syntax on
set nocompatible
set ttimeout
set notimeout
set backspace=indent,eol,start
set smarttab
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
"set softtabstop=4
set number
set relativenumber
set cursorline
set noshowmatch
set background=light
set t_Co=256
set synmaxcol=1000
set showcmd
set noshowmode
set noswapfile
set nobackup
set ruler
colorscheme spring-night

filetype plugin indent on

"noremap   <buffer> K      :s,^\(\s*\)[^# \t]\@=,\1#,e<CR>:nohls<CR>zv
"noremap   <buffer> <C-K>  :s,^\(\s*\)#\s\@!,\1,e<CR>:nohls<CR>zv

"noremap   <buffer> K      :s,^\(\s*\)[^# \t]\@=,\1#,e<CR>:nohls<CR>zv
"noremap   <buffer> <C-K>  :s,^\(\s*\)#\s\@!,\1,e<CR>:nohls<CR>zv

call plug#begin('~/.vim/bundle')
"Plug 'Valloric/YouCompleteMe'
"Plug 'scrooloose/syntastic'
"Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'html'] }
Plug 'Raimondi/delimitMate'
"Plug 'wookiehangover/jshint.vim', { 'for': 'javascript' }
Plug 'Lokaltog/vim-distinguished'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'fatih/vim-go'
Plug 'Shougo/neocomplcache.vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/MatchTagAlways'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'alvan/vim-closetag'
"Plug 'fisadev/vim-isort'
Plug 'mattn/emmet-vim'
Plug 'python-mode/python-mode'
Plug 'kshenoy/vim-signature'
" color schemes
Plug 'jpo/vim-railscasts-theme'
Plug 'nightsense/vim-crunchbang'
call plug#end()

" YouCompleteMe
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']

" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec='python3'
let g:syntastic_python_pylint_post_args = 
    \ ['--disable=missing-docstring,too-few-public-methods,' .
    \   'too-many-ancestors,no-member']


" delimitMate
imap <expr> <CR> pumvisible() ? neocomplcache#close_popup() : '<Plug>delimitMateCR'

" Emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,htmldjango,css EmmetInstall

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1

" for the indent guides plugin
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#121212 ctermbg=233

" vim-go settings
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

"au BufRead,BufNewFile *.tpl set filetype=gohtmltmpl syntax=gohtmltmpl

" ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" nerdtree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '→'
let g:NERDTreeDirArrowCollapsible = '↓'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"vim-closetag
"let delimitMate_matchpairs = "(:),[:],{:}"
"au FileType xhtml,html,htm let b:delimitMate_matchpairs = "(:),[:],{:}"

" python-mode
set completeopt=menu " hack to disable doc window
let g:pymode_python = "python3"
let g:pymode_folding = 0
let g:pymode_doc = 0
let g:pymode_lint_on_write = 1 
let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8', 'mccabe']
let g:pymode_lint_config = "$HOME/.pylintrc"
let g:pymode_lint_options_pep8 =
    \ {'ignore': 'E116'}
