runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax enable
filetype plugin indent on
set encoding=utf-8
set number
set ruler
set background=light
"let g:solarized_termcolors=256
colorscheme solarized
set tabstop=2 shiftwidth=2 expandtab
set laststatus=2
let g:jsx_ext_required = 0

inoremap jk <ESC>
map <Space> <leader>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>g :tabn<CR>
nnoremap <leader>G :tabp<CR>
nnoremap <leader>a :Ack 
nnoremap <leader>k :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><Esc>
nnoremap <leader>r :%s/<C-R><C-W>/
"nnoremap <leader>F :FlowToggle<CR>
nnoremap <leader>f :FlowMake<CR>
nnoremap <leader>F :FlowType<CR>
nnoremap <leader>h :ALEHover<CR>
nnoremap <leader>d ::ALEGoToDefinition<CR>
nnoremap <leader>D ::ALEDetail<CR>
nnoremap <leader>e :! yarn eslint %<CR>
"nnoremap <leader>e :call ale#Lint()<CR>
nnoremap <leader>j :! npm run test %<CR>
nnoremap <leader>J :! HMA_ENV=test jest % -u<CR>
nnoremap <leader>y :tabnew src/config/config.local.js<CR>
nnoremap <leader>Y :tabnew .configuration/config-local.yml<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --path-to-ignore\ ~/.ignore
  let g:ackprg = 'ag --nogroup --nocolor --column --path-to-ignore ~/.ignore'
  let g:ctrlp_user_command = 'ag %s -l --nocolor --path-to-ignore ~/.ignore -g ""'
  let g:ctrlp_use_caching = 0
  let g:ag_mapping_message=0
endif

"let g:syntastic_javascript_checkers = ['eslint']

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['eslint']

let g:flow#timeout = 2
let g:flow#enable = 0

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1

"prettier
autocmd FileType javascript.jsx,javascript,typescript,json set formatprg=prettier\ --stdin\ --parser\ typescript\ --single-quote\ --trailing-comma\ es5\ --semi\ false
"autocmd BufWritePre *.js :normal gggqG
"autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"

"Use locally installed flow
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
    let local_flow= getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif

" Asynchronous Lint Engine (ALE)
" Limit linters used for JavaScript.
let g:ale_linters = {
\  'java': [],
\  'javascript': ['flow', 'eslint', 'tslint']
\}
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
"let g:ale_sign_error = 'X' " could use emoji
"let g:ale_sign_warning = '?' " could use emoji
"let g:ale_statusline_format = ['X %d', '? %d', '']
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1
let g:ale_open_list = 1

let g:ale_sign_column_always = 1
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
"let g:ale_echo_msg_format = '%linter% says %s'
let g:ale_completion_enabled = 1
autocmd FileType qf setlocal wrap

" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>n :ALENextWrap<cr>
nnoremap <leader>p :ALEPreviousWrap<cr>

let NERDSpaceDelims=1

"https://danielmiessler.com/study/vim/?fb_ref=118ef0e03ab54c0d8197214328648a68-Hackernews
