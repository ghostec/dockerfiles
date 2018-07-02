let g:python2_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

call plug#begin()
"Plug 'sheerun/vim-polyglot'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-fugitive'
Plug 'bfrg/vim-cpp-modern'
"Plug 'ervandew/supertab' " auto tab context
Plug 'tpope/vim-surround' " quick switch enclosing chars
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs' " insert enclosing chars in pairs
Plug 'tpope/vim-endwise'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'w0rp/ale'
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/ncm-clang'
" Themes
Plug 'ajh17/Spacegray.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline-themes'
Plug 'crusoexia/vim-dracula'
call plug#end()

syntax on

set noswapfile
filetype on

set t_Co=256
set background=light
colorscheme dracula

" various options for clang_complete
set concealcursor=inv
let g:clang_snippets = 1
set completeopt=menu,longest

" ctrlp
" set a ~/.agignore file in order to work with ag (like .gitignore)
let g:ctrlp_custom_ignore = '\v[\/](build|node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" only use linters that uses compile_commands.json
let g:ale_linters = {}
let g:ale_fixers = {}
let g:ale_linters.cpp = ['clangcheck', 'clangtidy', 'cppcheck']
let g:ale_fixers.cpp = ['clang-format', 'remove_trailing_lines', 'trim_whitespace']

let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore=tags

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" vim-airline
set laststatus=2
"let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'

" NERDTree
nmap <leader>n :NERDTreeToggle<cr>

set wildmenu " visual autocomplete for command menu
set lazyredraw
set showmatch

" save session
" nnoremap <leader>s :mksession<CR>

" Line numbers
set number
set numberwidth=3
set cursorline
set cursorcolumn
set nofsync
" Tabs
"set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" Font
" set guifont=Fira_Code:h12
