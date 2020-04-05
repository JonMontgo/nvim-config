"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc

" PluginInstall installs plugins
call plug#begin('~/.config/nvim/bundle')
Plug 'git@github.com:junegunn/fzf.vim.git'
Plug 'git@github.com:junegunn/fzf.git'
Plug 'git@github.com:scrooloose/nerdtree.git'
Plug 'git@github.com:w0rp/ale.git'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'posva/vim-vue'
Plug 'git@github.com:jiangmiao/auto-pairs.git' 
Plug 'git@github.com:tpope/vim-surround.git'
Plug 'git@github.com:airblade/vim-gitgutter.git'
Plug 'git@github.com:scrooloose/nerdcommenter.git'
Plug 'git@github.com:wesQ3/vim-windowswap.git'
Plug 'git@github.com:Vimjas/vim-python-pep8-indent.git'
Plug 'git@github.com:tmhedberg/SimpylFold.git'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dylanaraps/wal.vim'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-fugitive'
Plug 'evanleck/vim-svelte'
call plug#end()

" #### Coc settings
"
" if hidden is not set, TextEdit might fail.
" set hidden

" Better display for messages
set cmdheight=2

" don't give |ins-completion-menu| messages.
set shortmess+=c


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"if has('patch8.1.1068')
  "" Use `complete_info` if your (Neo)Vim version supports it.
  "inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
  "imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" end Coc #####

" Setup clipboard support
set clipboard=unnamedplus

" Setup colorscheme
colorscheme wal

" Ensure syntax highlighting
syntax on

" Split Settings go below or to the right
set splitbelow
set splitright

" Set line numbers
set number

" Tab/spacing settings
set expandtab  " Tab becomes spaces
set softtabstop=2 " When tab key is hit insert 2 spaces
set shiftwidth=2 " When indentation is filled in use 2 spaces
set tabstop=4 " Tab characters are interpreted as 4 spaces
" set smartindent

" Set line length guide (80 chars)
set colorcolumn=80
" Solarized theme specific
highlight ColorColumn ctermbg=8 

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='kolor'

" Let's get powerline
" set rtp+=$VIM_POWER_BINDING

" Folding settings
set foldmethod=syntax "syntax highlighting items specify the folds
set foldcolumn=2 "defines 1 col at window left to indicate folding
set foldlevelstart=99 "start file with all folds open

" Vim-Javascript config
let g:javascript_plugin_jsdoc = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

" Right solarized foreground colors and always show status bar
set laststatus=2
set background=dark

" Nerd tree config
nmap <C-\> :NERDTreeToggle<CR>

" Fuzzy file
let g:fzf_action={
\  'ctrl-t': 'tab split',
\  'ctrl-i': 'split',
\  'ctrl-s': 'vsplit'
\}

" Easy Split Movements
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Tab next and previous
map <C-PageUp> :tabn<CR>
map <C-PageDown> :tabp<CR>
