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
"
"Plug 'sheerun/vim-polyglot'

Plug 'udalov/kotlin-vim'
Plug 'tfnico/vim-gradle'
Plug '~/potion-vim'
Plug '~/gsql-vim'
"Plug '~/vim-gradle-0.1'
"Plug 'https://bitbucket.org/sw-samuraj/vim-gradle'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'neo4j-contrib/cypher-vim-syntax'
Plug 'diepm/vim-rest-console'
Plug 'editorconfig/editorconfig-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'idanarye/vim-merginal', { 'branch': 'develop' }
Plug 'airblade/vim-gitgutter'
" Plug 'jeroenp/vim-xquery-syntax'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'lervag/vimtex'
Plug 'mattn/webapi-vim'
" Add plugins to &runtimepath
call plug#end()

colorscheme solarized
set number
set ai
set nowrap
set ignorecase
set gdefault
set showmatch
set background=dark
set ts=4
set sw=4
set expandtab
set colorcolumn=80
set updatetime=100
filetype on
au BufNewFile,BufRead *.sjs set filetype=javascript

"VRC Settings

let g:vrc_response_default_content_type = 'application/json'

let g:vrc_auto_format_response_patterns = {
    \ 'json': 'jq "."',
    \ 'xml': 'xmllint --format -'
    \}
let g:vrc_curl_opts = {
    \ '--connect-timeout' : 10,
    \ '-b': '~/.curl/cookiejar/cookie.txt',
    \ '-c': '~/.curl/cookiejar/cookie.txt',
    \ '-sSL': '',
    \ '--max-time': 60,
    \ '--ipv4': '',
    \ '-k': '',
    \'--netrc-optional': '',
    \}

"NetRW Settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
"let g:netrw_winsize = 25
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"augroup ProjectDrawer
"    autocmd!
"    autocmd VimEnter * :Vexplore
"augroup END
"
" Sort a _line_
vnoremap <F2> d:execute 'normal a' . join(sort(split(getreg('"'))), ' ')<CR>
vnoremap <F3> :sort<CR>
vnoremap <F4> :g/^\(.*\)\n\1$/d<CR>
vnoremap <F5> d:execute 'normal a' . split(getreg('"'))<CR>
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
