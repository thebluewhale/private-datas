""
" @author eunck
"

" Recognize the platform
function! GetRunningOS()
	if has("win32")
		return "win"
	endif
	if has("unix")
		if system('uname')=~'Darwin'
			return "mac"
		else
			return "linux"
		endif
	endif
endfunction
let os=GetRunningOS()

" ctags
if os=~"mac"
	let g:tagbar_ctags_bin='/usr/local/bin/ctags'
else
	" TODO ?
endif
set tags+=./tags

" font
if os=~"mac"
	set guifont=NanumGothicCoding:h13
else
	if os=~"linux"
		set guifont=NanumGothicCoding\ 10	
	endif
endif

" common
"set expandtab " tap->space*4'
set smarttab
set smartindent
set autoindent
set wrap
set tabstop=4
set shiftwidth=4
set number
set ignorecase
set hlsearch
set showmatch
set mouse=a
set clipboard=unnamedplus
set fencs=usc-bom,utf-8,cp949
set nocompatible
set foldnestmax=1
filetype on
filetype plugin indent on
syntax on
syntax enable
colorschem ron

" auto save & load
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-rails.git'
Plugin 'L9'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'FuzzyFinder'
Plugin 'The-NERD-tree'
Plugin 'The-NERD-Commenter'
Plugin 'AutoComplPop'
Plugin 'Tagbar'
Plugin 'grep.vim'
Plugin 'ctrlp.vim'
Plugin 'edc-support' " for Tizen development
"Plugin 'https://github.com/wesleyche/SrcExpl'
"Plugin 'surround.vim'
"Plugin 'OmniCppComplete'
"Plugin 'Syntastic'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" tab
map <C-n> :tabnew<CR>

" contract & expand
map <Leader>] <ESC>va}zf
map <Leader>[ <ESC>zMza


" NERDtree
autocmd vimenter * if !argc() | NERDTree | endif
map <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1		" show hidden files
"let NERDTreeShowBookmarks=1		" show Bookmarks always

" NerdCommenter
map  <plug>NERDCommenterToggle
map <Leader>? <plug>NERDCommenterInvert

" Tagbar
let g:tagbar_width=30
map <F4> :TagbarToggle<CR>

" grep
let g:Grep_Skip_files='tags'
let g:Grep_Skip_Dirs='boost .git CMakeFiles'
map <F2> :Rgrep<CR><CR><CR><CR>

" ctrlp
let g:ctrlp_custom_ignore={'dir': '\v[\/](boost)$',}
map <C-p>1 <ESC>:CtrlPMixed<CR>
map <C-p>2 <ESC>:CtrlPBuffer<CR>

" FuzzyFinder
"map <C-p>1 <ESC>:FufCoverageFile!<CR>
"map <C-p>2 <ESC>:FufBuffer!<CR>
map <C-p>3 <ESC>:FufChangeList!<CR>
map <C-p>4 <ESC>:FufLine!<CR>
map <C-p>5 <ESC>:FufJumpList!<CR>

" use Tab to switch tab 
map <Tab> <C-w><C-w>

" set colorscheme
colorscheme torte

" EOF
