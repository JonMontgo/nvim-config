" PluginInstall installs plugins
call plug#begin('~/.config/nvim/bundle')

" FZF
Plug 'git@github.com:junegunn/fzf.vim.git'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

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

" ETC
Plug 'git@github.com:jiangmiao/auto-pairs.git' 
Plug 'git@github.com:tpope/vim-surround.git'
Plug 'git@github.com:airblade/vim-gitgutter.git'
Plug 'tpope/vim-commentary'
Plug 'git@github.com:wesQ3/vim-windowswap.git'
Plug 'git@github.com:Vimjas/vim-python-pep8-indent.git'
Plug 'git@github.com:tmhedberg/SimpylFold.git'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'
" Plug 'fatih/vim-go'
" Plug 'cespare/vim-toml'
Plug 'tpope/vim-fugitive'
Plug 'evanleck/vim-svelte'
Plug 'godlygeek/tabular'

" AESTHETICS
Plug 'dylanaraps/wal.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-lualine/lualine.nvim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

call plug#end()

filetype plugin on

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

" #### Coc settings
"
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" end Coc #####

" Setup clipboard support
set clipboard=unnamedplus

" Setup colorscheme
colorscheme nord
if (has("termguicolors"))
  set termguicolors
endif

" Lualine
lua require('lualine').setup()

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

" Set line length guide (80 chars)
set colorcolumn=80

" Spelling selection
" setlocal spell spelllang=en_US

" Folding settings
" set foldmethod=syntax "syntax highlighting items specify the folds
set foldcolumn=2 "defines 1 col at window left to indicate folding
set foldlevelstart=99 "start file with all folds open


" Right solarized foreground colors and always show status bar
set laststatus=2
set background=dark

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
map <leader>sff :Files src<CR>

" Easy Split Movements
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Tab next and previous
map <leader>j :tabn<CR>
map <leader>k :tabp<CR>
