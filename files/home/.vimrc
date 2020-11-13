syntax on
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

set tabstop=2
set shiftwidth=2
set expandtab
set number
set relativenumber
set hls
set clipboard=unnamedplus
set spell spelllang=en_us
set sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,terminal"

" splits

set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" fzf

nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <C-f> :GFiles<CR>

" commands

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" markdown preview

let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1

" ale
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" grepper
let g:grepper = {}
let g:grepper.tools = ['grep', 'git', 'rg']
" search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>
" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" vim-test
let test#strategy = 'dispatch'

" packages

packadd minpac
call minpac#init()
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('tpope/vim-dispatch')
call minpac#add('tpope/vim-projectionist')
call minpac#add('tpope/vim-scriptease', {'type': 'opt'})
call minpac#add('tpope/vim-unimpaired')
call minpac#add('JamshedVesuna/vim-markdown-preview')
call minpac#add('w0rp/ale')
call minpac#add('mhinz/vim-grepper')
call minpac#add('janko-m/vim-test')
call minpac#add('tpope/vim-obsession')

call minpac#add('tpope/vim-fugitive')
call minpac#add('scrooloose/nerdtree')
call minpac#add('vim-syntastic/syntastic')
call minpac#add('vim-airline/vim-airline')
call minpac#add('jlanzarotta/bufexplorer')
call minpac#add('scrooloose/nerdcommenter')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('vim-ruby/vim-ruby')
call minpac#add('tpope/vim-haml')
call minpac#add('skalnik/vim-vroom')
call minpac#add('luochen1990/rainbow')
call minpac#add('honza/vim-snippets')
call minpac#add('tpope/vim-rails')
call minpac#add('tpope/vim-rake')
call minpac#add('tpope/vim-sleuth')
call minpac#add('garbas/vim-snipmate')
call minpac#add('ekalinin/Dockerfile.vim')
call minpac#add('tpope/vim-projectionist')
call minpac#add('tpope/vim-surround')
call minpac#add('NLKNguyen/vim-docker-compose-syntax')
call minpac#add('moll/vim-node')
call minpac#add('tomtom/tlib_vim')
call minpac#add('altercation/vim-colors-solarized')
call minpac#add('tpope/vim-bundler')
call minpac#add('kchmck/vim-coffee-script')
call minpac#add('MarcWeber/vim-addon-mw-utils')
call minpac#add('kopischke/unite-spell-suggest')
