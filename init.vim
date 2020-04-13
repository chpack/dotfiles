call plug#begin('~/.local/share/nvim/plugged')

Plug 'Valloric/YouCompleteMe'
"Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install({'tag':1})}}
"Plug 'neoclide/coc-python'
"Plug 'neoclide/coc-lists'
"Plug 'neoclide/coc-git'
"Plug 'neoclide/coc-highlight'
Plug 'liuchengxu/space-vim-dark' 
Plug 'jiangmiao/auto-pairs' 
Plug 'justinmk/vim-sneak'
Plug 'haya14busa/incsearch.vim'
Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


call plug#end()
"Plug 'jeaye/color_coded'
"Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }

set nocompatible                " use vim defaults
"set t_RV=                       " http://bugs.debian.org/608242

syntax on                       " turn syntax highlighting on by default
filetype on                     " detect type of file
filetype indent on              " load indent file for specific file type

set nobackup                    " do not keep a backup file
set novisualbell                " turn off visual bell
set visualbell t_vb=            " turn off error beep/flash

set ruler                       " show the current row and column
set number                      " show line numbers
set showcmd                     " display incomplete commands
set showmode                    " display current modes

set scrolloff=3                 " keep 3 lines when scrolling
set backspace=indent,eol,start  " make that backspace key work the way it
				"should
set showmatch                   " jump to matches when entering parentheses
set matchtime=0                 " tenths of a second to show the matching
				"parenthesis

set hlsearch                    " highlight searches
set incsearch                   " do incremental searching
set ignorecase                  " ignore case when searching
set smartcase                   " no ignorecase if Uppercase char present

" Default indenting options
set expandtab smarttab
set autoindent smartindent shiftround
set shiftwidth=4 softtabstop=4 tabstop=4
set colorcolumn=80

" Identify invisible characters and don't show them by default

set cursorcolumn
set cursorline
set nowrap

colorscheme space-vim-dark

highlight CursorLine   cterm=NONE ctermbg=235
highlight CursorColumn ctermbg=235
highlight ColorColumn ctermbg=235

hi Normal ctermbg=NONE
hi LineNr ctermbg=NONE
hi SignColumn ctermbg=NONE


"let g:ycm_extra_conf_globlist = ['~/.config/nvim/*']
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
set inccommand=split

inoremap <c-h> <c-space>

let mapleader = ","
nnoremap <leader>b :%!clang-format<cr>
nnoremap <leader>r :!make run<cr>
nnoremap <leader>w :YcmDiags<cr>
nnoremap <leader>f :YcmCompleter FixIt<cr>
nnoremap <leader>i :YcmCompleter GoToInclude<CR>
nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>f :YcmCompleter GoToDefinition<CR>
nnoremap <leader>m :YcmCompleter GoToImprecise<CR>
nnoremap <leader>j :YcmCompleter GoTo<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <leader>c :YcmCompleter GetDoc<CR>
"nnoremap <leader>b :!./build.sh<CR>

  autocmd CmdwinEnter * inoremap <expr><buffer> <TAB>
        \ pumvisible() ? "\<C-n>" : "\<TAB>"

set guicursor=
