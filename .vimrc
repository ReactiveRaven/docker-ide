set number

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'pangloss/vim-javascript' " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript support
Plug 'maxmellon/vim-jsx-pretty' " JS and JSX Syntax
Plug 'jparise/vim-graphql' " GraphQL syntax
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'prettier/vim-prettier' , { 'do': 'npm install' }
call plug#end()

set tabstop=4

let g:coc_global_extensions = [ 'coc-tsserver' ]

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" COC CONFIG
if has("patch-8.1.156")
  set signcolumn=number
else
  set signcolumn=yes
endif
set updatetime=300
set cmdheight=2
set shortmess+=c
if has ('nvim')
  inoremap <silent><expr> <c-`> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

