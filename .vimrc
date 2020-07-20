syntax on
set t_Co=256
set comments=sl:/*,mb:\ *,elx:\ */ "intelligent comments
set showcmd " Show partial command in status line
set showmatch "Show matching brackets
set ignorecase "Do case insenstive matching
set smartcase "Do smart case matching
set incsearch "Set incremental search
set hlsearch "Highlight search
set autowrite "Automatically save the buffer
set autoread "Reload the buffer when file changes on disk
set mouse=a "Enable mouse usage
set wrap "word wrap
set autoindent
set smartindent "set auto indentation
filetype plugin indent on
set termguicolors
set wildmenu
set path+=** "Search recursively

set tabstop=4 "make tab 4 spaces
set shiftwidth=4 "auto indentaion
set softtabstop=4
set expandtab
set shiftround "round indent to shiftwidth

set scrolloff=8 "display 88888888 lines above/below the cursor when scrolling with a mouse
set backspace=indent,eol,start "fixes common backspace problems
set ttyfast "speed up scrolling
set laststatus=2 "show the status bar
set showmode "show the mode
set showcmd "show the command
set matchpairs+=<:> "highlight matching pairs of brackets
set number "show the line number
set encoding=utf-8 "set the encoding
"set spelllang=en_ca
"set spell
set splitbelow
set splitright

"PLUGINS
".......
call plug#begin('~/.vim/plugged')

    Plug 'dracula/vim',{'as':'dracula'}
    Plug 'Valloric/YouCompleteMe',{'do':'./intall.py --clang-completer' }
   " Plug 'neoclide/coc.nvim', {'branch':'release'}
    "Plug 'xavierd/clang_complete'
    Plug 'joshdick/onedark.vim'
    Plug 'rhysd/vim-clang-format'
    Plug 'scrooloose/nerdtree', { 'on':'NERDTreeToggle' }
    Plug 'dense-analysis/ale'
    Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()

colorscheme onedark
autocmd FileType c ClangFormatAutoEnable
autocmd FileType cpp ClangFormatAutoEnable
let g:NERDTreeQuitOnOpen = 1 "quit NERDTree after opening a file

"STATUS BAR
"..........
set statusline=
set statusline+=%#IncSearch# "color setting
set statusline+=\ %M "show change in the status bar
set statusline+=\ %y "show the filetype in status bar
set statusline+=%#CursorLineNr#
set statusline+=\ %F "show the filepath in status bar
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction
function! StatusLineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) >0?' '.l:branchname.' ':''
endfunction
set statusline+=%{StatusLineGit()} "show git stuff
set statusline+=\ %r "show read-only
set statusline+=%= "right side settings
set statusline+=%#Search#
set statusline+=\ %c:%l/%L "show the column and the current line/total lines
set statusline+=\ %p%% "show the % of the document
set statusline+=\ [%n] "show the current buffer inside of []

"REMAPS
"......
let mapleader=" "
nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <C-f> :ClangFormat<CR>
nnoremap <C-v> :vsplit<CR>
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
nnoremap K 10k
nnoremap J 10j
nnoremap H 5h
nnoremap L 5l

"YouCompleteMe global config
let g:ycm_show_diagnostics_ui = 0

"let g:ycm_key_list_select_completion = ['<C-k>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-l>', '<Up>']
let g:SuperTabDefaultCompletionType = "context"

"disable ycm confirmation
let g:ycm_comfirm_extra_conf = 0

let g:ycm_global_ycm_extra_config = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_config.py'

" Ale
"....

let g:ale_comletion_enabled=1
let g:ale_cpp_clang_executable='clang++-5.0'

"Clang Complete
".............
 " path to directory where library can be found
 let g:clang_library_path='/usr/local/Cellar/llvm/10.0.0_3/lib'



"linter
"......
let g:ale_linters = {
    \   'cpp': ['clang']
    \}
let g:ale_cpp_clang_options = '-std=c++1z - 00 -Wextra -Wall -Wpedantic'
