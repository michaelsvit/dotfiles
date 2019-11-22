" Setup plugins
	call plug#begin('~/.local/share/nvim/plugged')

	" Appearance
	Plug 'lifepillar/vim-solarized8'
	Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'itchyny/lightline.vim'

	" Text objects
	Plug 'michaeljsmith/vim-indent-object'
	Plug 'wellle/targets.vim'
	Plug 'tpope/vim-surround'

	" Filesystem
	Plug 'justinmk/vim-dirvish'
	Plug 'tpope/vim-eunuch'

	" Coding
	Plug 'tpope/vim-commentary'
	Plug 'janko/vim-test'

	Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
	Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

	" Navigation
	Plug 'justinmk/vim-sneak'
	" Plug 'ludovicchabant/vim-gutentags'
	Plug '/usr/local/opt/fzf'
	Plug 'junegunn/fzf.vim'

	" Git
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'

	" General
	Plug 'tpope/vim-repeat'
	Plug 'junegunn/vim-easy-align'
	Plug 'jiangmiao/auto-pairs'
	Plug 'ervandew/supertab'

	call plug#end()


" General vim options
	" Appearance

	" vim-plug executes these two commands by default:
	" filetype plugin indent on
	" syntax enable

	set termguicolors
	set background=dark
	colorscheme solarized8_flat
	set conceallevel=1
	set foldmethod=indent
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
	set path+=**
	set tags=./tags,tags;$HOME

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
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

" vim-test
let test#strategy = "neovim"
let g:test#javascript#ava#file_pattern = '\v.*\.(test|spec).(js|jsx|coffee)$'

inoremap jj <ESC>
inoremap jk <ESC>A;<ESC>
nnoremap <leader>; A;<ESC>
map <Space> <leader>
nnoremap <leader>w :w<CR>

" Plugin: vim-test
nnoremap <leader>t :TestNearest<CR>
nnoremap <leader>T :TestFile<CR>
nnoremap <leader>l :TestLast<CR>

" Action: ripgrep
nnoremap <C-g> :Rg<Cr>

" Action: search word under cursor using ripgrep
nnoremap <leader>g :silent grep! <cword><CR>

" Action: search file names
nnoremap <M-f> :Files<Cr>

" Action: automatically fix file
nnoremap <leader>f :CocCommand eslint.executeAutofix<CR>

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

" Action: Open a vertical terminal split
nnoremap <leader>vt :vne<CR>:term<CR>

"""""" Terminal Mappings """"""
tnoremap <leader><Esc> <C-\><C-n>

" Check on cursor hold if file changed on disk
autocmd CursorHold,CursorHoldI * silent! checktime

" Equalize splits when vim is resized
autocmd VimResized * wincmd =
