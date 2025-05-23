" Init Plug
if empty(glob('~/.vim/autoload/plug.vim'))
   !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

source ~/.vim/plugins.vim

set expandtab

set linebreak

set list

set mouse=a
set mousefocus

set nobackup
set noswapfile

set number
set numberwidth=5

set smartcase

set splitbelow splitright

set shiftwidth=2
set softtabstop=2
set tabstop=2

set termguicolors
set textwidth=80
set hidden

set wildmenu
set wildmode=list:longest
silent! set wildignorecase

set winwidth=79 winheight=5 winminheight=5 winheight=999

set include=

" Don't redraw the screen during batch execution
set lazyredraw

let g:netrw_liststyle = 3

" Undo
silent !mkdir ~/.vim/undodir > /dev/null 2>&1
set undofile
set undodir=~/.vim/undodir

if exists("+spelllang")
  set spelllang=en_us
endif

command! -bang W w
command! -bang Q q
command! -bang Qa qa
command! -bang Wq wq
command! -bang Wqa wqa
command! -bang QQ qa!
command! -bang WW '!sudo tee % > /dev/null | edit!'
" cnoremap w!! execute 'write !sudo tee % > /dev/null' <bar> edit!

" REST OF FILE CONTAINS MAPPINGS
let mapleader = " "
let maplocalleader = ","

map <leader>s :split<cr>
map <leader>v :vsplit<cr>
map <C-l> <C-W>l
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k

nmap <leader>< [
nmap <leader>> ]
omap <leader>< [
omap <leader>> ]
xmap <leader>< [
xmap <leader>> ]

"" qq to record Q to replay
nmap Q @q
nnoremap Q @q

"" Quickfix
nnoremap ]q :cnext<cr>zz
nnoremap [q :cprev<cr>zz
nnoremap ]l :lnext<cr>zz
nnoremap [l :lprev<cr>zz

" ctrl+l redraws the screen and removes any search highlighting
nnoremap <silent> <leader>l :<C-U>nohlsearch<CR><C-L>
vnoremap <silent> <leader>l :<C-U>nohlsearch<CR>gv<C-L>

" <leader>c Close quickfix
nnoremap <leader>c :cclose<bar>lclose<bar>pclose<cr>

" open files in directory of current file
cnoremap %% <c-r>=expand('%:h').'/'<cr>

" GitGutter
set signcolumn=yes
set updatetime=250

" Emmet completion, rememeber to press `,` after this leader key
let g:user_emmet_leader_key='<C-e>'
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" Ag command line option
let g:ag_prg="ag --vimgrep --smart-case"

" FZF
let $FZF_DEFAULT_OPTS .= ' --inline-info'
nnoremap <silent> <leader>p :GFiles<cr>
nnoremap <silent> <leader>o :Files<cr>

let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

nnoremap <leader>S :%s/\<<C-r><C-w>\>/

" Completion
" set completeopt=menu,menuone,longest,preview,noinsert
" imap <c-f> <c-x><c-f><c-f>
" inoremap <Enter> <C-R>=pumvisible() ? "\<lt>C-y>" : "\<lt>Enter>"<CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" vim-lsp
let g:lsp_signs_enabled=1
let g:lsp_diagnostics_echo_cursor=1

let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('/tmp/lsp_log')

map gd <Plug>(lsp-definition)<CR>
map go  <Plug>(lsp-document-symbol)<CR>
map <F12> <Plug>(lsp-references)<CR>
map <F2> <Plug>(lsp-rename)<CR>
map K <Plug>(lsp-hover)



" Python
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

function! Get_flow_executable(server_info) abort
  let l:root_path = lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json')
  let l:flow_bin = l:root_path . '/node_modules/.bin/flow'
  return [l:flow_bin, 'lsp']
endfunction

" JS Flow
au User lsp_setup call lsp#register_server({
        \ 'name': 'flow',
        \ 'cmd': {server_info -> Get_flow_executable(server_info)},
        \ 'root_uri': {server_info -> lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
        \ 'whitelist': ['javascript', 'javascript.jsx'],
        \})

" Elixir
if executable('/elixir-ls/language_server.sh')
  au User lsp_setup call lsp#register_server({
          \ 'name': 'elixir-ls',
          \ 'cmd': {server_info -> ['/elixir-ls/language_server.sh']},
          \ 'root_uri': {server_info -> lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'mix.exs'))},
          \ 'whitelist': ['elixir', 'eelixir'],
          \})
endif

