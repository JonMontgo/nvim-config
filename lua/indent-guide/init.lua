vim.opt.list = true
vim.opt.listchars:append("eol:↴")

require("ibl").setup()
<<<<<<< HEAD

-- Start interactive EasyAlign in visual mode (e.g. vipga)
vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', { noremap = false, silent = true })

-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', { noremap = false, silent = true })
=======
>>>>>>> 918c71c32e9ef2b331fc2a42b3df7512daa3d6b4
