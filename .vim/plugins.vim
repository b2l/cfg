call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-sensible'

" Completion / Linting
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'

Plug 'PotatoesMaster/i3-vim-syntax'

" Theme
Plug 'ayu-theme/ayu-vim'

Plug 'tpope/vim-commentary' " Comment line/block... witch gcc, gc in visual, gcap for a paragraph
Plug 'tpope/vim-repeat' " add repeat with . to plugins
Plug 'tpope/vim-surround' " Surroung selection, word.. with something
Plug 'tpope/vim-vinegar'

" Python
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }

" Elixir Support 
Plug 'elixir-editors/vim-elixir'

" Javascript Support
Plug 'leafgarland/typescript-vim', {'for': ['typescript', 'typescript.tsx']}
Plug 'Galooshi/vim-import-js', {'for': ['javascript', 'javascript.tsx'], 'do': 'yarn global add import-js@3.1.0'}
Plug 'prettier/vim-prettier', { 'branch': 'release/1.x'}

" Web Support
Plug 'mattn/emmet-vim', { 'for': ['javascript','javascript.jsx' , 'css', 'scss', 'html', 'eex', 'mason'] }

call plug#end()
