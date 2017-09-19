set nocompatible
set exrc
set secure

let $GIT_SSL_NO_VERIFY='true'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

filetype off

" backup to ~/.tmp {{{
  set backup
  set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
  set backupskip=/tmp/*,/private/tmp/* 
  set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
  set writebackup
" }}}

set noswapfile

" Bundles...
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'mxw/vim-jsx'
Plugin 'artemave/vigun'
Plugin 'tmhedberg/SimpylFold'


Bundle 'elixir-lang/vim-elixir'
Bundle "terryma/vim-expand-region"
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-scripts/surround.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'thoughtbot/vim-rspec'
Bundle 'jgdavey/tslime.vim'
Bundle 'tpope/vim-rails'
Bundle 'scrooloose/syntastic'
Bundle 'mattn/emmet-vim'
Bundle 'groenewege/vim-less'
Bundle 'ekalinin/Dockerfile.vim'
Bundle 'elzr/vim-json'
Bundle 'digitaltoad/vim-jade'
Bundle 'tpope/vim-commentary'
Bundle 'featurist/vim-pogoscript'
Bundle 'wavded/vim-stylus'
Bundle 'sjl/gundo.vim'
Bundle 'chrisbra/csv.vim'
Bundle 'sukima/xmledit'
Bundle 'roman/golden-ratio'
Bundle 'ternjs/tern_for_vim'
Plugin 'dracula/vim'
au FileType javascript map <buffer> <Leader>td :TernDef<cr>
au FileType javascript map <buffer> <Leader>tr :TernRefs<cr>
au FileType javascript map <buffer> <Leader>ta :TernRename<cr>
au FileType javascript map <buffer> <Leader>tt :TernType<cr>


" {{{ Go
Bundle 'dgryski/vim-godef'
autocmd BufWritePre *.go Fmt

" gocode
Bundle 'Blackrush/vim-gocode'
let g:SuperTabDefaultCompletionType = "context"
set completeopt-=preview
" }}}

Bundle 'rking/ag.vim'

syntax on
filetype plugin indent on

set rnu
set shiftwidth=2
set tabstop=2
set expandtab
"Always display the status bar.
set laststatus=2

"dot on whitespace.
set list listchars=tab:→\ ,trail:·

"Highlight search
set hlsearch
set incsearch
set ignorecase
set smartcase


" Change buffers without saving
set hidden

"Scroll with more context
set scrolloff=10


" auto-complete
set ofu=syntaxcomplete#Complete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" " Indent if we're at the beginning of a line. Else, do completion.
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>


" disable the arrow keys... let's see how long this stays here...
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>


" Sensible escape key
inoremap kj <Esc>`^

" unhighlight search terms on enter
nnoremap <CR> :nohls<CR><CR>

" gp to highlight last pasted area
nnoremap gp `[v\`]

" tslime mappings
vmap <C-c><C-c> "ry :call Send_to_Tmux(@r)<CR>
nmap <C-c><C-c> vip<C-c><C-c>
nmap <C-c>v :call <SID>Tmux_Vars()<CR>

set backspace=indent,eol,start

call vundle#end()            " required
filetype plugin indent on     " required!

" Syntastic
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'
highlight SyntasticErrorSign ctermfg=196 guifg=#ff0000
highlight SyntasticWarningSign ctermfg=226 guifg=#ffff00

let g:syntastic_javascript_checkers = ['eslint']

