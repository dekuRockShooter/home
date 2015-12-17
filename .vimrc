" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'Valloric/YouCompleteMe'

    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
    " To ignore plugin indent changes, instead use:
    filetype plugin on
    "
    " Brief help
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plugin stuff after this line



" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" Path. Directories in which to search for files.
" set path+=~/...

filetype plugin on
" Colors
colorscheme deku

" Settings
syntax on
" set number
set hls
set wrap
set linebreak
set breakindent
set shiftwidth=4
set softtabstop=4
set autoindent
set expandtab
set cindent
set ruler
set noignorecase
set nocompatible
set showcmd
set history=50
set showmatch
set ignorecase smartcase
" set iskeyword+=-

" Keys
" Nothing: <Nop>
" Escape: <Esc>
" Fx: <Fx>
" Enter/Return: <CR>
" Space: <Space>
" Backspace: <BS>
" Left: <Left>
" Right: <Right>
" Shift: <S->
" Ctrl: <C->
" Home: <Home>
" End: <End>
" Insert: <Insert>
" Tab: <Tab>
" Pagedown: <PageDown>
" PageUp: <PageUp>
" |: <Bar> or \|
" Mappings okay to override: C-HJKL,<BS>,<Space>,HJKL
map <Bslash><Bslash> :buffers<CR>
map <Bslash>n :set number<CR>
map <Bslash>/ I"<ESC>
map H g^
map L g$
map <C-J> <C-E>
map <C-K> <C-Y>
nmap <Bslash>c :call Comment()<CR>
vmap <Bslash>c :call Comment()<CR>
nmap <Bslash>C :call Uncomment()<CR>
vmap <Bslash>C :call Uncomment()<CR>
:map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Function. Must start with capital letter. Call using :call

" Autocommand. When something happens, do something
" autocmd BufNewFile *.cpp read ~/template_cpp.cpp
autocmd BufNewFile,BufRead *.* syntax match Paren /[(){}\[\]]/
autocmd BufNewFile,BufRead *.* syntax match Oper /[!%^&*;:\-+=<>,.]/
autocmd BufNewFile,BufRead *.* set tabstop=4
autocmd BufNewFile,BufRead *.* retab 8
autocmd BufEnter *.* call ReloadComment() 

" Commands
" command Name action
" Plugins. See ~/.vim/plugin for global, ~/.vim/ftplugin for file specific
