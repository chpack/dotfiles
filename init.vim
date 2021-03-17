call plug#begin('~/.local/share/nvim/plugged')


Plug 'neoclide/coc.nvim', {'branch':'release'}

Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
"Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }

"Plug 'neoclide/coc-python'
"Plug 'neoclide/coc-lists'
"Plug 'neoclide/coc-git'
"Plug 'neoclide/coc-highlight'
"
"Plug 'lervag/vimtex' 
"
Plug 'jiangmiao/auto-pairs' 
"Plug 'justinmk/vim-sneak'
"Plug 'haya14busa/incsearch.vim'
"Plug 'mhinz/vim-signify'
"Plug 'airblade/vim-gitgutter'
"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'OmniSharp/omnisharp-vim'
"Plug 'jeaye/color_coded'
"
"Plug 'liuchengxu/space-vim-dark' 
"
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'nvim-treesitter/nvim-treesitter'
"

call plug#end()

set nocompatible                " use vim defaults
"set t_RV=                       " http://bugs.debian.org/608242

syntax on                       " turn syntax highlighting on by default
filetype on                     " detect type of file
filetype indent on              " load indent file for specific file type

"set nobackup                    " do not keep a backup file
set novisualbell                " turn off visual bell
set visualbell t_vb=            " turn off error beep/flash

set ruler                       " show the current row and column
set number                      " show line numbers
set showcmd                     " display incomplete commands
set showmode                    " display current modes

set scrolloff=5                 " keep 3 lines when scrolling
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
"colorscheme gruvbox

highlight CursorLine   cterm=NONE ctermbg=235
highlight CursorColumn ctermbg=235
highlight ColorColumn ctermbg=235

hi Normal ctermbg=NONE
hi LineNr ctermbg=NONE
hi SignColumn ctermbg=NONE


"let g:ycm_extra_conf_globlist = ['~/.config/nvim/*']
"let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
"let g:ycm_autoclose_preview_window_after_completion = 1
set inccommand=split

"inoremap <c-h> <c-space>

let mapleader = ","

set guicursor=

let g:vimtex_latexmk_options='-pdf -pdflatex="xelatex -synctex=1 \%S \%O" -verbose -file-line-error -interaction=nonstopmode'
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_enable=1

set hidden

let g:coc_global_extensions = ['coc-json','coc-vimlsp']

set updatetime=100

set shortmess+=c

set signcolumn=number

" use tab
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-o> coc#refresh()
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <leader>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format)
nmap <leader>f  <Plug>(coc-format)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-line)
nmap <leader>a  <Plug>(coc-codeaction-line)

" Remap keys for applying codeAction to the current buffer.
nmap <leader><tab> <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
nnoremap <silent><nowait> <space>f  :CocCommand explorer<CR>

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

let g:html_dynamic_folds = 1
set foldmethod=syntax
set foldlevel=10

let g:coc_disable_startup_warning = 1

set mouse=a

lua <<EOF
  require'nvim-treesitter.configs'.setup {
    --ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true,              -- false will disable the whole extension
      --disable = { "c", "rust" },  -- list of language that will be disabled
    },
  }
EOF

lua <<EOF
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.cpp = {
  install_info = {
    url = "/home/ch/op/tree-sitter/tree-sitter-cpp", -- local path or git repo
    files = {"src/parser.c","src/scanner.cc"}
  },
  filetype = "cpp", -- if filetype does not agrees with parser name
  used_by = {"bar", "baz","cpp"} -- additional filetypes that use this parser
}
EOF

"let g:nvcode_termcolors=256


colorscheme nvcode " Or whatever colorscheme you make


" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    "hi LineNr ctermbg=NONE guibg=NONE
endif

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

nnoremap <leader>t :hi Normal guibg=1<cr>
nnoremap <leader>T :hi Normal guibg=#1e1e1e<cr>
