" Plugs "
call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-sensible'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6', 'do': ':UpdateRemotePlugins', 'for': 'vim' }
Plug 'nvim-lua/plenary.nvim'
Plug 'rose-pine/neovim', { 'as': 'rose-pine' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'preservim/nerdtree'
Plug 'mbbill/undotree'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'tpope/vim-fugitive'
Plug 'nvim-lua/plenary.nvim'

" LPS "
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

call plug#end()

" configs "
syntax on     
set nu
set rnu         
set guicursor=""
set tabstop=2   
set softtabstop=2
set shiftwidth=2
set noexpandtab
set smartindent
set incsearch
set nobackup      
set nowritebackup
set scrolloff=10   
set cmdheight=2
set updatetime=50
set encoding=utf-8 
filetype on          
filetype plugin on   
filetype indent on  

" Remaps "
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"
nnoremap <Space> <Nop>
vnoremap <Space> <Nop>
nnoremap <leader>pv :Ex<CR>
" nerd Tree "
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-a> <Nop>
" navegation across the screen "
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" navegation "
nmap op o<Esc>k
nmap oi O<Esc>j
nmap oo A<CR>
nmap te :tabe<CR>
nmap ty :bn<CR>
nmap tr :bp<CR>
nmap td :bd<CR>
nmap th :split<CR>
nmap tv :vsplit<CR>
nmap tt :q<CR>
" UndoTree "
nnoremap <F5> :UndotreeToggle<CR>
" fugitive "
nmap <leader>gs :Git<CR>
"telescope "
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fi <cmd>Telescope git_files<cr>
nnoremap <leader>ps <cmd>Telescope grep_string<CR>

" Visual mode: Move selected lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Normal mode: Join the current line with the one below it
nnoremap J mzJ`z
" Normal mode: Move the cursor and the screen down half a page
nnoremap <C-d> <C-d>zz
" Normal mode: Move the cursor and the screen up half a page
nnoremap <C-u> <C-u>zz
" Normal mode: Move to the next search result and center the screen
nnoremap n nzzzv
" Normal mode: Move to the previous search result and center the screen
nnoremap N Nzzzv
" Normal mode: desmarc word searched
nnoremap <C-n> :nohlsearch
" Visual mode: Cut selected text and paste it above the cursor
xnoremap <leader>p "_dP
" Normal and Visual mode: Copy selected text to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
" Normal mode: Copy the current line to system clipboard
nnoremap <leader>Y "+Y
" Visual mode: Delete selected text and exit to normal mode
xnoremap <leader>d "_d
" Normal mode: Disable the Ex mode (Q)
nnoremap Q <nop>
" Normal mode: Format code using LSP
nnoremap <leader>f <cmd>lua vim.lsp.buf.format()<CR>
" Normal mode: Move to the next error and center the screen
nnoremap <C-k> <cmd>cnext<CR>zz
" Normal mode: Move to the previous error and center the screen
nnoremap <C-j> <cmd>cprev<CR>zz
" Normal mode: Move to the next location list item and center the screen
nnoremap <leader>k <cmd>lnext<CR>zz
" Normal mode: Move to the previous location list item and center the screen
nnoremap <leader>j <cmd>lprev<CR>zz

" Normal mode: Replace text using search and replace
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Normal mode: Add executable permission to the current file
nnoremap <leader>x :!chmod +x %<CR>

" Normal mode: Open the Packer configuration file
nnoremap <leader>vpp :e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>
" Normal mode: Run a custom command
nnoremap <leader>mr :CellularAutomaton make_it_rain<CR>

" Normal mode: Reload the current file
nnoremap <leader><leader> :so %<CR>


" Theme "
colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

" LPS config "
lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) 
        
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), 
			}),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
  })
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  
  require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    capabilities = capabilities
  }
EOF
