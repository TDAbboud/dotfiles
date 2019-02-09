" Auto install vim-plug if it's not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'ervandew/supertab'
Plug 'tpope/vim-commentary'     " Toggle comments like sublime
Plug 'tpope/vim-surround'       " Quickly change surrounding quotations
Plug 'airblade/vim-gitgutter'   " Git gitter
Plug 'tpope/vim-fugitive'       " Git for vim
Plug 'ryanoasis/vim-devicons'   " Icons
Plug 'Raimondi/delimitMate'     " Match parenthesis and quotes
Plug 'majutsushi/tagbar'        " Tags side bar browser
Plug 'mhinz/vim-startify'
Plug 'qpkorr/vim-bufkill'           " Bring sanity to closing buffers
Plug 'scrooloose/nerdtree',  { 'on': 'NERDTreeToggle'}
Plug 'ntpeters/vim-better-whitespace'

" Languages
Plug 'fatih/vim-go', {'for': ['go']}    " Loads only when editing go code
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Only load fzf when we are in the terminal
" Load ctrlp when we are in a gui vim
Plug 'junegunn/fzf', has('gui_running') ? { 'on': [] } : { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim', has('gui_running') ? { 'on': [] } : {}
Plug 'ctrlpvim/ctrlp.vim', has('gui_running') ? {} : { 'on': [] }

" Async Autocomplete (Only works with nvim)
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': ['go']}       " Go autocomplete

" Snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Colorthemes
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim/' }
Plug 'chriskempson/base16-vim'
Plug 'Lokaltog/vim-monotone'


" Just tests
Plug 'tpope/vim-dispatch'
" Plug 'tpope/vim-eunuch'
" Plug 'tdabboud/vim-godel'

call plug#end()
