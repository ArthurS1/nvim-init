"-------------------------------- PLUGINS ------------------------------
"
call plug#begin('~/.config/nvim/plugins')
Plug 'vim-scripts/bats.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
call plug#end()
"---------------------------- GENERAL SETTINGS --------------------------
"
inoremap ² <Esc>
tnoremap ² <C-\><C-n>
map ; :Files<CR>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
set number
set swapfile
set dir=~/.config/nvim/tmp/
set relativenumber
set expandtab
set shiftwidth=4
set tabstop=4
"----------------- RECOMMENDED NVIM-CMP SETTINGS ------------------------
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
"---------------------------------- LSP ---------------------------------
"
lua << EOF

local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<CR>'] = cmp.mapping.confirm({select = true }),
        ['<Tab><Tab>'] = cmp.mapping.confirm({select = true }),
        },
    sources = {
        -- For ultisnips user.
        { name = 'nvim_lsp'},
        { name = 'vsnip' },
        { name = 'buffer' },
        }
    })

    require'lspconfig'.pyright.setup{capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())}
    require'lspconfig'.hls.setup{capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())}
    require'lspconfig'.clangd.setup{capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())}
    require'lspconfig'.tsserver.setup{capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())}
    require'lspconfig'.cmake.setup{capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())}
EOF
"------------------------------------------------------------------------
