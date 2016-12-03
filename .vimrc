
" Install vim-plug if we don't already have it
if empty(glob("~/.vim/autoload/plug.vim"))
  " Ensure all needed directories exist
  execute 'mkdir -p ~/.vim/plugged'
  execute 'mkdir -p ~/.vim/autoload'
  " Download the actual plugin manager
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" plugin on GitHub repo
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rvm'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
let g:rspec_command = "Dispatch rspec {spec}"

"Plugin 'Valloric/YouCompleteMe'
"let g:ycm_key_list_select_completion   = ['<C-j>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionTyp     = '<C-n>'
let g:SuperTabCrMapping                = 0

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

Plug 'easymotion/vim-easymotion'
map go <Plug>(easymotion-bd-f) 

Plug 'majutsushi/tagbar'
"let g:tagbar_left=1
map <F12> :TagbarToggle<CR>

Plug 'szw/vim-tags'

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
map <Leader>ff :NERDTree<CR>
map <Leader>ffc :NERDTreeClose<CR>
" if has("autocmd")
"   autocmd vimenter * NERDTree
"   autocmd vimenter * if !argc() | NERDTree | endif
"   autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | e
"   autocmd vimenter * wincmd p
" endif

Plug 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

"Plug 'flazz/vim-colorschemes'
Plug 'altercation/vim-colors-solarized'

"Plug 'scrooloose/syntastic'
Plug 'mbedna/syntastic' "Forked from scrooloose/syntastic, solved cygwin path problem
let g:syntastic_error_symbol = '>>'
let g:syntastic_warning_symbol = '>'
let g:syntastic_enable_highlighting = 1
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_java_checkers = ['javac']
let g:syntastic_java_javac_config_file_enabled = 1

Plug 'vim-scripts/vim-gradle'
Plug 'Scuilion/gradle-syntastic-plugin'

Plug 'godlygeek/tabular'
":Tab /=        等号对齐
":Tab /:        冒号对齐
":Tab /:\zs     冒号后的文字对齐

"Plug 'OmniSharp/omnisharp-vim'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
"imap <Leader>sm <esc>a<Plug>snipMateNextOrTrigger
"smap <Leader>sm <Plug>snipMateNextOrTrigger

" Optional:
Plug 'honza/vim-snippets'
"Plug 'SirVer/ultisnips'
"Plug 'matthewsimo/angular-vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

Plug 'rstacruz/sparkup'
Plug 'mattn/emmet-vim'
let g:user_emmet_mode='n'

Plug 'vim-ctrlspace/vim-ctrlspace'
set hidden
set showtabline=0 "If you feel brave enough turn off tabline

Plug 'thoughtbot/vim-rspec'
Plug 'janko-m/vim-test'
Plug 'tomtom/tcomment_vim'
Plug 'kien/ctrlp.vim'
Plug 'claco/jasmine.vim'
Plug 'Raimondi/delimitMate'
Plug 'vim-scripts/javacomplete'
"Plug 'artur-shaik/vim-javacomplete2'
"Plug 'wsdjeg/vim-javacomplete2'
let g:JavaComplete_JavaviDebug=1
let g:JavaComplete_JavaviLogfileDirectory="C:/"
let g:JavaComplete_ShowExternalCommandsOutput=1
Plug 'airblade/vim-rooter'

Plug 'JalaiAmitahl/maven-compiler.vim'
Plug 'mikelue/vim-maven-plugin'

"Plug 'ryanoasis/vim-webdevicons'
"let g:webdevicons_enable = 1

filetype plugin indent on    " required

" All of your Plugins must be added before the following line
call plug#end()            " required

syntax on
syntax enable
set rnu
set nu
set numberwidth=4
set cpoptions+=n
"highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

set foldenable
set foldlevel=2
set foldcolumn=2
set foldnestmax=2
set foldmethod=syntax
set smartindent

set tabstop=2
set shiftwidth=2
set expandtab
set cursorline
"highlight CursorLine ctermbg=Black ctermfg=None
"hi Normal ctermbg=none

set grepprg=grep\ -nH\ $*
let g:tex_flavour = "latex"

set laststatus=2

set t_ut=
if $TERM == "xterm"
   set t_Co=256
endif

" colorscheme molokai
" set background=dark
" let g:molokai_original = 1
" let g:rehash256 = 1

set background=dark
let g:solarized_termcolors=256
colorscheme solarized

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '\..'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class

let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ }

map <Leader>lcd :lcd %:p:h<CR> "Change dir position to current opend file
map <Leader>ev :e $MYVIMRC<CR>
map cb :CtrlSpace<CR>
map <Leader>env :so ~/.vimrc<CR>
map <Leader>gc :!google-chrome %<CR>

"call append(linenumber, repeat([''], 5))
nmap <S-Enter> O<ESC>j "Insert newline above without entering insert mode
nmap <CR> o<ESC>k "Insert newline below without entering insert mode

" For vim-rspec plugin
map <Leader>st :call RunCurrentSpecFile()<CR>
map <Leader>ss :call RunNearestSpec()<CR>
map <Leader>sl :call RunLastSpec()<CR>
map <Leader>sa :call RunAllSpecs()<CR>


