
 " This must be first, because it changes other options as a side effect.
 set nocompatible
 
 " SETTINGS
 " 
 filetype plugin indent on
 set encoding=utf-8
 set smarttab
 set noet ci pi sts=0 sw=2 ts=2
 " set noet ci pi sts=0 sw=4 ts=4
 " set noexpandtab
 " set copyindent
 " set preserveindent
 " set softtabstop=0
 " set shiftwidth=4
 " set tabstop=4
 set ignorecase
 set smartcase
 set nowrap
 set textwidth=0
 set autoindent
 set linebreak
 set number
 set cursorline
 set grepformat=%f:%l:%m
 set grepprg=ack\ -A\ 0\ -B\ 0\ --nocolour\ --nogroup\ --column
 set listchars=tab:▶\ ,eol:¬
 set wildignore=*.swp,.git,.svn,*.log,*.gif,*.jpeg,*.jpg,*.png,*.pdf,tmp/**
 set wildmenu                    " show menu when tabbing
 
 set hidden                      " Be more liberal about hidden buffers
 set backspace=indent,eol,start  " backspace over everything
 set numberwidth=5               " Sets the gutter width for line numbers
 set nobackup                    " do not keep a backup file, use an SCM instead
 set history=50                  " keep 50 lines of command line history
 set ruler                       " show the cursor position all the time
 set incsearch                   " do incremental searching
 set hlsearch                    " Highlight all search matches
 set lazyredraw                  " Don't update the display while executing macros
 " set ch=1                        " Make command line two lines high
 set laststatus=2                " Always show the status line
 set showcmd                     " Show the current command in the lower right corner right corner
 set showmode                    " Show the current mode
 set timeoutlen=450              " Short map keys timeout keeps the ui feeling snappy
 set tags=./TAGS,TAGS            " Use Emacs tagfile naming convention
 
 " Keep more context when scrolling off the end of a buffer
 set scrolloff=3
 
 " Store temporary files in a central spot
 set directory=~/.vim-tmp//,~/.tmp//,~/tmp//,/var/tmp//,/tmp
 
 set statusline=
 set statusline+=[%n]\ %<                        " Buffer number
 set statusline+=%.99f\                          " File path
 set statusline+=%w%m%r                          " Flags: window type, is modified, read-only
 set statusline+=%y                              " File type
 set statusline+=%=                              " Right align everything post here
 set statusline+=%-16(\ %l,%c\|%{col('$')-1}\ %) " show line number, cols, total cols
 set statusline+=%P                              " Percentage through file
 set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P	" show git branch
 
 let g:EasyMotion_leader_key = ','
 
 " Command-T Plugin and File Navigation
 let mapleader = ","
 cnoremap %% <C-R>=expand('%:h').'/'<cr>
 nmap <leader>gf :CommandTFlush<cr>
 nmap <leader>g :CommandT<cr>
 nmap <leader>gb :CommandTBuffer<cr>
 nmap <leader>gg :CommandT %%<cr>
 nmap <leader>gp :CommandT public<cr>
 nmap <leader>gm :CommandT grails-app/model<cr>
 nmap <leader>go :CommandT grails-app/conf<cr>
 nmap <leader>gc :CommandT grails-app/controllers<cr>
 nmap <leader>gv :CommandT grails-app/views<cr>
 nmap <leader>gs :CommandT grails-app/services<cr>
 nmap <leader>gt :CommandT test<cr>
 nmap <leader>ga :CommandT web-app<cr>
 let g:CommandTMaxHeight = 15

 " NERDTree keymap
 map <leader>r :NERDTreeFind<cr>
 map <leader>f :NERDTreeFocus<cr>
 
" Commenting blocks of code.
noremap   <silent> cc      :s,^\(\s*\)[^# \t]\@=,\1# ,e<CR>:nohls<CR>zvj
noremap   <silent> cu      :s,^\(\s*\)# \s\@!,\1,e<CR>:nohls<CR>zvj

 " Tabs keymap
 " set switchbuf=usetab,newtab
 " nnoremap <F8> :sbnext<CR>
 " nnoremap <S-F8> :sbprevious<CR>
 " nnoremap <C-Left> :tabprevious<CR>
 " nnoremap <C-Right> :tabnext<CR>
 " nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
 " nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

 " clear highlight
 nmap <silent> <leader>/ :noh<CR>

 " close buffers
 map <F3> :BufOnly<CR> "Close all other buffers but this one
 map <F4> :BufOnly<CR>:bd <cr> "Close all buffers

 " map tab key similar to Firefox
 map <leader>] gt
 map <leader>[ gT
 map <leader>1 1gt
 map <leader>2 2gt
 map <leader>3 3gt
 map <leader>4 4gt
 map <leader>5 5gt
 map <leader>6 6gt
 map <leader>7 7gt
 map <leader>8 8gt
 map <leader>9 :tablast<CR>

 command! -nargs=* Wrap set wrap linebreak nolist
 
 " Bubble text
 " Bubble single lines
 " nmap <M-Up> [e
 " nmap <M-Down> ]e
 " Bubble multiple lines
 " vmap <C-Up> [egv
 " vmap <C-Down> ]egv

 " Vundle settings
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'tpope/vim-fugitive'
 " Surround
 Bundle 'tpope/vim-surround'
 " Properly bubble text
 Bundle 'tpope/vim-unimpaired'
 " quick jump to text
 Bundle 'Lokaltog/vim-easymotion'
 " Close buffers
 Bundle 'BufOnly.vim'
 " Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 " Bundle 'tpope/vim-rails.git'
 " vim-scripts repos
 " Bundle 'L9'
 " Bundle 'FuzzyFinder'

 " Commenting
 Bundle 'tcomment'
 " Search files
 Bundle 'git://git.wincent.com/command-t.git'
 " Grep commands
 Bundle 'epmatsw/ag.vim'  
 " Align text
 Bundle 'godlygeek/tabular' 
 " Search text in all files within project
 Bundle 'mileszs/ack.vim'
 " Bundle 'jgdavey/tslime.vim'
 Bundle 'scrooloose/nerdtree'
 Bundle 'msanders/snipmate.vim'
 " Tab completion
 " Bundle 'ervandew/supertab' 

 " git clone git://github.com/altercation/vim-colors-solarized.git
 " Bundle 'altercation/vim-colors-solarized'

 " Bundle 'Valloric/YouCompleteMe'
 " git repos on your local machine (ie. when working on your own plugin)
 " Bundle 'file:///Users/gmarik/path/to/plugin'
 " ...

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
 

 " GUI/TERMINAL ENVIRONMENT SETTINGS

 if has("gui_running")
   set guioptions=egmrt
   set guifont=Inconsolata:h18
 else
 	 set t_Co=256
 	 set background=dark
 endif

 " In many terminal emulators the mouse works just fine, thus enable it.
 if has('mouse')
     set mouse=a
 endif
