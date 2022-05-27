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

" Terraform 
Plug 'hashivim/vim-terraform'

" ETC
Plug 'git@github.com:jiangmiao/auto-pairs.git' 
Plug 'git@github.com:tpope/vim-surround.git'
Plug 'tpope/vim-commentary'
Plug 'git@github.com:wesQ3/vim-windowswap.git'
Plug 'github/copilot.vim'
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

" lsp Config
"
" LSP Completion
set completeopt=menu,menuone,noselect

" Buffer formatting
" autocmd BufWritePre *.py lua vim.lsp.buf.formatting()
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting()
autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting()
autocmd BufWritePre *.js lua vim.lsp.buf.formatting()
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting()
autocmd BufWritePre *.svelte lua vim.lsp.buf.formatting()

lua << END

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


-- END Setup nvim-cmp.


-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 
  'tsserver', 
  'svelte', 
  'denols', 
  'tailwindcss', 
  'golangci_lint_ls', 
  'emmet_ls', 
  'pyright' 
}
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    },
    capabilities = capabilities
  }
end
require('lspconfig').efm.setup {
  filetypes = { 'python' },
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    -- This will be the default in neovim 0.7+
    debounce_text_changes = 150,
  },
  init_options = { documentFormatting=true },
  settings = {
    rootMarkets = {".git/"},
    languages = {
      python = {
        {
          formatCommand = "black --quiet -",
          formatStdin = true
        },
        {
          formatCommand = "isort --quiet -",
          formatStdin = true
        }
      }
    }
  }
}
END
" End LSP Config


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
colorscheme nord
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
