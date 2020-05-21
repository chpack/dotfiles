call plug#begin('~/.local/share/nvim/plugged')

"Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch':'release'}
"Plug 'neoclide/coc-python'
"Plug 'neoclide/coc-lists'
"Plug 'neoclide/coc-git'
"Plug 'neoclide/coc-highlight'
Plug 'liuchengxu/space-vim-dark' 
Plug 'lervag/vimtex' 
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
"nnoremap <leader>b :%!clang-format<cr>
"nnoremap <leader>r :!make run<cr>
"nnoremap <leader>w :YcmDiags<cr>
"nnoremap <leader>f :YcmCompleter FixIt<cr>
"nnoremap <leader>i :YcmCompleter GoToInclude<CR>
"nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
""nnoremap <leader>f :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>m :YcmCompleter GoToImprecise<CR>
"nnoremap <leader>j :YcmCompleter GoTo<CR>
"nnoremap <leader>t :YcmCompleter GetType<CR>
"nnoremap <leader>c :YcmCompleter GetDoc<CR>
"nnoremap <leader>b :!./build.sh<CR>

  autocmd CmdwinEnter * inoremap <expr><buffer> <TAB>
        \ pumvisible() ? "\<C-n>" : "\<TAB>"

set guicursor=

let g:vimtex_latexmk_options='-pdf -pdflatex="xelatex -synctex=1 \%S \%O" -verbose -file-line-error -interaction=nonstopmode'
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_enable=1

" use <tab>
function! s:check_back_space() abort
    let col = col('.')-1
    return !col || getline('.')[col-1]=~ '\s'
endfunction

inoremap <silent><expr> <TAB>
		  \ pumvisible() ? "\<C-n>" :
		  \ <SID>check_back_space() ? "\<TAB>" :
		  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

nmap <leader>es <Plug>(coc-diagnostic-info) 
"			显示当前位置下的错误信息，没有截断。
"
nmap <leader>ej <Plug>(coc-diagnostic-next) 
"			跳转到下一个错误处。
"
nmap <leader>ek <Plug>(coc-diagnostic-prev) 
"			跳转到上一个错误处。
"
nmap <leader>el <Plug>(coc-diagnostic-next-error) 
"			跳转到下一个错误处.
"
nmap <leader>eh <Plug>(coc-diagnostic-prev-error) 
"			跳转到上一个错误处.
"
nmap <leader>jf <Plug>(coc-definition) 
"			跳转到定义位置。
"
nmap <leader>jc <Plug>(coc-declaration) 
"			跳转到声明位置。
"
nmap <leader>ji <Plug>(coc-implementation) 
"			跳转到实现位置。
"
nmap <leader>jt <Plug>(coc-type-definition) 
"			跳转到类型定义位置。
"
nmap <leader>jr <Plug>(coc-references) 
"			跳转到引用位置。
"
nmap <leader>fs <Plug>(coc-format-selected) 
nmap <leader>fs <Plug>(coc-format-selected) 
"			格式化选中区间，可在正常和可视模式下工作。
"			正常模式下时作用于 motion 对象。
"	例如: >
"	vmap <leader>p  nmap <leader> <Plug>(coc-format-selected)
"	nmap <leader>p  nmap <leader> <Plug>(coc-format-selected)
"	表示使用 `<leader>p` 格式化选中区间，使用 `<leader>pap` 格式化
"	当前段落。
"
nmap <leader>f <Plug>(coc-format) 
"			格式化当前 buffer。
"
nmap <leader>rn <Plug>(coc-rename) 
"			重命名光标所在位置符号。
"
nmap <leader>ef <Plug>(coc-codeaction) 
"			获取并执行 language server 给出的当前缓冲区的
"			可用操作。
"
"nmap <leader> <Plug>(coc-codeaction-selected) 
"			获取并执行 language server 给出的当前选择区间
"			内的可用操作。
"nmap <leader> <Plug>(coc-openlink) 
"			打开鼠标位置下的链接。
"
nmap <leader>cl <Plug>(coc-codelens-action) 
"			执行 codelens 给出的动作。
"
"			需要设置 `"codeLens.enable":true` 开启 codeLens
"			支持，该功能需要 neovim 支持 virtual text 特性。
"
nmap <leader>a <Plug>(coc-fix-current) 
"			修复当前行可修复的第一个错误修复操作。
"
nmap <leader>wh <Plug>(coc-float-hide) 
"			隐藏所有浮动窗口。
"
nmap <leader>wf <Plug>(coc-float-jump) 
"			跳转到第一个浮动窗口。
"
nmap <leader>rf <Plug>(coc-refactor) 
"			打开重构窗口，用于重构当前函数或重命名。
"
"nmap <leader>sj <Plug>(coc-range-select) 
"nmap <leader> <Plug>(coc-range-select) 
"
"			选择下一个可选区域。
"
"			注意：仅部分语言服务支持。
"
"nmap <leader>sk <Plug>(coc-range-select-backward) 
"			选择上一个可选区域。
"			注意：仅部分语言服务支持。
"nmap <leader> <Plug>(coc-funcobj-i) 
"			选择函数内所有行，默认映射到 `if` 。
"			例如：使用 `cif` 重写当前函数。
"nmap <leader> <Plug>(coc-funcobj-a) 
"			选择当前函数所在区间，默认映射到 `af`。
"
"
nmap <leader>la :CocList -A --normal outline<CR>
nmap <leader>ll :CocList -A outline<CR>
nmap <leader>lq :CocList -A --normal actions<CR>
nmap <leader>ls :CocList -A --normal diagnostics<CR>

let g:html_dynamic_folds = 1
set foldmethod=syntax
