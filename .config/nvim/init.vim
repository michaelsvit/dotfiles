" Setup plugins
call plug#begin('~/.local/share/nvim/plugged')

" Appearance
Plug 'lifepillar/vim-solarized8'
Plug 'itchyny/lightline.vim'

" Text objects
" Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-surround'

" Filesystem
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-eunuch'

" Coding
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'numToStr/Comment.nvim'
" Plug 'neovim/nvim-lspconfig' // plugin that sets up lsp servers

" Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'SmiteshP/nvim-navbuddy' // requires lsp

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sindrets/diffview.nvim'

" General
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'abecodes/tabout.nvim'
Plug 'mickael-menu/zk-nvim'

call plug#end()

" Tree-Sitter config
lua <<EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = {"python", "comment", "rust", "go", "gomod", "java", "lua", "javascript", "toml", "yaml", "json", "bash", "dockerfile", "c_sharp", "proto"} ,
    highlight = { enable = true },
    indent = { enable = true },
    refactor = {
        highlight_definitions = { enable = true },
        highlight_current_scope = { enable = true },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grr",
            },
        },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = "gnd",
                list_definitions = "gnD",
                list_definitions_toc = "gO",
                goto_next_usage = "<a-*>",
                goto_previous_usage = "<a-#>",
            },
        },
    },
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj
            lookahead = true,

            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
            }
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner"
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner"
            }
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]f"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]F"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[f"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[F"] = "@function.outer",
                ["[]"] = "@class.outer",
            }
        }
    }
}

require('Comment').setup()
require('zk').setup({
    picker = "fzf"
})
EOF

" General vim options
" Appearance

set termguicolors
colorscheme solarized8_flat
set conceallevel=1
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set breakindent
set breakindentopt=shift:2
set showbreak=↳
set cursorline
set number
set relativenumber
set scrolloff=1

" Formatting
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Buffers
set updatetime=100
set autoread
set hidden

" Windows
set splitbelow
set splitright

" Other
set wildmenu
set wildignorecase

" vim-lightline
let g:lightline = {
            \ 'colorscheme': 'solarized',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head'
            \ },
            \ }

inoremap jj <ESC>
inoremap jk <ESC>A;<ESC>
nnoremap <leader>; A;<ESC>
map <Space> <leader>
nnoremap <leader>w :w<CR>
nnoremap gb :ls<CR>:b<Space>
nnoremap <PageUp> :bprevious<CR>
nnoremap <PageDown> :bnext<CR>
nnoremap <silent> <leader>yf :let @+=expand("%:p")<CR>

" Action: split line
nnoremap S :keeppatterns substitute/\s*\%#\s*/\r/e <bar> normal! ==<CR>

" Plugin: vim-test
nnoremap <leader>t :TestNearest<CR>
nnoremap <leader>T :TestFile<CR>
nnoremap <leader>l :TestLast<CR>

" Action: search word under cursor using ripgrep
nnoremap <leader>qg :silent grep! <cword><CR>

" vim-fzf
nnoremap <leader><space> :Buffers<Cr>
nnoremap <leader>f :Files<Cr>
nnoremap <leader>g :Rg<Cr>
nnoremap <leader>h :History<Cr>

" Action: open vimrc in vertical split
nnoremap <leader>v :vsp $MYVIMRC<CR>

" Action: visual select pasted text
nnoremap gp `[v`]

" Action: indent pasted text
nnoremap g= `[v`]=

" Action: change all occurences of word under cursor in current file
nnoremap <leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
xnoremap <leader>s "sy:%s/<C-r>s//g<Left><Left>

" Action: substitute word under cursor and dot repeat
nnoremap <silent> <leader>c :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> <leader>c "sy:let @/=@s<CR>cgn

" Action: disable highlight
nnoremap <leader>n :nohl<CR>

" Action: Quickfix navigation
nnoremap <leader>q :ccl<CR>
nnoremap <leader>Q :cope<CR>
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
nnoremap [<Space> O<Esc>j
nnoremap ]<Space> o<Esc>k

"""""" Terminal Mappings """"""
tnoremap <leader><Esc> <C-\><C-n>

" Check on cursor hold if file changed on disk
autocmd CursorHold,CursorHoldI * silent! checktime

" Equalize splits when vim is resized
autocmd VimResized * wincmd =

" Filetype-specific configuration
autocmd FileType proto setlocal shiftwidth=2 tabstop=2
