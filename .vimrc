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

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"mouse support
"n Normal mode
"v visual mode
"i insert mode
"c command-line mode
"h all previous modes when editing a help file
"a all previous modes
set mouse=n

Bundle 'taglist.vim'
let Tlist_Ctags_Cmd='ctags'
"let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window=1            "在右侧窗口中显示taglist窗口
let Tlist_Use_Left_Windo =1                "在左侧窗口中显示taglist窗口
let Tlist_WinWidt ="95"                    "设置taglist的宽度
"let Tlist_Use_Horiz_Window=1
"let Tlist_Height =65                    "设置taglist的宽度


"color set
colorscheme molokai_dark
"colorscheme molokai
let g:molokai_original = 1
syntax enable
set t_Co=256
let g:rehash256 = 1
"highlight NonText guibg=#060606
"highlight Folded  guibg=#0A0A0A guifg=#9090D0
"==================================
"colorscheme papercolor setting
"set background=dark
"colorscheme PaperColor


Plugin 'sickill/vim-monokai'
Bundle 'The-NERD-tree'
"open NERDTree default
"autocmd VimEnter * NERDTree

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd Syntax javascript set syntax=jquery
let NERDTreeWinSize=40
let NERDTreeMouseMode=2
let NERDChristmasTree=1
"let NERDTreeShowLineNumbers=1
let NERDTreeWinPos="right"
let NERDTreeStatusline=1
let NERDTreeAutoCenter=1


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

"ctrl+] search func name
map g<C-]> :cs find 3 <C-R>=expand(“<cword>”)<CR><CR>
"ctul+/ search c symbols
map g<C-/> :cs find 0 <C-R>=expand(“<cword>”)<CR><CR>

nmap ss :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap sg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap sc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap st :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap se :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap sf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap si :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap sd :cs find d <C-R>=expand("<cword>")<CR><CR>

"show cscope result in a quickfix window
"set cscopequickfix=s-,c-,d-,i-,t-,e-   


"powerline
"Bundle "Lokaltog/vim-powerline"
set laststatus=2
let g:Powerline_symbols = 'compatible'
let g:Powerline_stl_path_style = 'short'
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

set csprg=~/cscope.sh

"marks
highlight MarkWord6 ctermfg=0  ctermbg=9  guifg=#ffffff  guibg=#ff7272
highlight MarkWord7 ctermfg=231  ctermbg=98  guifg=#ffffff  guibg=#875fd7
highlight MarkWord8 ctermfg=15  ctermbg=75  guifg=#ffffff  guibg=#50f078
highlight MarkWord9 cterm=bold ctermfg=231  ctermbg=160  guifg=#ffffff  guibg=#d70000
highlight MarkWord10 ctermfg=15  ctermbg=216  guifg=Black  guibg=#82F078
highlight MarkWord11 ctermfg=231  ctermbg=24  guifg=#ffffff  guibg=#005f87
highlight MarkWord12 cterm=bold ctermfg=88  ctermbg=208 gui=bold  guifg=#ffffff  guibg=#ff8700
highlight MarkWord13 cterm=bold ctermfg=231  ctermbg=97  gui=bold  guifg=#ffffff  guibg=#0058f7
highlight MarkWord14 cterm=bold ctermfg=15  ctermbg=90  gui=bold  guifg=#005f5f  guibg=#ffffff
highlight MarkWord15 cterm=bold ctermfg=15  ctermbg=55  gui=bold  guifg=#5f00af  guibg=#ffffff
highlight MarkWord16 cterm=bold ctermfg=160 ctermbg=148  gui=bold  guifg=#d70000  guibg=#afd700
highlight MarkWord17 cterm=bold ctermfg=231 ctermbg=60   gui=bold  guifg=#ffffff  guibg=#5f00af
highlight MarkWord18 cterm=bold ctermfg=0  ctermbg=178  gui=bold  guifg=Black  guibg=#6BF0B4
highlight MarkWord19 cterm=bold ctermfg=0  ctermbg=26  gui=bold  guifg=Black  guibg=#06F099
highlight MarkWord20 cterm=bold ctermfg=0  ctermbg=62  gui=bold  guifg=Black  guibg=#22F078
highlight MarkWord21 cterm=bold ctermfg=0  ctermbg=200  gui=bold  guifg=White  guibg=#A6BFA1


let g:mwAutoSaveMarks = 1  "auto save preview vim session's marks
let g:mwAutoLoadMarks = 1



"plantuml
"let g:plantuml_executable_script='java -jar /drivers/c/MyLearning/plantuml.jar'
"nnoremap <F4> :w<CR> :silent make<CR>
"inoremap <F4> <Esc>:w<CR>:silent make<CR>
"vnoremap <F4> :<C-U>:w<CR>:silent make<CR

set nocp
set backspace=indent,eol,start

"install vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1


"Ctrlp file search

Bundle 'ctrlpvim/ctrlp.vim'
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
"Plug 'lokaltog/vim-powerline'
Plug 'vimwiki/vimwiki'
Plug 'nathanaelkane/vim-indent-guides'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

"pandoc
Plug 'vim-pandoc/vim-pandoc'

"github color scheme
Plug 'endel/vim-github-colorscheme'
call plug#end()
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
let wiki.path = '/mnt/c/vimwiki/'
let wiki.export_path = '/mnt/c/vimwiki/vimwiki_assets'
let wiki.path_html = '/mnt/c/vimwiki_html'
let wiki.nested_syntaxes = {'js':'javascript', 'python': 'python', 'c++': 'cpp', 'md':'markdown'}
"let wiki.template_path=wiki.path_html.'/template'
let wiki.template_path=wiki.export_path.'vimwiki-assets'
let wiki.template_default='default'
let wiki.template_ext = '.html'



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



"reset cscope out file
map <F5> : call FlushStatus()<cr>
func! FlushStatus()
exec "Gblame"
endfunc


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

