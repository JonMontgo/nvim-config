-- init.lua - Neovim configuration in Lua
-- Load plugin and configuration modules
require('plugins')
require('styling')
require('lsp')
require('treesitter')
require('terminal')
require('indent-guide')
require('files')
require('database')
require('gpt')
require('notes')

-- Options
local opt = vim.opt

-- Clipboard support
opt.clipboard = "unnamedplus"

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Line numbers
opt.relativenumber = true
opt.number = true

-- Tabs and indentation
opt.expandtab = true
opt.softtabstop = 2
opt.shiftwidth = 2
opt.tabstop = 4

-- Color column at 88 chars
opt.colorcolumn = "88"

-- Syntax highlighting
vim.cmd("syntax on")

-- Folding
opt.foldcolumn = "2"
opt.foldlevelstart = 99

-- FZF actions
vim.g.fzf_action = {
  ["ctrl-t"] = "tab split",
  ["ctrl-i"] = "split",
  ["ctrl-s"] = "vsplit",
}

-- Key mappings
local map = vim.keymap.set

-- Fuzzy finder mapping
map('n', '<leader>sff', ':Files src<CR>', { silent = true })

-- Easy split movements
map('n', '<C-J>', '<C-W><C-J>', { noremap = true, silent = true })
map('n', '<C-K>', '<C-W><C-K>', { noremap = true, silent = true })
map('n', '<C-L>', '<C-W><C-L>', { noremap = true, silent = true })
map('n', '<C-H>', '<C-W><C-H>', { noremap = true, silent = true })

-- Tab navigation
map('n', '<leader>l', ':tabn<CR>', { silent = true })
map('n', '<leader>h', ':tabp<CR>', { silent = true })