call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Group dependencies, vim-snippets depends on ultisnips
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }
" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

Plug 'editorconfig/editorconfig-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'  
Plug 'gregsexton/gitv' 
Plug 'idanarye/vim-merginal'
Plug 'jeroenp/vim-xquery-syntax'

Plug 'bling/vim-airline' 
Plug 'vim-airline/vim-airline-themes'

" Add plugins to &runtimepath
call plug#end()

"colorscheme solarized
set number
set ai
set nowrap
set ignorecase
set gdefault
set showmatch
set background=light
