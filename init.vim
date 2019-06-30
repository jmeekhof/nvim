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

" Plug 'Shougo/vimproc'
" Plug 'bitc/vim-hdevtools'
" Plug 'eagletmt/ghcmod-vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'
Plug 'w0rp/ale'
Plug 'parsonsmatt/intero-neovim'
"
Plug 'tmux-plugins/vim-tmux'
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

" ----- Haskell setup haskell-vim -----
let g:haskell_indent_if = 2
let g:haskell_indent_before_where = 2
let g:haskell_indent_case_alternatives = 1
let g:haskell_indent_let_no_in = 0

" ----- Haskell stylish-haskell
let g:hindent_on_save = 0

" Helper function, called below with mappings
function! HaskellFormat(which) abort
  if a:which ==# 'hindent' || a:which ==# 'both'
    :Hindent
  endif
  if a:which ==# 'stylish' || a:which ==# 'both'
    silent! exe 'undojoin'
    silent! exe 'keepjumps %!stylish-haskell'
  endif
endfunction

" Key bindings
augroup haskellStylish
  au!
  " Just hindent
  au FileType haskell nnoremap <leader>hi :Hindent<CR>
  " Just stylish-haskell
  au FileType haskell nnoremap <leader>hs :call HaskellFormat('stylish')<CR>
  " First hindent, then stylish-haskell
  au FileType haskell nnoremap <leader>hf :call HaskellFormat('both')<CR>
augroup END

" ----- Haskell ALE setup -----
" let g:ale_linters.haskell = ['stack-ghc-mod', 'hlint']
" ALE setup
let g:ale_haskell_hlint_executable = 'hlint'
let g:ale_haskell_ghc_mod_executable = 'ghc-mod'
" ----- parsonsmatt/intero-neovim -----

" Prefer starting Intero manually (faster startup times)
let g:intero_start_immediately = 0
" Use ALE (works even when not using Intero)
let g:intero_use_neomake = 0

augroup interoMaps
  au!

  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
  au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
  au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  au FileType haskell nnoremap <silent> <leader>wr :w \| :InteroReload<CR>
  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

  au FileType haskell map <leader>t <Plug>InteroGenericType
  au FileType haskell map <leader>T <Plug>InteroType
  au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

  au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>
  au FileType haskell nnoremap <silent> <leader>iu :InteroUses<CR>
  au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
augroup END
let g:ale_fixers = {
            \ 'kotlin': ['ktlint']
            \}
let g:ale_kotlin_ktlint_executable = 'ktlint'
let g:ale_linters = {
            \ 'haskell':  ['stack-ghc-mod', 'hlint']
            \}

let g:github_dashboard = { 'username': 'jmeekhof', 'password': $GITHUB_TOKEN }

" Profile for GHE at work
let g:github_dashboard#work = {
    \ 'username': 'jmeekhof',
    \ 'password': $GHE_TOKEN,
    \ 'api_endpoint': $GHE_API,
    \ 'web_endpoint': $GHE_WEB
    \ }
