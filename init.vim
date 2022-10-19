" Lua imports here
:lua require('plugins')
:lua require('lsp')
:lua require('treesitter')
:lua require('styling')
:lua require('terminal')
:lua require('indent-guide')
:lua require('files')
:lua require('database')


" Setup clipboard support

set clipboard=unnamedplus

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
