" Setup plugins
call plug#begin('~/.local/share/nvim/plugged')

" Appearance
Plug 'lifepillar/vim-solarized8'
Plug 'itchyny/lightline.vim'

" Text objects
Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-surround'

" Filesystem
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-eunuch'

" Coding
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-commentary'
Plug 'janko/vim-test'

Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'rust-lang/rust.vim'

" Navigation
Plug '/home/linuxbrew/.linuxbrew/opt/fzf'
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" General
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'vimwiki/vimwiki'

call plug#end()

" Tree-Sitter config
lua <<EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = {"rust", "go", "gomod", "java", "lua", "javascript", "toml", "yaml", "json", "bash"} ,
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}
EOF

" General vim options
" Appearance

" vim-plug executes these two commands by default:
" filetype plugin indent on

set termguicolors
set background=dark
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
if !&scrolloff
    set scrolloff=1
endif
if !&sidescrolloff
    set sidescrolloff=5
endif

" Formatting
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent

" Buffers
set updatetime=100
set autoread
set hidden

" Windows
set splitbelow
set splitright

" Other
set backspace=indent,eol,start
set incsearch
set wildmenu
set wildignorecase
set path=.,**
set tags=./tags,tags;$HOME
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=tags
set wildignore+=*.tar.*
set wildignore+=*/node_modules/**/*

if has("nvim")
    set inccommand=nosplit
endif


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

" nnoremap <leader>f :find *
" nnoremap <leader>s :sfind *
" nnoremap <leader>v :vert sfind *
" nnoremap <leader>t :tabfind *
"
" nnoremap <leader>F :find <C-R>=expand('%:h').'/*'<CR>
" nnoremap <leader>S :sfind <C-R>=expand('%:h').'/*'<CR>
" nnoremap <leader>V :vert sfind <C-R>=expand('%:h').'/*'<CR>
" nnoremap <leader>T :tabfind <C-R>=expand('%:h').'/*'<CR>
"
" set wildcharm=<C-z>
" nnoremap <leader>b :buffer <C-z><S-Tab>
" nnoremap <leader>B :sbuffer <C-z><S-Tab>
"
" nnoremap <leader>j :tjump /
"
" augroup VIMRC
"   autocmd!

"   autocmd BufLeave *.css  normal! mC
"   autocmd BufLeave *.html normal! mH
"   autocmd BufLeave *.js   normal! mJ
"   autocmd BufLeave *.php  normal! mP
" augroup END


" Set gutentags command arguments
" au FileType c++ let g:gutentags_ctags_extra_args = ['--c++-kinds=+p','--fields=+iaS','--extras=+q']

" Set tab key to expand snippets
" let g:UltiSnipsExpandTrigger="<leader><tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-k>"
" let g:UltiSnipsJumpBackwardTrigger="<c-j>"
" let g:UltiSnipsEditSplit="vertical"

" Set tab key to traverse list from top to bottom
let g:SuperTabDefaultCompletionType = "<c-n>"

" Setup vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
" let g:javascript_conceal_noarg_arrow_function = "🞅"
" let g:javascript_conceal_underscore_arrow_function = "🞅"

" vim-test
let test#strategy = "neovim"
let g:test#javascript#ava#file_pattern = '\v.*\.(test|spec).(js|jsx|coffee)$'

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

" Action: Set Python breakpoint
au FileType python nnoremap <silent> <leader>b oimport pdb; pdb.set_trace()<esc>
au FileType python nnoremap <silent> <leader>B Oimport pdb; pdb.set_trace()<esc>

"""""" Terminal Mappings """"""
tnoremap <leader><Esc> <C-\><C-n>

" Check on cursor hold if file changed on disk
autocmd CursorHold,CursorHoldI * silent! checktime

" Equalize splits when vim is resized
autocmd VimResized * wincmd =
