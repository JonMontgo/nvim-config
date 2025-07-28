# NVim Config

## Introduction
This Neovim configuration is designed to enhance your development experience by providing a comprehensive set of tools and features. It includes a variety of plugins to support different programming languages, improve code navigation, and streamline your workflow.

## Installation
Before installing this configuration, ensure you have [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) installed.

### This Config Installation
To install this configuration, use the following commands:
```sh
mkdir -p ~/.config/nvim
git clone git@github.com:JonMontgo/nvim-config.git ~/.config/nvim
```

## Features
- **Fuzzy Finder**: Quickly find files and navigate your project with FZF and Telescope.
- **Vibe Coding Support**: Enhance coding workflow with Vibe integration.
- **File Explorer**: Easily browse your file system with nvim-tree.
- **Language Support**: Comprehensive support for multiple languages including Python, Go, TypeScript, and more.
- **LSP and Autocompletion**: Integrated language server protocol support and autocompletion with nvim-cmp.
- **Treesitter**: Advanced syntax highlighting and code folding.
- **Terminal Integration**: Seamlessly toggle terminal windows within Neovim.
- **Note-taking**: Manage notes efficiently with Obsidian integration.

## Plugins
- **Fuzzy Finder**: `fzf`, `telescope.nvim`
- **File Explorer**: `nvim-tree.lua`
- **Language Support**: `vim-solidity`, `vim-terraform`, `vim-python-pep8-indent`
- **LSP and Autocompletion**: `nvim-lspconfig`, `mason.nvim`, `nvim-cmp`
- **Treesitter**: `nvim-treesitter`
- **Terminal Integration**: `toggleterm.nvim`
- **AI Assistance**: `avante.nvim`
- **Note-taking**: `obsidian.nvim`
- **Text Editing Enhancements**: `vim-surround`, `vim-sleuth`, `Comment.nvim`
- **Themes and UI**: `nightfox.nvim`, `lualine.nvim`, `indent-blankline.nvim`

## Usage
- Toggle the file explorer with `<leader>nt`.
- Open a terminal with `<leader>to`.
