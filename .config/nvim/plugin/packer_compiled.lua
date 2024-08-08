-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/leon/.cache/nvim/packer_hererocks/2.1.1720049189/share/lua/5.1/?.lua;/Users/leon/.cache/nvim/packer_hererocks/2.1.1720049189/share/lua/5.1/?/init.lua;/Users/leon/.cache/nvim/packer_hererocks/2.1.1720049189/lib/luarocks/rocks-5.1/?.lua;/Users/leon/.cache/nvim/packer_hererocks/2.1.1720049189/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/leon/.cache/nvim/packer_hererocks/2.1.1720049189/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["copilot-cmp"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16copilot_cmp\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/opt/copilot-cmp",
    url = "https://github.com/zbirenbaum/copilot-cmp"
  },
  ["copilot.lua"] = {
    after = { "copilot-cmp" },
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0 runtime! config/copilot.lua\bcmd\bvim\0" },
    loaded = true,
    only_config = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/lightline.vim",
    url = "https://github.com/itchyny/lightline.vim"
  },
  ["lsp-zero.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\28runtime! config/lsp.lua\bcmd\bvim\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/opt/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0!runtime! config/neo-tree.lua\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["neodev.nvim"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    config = { "\27LJ\2\nG\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0(runtime! config/nvim-treesitter.lua\bcmd\bvim\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  tabular = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-recent-files"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/telescope-recent-files",
    url = "https://github.com/smartpde/telescope-recent-files"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\"runtime! config/telescope.lua\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["text-case.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0!runtime! config/textcase.vim\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/text-case.nvim",
    url = "https://github.com/johmsalas/text-case.nvim"
  },
  undotree = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0!runtime! config/undotree.lua\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-bad-whitespace"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/vim-bad-whitespace",
    url = "https://github.com/bitc/vim-bad-whitespace"
  },
  ["vim-bbye"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/vim-bbye",
    url = "https://github.com/moll/vim-bbye"
  },
  ["vim-fetch"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/vim-fetch",
    url = "https://github.com/kopischke/vim-fetch"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/vim-lastplace",
    url = "https://github.com/farmergreg/vim-lastplace"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-textobj-url"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/vim-textobj-url",
    url = "https://github.com/LeonB/vim-textobj-url"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  ["wombat.nvim"] = {
    config = { "\27LJ\2\nN\0\0\5\1\4\1\t4\0\3\0006\1\0\0005\3\2\0-\4\0\0009\4\1\4=\4\3\3B\1\2\0?\1\0\0L\0\2\0\2À\afg\1\0\1\afg\0\nWhite\15Identifier\3€€À™\4à\1\1\0\a\0\f\0\0266\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0026\1\4\0'\3\6\0B\1\2\0026\2\4\0'\4\a\0B\2\2\0029\2\b\0029\3\t\0004\5\3\0>\1\1\5B\3\2\0029\3\n\0033\5\v\0B\3\2\2\18\4\0\0\18\6\3\0B\4\2\0012\0\0€K\0\1\0\0\twith\fextends\vcolors\"lush_theme.wombat_lush_colors\27lush_theme.wombat_lush\tlush\frequire\fzzzzzzz\16colors_name\6g\bvim\0" },
    loaded = true,
    path = "/Users/leon/.local/share/nvim/site/pack/packer/start/wombat.nvim",
    url = "https://github.com/ViViDboarder/wombat.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: text-case.nvim
time([[Config for text-case.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0!runtime! config/textcase.vim\bcmd\bvim\0", "config", "text-case.nvim")
time([[Config for text-case.nvim]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0!runtime! config/neo-tree.lua\bcmd\bvim\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: copilot.lua
time([[Config for copilot.lua]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0 runtime! config/copilot.lua\bcmd\bvim\0", "config", "copilot.lua")
time([[Config for copilot.lua]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\"runtime! config/telescope.lua\bcmd\bvim\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: undotree
time([[Config for undotree]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0!runtime! config/undotree.lua\bcmd\bvim\0", "config", "undotree")
time([[Config for undotree]], false)
-- Config for: wombat.nvim
time([[Config for wombat.nvim]], true)
try_loadstring("\27LJ\2\nN\0\0\5\1\4\1\t4\0\3\0006\1\0\0005\3\2\0-\4\0\0009\4\1\4=\4\3\3B\1\2\0?\1\0\0L\0\2\0\2À\afg\1\0\1\afg\0\nWhite\15Identifier\3€€À™\4à\1\1\0\a\0\f\0\0266\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0026\1\4\0'\3\6\0B\1\2\0026\2\4\0'\4\a\0B\2\2\0029\2\b\0029\3\t\0004\5\3\0>\1\1\5B\3\2\0029\3\n\0033\5\v\0B\3\2\2\18\4\0\0\18\6\3\0B\4\2\0012\0\0€K\0\1\0\0\twith\fextends\vcolors\"lush_theme.wombat_lush_colors\27lush_theme.wombat_lush\tlush\frequire\fzzzzzzz\16colors_name\6g\bvim\0", "config", "wombat.nvim")
time([[Config for wombat.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd neodev.nvim ]]
vim.cmd [[ packadd lsp-zero.nvim ]]

-- Config for: lsp-zero.nvim
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\28runtime! config/lsp.lua\bcmd\bvim\0", "config", "lsp-zero.nvim")

vim.cmd [[ packadd nvim-treesitter ]]
vim.cmd [[ packadd nvim-treesitter-textobjects ]]

-- Config for: nvim-treesitter-textobjects
try_loadstring("\27LJ\2\nG\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0(runtime! config/nvim-treesitter.lua\bcmd\bvim\0", "config", "nvim-treesitter-textobjects")

vim.cmd [[ packadd copilot-cmp ]]

-- Config for: copilot-cmp
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16copilot_cmp\frequire\0", "config", "copilot-cmp")

time([[Sequenced loading]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
