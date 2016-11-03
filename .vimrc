runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax enable
filetype plugin indent on
set encoding=utf-8
set number
set ruler
set background=light
let g:solarized_termcolors=256
colorscheme solarized
set tabstop=2 shiftwidth=2 expandtab

inoremap jk <ESC>
map <Space> <leader>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>g :tabn<CR>
nnoremap <leader>G :tabp<CR>
nnoremap <leader>a :Ag 
nnoremap <leader>k :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ackprg = 'ag --nogroup --nocolor --column'
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

"https://danielmiessler.com/study/vim/?fb_ref=118ef0e03ab54c0d8197214328648a68-Hackernews
