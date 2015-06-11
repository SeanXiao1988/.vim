" be iMproved
set nocompatible

" Vundle setting {
	filetype off " required!

	set rtp+=~/.vim/bundle/vundle/
	set rtp+=$GOROOT/misc/vim
	call vundle#rc()

	" let Vundle manage Vundle(required!)
	Bundle 'gmarik/vundle'

	" plugins repos {
		" The-NERD-tree
		Bundle 'SeanXiao1988/The-NERD-tree-Extension'

		" pbcopy plugin
		Bundle 'SeanXiao1988/vim-pbcopy'

		" a css/html helper
		Bundle 'vim-scripts/Emmet.vim'

		" DoxygenToolkit
		Bundle 'vim-scripts/DoxygenToolkit.vim'

		" Bundle 'minibufexplorerpp'
		Bundle 'jeetsukumaran/vim-buffergator'

		" Commenter for many lang
		Bundle 'The-NERD-Commenter'

		" Taglist
		Bundle 'taglist.vim'

		" a color colorscheme
		Bundle 'chriskempson/vim-tomorrow-theme'

		" ctrlp.vim
		Bundle 'ctrlp.vim'

		" Markdown hightline plugin
		Bundle 'Markdown'

		" match ()
		Bundle 'matchit.zip'

		" Less css hightline plugin
		Bundle 'groenewege/vim-less'

		" Coffee script
		Bundle 'kchmck/vim-coffee-script'

		" Dash plugins
		Bundle 'rizzatti/funcoo.vim'
		Bundle 'rizzatti/dash.vim'

		" Let command :saveas to delete the old file
		Bundle 'danro/rename.vim'

		" Js Beautiful
		Bundle 'maksimr/vim-jsbeautify'

		" Indent for ruby
		Bundle 'vim-ruby/vim-ruby'
		Bundle 'fatih/vim-go'

		"Auto close the block
		"Bundle 'AutoClose'
		" Code formater
		"Bundle 'godlygeek/tabular'
	" }

	" required!
	filetype plugin indent on
" }

" vim-pbcopy {
	let g:copyAndGrepVar_grepInclude = ["*.vim", "*.lua", "*.md", "*.js", "*.py", "*.h", "*.cpp", "*.m"]
" }
"
" vim-jsbeautiful {
	map <leader>ff :call JsBeautify()<cr>
	autocmd FileType javascript noremap <buffer>  <leader>ff :call JsBeautify()<cr>
	autocmd FileType html noremap <buffer> <leader>ff :call HtmlBeautify()<cr>
	autocmd FileType css noremap <buffer> <leader>ff :call CSSBeautify()<cr>
" }
"
" DoxygenTookit{
	let g:DoxygenToolkit_briefTag_pre="@synopsis  "
	let g:DoxygenToolkit_paramTag_pre="@param "
	let g:DoxygenToolkit_returnTag="@returns   "
	let g:DoxygenToolkit_authorName="foding"
	let g:DoxygenToolkit_licenseTag=""
	let g:DoxygenToolkit_compactDoc="yes"

	let g:DoxygenToolkit_authorName="foding, <xiaol.ghost@gmail.com>"
	let s:licenseTag = "Copyright(C)\<enter>"
	let s:licenseTag = s:licenseTag . "For free\<enter>"
	let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
	let g:DoxygenToolkit_licenseTag = s:licenseTag
	let g:DoxygenToolkit_briefTag_funcName="yes"
	let g:doxygen_enhanced_color=1
	
	:nmap <silent> <leader>f <Plug>Dox
" }

" format setting {
	" show line number
	set number

	" set `<<` and `>>` command offset width become 4
	set shiftwidth=4

	" set BS key delete 4 space at once press
	set softtabstop=4

	" set tab width is 4
	set tabstop=4

	" set text width to 80 chars and give a colorcolumn to mark
	"set textwidth=0
	"set colorcolumn=+1

	" set cursor margin top and bottom 3 lines
	set so=3

	" set indent for diff lang {
		autocmd FileType ruby       set shiftwidth=2 | set expandtab
		autocmd FileType eruby      set shiftwidth=2 | set expandtab
		autocmd FileType erlang     set shiftwidth=2 | set expandtab
		autocmd FileType html       set shiftwidth=2 | set expandtab
		autocmd FileType javascript set shiftwidth=2 | set expandtab
		autocmd FileType php        set shiftwidth=4 | set expandtab
	" }
" }

" display setting {
	" set statue line
	set laststatus=2

	" hightline the search chars
	set hlsearch

	" jump intime when search
	set incsearch

	" show tabs and spaces at the end of line
	set list
	set listchars=""
	set listchars=tab:»\ 
	if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
		set listchars+=trail:·
		"set listchars+=eol:¶
		"set listchars+=eol:¬
	else
		set listchars+=trail:.
	endif

	" syntax on
	syntax on

	" set backspace
	set backspace=indent,eol,start

	" be iMproved
	set nocompatible
	set ignorecase
" }

" key map {
	" <leader> key setting {
		let mapleader = ","
		let g:mapleader = ","
	" }

	" Fast saving
	nmap <leader>w :w!<CR>

	" Fast split window
	nmap <leader>- :sp<CR>
	nmap <leader>\| :vsp<CR>

	" fast change panel {
		nmap <Tab> <C-w>w
		nmap <c-h> <c-w><c-h>
		nmap <c-j> <c-w><c-j>
		nmap <c-k> <c-w><c-k>
		nmap <c-l> <c-w><c-l>
	" }
	
	"fast page down and up
	"nmap <c-j> <c-f>
	"nmap <c-k> <c-b>
	"vmap <c-j> <c-f>
	"vmap <c-k> <c-b>
	"nmap <d-j> <c-d>
	"nmap <d-k> <c-u>
	"vmap <d-j> <c-d>
	"vmap <d-k> <c-u>

	" fast nohl
	map <leader>h :nohl<CR>

	" auto complete
	function! InsertTabWrapper()
		let col = col('.') - 1
		if !col || getline('.')[col - 1] !~ '\k'
			return "\<tab>"
		else
			return "\<c-p>"
		endif
	endfunction
	inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" }
"
" other setting {
	" Set to auto read when a file is changed from the outside
	set autoread

	" no backup
	set nobackup

	" let vim use system clipboard
	set clipboard=unnamed
" }
"
" Dash setting{
	:nmap <silent> <leader>d <Plug>DashSearch
" }

" NERDTree setting {
	map <C-o> :NERDTreeToggle<CR>
	let g:NERDTreeWinSize = 35
" }

" TagList setting {
	let Tlist_JS_Settings = 'javascript;s:string;a:array;o:object;f:function'
	let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

	" Show Tlist on the right
	let Tlist_Use_Right_Window=1

	" Close vim when Tlist is the last window
	let Tlist_Exit_OnlyWindow=1

	" Show Tlist only one file
	let Tlist_Show_One_File=1

	" Get focus when open the Tlist
	let Tlist_GainFocus_On_ToggleOpen=1
	" Set Tlist Window Width
	let Tlist_WinWidth=50

	" Mapping Toggle the Tlist
	map <C-g> :TlistToggle<CR>
" }

" statusline {
hi User1 guibg=#555555 guifg=#454545
hi User2 guibg=#555555 guifg=Gray
hi User3 guibg=#555555 guifg=White
set statusline=\ 
set statusline+=%t%m
set statusline+=%=%{''.(&fenc!=''?&fenc:&enc).''}
set statusline+=\ │\ 
set statusline+=%{&ff}
set statusline+=\ │\ 
set statusline+=%y
set statusline+=\ │\ 
set statusline+=[%-8.10(%l,%c%)\ %-4.(%p%%%)]
" }
"
