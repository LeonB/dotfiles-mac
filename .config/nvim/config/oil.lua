require('oil').setup()

vim.keymap.set("n", "<leader>e", function()
   if vim.bo.filetype == 'oil' then
     require("oil").close()
   else
     require("oil").open()
   end
end, { desc = "File navigation" })
