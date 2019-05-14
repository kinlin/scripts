set ma
set showmatch
set smartindent
"set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set noexpandtab
set expandtab
set hlsearch
set number
set list
set listchars=tab:>-,trail:-
 
set ruler " 开启行号显示
syntax enable "开启语法高亮
syntax on "

set showmatch nosm "sm  nosm  show {} [] match

"使用语法高亮定义代码折叠
"set foldmethod=syntax
""打开文件是默认不折叠代码
set foldlevelstart=99

"set code fold
set fdm=manual  "manual  indent  expr   syntax   diff   marker

"forbiden vim generate backup file
set nobackup
set noswapfile
set nowritebackup

"vim paste. map F10, so we can paste as the copy styles
set pastetoggle=<F10>

" set cursorline " 高亮显示当前行
" set cursorcolumn " 高亮显示当前列
set cursorline  " 高亮当前行
set cursorcolumn " 高亮显示当前列

set laststatus=2 " 总是显示状态栏


" vim卡顿 https://github.com/wklken/k-vim/issues/233
" 主要是因为syntax on. 如果syntax off会好很多
set re=1
set ttyfast
set lazyredraw

"mouse support
"n Normal mode
"v visual mode
"i insert mode
"c command-line mode
"h all previous modes when editing a help file
"a all previous modes
set mouse=n

"Plugin 'taglist.vim'
"taglist config
let Tlist_Ctags_Cmd='ctags'
"let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window=1            "在右侧窗口中显示taglist窗口
let Tlist_Use_Left_Windo =1                "在左侧窗口中显示taglist窗口
let Tlist_WinWidt ="95"                    "设置taglist的宽度
"let Tlist_Use_Horiz_Window=1
"let Tlist_Height =65                    "设置taglist的宽度


"color set
"colorscheme molokai_dark
colorscheme molokai_dark
let g:molokai_original = 1
syntax enable
set t_Co=256
let g:rehash256 = 1
"highlight NonText guibg=#060606
"highlight Folded  guibg=#0A0A0A guifg=#9090D0
"==================================

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile Appraisals set filetype=ruby
"autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd Syntax javascript set syntax=jquery
let NERDTreeWinSize=40
let NERDTreeMouseMode=2
let NERDChristmasTree=1
"let NERDTreeShowLineNumbers=1
let NERDTreeWinPos="right"
let NERDTreeStatusline=1
let NERDTreeAutoCenter=1
"https://superuser.com/questions/195022/vim-how-to-synchronize-nerdtree-with-current-opened-tab-file-path/567013
"Actually , this make ctrip only search current folder
"autocmd BufEnter * lcd %:p:h
"NERDTree % can also have similar effect


" cscope settings
if has("cscope")
"	set csprg=/usr/bin/cscope
	set csprg=~/cscope.sh
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
		" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif

set csprg=~/cscope.sh

"ctrl+] search func name
map g<C-]> :cs find 3 <C-R>=expand(“<cword>”)<CR><CR>
"ctul+/ search c symbols
map g<C-/> : cs find 0 <C-R>=expand(“<cword>”)<CR><CR>
nmap ss    : cs find s <C-R>=expand("<cword>")<CR><CR>
nmap sg    : cs find g <C-R>=expand("<cword>")<CR><CR>
nmap sc    : cs find c <C-R>=expand("<cword>")<CR><CR>
nmap st    : cs find t <C-R>=expand("<cword>")<CR><CR>
nmap se    : cs find e <C-R>=expand("<cword>")<CR><CR>
nmap sf    : cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap si    : cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap sd    : cs find d <C-R>=expand("<cword>")<CR><CR>

"show cscope result in a quickfix window
"set cscopequickfix=s-,c-,d-,i-,t-,e-   


"powerline
set laststatus=2
let g:Powerline_symbols='compatible'
let g:Powerline_stl_path_style='short'
set encoding=UTF-8
set fillchars+=stl:\ ,stlnc:\


"if is over 80 characters one line
"highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
"match OverLength /\%>80v.\+/
"set colorcolumn=81

"save last position
if has("autocmd")
   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal g'\"" | endif
endif


let g:mwAutoSaveMarks = 1  "auto save preview vim session's marks
let g:mwAutoLoadMarks = 1


set nocp
set backspace=indent,eol,start

"install vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
"let g:cpp_experimental_template_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1


"Ctrlp file search

let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=2

"set case ignore when search.
set ignorecase smartcase

set incsearch


"===============================


"==============================
"Do this First
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \

"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 't9md/vim-quickhl'

"Actually most of time, we don't need this, and it slowdown the Edit
"Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'
Plug 'tacahiroy/ctrlp-funky'
"Another replace of powerline
Plug 'itchyny/lightline.vim'

Plug 'vimwiki/vimwiki'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

"pandoc
Plug 'vim-pandoc/vim-pandoc'

"github color scheme
Plug 'endel/vim-github-colorscheme'

"powerline
Plug 'lokaltog/vim-powerline'
"airline
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

"ctrlp
Plug 'ctrlpvim/ctrlp.vim'

"tomasr/molokai
"sudo cp ~/.vim/plugged/moloknai/colors/molokai.vim /usr/share/vim/vim81/colors/
"need run copy before it works
Plug 'tomasr/molokai'

"molokai_dark
Plug 'fcevado/molokai_dark'


"vim-cpp-enhanced-highlight
Plug 'octol/vim-cpp-enhanced-highlight'

"quickhl
Plug 't9md/vim-quickhl'

Plug 'vim-scripts/mru.vim'

"Plugin 'inkarkat/vim-mark'
"tips : check the mark.vim, will helpful.   like `99\m` and :Marks
Plug 'inkarkat/vim-mark'

"Plugin 'scrooloose/nerdtree'
Plug 'scrooloose/nerdtree'

"taglist
"Plug 'taglist.vim'

"tagbar  tagbar and taglist should choose one and delete another
Plug 'majutsushi/tagbar'

Plug 'godlygeek/tabular'

Plug 'plasticboy/vim-markdown'


"common function
Plug 'inkarkat/vim-ingo-library'

"snippet
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

"undo tree
"http://foocoder.com/2014/04/15/mei-ri-vimcha-jian-vim-che-xiao-shu-gundo-dot-vim/
" enter undolist will show undo tree
"Plug 'sjl/gundo.vim'
"This is not good. Use new one
Plug 'mbbill/undotree'


"surround.vim
"http://zuyunfei.com/2013/04/17/killer-plugin-of-vim-surround/
Plug 'tpope/vim-surround'

"plantuml syntax highlight
Plug 'aklt/plantuml-syntax'

"color scheme
Plug 'altercation/vim-colors-solarized'

call plug#end()


"tabular key
" 冒号对齐
" :Tab /:

"surround key
"Normal mode
"-----------
"ds  - delete a surrounding
"cs  - change a surrounding
"ys  - add a surrounding
"yS  - add a surrounding and place the surrounded text on a new line + indent it
"yss - add a surrounding to the whole line
"ySs - add a surrounding to the whole line, place it on a new line + indent it
"ySS - same as ySs
"
"Visual mode
"-----------
"s   - in visual mode, add a surrounding
"S   - in visual mode, add a surrounding but place text on new line + indent it
"
"Insert mode
"-----------
"<CTRL-s> - in insert mode, add a surrounding
"<CTRL-s><CTRL-s> - in insert mode, add a new line + surrounding + indent
"<CTRL-g>s - same as <CTRL-s>
"<CTRL-g>S - same as <CTRL-s><CTRL-s>

"undotree config
if has("persistent_undo")
    set undodir=$HOME."/.undodir"
    set undofile
endif
nnoremap <F5> :UndotreeToggle<cr>


"snippet config
let g:UltiSnipsExpandTrigger="<tab>"
" 使用 tab 切换下一个触发点，shit+tab 上一个触发点
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" 使用 UltiSnipsEdit 命令时垂直分割屏幕
let g:UltiSnipsEditSplit="vertical"



"vim-markdown config
let g:vim_markdown_folding_disabled = 1

"vim-mark
let g:mwDefaultHighlightingPalette = 'maximum'

"tagbar config
nmap <F5> :TagbarToggle<CR>

let g:quickhl_manual_enable_at_startup = 1
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)

nmap <Space>w <Plug>(quickhl-manual-this-whole-word)
xmap <Space>w <Plug>(quickhl-manual-this-whole-word)

nmap <Space>c <Plug>(quickhl-manual-clear)
vmap <Space>c <Plug>(quickhl-manual-clear)

nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

nmap <Space>j <Plug>(quickhl-cword-toggle)
nmap <Space>] <Plug>(quickhl-tag-toggle)
map H <Plug>(operator-quickhl-manual-this-motion)

"gitgutter
set updatetime=100
set updatecount=10000
"https://github.com/vim/vim/issues/2790
set redrawtime=100000
"
"vim-gitgutter
"jump to next hunk (change): ]c
"jump to previous hunk (change): [c
"
"stage the hunk with <Leader>hs
"undo it with <Leader>hu.

"let g:gitgutter_highlight_lines = 1

"fugitive
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

"ctrlp-funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

let g:ctrlp_funky_matchtype = 'path'


"vimwiki
"let g:vimwiki_folding = 'list'
let wiki = {}
let wiki.path = '/mnt/c/mygithub/mywiki/vimwiki/'
let wiki.export_path = '/mnt/c/mygithub/mywiki/vimwiki/vimwiki_assets'
let wiki.path_html = '/mnt/c/mygithub/mywiki/vimwiki_html'
let wiki.nested_syntaxes = {'js':'javascript', 'python': 'python', 'c++': 'cpp', 'md':'markdown', 'mk':'makefile', 'shell':'shell'}
"let wiki.template_path=wiki.path_html.'/template'
let wiki.template_path=wiki.export_path.'vimwiki-assets'
let wiki.template_default='default'
let wiki.template_ext = '.html'
let g:vimwiki_table_mappings = 0



"set for markdown syntax
"let wiki.syntax='markdown'
"let wiki.ext='.md'
"let g:vimwiki_customwiki2html=$HOME.'/.vim/plugged/vimwiki/autoload/vimwiki/customwiki2html.sh'

"vimwiki folding
let g:vimwiki_folding=''

let g:vimwiki_list = [wiki]
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1,color,p'

"indent-guides
"Useless...............
"==============================




map <f11> :call CompileUml()<cr>
func! CompileUml()
exec "w"
exec "!java -jar plantuml.jar -charset UTF-8 %"
exec "!java -jar plantuml.jar -charset UTF-8 -tsvg %"
endfunc

"reset cscope out file
map <F12> : call ReConnectCscope()<cr>
func! ReConnectCscope()
exec "cs kill 0"
exec "!./generate.sh"
exec "set csprg=~/cscope.sh"
exec "cs add cscope.out"
endfunc

"use
func! CallTagTog()
exec "TagbarTogger"
endfunc
nmap tt :TagbarToggle<CR><CR>

"map Gblame
nmap gb :Gblame<cr>

"map syntax sync fromstart
nmap tu :syntax sync fromstart<cr>


