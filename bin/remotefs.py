#!/usr/bin/env python

import argparse
import os
import subprocess
import sys
import psutil

def mount_remote_fs(hostname, remote_path, mount_path):
    if not os.path.isdir(mount_path):
        # Create the mount point
        os.mkdir(mount_path)

    if not os.path.ismount(mount_path):
        # mount it
        cmd = mount_command(hostname, remote_path, mount_path)
        subprocess.check_call(cmd)

    sys.stdout.write("Mounted %s on %s\n" % (hostname, mount_path))

def unmount_remote_fs(hostname, mount_path):
    if os.getcwd().find(mount_path) == 0:
        sys.stderr.write("Cannot unmount when cwd is in mount path\n")
        sys.exit(2)

    mountpoints = get_mountpoints()
    if mount_path in mountpoints:
        cmd = unmount_command(hostname, mount_path)
        print(cmd)
        try:
            subprocess.check_call(cmd)
        except subprocess.CalledProcessError as e:
            print(e.returncode)
            # 1 = Device or resource busy
            pass # directory not mounted

        if not os.listdir(mount_path):
            os.rmdir(mount_path)
        else:
             sys.stderr.write("Not removing. %s is not empty\n" % mount_path)

        sys.stdout.write("Unmounted %s\n" % mount_path)
    else:
        sys.stdout.write("%s is not mounted\n" % mount_path)

def mount_command(hostname, remote_path, mount_path):
    uri = hostname + ':' + remote_path
    cmd = ['/usr/local/bin/sshfs', uri, mount_path]
    if args.options:
        cmd.append('-o')
        cmd.append(args.options)
    if args.compression:
        cmd.append('-C')

    # sshfs overwrites this; find another way to make ssh agent forwarding work
    # with sshfs (fork a ssh process?)
    # cmd.append('-o')
    # cmd.append('ssh_command=ssh -A -o ClearAllForwardings=no')

    return cmd

def unmount_command(hostname, mount_path):
    uri = hostname + ':'
    cmd = ['/sbin/umount', '-f', mount_path]
    return cmd

def get_mountpoints():
    mountpoints = []
    for p in psutil.disk_partitions(all=True):
        if p.fstype != "macfuse":
            continue

        if not p.mountpoint.startswith(os.path.expandvars("$HOME/Public/")):
            continue

        mountpoints.append(p.mountpoint)

    return mountpoints

def parse_args():
    parser = argparse.ArgumentParser(description='Mount a remote fs on a preconfigured location')
    parser.add_argument('-u', '--unmount', action='store_true', help='aasasd')
    parser.add_argument('-o', '--options', default='auto_cache,no_readahead,idmap=user,reconnect')

    exclusive_grp = parser.add_mutually_exclusive_group()
    exclusive_grp.add_argument('-c', '--compression', action='store_true', default=True)
    exclusive_grp.add_argument('-nc', '--no-compression', action='store_false', dest='compression')

    parser.add_argument('hostname', metavar='[user@]hostname')
    parser.add_argument('mount_path', nargs='?')
    args = parser.parse_args()

    if ':' in args.hostname:
        args.hostname, args.remote_path = args.hostname.split(':')
    else:
        args.remote_path = ''

    # If no mount path: assign a default one
    if not args.mount_path:
        # check if hostname is maybe a path
        if os.path.exists(os.path.dirname(args.hostname)):
            args.mount_path = args.hostname
        else:
            args.mount_path = os.path.expandvars("$HOME/Public/" + args.hostname)

    return args

# Do stuff
args = parse_args()
if args.unmount:
    unmount_remote_fs(args.hostname, args.mount_path)
else:
    try:
        mount_remote_fs(args.hostname, args.remote_path, args.mount_path)
    except KeyboardInterrupt as e:
        unmount_remote_fs(args.hostname, args.mount_path)
        sys.exit(0)
    except subprocess.CalledProcessError as e:
        # Something has happened: try to unmount & clean up
        unmount_remote_fs(args.hostname, args.mount_path)
        sys.exit(e.returncode)

# If not bad has happened: exit with a zero
sys.exit(0)

