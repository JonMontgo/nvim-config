" PluginInstall installs plugins
call plug#begin('~/.config/nvim/bundle')

" FZF
Plug 'git@github.com:junegunn/fzf.vim.git'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Nerd tree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Global Syntax Highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" GoLang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Solidity
Plug 'tomlion/vim-solidity'

" MJML
Plug 'amadeus/vim-mjml'

" Terraform 
Plug 'hashivim/vim-terraform'

" Terminal Toggles
Plug 'akinsho/toggleterm.nvim', {'tag': 'v1.*'}

" ETC
Plug 'git@github.com:jiangmiao/auto-pairs.git' 
Plug 'git@github.com:tpope/vim-surround.git'
Plug 'tpope/vim-commentary'
Plug 'git@github.com:wesQ3/vim-windowswap.git'
Plug 'tpope/vim-fugitive'
Plug 'evanleck/vim-svelte'
Plug 'godlygeek/tabular'

" AESTHETICS
Plug 'shaunsingh/nord.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-lualine/lualine.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'ervandew/supertab'
" Auto format on save

call plug#end()

filetype plugin on


" Lua imports here
:lua require('lsp')
:lua require('terminal')


" Tree Sitter Config
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = { 
    enable = true 
  },
  indent = {
    enable = true
  }
}
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" Setup clipboard support

set clipboard=unnamedplus

" Setup colorscheme
lua <<EOF
vim.g.nord_disable_background = true
require('nord').set()
EOF
if (has("termguicolors"))
  set termguicolors
endif

" Lualine
lua << END
require('lualine').setup {
  options = {
    theme = 'nord'
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1, -- Just patch this so that I get relative paths instead name

      }
    }
  }
}
END

" Ensure syntax highlighting
syntax on

" Split Settings go below or to the right
set splitbelow
set splitright

" Set line numbers
set relativenumber
set number

" Tab/spacing settings
set expandtab  " Tab becomes spaces
set softtabstop=2 " When tab key is hit insert 2 spaces
set shiftwidth=2 " When indentation is filled in use 2 spaces
set tabstop=4 " Tab characters are interpreted as 4 spaces
" set smartindent

" Set line length guide (88 chars for black)
set colorcolumn=88

" Spelling selection
" setlocal spell spelllang=en_US

" Folding settings
" set foldmethod=syntax "syntax highlighting items specify the folds
set foldcolumn=2 "defines 1 col at window left to indicate folding
set foldlevelstart=99 "start file with all folds open


" Right solarized foreground colors and always show status bar
" set laststatus=2
" set background=dark

" Nerd tree config
nmap <leader>nt :NERDTreeToggle<CR>
" let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
\  'Modified'  :'✹',
\  'Staged'    :'✚',
\  'Untracked' :'✭',
\  'Renamed'   :'➜',
\  'Unmerged'  :'═',
\  'Deleted'   :'✖',
\  'Dirty'     :'✗',
\  'Ignored'   :'☒',
\  'Clean'     :'✔︎',
\  'Unknown'   :'?',
\}

" Fuzzy file
let g:fzf_action={
\  'ctrl-t': 'tab split',
\  'ctrl-i': 'split',
\  'ctrl-s': 'vsplit'
\}
map <leader>ff :Files<CR>
map <leader>gff :GFiles<CR>
map <leader>sff :Files src<CR>

" Easy Split Movements
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Tab next and previous
map <leader>l :tabn<CR>
map <leader>h :tabp<CR>
