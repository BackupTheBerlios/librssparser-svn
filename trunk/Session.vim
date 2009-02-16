let SessionLoad = 1
if &cp | set nocp | endif
map Q gq
let s:cpo_save=&cpo
set cpo&vim
nmap <silent> \ucs :call C_RemoveGuiMenus()<NL>nmap <silent> \lcs :call C_CreateGuiMenus()<NL>let s:cpo_save=&cpo
nmap <silent> \lcs :call C_CreateGuiMenus()
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)<NL>let &cpo=s:cpo_save
let &cpo=s:cpo_save
unlet s:cpo_save
set background=dark
set backspace=indent,eol,start
set backup
set helplang=en
set history=50
set hlsearch
set iminsert=0
set incsearch
set mouse=a
set ruler
set shiftwidth=4
set showcmd
set tabstop=4
set termencoding=utf-8
set window=38
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/projekty/c/librssparser
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +7 src/rss.c
badd +27 src/rss.h
badd +10 src/rss_curl.c
badd +1 src/rss_curl.h
badd +13 src/rss_expat.c
badd +13 src/rss_expat.h
badd +13 src/rss_iconv.c
badd +13 src/rss_iconv.h
badd +10 src/rss_list.c
badd +10 src/rss_list.h
badd +1 src/rss_data.h
badd +154 test/test.c
badd +25 src/Makefile
badd +11 test/Makefile
badd +8 Makefile
badd +1 README
badd +1 AUTHOR
badd +1 TODO
silent! argdel *
edit src/rss.c
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <silent> <S-F9> :call C_Arguments()<NL>imap <buffer> <silent> <C-F9> :call C_Run()<NL>imap <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()<NL>imap <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()<NL>nmap <buffer> <silent> \rh :call C_Hardcopy("n")<NL>nmap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()<NL>nnoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>nnoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
imap <buffer> <silent> <C-F9> :call C_Run()
imap <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()
imap <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()
nnoremap <buffer> <silent> \s{ :call C_Block("a")o
nnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")
nnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")
nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
nnoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
nmap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()
nmap <buffer> <silent> \rh :call C_Hardcopy("n")
nnoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
nnoremap <buffer> <silent> \np :call C_ProtoPick("n")<NL>nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")<NL>nnoremap <buffer> <silent> \ias oassert();<Left><Left>
nnoremap <buffer> <silent> \isi isizeof()<Left>
nnoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
nnoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
nnoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
nnoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
nnoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
nnoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
nnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")<NL>nnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")<NL>nnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")<NL>nnoremap <buffer> <silent> \s{ :call C_Block("a")o
nnoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
nnoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
nnoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
nnoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
nnoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
nnoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
nnoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
nnoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
nnoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
nnoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
nnoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
nnoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch<NL>nnoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
nnoremap <buffer> <silent> \c* :call C_CodeComment("a","yes"):nohlsearchj
nnoremap <buffer> <silent> \ci o/*/kA 
nnoremap <buffer> <silent> \cn :call C_LineEndComment("// ")A
nnoremap <buffer> <silent> \cl :call C_LineEndComment()a
nnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")<NL>map <buffer> <silent> \h :call C_HelpCsupport()<NL>map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()<NL>map <buffer> <silent> \rx :call C_XtermSize()<NL>map <buffer> <silent> \rs :call C_Settings()<NL>vmap <buffer> <silent> \rh :call C_Hardcopy("v")<NL>omap <buffer> <silent> \rh :call C_Hardcopy("n")<NL>vmap <buffer> <silent> \rd :call C_Indent("v"):redraw:call C_HlMessage()<NL>omap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()<NL>map <buffer> <silent> \ri :call C_SplintArguments()<NL>map <buffer> <silent> \rp :call C_SplintCheck():redraw:call C_HlMessage()<NL>map <buffer> <silent> \rg :call C_MakeArguments()<NL>map <buffer> <silent> \rm :call C_Make()<NL>map <buffer> <silent> \ra :call C_Arguments()<NL>map <buffer> <silent> \rr :call C_Run()<NL>map <buffer> <silent> \rl :call C_Link():redraw:call C_HlMessage()<NL>map <buffer> <silent> \rc :call C_Compile():redraw:call C_HlMessage()<NL>vnoremap <buffer> <silent> \+c. :call C_CodeCatch("v","...")<NL>onoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>vnoremap <buffer> <silent> \+ca :call C_CodeCatch("v"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \ias oassert();<Left><Left>
onoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
map <buffer> <silent> \h :call C_HelpCsupport()
map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call C_XtermSize()
map <buffer> <silent> \rs :call C_Settings()
vmap <buffer> <silent> \rh :call C_Hardcopy("v")
omap <buffer> <silent> \rh :call C_Hardcopy("n")
vmap <buffer> <silent> \rd :call C_Indent("v"):redraw:call C_HlMessage()
omap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()
map <buffer> <silent> \ri :call C_SplintArguments()
map <buffer> <silent> \rp :call C_SplintCheck():redraw:call C_HlMessage()
map <buffer> <silent> \rg :call C_MakeArguments()
map <buffer> <silent> \rm :call C_Make()
map <buffer> <silent> \ra :call C_Arguments()
map <buffer> <silent> \rr :call C_Run()
map <buffer> <silent> \rl :call C_Link():redraw:call C_HlMessage()
map <buffer> <silent> \rc :call C_Compile():redraw:call C_HlMessage()
vnoremap <buffer> <silent> \+c. :call C_CodeCatch("v","...")
onoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
vnoremap <buffer> <silent> \+ca :call C_CodeCatch("v"," const &ExceptObj ")f(fci
nnoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
vnoremap <buffer> <silent> \+tr :call C_CodeTryCatch("v")f(fci
onoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
noremap <buffer> <silent> \+tf :call C_CodeTemplateFunct()<NL>noremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")<NL>noremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")<NL>noremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")<NL>noremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")<NL>noremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")<NL>noremap <buffer> <silent> \+m :call C_CodeMethod()<NL>noremap <buffer> <silent> \ns :call C_ProtoShow()<NL>noremap <buffer> <silent> \nc :call C_ProtoClear()<NL>noremap <buffer> <silent> \ni :call C_ProtoInsert()<NL>vnoremap <buffer> <silent> \np :call C_ProtoPick("v")<NL>onoremap <buffer> <silent> \np :call C_ProtoPick("n")<NL>noremap <buffer> <silent> \ne :call C_CodeSnippet("e")<NL>vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")<NL>onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")<NL>noremap <buffer> <silent> \nr :call C_CodeSnippet("r")<NL>noremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
noremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")
noremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")
noremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")
noremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")
noremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")
noremap <buffer> <silent> \+m :call C_CodeMethod()
noremap <buffer> <silent> \ns :call C_ProtoShow()
noremap <buffer> <silent> \nc :call C_ProtoClear()
noremap <buffer> <silent> \ni :call C_ProtoInsert()
vnoremap <buffer> <silent> \np :call C_ProtoPick("v")
onoremap <buffer> <silent> \np :call C_ProtoPick("n")
noremap <buffer> <silent> \ne :call C_CodeSnippet("e")
vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")
onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
noremap <buffer> <silent> \nr :call C_CodeSnippet("r")
noremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
noremap <buffer> <silent> \ii :call C_CodeFopen("input")jf"a
vnoremap <buffer> <silent> \ias sassert();F(p
nnoremap <buffer> <silent> \ias oassert();<Left><Left>
vnoremap <buffer> <silent> \isi ssizeof()P
onoremap <buffer> <silent> \isi isizeof()<Left>
noremap <buffer> <silent> \ima :call C_CodeMalloc("m")i
noremap <buffer> <silent> \ica :call C_CodeMalloc("c")i
noremap <buffer> <silent> \isc oscanf("", & );F"i
noremap <buffer> <silent> \ip oprintf("\n");2F"a
noremap <buffer> <silent> \iu :call C_EST("union")o
noremap <buffer> <silent> \is :call C_EST("struct")o
noremap <buffer> <silent> \ie :call C_EST("enum")o
vnoremap <buffer> <silent> \in :call C_CodeFor("down", "v")<NL>onoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
onoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
vnoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "v")<NL>onoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
onoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
vnoremap <buffer> <silent> \im :call C_CodeMain("v")<NL>onoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
onoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
vnoremap <buffer> <silent> \isf :call C_CodeFunction("sv")w
onoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
vnoremap <buffer> <silent> \if :call C_CodeFunction("v")<NL>onoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()<NL>vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")<NL>vnoremap <buffer> <silent> \pind :call C_PPifndef (         "v" )<NL>vnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","v+")<NL>vnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"v+")<NL>vnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"v+")<NL>onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
onoremap <buffer> <silent> \if :call C_CodeFunction("a")
noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")
vnoremap <buffer> <silent> \pind :call C_PPifndef (         "v" )
vnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","v+")
vnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"v+")
vnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"v+")
onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
onoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
onoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")<NL>onoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")<NL>onoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")<NL>noremap <buffer> <silent> \pu :call C_PPUndef()f	a
onoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")
onoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")
noremap <buffer> <silent> \pu :call C_PPUndef()f	a
noremap <buffer> <silent> \pd :call C_PPDefine()f	a
noremap <buffer> <silent> \p" o#include	""<Left>
noremap <buffer> <silent> \p< o#include	<><Left>
vnoremap <buffer> <silent> \s{ :call C_Block("v")<NL>onoremap <buffer> <silent> \s{ :call C_Block("a")o
onoremap <buffer> <silent> \s{ :call C_Block("a")o
vnoremap <buffer> <silent> \sc :call C_CodeCaseVisual()
onoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
vnoremap <buffer> <silent> \ss :call C_CodeSwitchVisual()f(la
onoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
vnoremap <buffer> <silent> \swh :call C_StatBlock("v","while (  )")f(la
onoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
vnoremap <buffer> <silent> \sw :call C_Stat("v","while (  )")f(la
onoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
vnoremap <buffer> <silent> \sife :call C_IfBlockElse("v")f(la
onoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
vnoremap <buffer> <silent> \sie :call C_IfElse("v")f(la
onoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
vnoremap <buffer> <silent> \sif :call C_StatBlock("v","if (  )")f(la
onoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
vnoremap <buffer> <silent> \si :call C_Stat("v","if (  )")f(la
onoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
vnoremap <buffer> <silent> \sfo :call C_StatBlock("v","for ( ; ; )")f;i
onoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
vnoremap <buffer> <silent> \sf :call C_Stat("v","for ( ; ; )")f;i
onoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
vnoremap <buffer> <silent> \sd :call C_DoWhile("v")f(la
onoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
noremap <buffer> <silent> \cy :call C_Toggle_C_Cpp()<NL>noremap <buffer> <silent> \ct a=strftime("%x %X %Z")<NL>noremap <buffer> <silent> \cd a=strftime("%x")<NL>noremap <buffer> <silent> \ccl :call C_CommentTemplates("class")<NL>noremap <buffer> <silent> \cme :call C_CommentTemplates("method")<NL>noremap <buffer> <silent> \cfu :call C_CommentTemplates("function")<NL>noremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")<NL>vnoremap <buffer> <silent> \co :call C_CommentCode("v"):nohlsearch<NL>onoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch<NL>vnoremap <buffer> <silent> \c\ :call C_CodeComment("v","no"):nohlsearchj
noremap <buffer> <silent> \ct a=strftime("%x %X %Z")
noremap <buffer> <silent> \cd a=strftime("%x")
noremap <buffer> <silent> \ccl :call C_CommentTemplates("class")
noremap <buffer> <silent> \cme :call C_CommentTemplates("method")
noremap <buffer> <silent> \cfu :call C_CommentTemplates("function")
noremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")
vnoremap <buffer> <silent> \co :call C_CommentCode("v"):nohlsearch
onoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch
vnoremap <buffer> <silent> \c\ :call C_CodeComment("v","no"):nohlsearchj
nnoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
vnoremap <buffer> <silent> \c* :call C_CodeComment("v","yes"):nohlsearchj
onoremap <buffer> <silent> \c* :call C_CodeComment("a","yes"):nohlsearchj
vnoremap <buffer> <silent> \ci :call C_CodeComment("v","yes"):nohlsearch<NL>onoremap <buffer> <silent> \ci o/*/kA 
onoremap <buffer> <silent> \ci o/*/kA 
noremap <buffer> <silent> \cs :call C_GetLineEndCommCol()<NL>vnoremap <buffer> <silent> \cn :call C_MultiLineEndComments("// ")A
vnoremap <buffer> <silent> \cn :call C_MultiLineEndComments("// ")A
onoremap <buffer> <silent> \cn :call C_LineEndComment("// ")A
vnoremap <buffer> <silent> \cl :call C_MultiLineEndComments()a
onoremap <buffer> <silent> \cl :call C_LineEndComment()a
vnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("v")<NL>onoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")<NL>map <buffer> <silent> <S-F9> :call C_Arguments()<NL>map <buffer> <silent> <C-F9> :call C_Run()<NL>map <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()<NL>map <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()<NL>inoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>inoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")
map <buffer> <silent> <S-F9> :call C_Arguments()
map <buffer> <silent> <C-F9> :call C_Run()
map <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()
map <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()
inoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
inoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
inoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
inoremap <buffer> <silent> \+tf :call C_CodeTemplateFunct()<NL>inoremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")<NL>inoremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")<NL>inoremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")<NL>inoremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")<NL>inoremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")<NL>inoremap <buffer> <silent> \+m :call C_CodeMethod()<NL>inoremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
inoremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")
inoremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")
inoremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")
inoremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")
inoremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")
inoremap <buffer> <silent> \+m :call C_CodeMethod()
inoremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
inoremap <buffer> <silent> \ii :call C_CodeFopen("input")jf"a
inoremap <buffer> <silent> \ias assert();<Left><Left>
inoremap <buffer> <silent> \isi sizeof()<Left>
inoremap <buffer> <silent> \ima :call C_CodeMalloc("m")i
inoremap <buffer> <silent> \ica :call C_CodeMalloc("c")i
inoremap <buffer> <silent> \isc scanf("", & );F"i
inoremap <buffer> <silent> \ip printf("\n");2F"a
inoremap <buffer> <silent> \iu :call C_EST("union")o
inoremap <buffer> <silent> \is :call C_EST("struct")o
inoremap <buffer> <silent> \ie :call C_EST("enum")o
inoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
inoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
inoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
inoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
inoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
inoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
inoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")A
inoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")A
inoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")A
inoremap <buffer> <silent> \pu :call C_PPUndef()f	a
inoremap <buffer> <silent> \pd :call C_PPDefine()f	a
inoremap <buffer> <silent> \p" o#include	""<Left>
inoremap <buffer> <silent> \p< o#include	<><Left>
inoremap <buffer> <silent> \s{ :call C_Block("a")o
inoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
inoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
inoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
inoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
inoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
inoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
inoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
inoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
inoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
inoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
inoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
inoremap <buffer> <silent> \ct =strftime("%x %X %Z")<NL>inoremap <buffer> <silent> \cd =strftime("%x")<NL>inoremap <buffer> <silent> \ccl :call C_CommentTemplates("class")<NL>inoremap <buffer> <silent> \cme :call C_CommentTemplates("method")<NL>inoremap <buffer> <silent> \cfu :call C_CommentTemplates("function")<NL>inoremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")<NL>inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")a
inoremap <buffer> <silent> \cd =strftime("%x")
inoremap <buffer> <silent> \ccl :call C_CommentTemplates("class")
inoremap <buffer> <silent> \cme :call C_CommentTemplates("method")
inoremap <buffer> <silent> \cfu :call C_CommentTemplates("function")
inoremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")
inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")a
inoremap <buffer> <silent> \cl :call C_LineEndComment()a
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=~/.vim/c-support/wordlists/c-c++-keywords.list,~/.vim/c-support/wordlists/k+r.list,~/.vim/c-support/wordlists/stl_index.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'c'
setlocal filetype=c
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
setlocal syntax=c
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 40 - ((19 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
40
normal! 01l
tabedit src/rss.h
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <silent> <S-F9> :call C_Arguments()<NL>imap <buffer> <silent> <C-F9> :call C_Run()<NL>imap <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()<NL>imap <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()<NL>nmap <buffer> <silent> \rh :call C_Hardcopy("n")<NL>nmap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()<NL>nnoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>nnoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
imap <buffer> <silent> <C-F9> :call C_Run()
imap <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()
imap <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()
nnoremap <buffer> <silent> \s{ :call C_Block("a")o
nnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")
nnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")
nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
nnoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
nmap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()
nmap <buffer> <silent> \rh :call C_Hardcopy("n")
nnoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
nnoremap <buffer> <silent> \np :call C_ProtoPick("n")<NL>nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")<NL>nnoremap <buffer> <silent> \ias oassert();<Left><Left>
nnoremap <buffer> <silent> \isi isizeof()<Left>
nnoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
nnoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
nnoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
nnoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
nnoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
nnoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
nnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")<NL>nnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")<NL>nnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")<NL>nnoremap <buffer> <silent> \s{ :call C_Block("a")o
nnoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
nnoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
nnoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
nnoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
nnoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
nnoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
nnoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
nnoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
nnoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
nnoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
nnoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
nnoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch<NL>nnoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
nnoremap <buffer> <silent> \c* :call C_CodeComment("a","yes"):nohlsearchj
nnoremap <buffer> <silent> \ci o/*/kA 
nnoremap <buffer> <silent> \cn :call C_LineEndComment("// ")A
nnoremap <buffer> <silent> \cl :call C_LineEndComment()a
nnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")<NL>map <buffer> <silent> \h :call C_HelpCsupport()<NL>map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()<NL>map <buffer> <silent> \rx :call C_XtermSize()<NL>map <buffer> <silent> \rs :call C_Settings()<NL>vmap <buffer> <silent> \rh :call C_Hardcopy("v")<NL>omap <buffer> <silent> \rh :call C_Hardcopy("n")<NL>vmap <buffer> <silent> \rd :call C_Indent("v"):redraw:call C_HlMessage()<NL>omap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()<NL>map <buffer> <silent> \ri :call C_SplintArguments()<NL>map <buffer> <silent> \rp :call C_SplintCheck():redraw:call C_HlMessage()<NL>map <buffer> <silent> \rg :call C_MakeArguments()<NL>map <buffer> <silent> \rm :call C_Make()<NL>map <buffer> <silent> \ra :call C_Arguments()<NL>map <buffer> <silent> \rr :call C_Run()<NL>map <buffer> <silent> \rl :call C_Link():redraw:call C_HlMessage()<NL>map <buffer> <silent> \rc :call C_Compile():redraw:call C_HlMessage()<NL>vnoremap <buffer> <silent> \+c. :call C_CodeCatch("v","...")<NL>onoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>vnoremap <buffer> <silent> \+ca :call C_CodeCatch("v"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \ias oassert();<Left><Left>
onoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
map <buffer> <silent> \h :call C_HelpCsupport()
map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call C_XtermSize()
map <buffer> <silent> \rs :call C_Settings()
vmap <buffer> <silent> \rh :call C_Hardcopy("v")
omap <buffer> <silent> \rh :call C_Hardcopy("n")
vmap <buffer> <silent> \rd :call C_Indent("v"):redraw:call C_HlMessage()
omap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()
map <buffer> <silent> \ri :call C_SplintArguments()
map <buffer> <silent> \rp :call C_SplintCheck():redraw:call C_HlMessage()
map <buffer> <silent> \rg :call C_MakeArguments()
map <buffer> <silent> \rm :call C_Make()
map <buffer> <silent> \ra :call C_Arguments()
map <buffer> <silent> \rr :call C_Run()
map <buffer> <silent> \rl :call C_Link():redraw:call C_HlMessage()
map <buffer> <silent> \rc :call C_Compile():redraw:call C_HlMessage()
vnoremap <buffer> <silent> \+c. :call C_CodeCatch("v","...")
onoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
vnoremap <buffer> <silent> \+ca :call C_CodeCatch("v"," const &ExceptObj ")f(fci
nnoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
vnoremap <buffer> <silent> \+tr :call C_CodeTryCatch("v")f(fci
onoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
noremap <buffer> <silent> \+tf :call C_CodeTemplateFunct()<NL>noremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")<NL>noremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")<NL>noremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")<NL>noremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")<NL>noremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")<NL>noremap <buffer> <silent> \+m :call C_CodeMethod()<NL>noremap <buffer> <silent> \ns :call C_ProtoShow()<NL>noremap <buffer> <silent> \nc :call C_ProtoClear()<NL>noremap <buffer> <silent> \ni :call C_ProtoInsert()<NL>vnoremap <buffer> <silent> \np :call C_ProtoPick("v")<NL>onoremap <buffer> <silent> \np :call C_ProtoPick("n")<NL>noremap <buffer> <silent> \ne :call C_CodeSnippet("e")<NL>vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")<NL>onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")<NL>noremap <buffer> <silent> \nr :call C_CodeSnippet("r")<NL>noremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
noremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")
noremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")
noremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")
noremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")
noremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")
noremap <buffer> <silent> \+m :call C_CodeMethod()
noremap <buffer> <silent> \ns :call C_ProtoShow()
noremap <buffer> <silent> \nc :call C_ProtoClear()
noremap <buffer> <silent> \ni :call C_ProtoInsert()
vnoremap <buffer> <silent> \np :call C_ProtoPick("v")
onoremap <buffer> <silent> \np :call C_ProtoPick("n")
noremap <buffer> <silent> \ne :call C_CodeSnippet("e")
vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")
onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
noremap <buffer> <silent> \nr :call C_CodeSnippet("r")
noremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
noremap <buffer> <silent> \ii :call C_CodeFopen("input")jf"a
vnoremap <buffer> <silent> \ias sassert();F(p
nnoremap <buffer> <silent> \ias oassert();<Left><Left>
vnoremap <buffer> <silent> \isi ssizeof()P
onoremap <buffer> <silent> \isi isizeof()<Left>
noremap <buffer> <silent> \ima :call C_CodeMalloc("m")i
noremap <buffer> <silent> \ica :call C_CodeMalloc("c")i
noremap <buffer> <silent> \isc oscanf("", & );F"i
noremap <buffer> <silent> \ip oprintf("\n");2F"a
noremap <buffer> <silent> \iu :call C_EST("union")o
noremap <buffer> <silent> \is :call C_EST("struct")o
noremap <buffer> <silent> \ie :call C_EST("enum")o
vnoremap <buffer> <silent> \in :call C_CodeFor("down", "v")<NL>onoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
onoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
vnoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "v")<NL>onoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
onoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
vnoremap <buffer> <silent> \im :call C_CodeMain("v")<NL>onoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
onoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
vnoremap <buffer> <silent> \isf :call C_CodeFunction("sv")w
onoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
vnoremap <buffer> <silent> \if :call C_CodeFunction("v")<NL>onoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()<NL>vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")<NL>vnoremap <buffer> <silent> \pind :call C_PPifndef (         "v" )<NL>vnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","v+")<NL>vnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"v+")<NL>vnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"v+")<NL>onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
onoremap <buffer> <silent> \if :call C_CodeFunction("a")
noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")
vnoremap <buffer> <silent> \pind :call C_PPifndef (         "v" )
vnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","v+")
vnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"v+")
vnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"v+")
onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
onoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
onoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")<NL>onoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")<NL>onoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")<NL>noremap <buffer> <silent> \pu :call C_PPUndef()f	a
onoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")
onoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")
noremap <buffer> <silent> \pu :call C_PPUndef()f	a
noremap <buffer> <silent> \pd :call C_PPDefine()f	a
noremap <buffer> <silent> \p" o#include	""<Left>
noremap <buffer> <silent> \p< o#include	<><Left>
vnoremap <buffer> <silent> \s{ :call C_Block("v")<NL>onoremap <buffer> <silent> \s{ :call C_Block("a")o
onoremap <buffer> <silent> \s{ :call C_Block("a")o
vnoremap <buffer> <silent> \sc :call C_CodeCaseVisual()
onoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
vnoremap <buffer> <silent> \ss :call C_CodeSwitchVisual()f(la
onoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
vnoremap <buffer> <silent> \swh :call C_StatBlock("v","while (  )")f(la
onoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
vnoremap <buffer> <silent> \sw :call C_Stat("v","while (  )")f(la
onoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
vnoremap <buffer> <silent> \sife :call C_IfBlockElse("v")f(la
onoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
vnoremap <buffer> <silent> \sie :call C_IfElse("v")f(la
onoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
vnoremap <buffer> <silent> \sif :call C_StatBlock("v","if (  )")f(la
onoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
vnoremap <buffer> <silent> \si :call C_Stat("v","if (  )")f(la
onoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
vnoremap <buffer> <silent> \sfo :call C_StatBlock("v","for ( ; ; )")f;i
onoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
vnoremap <buffer> <silent> \sf :call C_Stat("v","for ( ; ; )")f;i
onoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
vnoremap <buffer> <silent> \sd :call C_DoWhile("v")f(la
onoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
noremap <buffer> <silent> \cy :call C_Toggle_C_Cpp()<NL>noremap <buffer> <silent> \ct a=strftime("%x %X %Z")<NL>noremap <buffer> <silent> \cd a=strftime("%x")<NL>noremap <buffer> <silent> \ccl :call C_CommentTemplates("class")<NL>noremap <buffer> <silent> \cme :call C_CommentTemplates("method")<NL>noremap <buffer> <silent> \cfu :call C_CommentTemplates("function")<NL>noremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")<NL>vnoremap <buffer> <silent> \co :call C_CommentCode("v"):nohlsearch<NL>onoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch<NL>vnoremap <buffer> <silent> \c\ :call C_CodeComment("v","no"):nohlsearchj
noremap <buffer> <silent> \ct a=strftime("%x %X %Z")
noremap <buffer> <silent> \cd a=strftime("%x")
noremap <buffer> <silent> \ccl :call C_CommentTemplates("class")
noremap <buffer> <silent> \cme :call C_CommentTemplates("method")
noremap <buffer> <silent> \cfu :call C_CommentTemplates("function")
noremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")
vnoremap <buffer> <silent> \co :call C_CommentCode("v"):nohlsearch
onoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch
vnoremap <buffer> <silent> \c\ :call C_CodeComment("v","no"):nohlsearchj
nnoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
vnoremap <buffer> <silent> \c* :call C_CodeComment("v","yes"):nohlsearchj
onoremap <buffer> <silent> \c* :call C_CodeComment("a","yes"):nohlsearchj
vnoremap <buffer> <silent> \ci :call C_CodeComment("v","yes"):nohlsearch<NL>onoremap <buffer> <silent> \ci o/*/kA 
onoremap <buffer> <silent> \ci o/*/kA 
noremap <buffer> <silent> \cs :call C_GetLineEndCommCol()<NL>vnoremap <buffer> <silent> \cn :call C_MultiLineEndComments("// ")A
vnoremap <buffer> <silent> \cn :call C_MultiLineEndComments("// ")A
onoremap <buffer> <silent> \cn :call C_LineEndComment("// ")A
vnoremap <buffer> <silent> \cl :call C_MultiLineEndComments()a
onoremap <buffer> <silent> \cl :call C_LineEndComment()a
vnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("v")<NL>onoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")<NL>map <buffer> <silent> <S-F9> :call C_Arguments()<NL>map <buffer> <silent> <C-F9> :call C_Run()<NL>map <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()<NL>map <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()<NL>inoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>inoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")
map <buffer> <silent> <S-F9> :call C_Arguments()
map <buffer> <silent> <C-F9> :call C_Run()
map <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()
map <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()
inoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
inoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
inoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
inoremap <buffer> <silent> \+tf :call C_CodeTemplateFunct()<NL>inoremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")<NL>inoremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")<NL>inoremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")<NL>inoremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")<NL>inoremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")<NL>inoremap <buffer> <silent> \+m :call C_CodeMethod()<NL>inoremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
inoremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")
inoremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")
inoremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")
inoremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")
inoremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")
inoremap <buffer> <silent> \+m :call C_CodeMethod()
inoremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
inoremap <buffer> <silent> \ii :call C_CodeFopen("input")jf"a
inoremap <buffer> <silent> \ias assert();<Left><Left>
inoremap <buffer> <silent> \isi sizeof()<Left>
inoremap <buffer> <silent> \ima :call C_CodeMalloc("m")i
inoremap <buffer> <silent> \ica :call C_CodeMalloc("c")i
inoremap <buffer> <silent> \isc scanf("", & );F"i
inoremap <buffer> <silent> \ip printf("\n");2F"a
inoremap <buffer> <silent> \iu :call C_EST("union")o
inoremap <buffer> <silent> \is :call C_EST("struct")o
inoremap <buffer> <silent> \ie :call C_EST("enum")o
inoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
inoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
inoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
inoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
inoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
inoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
inoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")A
inoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")A
inoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")A
inoremap <buffer> <silent> \pu :call C_PPUndef()f	a
inoremap <buffer> <silent> \pd :call C_PPDefine()f	a
inoremap <buffer> <silent> \p" o#include	""<Left>
inoremap <buffer> <silent> \p< o#include	<><Left>
inoremap <buffer> <silent> \s{ :call C_Block("a")o
inoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
inoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
inoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
inoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
inoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
inoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
inoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
inoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
inoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
inoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
inoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
inoremap <buffer> <silent> \ct =strftime("%x %X %Z")<NL>inoremap <buffer> <silent> \cd =strftime("%x")<NL>inoremap <buffer> <silent> \ccl :call C_CommentTemplates("class")<NL>inoremap <buffer> <silent> \cme :call C_CommentTemplates("method")<NL>inoremap <buffer> <silent> \cfu :call C_CommentTemplates("function")<NL>inoremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")<NL>inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")a
inoremap <buffer> <silent> \cd =strftime("%x")
inoremap <buffer> <silent> \ccl :call C_CommentTemplates("class")
inoremap <buffer> <silent> \cme :call C_CommentTemplates("method")
inoremap <buffer> <silent> \cfu :call C_CommentTemplates("function")
inoremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")
inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")a
inoremap <buffer> <silent> \cl :call C_LineEndComment()a
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=~/.vim/c-support/wordlists/c-c++-keywords.list,~/.vim/c-support/wordlists/k+r.list,~/.vim/c-support/wordlists/stl_index.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'c'
setlocal filetype=c
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
setlocal syntax=c
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 45 - ((29 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
45
normal! 045l
tabedit src/rss_expat.c
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <silent> <S-F9> :call C_Arguments()<NL>imap <buffer> <silent> <C-F9> :call C_Run()<NL>imap <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()<NL>imap <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()<NL>nmap <buffer> <silent> \rh :call C_Hardcopy("n")<NL>nmap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()<NL>nnoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>nnoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
imap <buffer> <silent> <C-F9> :call C_Run()
imap <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()
imap <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()
nnoremap <buffer> <silent> \s{ :call C_Block("a")o
nnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")
nnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")
nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
nnoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
nmap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()
nmap <buffer> <silent> \rh :call C_Hardcopy("n")
nnoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
nnoremap <buffer> <silent> \np :call C_ProtoPick("n")<NL>nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")<NL>nnoremap <buffer> <silent> \ias oassert();<Left><Left>
nnoremap <buffer> <silent> \isi isizeof()<Left>
nnoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
nnoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
nnoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
nnoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
nnoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
nnoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
nnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")<NL>nnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")<NL>nnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")<NL>nnoremap <buffer> <silent> \s{ :call C_Block("a")o
nnoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
nnoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
nnoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
nnoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
nnoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
nnoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
nnoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
nnoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
nnoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
nnoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
nnoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
nnoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch<NL>nnoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
nnoremap <buffer> <silent> \c* :call C_CodeComment("a","yes"):nohlsearchj
nnoremap <buffer> <silent> \ci o/*/kA 
nnoremap <buffer> <silent> \cn :call C_LineEndComment("// ")A
nnoremap <buffer> <silent> \cl :call C_LineEndComment()a
nnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")<NL>map <buffer> <silent> \h :call C_HelpCsupport()<NL>map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()<NL>map <buffer> <silent> \rx :call C_XtermSize()<NL>map <buffer> <silent> \rs :call C_Settings()<NL>vmap <buffer> <silent> \rh :call C_Hardcopy("v")<NL>omap <buffer> <silent> \rh :call C_Hardcopy("n")<NL>vmap <buffer> <silent> \rd :call C_Indent("v"):redraw:call C_HlMessage()<NL>omap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()<NL>map <buffer> <silent> \ri :call C_SplintArguments()<NL>map <buffer> <silent> \rp :call C_SplintCheck():redraw:call C_HlMessage()<NL>map <buffer> <silent> \rg :call C_MakeArguments()<NL>map <buffer> <silent> \rm :call C_Make()<NL>map <buffer> <silent> \ra :call C_Arguments()<NL>map <buffer> <silent> \rr :call C_Run()<NL>map <buffer> <silent> \rl :call C_Link():redraw:call C_HlMessage()<NL>map <buffer> <silent> \rc :call C_Compile():redraw:call C_HlMessage()<NL>vnoremap <buffer> <silent> \+c. :call C_CodeCatch("v","...")<NL>onoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>vnoremap <buffer> <silent> \+ca :call C_CodeCatch("v"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \ias oassert();<Left><Left>
onoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
map <buffer> <silent> \h :call C_HelpCsupport()
map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call C_XtermSize()
map <buffer> <silent> \rs :call C_Settings()
vmap <buffer> <silent> \rh :call C_Hardcopy("v")
omap <buffer> <silent> \rh :call C_Hardcopy("n")
vmap <buffer> <silent> \rd :call C_Indent("v"):redraw:call C_HlMessage()
omap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()
map <buffer> <silent> \ri :call C_SplintArguments()
map <buffer> <silent> \rp :call C_SplintCheck():redraw:call C_HlMessage()
map <buffer> <silent> \rg :call C_MakeArguments()
map <buffer> <silent> \rm :call C_Make()
map <buffer> <silent> \ra :call C_Arguments()
map <buffer> <silent> \rr :call C_Run()
map <buffer> <silent> \rl :call C_Link():redraw:call C_HlMessage()
map <buffer> <silent> \rc :call C_Compile():redraw:call C_HlMessage()
vnoremap <buffer> <silent> \+c. :call C_CodeCatch("v","...")
onoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
vnoremap <buffer> <silent> \+ca :call C_CodeCatch("v"," const &ExceptObj ")f(fci
nnoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
vnoremap <buffer> <silent> \+tr :call C_CodeTryCatch("v")f(fci
onoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
noremap <buffer> <silent> \+tf :call C_CodeTemplateFunct()<NL>noremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")<NL>noremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")<NL>noremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")<NL>noremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")<NL>noremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")<NL>noremap <buffer> <silent> \+m :call C_CodeMethod()<NL>noremap <buffer> <silent> \ns :call C_ProtoShow()<NL>noremap <buffer> <silent> \nc :call C_ProtoClear()<NL>noremap <buffer> <silent> \ni :call C_ProtoInsert()<NL>vnoremap <buffer> <silent> \np :call C_ProtoPick("v")<NL>onoremap <buffer> <silent> \np :call C_ProtoPick("n")<NL>noremap <buffer> <silent> \ne :call C_CodeSnippet("e")<NL>vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")<NL>onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")<NL>noremap <buffer> <silent> \nr :call C_CodeSnippet("r")<NL>noremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
noremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")
noremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")
noremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")
noremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")
noremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")
noremap <buffer> <silent> \+m :call C_CodeMethod()
noremap <buffer> <silent> \ns :call C_ProtoShow()
noremap <buffer> <silent> \nc :call C_ProtoClear()
noremap <buffer> <silent> \ni :call C_ProtoInsert()
vnoremap <buffer> <silent> \np :call C_ProtoPick("v")
onoremap <buffer> <silent> \np :call C_ProtoPick("n")
noremap <buffer> <silent> \ne :call C_CodeSnippet("e")
vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")
onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
noremap <buffer> <silent> \nr :call C_CodeSnippet("r")
noremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
noremap <buffer> <silent> \ii :call C_CodeFopen("input")jf"a
vnoremap <buffer> <silent> \ias sassert();F(p
nnoremap <buffer> <silent> \ias oassert();<Left><Left>
vnoremap <buffer> <silent> \isi ssizeof()P
onoremap <buffer> <silent> \isi isizeof()<Left>
noremap <buffer> <silent> \ima :call C_CodeMalloc("m")i
noremap <buffer> <silent> \ica :call C_CodeMalloc("c")i
noremap <buffer> <silent> \isc oscanf("", & );F"i
noremap <buffer> <silent> \ip oprintf("\n");2F"a
noremap <buffer> <silent> \iu :call C_EST("union")o
noremap <buffer> <silent> \is :call C_EST("struct")o
noremap <buffer> <silent> \ie :call C_EST("enum")o
vnoremap <buffer> <silent> \in :call C_CodeFor("down", "v")<NL>onoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
onoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
vnoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "v")<NL>onoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
onoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
vnoremap <buffer> <silent> \im :call C_CodeMain("v")<NL>onoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
onoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
vnoremap <buffer> <silent> \isf :call C_CodeFunction("sv")w
onoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
vnoremap <buffer> <silent> \if :call C_CodeFunction("v")<NL>onoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()<NL>vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")<NL>vnoremap <buffer> <silent> \pind :call C_PPifndef (         "v" )<NL>vnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","v+")<NL>vnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"v+")<NL>vnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"v+")<NL>onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
onoremap <buffer> <silent> \if :call C_CodeFunction("a")
noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")
vnoremap <buffer> <silent> \pind :call C_PPifndef (         "v" )
vnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","v+")
vnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"v+")
vnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"v+")
onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
onoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
onoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")<NL>onoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")<NL>onoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")<NL>noremap <buffer> <silent> \pu :call C_PPUndef()f	a
onoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")
onoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")
noremap <buffer> <silent> \pu :call C_PPUndef()f	a
noremap <buffer> <silent> \pd :call C_PPDefine()f	a
noremap <buffer> <silent> \p" o#include	""<Left>
noremap <buffer> <silent> \p< o#include	<><Left>
vnoremap <buffer> <silent> \s{ :call C_Block("v")<NL>onoremap <buffer> <silent> \s{ :call C_Block("a")o
onoremap <buffer> <silent> \s{ :call C_Block("a")o
vnoremap <buffer> <silent> \sc :call C_CodeCaseVisual()
onoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
vnoremap <buffer> <silent> \ss :call C_CodeSwitchVisual()f(la
onoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
vnoremap <buffer> <silent> \swh :call C_StatBlock("v","while (  )")f(la
onoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
vnoremap <buffer> <silent> \sw :call C_Stat("v","while (  )")f(la
onoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
vnoremap <buffer> <silent> \sife :call C_IfBlockElse("v")f(la
onoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
vnoremap <buffer> <silent> \sie :call C_IfElse("v")f(la
onoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
vnoremap <buffer> <silent> \sif :call C_StatBlock("v","if (  )")f(la
onoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
vnoremap <buffer> <silent> \si :call C_Stat("v","if (  )")f(la
onoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
vnoremap <buffer> <silent> \sfo :call C_StatBlock("v","for ( ; ; )")f;i
onoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
vnoremap <buffer> <silent> \sf :call C_Stat("v","for ( ; ; )")f;i
onoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
vnoremap <buffer> <silent> \sd :call C_DoWhile("v")f(la
onoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
noremap <buffer> <silent> \cy :call C_Toggle_C_Cpp()<NL>noremap <buffer> <silent> \ct a=strftime("%x %X %Z")<NL>noremap <buffer> <silent> \cd a=strftime("%x")<NL>noremap <buffer> <silent> \ccl :call C_CommentTemplates("class")<NL>noremap <buffer> <silent> \cme :call C_CommentTemplates("method")<NL>noremap <buffer> <silent> \cfu :call C_CommentTemplates("function")<NL>noremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")<NL>vnoremap <buffer> <silent> \co :call C_CommentCode("v"):nohlsearch<NL>onoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch<NL>vnoremap <buffer> <silent> \c\ :call C_CodeComment("v","no"):nohlsearchj
noremap <buffer> <silent> \ct a=strftime("%x %X %Z")
noremap <buffer> <silent> \cd a=strftime("%x")
noremap <buffer> <silent> \ccl :call C_CommentTemplates("class")
noremap <buffer> <silent> \cme :call C_CommentTemplates("method")
noremap <buffer> <silent> \cfu :call C_CommentTemplates("function")
noremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")
vnoremap <buffer> <silent> \co :call C_CommentCode("v"):nohlsearch
onoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch
vnoremap <buffer> <silent> \c\ :call C_CodeComment("v","no"):nohlsearchj
nnoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
vnoremap <buffer> <silent> \c* :call C_CodeComment("v","yes"):nohlsearchj
onoremap <buffer> <silent> \c* :call C_CodeComment("a","yes"):nohlsearchj
vnoremap <buffer> <silent> \ci :call C_CodeComment("v","yes"):nohlsearch<NL>onoremap <buffer> <silent> \ci o/*/kA 
onoremap <buffer> <silent> \ci o/*/kA 
noremap <buffer> <silent> \cs :call C_GetLineEndCommCol()<NL>vnoremap <buffer> <silent> \cn :call C_MultiLineEndComments("// ")A
vnoremap <buffer> <silent> \cn :call C_MultiLineEndComments("// ")A
onoremap <buffer> <silent> \cn :call C_LineEndComment("// ")A
vnoremap <buffer> <silent> \cl :call C_MultiLineEndComments()a
onoremap <buffer> <silent> \cl :call C_LineEndComment()a
vnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("v")<NL>onoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")<NL>map <buffer> <silent> <S-F9> :call C_Arguments()<NL>map <buffer> <silent> <C-F9> :call C_Run()<NL>map <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()<NL>map <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()<NL>inoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>inoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")
map <buffer> <silent> <S-F9> :call C_Arguments()
map <buffer> <silent> <C-F9> :call C_Run()
map <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()
map <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()
inoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
inoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
inoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
inoremap <buffer> <silent> \+tf :call C_CodeTemplateFunct()<NL>inoremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")<NL>inoremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")<NL>inoremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")<NL>inoremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")<NL>inoremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")<NL>inoremap <buffer> <silent> \+m :call C_CodeMethod()<NL>inoremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
inoremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")
inoremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")
inoremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")
inoremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")
inoremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")
inoremap <buffer> <silent> \+m :call C_CodeMethod()
inoremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
inoremap <buffer> <silent> \ii :call C_CodeFopen("input")jf"a
inoremap <buffer> <silent> \ias assert();<Left><Left>
inoremap <buffer> <silent> \isi sizeof()<Left>
inoremap <buffer> <silent> \ima :call C_CodeMalloc("m")i
inoremap <buffer> <silent> \ica :call C_CodeMalloc("c")i
inoremap <buffer> <silent> \isc scanf("", & );F"i
inoremap <buffer> <silent> \ip printf("\n");2F"a
inoremap <buffer> <silent> \iu :call C_EST("union")o
inoremap <buffer> <silent> \is :call C_EST("struct")o
inoremap <buffer> <silent> \ie :call C_EST("enum")o
inoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
inoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
inoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
inoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
inoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
inoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
inoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")A
inoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")A
inoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")A
inoremap <buffer> <silent> \pu :call C_PPUndef()f	a
inoremap <buffer> <silent> \pd :call C_PPDefine()f	a
inoremap <buffer> <silent> \p" o#include	""<Left>
inoremap <buffer> <silent> \p< o#include	<><Left>
inoremap <buffer> <silent> \s{ :call C_Block("a")o
inoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
inoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
inoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
inoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
inoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
inoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
inoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
inoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
inoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
inoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
inoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
inoremap <buffer> <silent> \ct =strftime("%x %X %Z")<NL>inoremap <buffer> <silent> \cd =strftime("%x")<NL>inoremap <buffer> <silent> \ccl :call C_CommentTemplates("class")<NL>inoremap <buffer> <silent> \cme :call C_CommentTemplates("method")<NL>inoremap <buffer> <silent> \cfu :call C_CommentTemplates("function")<NL>inoremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")<NL>inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")a
inoremap <buffer> <silent> \cd =strftime("%x")
inoremap <buffer> <silent> \ccl :call C_CommentTemplates("class")
inoremap <buffer> <silent> \cme :call C_CommentTemplates("method")
inoremap <buffer> <silent> \cfu :call C_CommentTemplates("function")
inoremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")
inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")a
inoremap <buffer> <silent> \cl :call C_LineEndComment()a
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=~/.vim/c-support/wordlists/c-c++-keywords.list,~/.vim/c-support/wordlists/k+r.list,~/.vim/c-support/wordlists/stl_index.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'c'
setlocal filetype=c
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
setlocal syntax=c
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 38 - ((37 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
38
normal! 017l
tabedit src/rss_expat.h
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <silent> <S-F9> :call C_Arguments()<NL>imap <buffer> <silent> <C-F9> :call C_Run()<NL>imap <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()<NL>imap <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()<NL>nmap <buffer> <silent> \rh :call C_Hardcopy("n")<NL>nmap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()<NL>nnoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>nnoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
imap <buffer> <silent> <C-F9> :call C_Run()
imap <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()
imap <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()
nnoremap <buffer> <silent> \s{ :call C_Block("a")o
nnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")
nnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")
nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
nnoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
nmap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()
nmap <buffer> <silent> \rh :call C_Hardcopy("n")
nnoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
nnoremap <buffer> <silent> \np :call C_ProtoPick("n")<NL>nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")<NL>nnoremap <buffer> <silent> \ias oassert();<Left><Left>
nnoremap <buffer> <silent> \isi isizeof()<Left>
nnoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
nnoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
nnoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
nnoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
nnoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
nnoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
nnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")<NL>nnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")<NL>nnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")<NL>nnoremap <buffer> <silent> \s{ :call C_Block("a")o
nnoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
nnoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
nnoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
nnoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
nnoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
nnoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
nnoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
nnoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
nnoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
nnoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
nnoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
nnoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch<NL>nnoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
nnoremap <buffer> <silent> \c* :call C_CodeComment("a","yes"):nohlsearchj
nnoremap <buffer> <silent> \ci o/*/kA 
nnoremap <buffer> <silent> \cn :call C_LineEndComment("// ")A
nnoremap <buffer> <silent> \cl :call C_LineEndComment()a
nnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")<NL>map <buffer> <silent> \h :call C_HelpCsupport()<NL>map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()<NL>map <buffer> <silent> \rx :call C_XtermSize()<NL>map <buffer> <silent> \rs :call C_Settings()<NL>vmap <buffer> <silent> \rh :call C_Hardcopy("v")<NL>omap <buffer> <silent> \rh :call C_Hardcopy("n")<NL>vmap <buffer> <silent> \rd :call C_Indent("v"):redraw:call C_HlMessage()<NL>omap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()<NL>map <buffer> <silent> \ri :call C_SplintArguments()<NL>map <buffer> <silent> \rp :call C_SplintCheck():redraw:call C_HlMessage()<NL>map <buffer> <silent> \rg :call C_MakeArguments()<NL>map <buffer> <silent> \rm :call C_Make()<NL>map <buffer> <silent> \ra :call C_Arguments()<NL>map <buffer> <silent> \rr :call C_Run()<NL>map <buffer> <silent> \rl :call C_Link():redraw:call C_HlMessage()<NL>map <buffer> <silent> \rc :call C_Compile():redraw:call C_HlMessage()<NL>vnoremap <buffer> <silent> \+c. :call C_CodeCatch("v","...")<NL>onoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>vnoremap <buffer> <silent> \+ca :call C_CodeCatch("v"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \ias oassert();<Left><Left>
onoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
map <buffer> <silent> \h :call C_HelpCsupport()
map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call C_XtermSize()
map <buffer> <silent> \rs :call C_Settings()
vmap <buffer> <silent> \rh :call C_Hardcopy("v")
omap <buffer> <silent> \rh :call C_Hardcopy("n")
vmap <buffer> <silent> \rd :call C_Indent("v"):redraw:call C_HlMessage()
omap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()
map <buffer> <silent> \ri :call C_SplintArguments()
map <buffer> <silent> \rp :call C_SplintCheck():redraw:call C_HlMessage()
map <buffer> <silent> \rg :call C_MakeArguments()
map <buffer> <silent> \rm :call C_Make()
map <buffer> <silent> \ra :call C_Arguments()
map <buffer> <silent> \rr :call C_Run()
map <buffer> <silent> \rl :call C_Link():redraw:call C_HlMessage()
map <buffer> <silent> \rc :call C_Compile():redraw:call C_HlMessage()
vnoremap <buffer> <silent> \+c. :call C_CodeCatch("v","...")
onoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
vnoremap <buffer> <silent> \+ca :call C_CodeCatch("v"," const &ExceptObj ")f(fci
nnoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
vnoremap <buffer> <silent> \+tr :call C_CodeTryCatch("v")f(fci
onoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
noremap <buffer> <silent> \+tf :call C_CodeTemplateFunct()<NL>noremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")<NL>noremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")<NL>noremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")<NL>noremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")<NL>noremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")<NL>noremap <buffer> <silent> \+m :call C_CodeMethod()<NL>noremap <buffer> <silent> \ns :call C_ProtoShow()<NL>noremap <buffer> <silent> \nc :call C_ProtoClear()<NL>noremap <buffer> <silent> \ni :call C_ProtoInsert()<NL>vnoremap <buffer> <silent> \np :call C_ProtoPick("v")<NL>onoremap <buffer> <silent> \np :call C_ProtoPick("n")<NL>noremap <buffer> <silent> \ne :call C_CodeSnippet("e")<NL>vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")<NL>onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")<NL>noremap <buffer> <silent> \nr :call C_CodeSnippet("r")<NL>noremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
noremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")
noremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")
noremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")
noremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")
noremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")
noremap <buffer> <silent> \+m :call C_CodeMethod()
noremap <buffer> <silent> \ns :call C_ProtoShow()
noremap <buffer> <silent> \nc :call C_ProtoClear()
noremap <buffer> <silent> \ni :call C_ProtoInsert()
vnoremap <buffer> <silent> \np :call C_ProtoPick("v")
onoremap <buffer> <silent> \np :call C_ProtoPick("n")
noremap <buffer> <silent> \ne :call C_CodeSnippet("e")
vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")
onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
noremap <buffer> <silent> \nr :call C_CodeSnippet("r")
noremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
noremap <buffer> <silent> \ii :call C_CodeFopen("input")jf"a
vnoremap <buffer> <silent> \ias sassert();F(p
nnoremap <buffer> <silent> \ias oassert();<Left><Left>
vnoremap <buffer> <silent> \isi ssizeof()P
onoremap <buffer> <silent> \isi isizeof()<Left>
noremap <buffer> <silent> \ima :call C_CodeMalloc("m")i
noremap <buffer> <silent> \ica :call C_CodeMalloc("c")i
noremap <buffer> <silent> \isc oscanf("", & );F"i
noremap <buffer> <silent> \ip oprintf("\n");2F"a
noremap <buffer> <silent> \iu :call C_EST("union")o
noremap <buffer> <silent> \is :call C_EST("struct")o
noremap <buffer> <silent> \ie :call C_EST("enum")o
vnoremap <buffer> <silent> \in :call C_CodeFor("down", "v")<NL>onoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
onoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
vnoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "v")<NL>onoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
onoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
vnoremap <buffer> <silent> \im :call C_CodeMain("v")<NL>onoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
onoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
vnoremap <buffer> <silent> \isf :call C_CodeFunction("sv")w
onoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
vnoremap <buffer> <silent> \if :call C_CodeFunction("v")<NL>onoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()<NL>vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")<NL>vnoremap <buffer> <silent> \pind :call C_PPifndef (         "v" )<NL>vnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","v+")<NL>vnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"v+")<NL>vnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"v+")<NL>onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
onoremap <buffer> <silent> \if :call C_CodeFunction("a")
noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")
vnoremap <buffer> <silent> \pind :call C_PPifndef (         "v" )
vnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","v+")
vnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"v+")
vnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"v+")
onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
onoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
onoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")<NL>onoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")<NL>onoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")<NL>noremap <buffer> <silent> \pu :call C_PPUndef()f	a
onoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")
onoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")
noremap <buffer> <silent> \pu :call C_PPUndef()f	a
noremap <buffer> <silent> \pd :call C_PPDefine()f	a
noremap <buffer> <silent> \p" o#include	""<Left>
noremap <buffer> <silent> \p< o#include	<><Left>
vnoremap <buffer> <silent> \s{ :call C_Block("v")<NL>onoremap <buffer> <silent> \s{ :call C_Block("a")o
onoremap <buffer> <silent> \s{ :call C_Block("a")o
vnoremap <buffer> <silent> \sc :call C_CodeCaseVisual()
onoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
vnoremap <buffer> <silent> \ss :call C_CodeSwitchVisual()f(la
onoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
vnoremap <buffer> <silent> \swh :call C_StatBlock("v","while (  )")f(la
onoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
vnoremap <buffer> <silent> \sw :call C_Stat("v","while (  )")f(la
onoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
vnoremap <buffer> <silent> \sife :call C_IfBlockElse("v")f(la
onoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
vnoremap <buffer> <silent> \sie :call C_IfElse("v")f(la
onoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
vnoremap <buffer> <silent> \sif :call C_StatBlock("v","if (  )")f(la
onoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
vnoremap <buffer> <silent> \si :call C_Stat("v","if (  )")f(la
onoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
vnoremap <buffer> <silent> \sfo :call C_StatBlock("v","for ( ; ; )")f;i
onoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
vnoremap <buffer> <silent> \sf :call C_Stat("v","for ( ; ; )")f;i
onoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
vnoremap <buffer> <silent> \sd :call C_DoWhile("v")f(la
onoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
noremap <buffer> <silent> \cy :call C_Toggle_C_Cpp()<NL>noremap <buffer> <silent> \ct a=strftime("%x %X %Z")<NL>noremap <buffer> <silent> \cd a=strftime("%x")<NL>noremap <buffer> <silent> \ccl :call C_CommentTemplates("class")<NL>noremap <buffer> <silent> \cme :call C_CommentTemplates("method")<NL>noremap <buffer> <silent> \cfu :call C_CommentTemplates("function")<NL>noremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")<NL>vnoremap <buffer> <silent> \co :call C_CommentCode("v"):nohlsearch<NL>onoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch<NL>vnoremap <buffer> <silent> \c\ :call C_CodeComment("v","no"):nohlsearchj
noremap <buffer> <silent> \ct a=strftime("%x %X %Z")
noremap <buffer> <silent> \cd a=strftime("%x")
noremap <buffer> <silent> \ccl :call C_CommentTemplates("class")
noremap <buffer> <silent> \cme :call C_CommentTemplates("method")
noremap <buffer> <silent> \cfu :call C_CommentTemplates("function")
noremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")
vnoremap <buffer> <silent> \co :call C_CommentCode("v"):nohlsearch
onoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch
vnoremap <buffer> <silent> \c\ :call C_CodeComment("v","no"):nohlsearchj
nnoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
vnoremap <buffer> <silent> \c* :call C_CodeComment("v","yes"):nohlsearchj
onoremap <buffer> <silent> \c* :call C_CodeComment("a","yes"):nohlsearchj
vnoremap <buffer> <silent> \ci :call C_CodeComment("v","yes"):nohlsearch<NL>onoremap <buffer> <silent> \ci o/*/kA 
onoremap <buffer> <silent> \ci o/*/kA 
noremap <buffer> <silent> \cs :call C_GetLineEndCommCol()<NL>vnoremap <buffer> <silent> \cn :call C_MultiLineEndComments("// ")A
vnoremap <buffer> <silent> \cn :call C_MultiLineEndComments("// ")A
onoremap <buffer> <silent> \cn :call C_LineEndComment("// ")A
vnoremap <buffer> <silent> \cl :call C_MultiLineEndComments()a
onoremap <buffer> <silent> \cl :call C_LineEndComment()a
vnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("v")<NL>onoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")<NL>map <buffer> <silent> <S-F9> :call C_Arguments()<NL>map <buffer> <silent> <C-F9> :call C_Run()<NL>map <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()<NL>map <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()<NL>inoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>inoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")
map <buffer> <silent> <S-F9> :call C_Arguments()
map <buffer> <silent> <C-F9> :call C_Run()
map <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()
map <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()
inoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
inoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
inoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
inoremap <buffer> <silent> \+tf :call C_CodeTemplateFunct()<NL>inoremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")<NL>inoremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")<NL>inoremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")<NL>inoremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")<NL>inoremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")<NL>inoremap <buffer> <silent> \+m :call C_CodeMethod()<NL>inoremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
inoremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")
inoremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")
inoremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")
inoremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")
inoremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")
inoremap <buffer> <silent> \+m :call C_CodeMethod()
inoremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
inoremap <buffer> <silent> \ii :call C_CodeFopen("input")jf"a
inoremap <buffer> <silent> \ias assert();<Left><Left>
inoremap <buffer> <silent> \isi sizeof()<Left>
inoremap <buffer> <silent> \ima :call C_CodeMalloc("m")i
inoremap <buffer> <silent> \ica :call C_CodeMalloc("c")i
inoremap <buffer> <silent> \isc scanf("", & );F"i
inoremap <buffer> <silent> \ip printf("\n");2F"a
inoremap <buffer> <silent> \iu :call C_EST("union")o
inoremap <buffer> <silent> \is :call C_EST("struct")o
inoremap <buffer> <silent> \ie :call C_EST("enum")o
inoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
inoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
inoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
inoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
inoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
inoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
inoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")A
inoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")A
inoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")A
inoremap <buffer> <silent> \pu :call C_PPUndef()f	a
inoremap <buffer> <silent> \pd :call C_PPDefine()f	a
inoremap <buffer> <silent> \p" o#include	""<Left>
inoremap <buffer> <silent> \p< o#include	<><Left>
inoremap <buffer> <silent> \s{ :call C_Block("a")o
inoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
inoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
inoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
inoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
inoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
inoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
inoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
inoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
inoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
inoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
inoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
inoremap <buffer> <silent> \ct =strftime("%x %X %Z")<NL>inoremap <buffer> <silent> \cd =strftime("%x")<NL>inoremap <buffer> <silent> \ccl :call C_CommentTemplates("class")<NL>inoremap <buffer> <silent> \cme :call C_CommentTemplates("method")<NL>inoremap <buffer> <silent> \cfu :call C_CommentTemplates("function")<NL>inoremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")<NL>inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")a
inoremap <buffer> <silent> \cd =strftime("%x")
inoremap <buffer> <silent> \ccl :call C_CommentTemplates("class")
inoremap <buffer> <silent> \cme :call C_CommentTemplates("method")
inoremap <buffer> <silent> \cfu :call C_CommentTemplates("function")
inoremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")
inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")a
inoremap <buffer> <silent> \cl :call C_LineEndComment()a
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=~/.vim/c-support/wordlists/c-c++-keywords.list,~/.vim/c-support/wordlists/k+r.list,~/.vim/c-support/wordlists/stl_index.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'c'
setlocal filetype=c
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
setlocal syntax=c
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 13 - ((12 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
13
normal! 055l
tabedit src/rss_iconv.c
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <silent> <S-F9> :call C_Arguments()<NL>imap <buffer> <silent> <C-F9> :call C_Run()<NL>imap <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()<NL>imap <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()<NL>nmap <buffer> <silent> \rh :call C_Hardcopy("n")<NL>nmap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()<NL>nnoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>nnoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
imap <buffer> <silent> <C-F9> :call C_Run()
imap <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()
imap <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()
nnoremap <buffer> <silent> \s{ :call C_Block("a")o
nnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")
nnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")
nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
nnoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
nmap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()
nmap <buffer> <silent> \rh :call C_Hardcopy("n")
nnoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
nnoremap <buffer> <silent> \np :call C_ProtoPick("n")<NL>nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")<NL>nnoremap <buffer> <silent> \ias oassert();<Left><Left>
nnoremap <buffer> <silent> \isi isizeof()<Left>
nnoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
nnoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
nnoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
nnoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
nnoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
nnoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
nnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")<NL>nnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")<NL>nnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")<NL>nnoremap <buffer> <silent> \s{ :call C_Block("a")o
nnoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
nnoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
nnoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
nnoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
nnoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
nnoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
nnoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
nnoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
nnoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
nnoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
nnoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
nnoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch<NL>nnoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
nnoremap <buffer> <silent> \c* :call C_CodeComment("a","yes"):nohlsearchj
nnoremap <buffer> <silent> \ci o/*/kA 
nnoremap <buffer> <silent> \cn :call C_LineEndComment("// ")A
nnoremap <buffer> <silent> \cl :call C_LineEndComment()a
nnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")<NL>map <buffer> <silent> \h :call C_HelpCsupport()<NL>map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()<NL>map <buffer> <silent> \rx :call C_XtermSize()<NL>map <buffer> <silent> \rs :call C_Settings()<NL>vmap <buffer> <silent> \rh :call C_Hardcopy("v")<NL>omap <buffer> <silent> \rh :call C_Hardcopy("n")<NL>vmap <buffer> <silent> \rd :call C_Indent("v"):redraw:call C_HlMessage()<NL>omap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()<NL>map <buffer> <silent> \ri :call C_SplintArguments()<NL>map <buffer> <silent> \rp :call C_SplintCheck():redraw:call C_HlMessage()<NL>map <buffer> <silent> \rg :call C_MakeArguments()<NL>map <buffer> <silent> \rm :call C_Make()<NL>map <buffer> <silent> \ra :call C_Arguments()<NL>map <buffer> <silent> \rr :call C_Run()<NL>map <buffer> <silent> \rl :call C_Link():redraw:call C_HlMessage()<NL>map <buffer> <silent> \rc :call C_Compile():redraw:call C_HlMessage()<NL>vnoremap <buffer> <silent> \+c. :call C_CodeCatch("v","...")<NL>onoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>vnoremap <buffer> <silent> \+ca :call C_CodeCatch("v"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \ias oassert();<Left><Left>
onoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
map <buffer> <silent> \h :call C_HelpCsupport()
map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call C_XtermSize()
map <buffer> <silent> \rs :call C_Settings()
vmap <buffer> <silent> \rh :call C_Hardcopy("v")
omap <buffer> <silent> \rh :call C_Hardcopy("n")
vmap <buffer> <silent> \rd :call C_Indent("v"):redraw:call C_HlMessage()
omap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()
map <buffer> <silent> \ri :call C_SplintArguments()
map <buffer> <silent> \rp :call C_SplintCheck():redraw:call C_HlMessage()
map <buffer> <silent> \rg :call C_MakeArguments()
map <buffer> <silent> \rm :call C_Make()
map <buffer> <silent> \ra :call C_Arguments()
map <buffer> <silent> \rr :call C_Run()
map <buffer> <silent> \rl :call C_Link():redraw:call C_HlMessage()
map <buffer> <silent> \rc :call C_Compile():redraw:call C_HlMessage()
vnoremap <buffer> <silent> \+c. :call C_CodeCatch("v","...")
onoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
vnoremap <buffer> <silent> \+ca :call C_CodeCatch("v"," const &ExceptObj ")f(fci
nnoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
vnoremap <buffer> <silent> \+tr :call C_CodeTryCatch("v")f(fci
onoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
noremap <buffer> <silent> \+tf :call C_CodeTemplateFunct()<NL>noremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")<NL>noremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")<NL>noremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")<NL>noremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")<NL>noremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")<NL>noremap <buffer> <silent> \+m :call C_CodeMethod()<NL>noremap <buffer> <silent> \ns :call C_ProtoShow()<NL>noremap <buffer> <silent> \nc :call C_ProtoClear()<NL>noremap <buffer> <silent> \ni :call C_ProtoInsert()<NL>vnoremap <buffer> <silent> \np :call C_ProtoPick("v")<NL>onoremap <buffer> <silent> \np :call C_ProtoPick("n")<NL>noremap <buffer> <silent> \ne :call C_CodeSnippet("e")<NL>vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")<NL>onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")<NL>noremap <buffer> <silent> \nr :call C_CodeSnippet("r")<NL>noremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
noremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")
noremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")
noremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")
noremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")
noremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")
noremap <buffer> <silent> \+m :call C_CodeMethod()
noremap <buffer> <silent> \ns :call C_ProtoShow()
noremap <buffer> <silent> \nc :call C_ProtoClear()
noremap <buffer> <silent> \ni :call C_ProtoInsert()
vnoremap <buffer> <silent> \np :call C_ProtoPick("v")
onoremap <buffer> <silent> \np :call C_ProtoPick("n")
noremap <buffer> <silent> \ne :call C_CodeSnippet("e")
vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")
onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
noremap <buffer> <silent> \nr :call C_CodeSnippet("r")
noremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
noremap <buffer> <silent> \ii :call C_CodeFopen("input")jf"a
vnoremap <buffer> <silent> \ias sassert();F(p
nnoremap <buffer> <silent> \ias oassert();<Left><Left>
vnoremap <buffer> <silent> \isi ssizeof()P
onoremap <buffer> <silent> \isi isizeof()<Left>
noremap <buffer> <silent> \ima :call C_CodeMalloc("m")i
noremap <buffer> <silent> \ica :call C_CodeMalloc("c")i
noremap <buffer> <silent> \isc oscanf("", & );F"i
noremap <buffer> <silent> \ip oprintf("\n");2F"a
noremap <buffer> <silent> \iu :call C_EST("union")o
noremap <buffer> <silent> \is :call C_EST("struct")o
noremap <buffer> <silent> \ie :call C_EST("enum")o
vnoremap <buffer> <silent> \in :call C_CodeFor("down", "v")<NL>onoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
onoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
vnoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "v")<NL>onoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
onoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
vnoremap <buffer> <silent> \im :call C_CodeMain("v")<NL>onoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
onoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
vnoremap <buffer> <silent> \isf :call C_CodeFunction("sv")w
onoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
vnoremap <buffer> <silent> \if :call C_CodeFunction("v")<NL>onoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()<NL>vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")<NL>vnoremap <buffer> <silent> \pind :call C_PPifndef (         "v" )<NL>vnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","v+")<NL>vnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"v+")<NL>vnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"v+")<NL>onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
onoremap <buffer> <silent> \if :call C_CodeFunction("a")
noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")
vnoremap <buffer> <silent> \pind :call C_PPifndef (         "v" )
vnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","v+")
vnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"v+")
vnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"v+")
onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
onoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
onoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")<NL>onoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")<NL>onoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")<NL>noremap <buffer> <silent> \pu :call C_PPUndef()f	a
onoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")
onoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")
noremap <buffer> <silent> \pu :call C_PPUndef()f	a
noremap <buffer> <silent> \pd :call C_PPDefine()f	a
noremap <buffer> <silent> \p" o#include	""<Left>
noremap <buffer> <silent> \p< o#include	<><Left>
vnoremap <buffer> <silent> \s{ :call C_Block("v")<NL>onoremap <buffer> <silent> \s{ :call C_Block("a")o
onoremap <buffer> <silent> \s{ :call C_Block("a")o
vnoremap <buffer> <silent> \sc :call C_CodeCaseVisual()
onoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
vnoremap <buffer> <silent> \ss :call C_CodeSwitchVisual()f(la
onoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
vnoremap <buffer> <silent> \swh :call C_StatBlock("v","while (  )")f(la
onoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
vnoremap <buffer> <silent> \sw :call C_Stat("v","while (  )")f(la
onoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
vnoremap <buffer> <silent> \sife :call C_IfBlockElse("v")f(la
onoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
vnoremap <buffer> <silent> \sie :call C_IfElse("v")f(la
onoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
vnoremap <buffer> <silent> \sif :call C_StatBlock("v","if (  )")f(la
onoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
vnoremap <buffer> <silent> \si :call C_Stat("v","if (  )")f(la
onoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
vnoremap <buffer> <silent> \sfo :call C_StatBlock("v","for ( ; ; )")f;i
onoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
vnoremap <buffer> <silent> \sf :call C_Stat("v","for ( ; ; )")f;i
onoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
vnoremap <buffer> <silent> \sd :call C_DoWhile("v")f(la
onoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
noremap <buffer> <silent> \cy :call C_Toggle_C_Cpp()<NL>noremap <buffer> <silent> \ct a=strftime("%x %X %Z")<NL>noremap <buffer> <silent> \cd a=strftime("%x")<NL>noremap <buffer> <silent> \ccl :call C_CommentTemplates("class")<NL>noremap <buffer> <silent> \cme :call C_CommentTemplates("method")<NL>noremap <buffer> <silent> \cfu :call C_CommentTemplates("function")<NL>noremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")<NL>vnoremap <buffer> <silent> \co :call C_CommentCode("v"):nohlsearch<NL>onoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch<NL>vnoremap <buffer> <silent> \c\ :call C_CodeComment("v","no"):nohlsearchj
noremap <buffer> <silent> \ct a=strftime("%x %X %Z")
noremap <buffer> <silent> \cd a=strftime("%x")
noremap <buffer> <silent> \ccl :call C_CommentTemplates("class")
noremap <buffer> <silent> \cme :call C_CommentTemplates("method")
noremap <buffer> <silent> \cfu :call C_CommentTemplates("function")
noremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")
vnoremap <buffer> <silent> \co :call C_CommentCode("v"):nohlsearch
onoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch
vnoremap <buffer> <silent> \c\ :call C_CodeComment("v","no"):nohlsearchj
nnoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
vnoremap <buffer> <silent> \c* :call C_CodeComment("v","yes"):nohlsearchj
onoremap <buffer> <silent> \c* :call C_CodeComment("a","yes"):nohlsearchj
vnoremap <buffer> <silent> \ci :call C_CodeComment("v","yes"):nohlsearch<NL>onoremap <buffer> <silent> \ci o/*/kA 
onoremap <buffer> <silent> \ci o/*/kA 
noremap <buffer> <silent> \cs :call C_GetLineEndCommCol()<NL>vnoremap <buffer> <silent> \cn :call C_MultiLineEndComments("// ")A
vnoremap <buffer> <silent> \cn :call C_MultiLineEndComments("// ")A
onoremap <buffer> <silent> \cn :call C_LineEndComment("// ")A
vnoremap <buffer> <silent> \cl :call C_MultiLineEndComments()a
onoremap <buffer> <silent> \cl :call C_LineEndComment()a
vnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("v")<NL>onoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")<NL>map <buffer> <silent> <S-F9> :call C_Arguments()<NL>map <buffer> <silent> <C-F9> :call C_Run()<NL>map <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()<NL>map <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()<NL>inoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>inoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")
map <buffer> <silent> <S-F9> :call C_Arguments()
map <buffer> <silent> <C-F9> :call C_Run()
map <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()
map <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()
inoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
inoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
inoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
inoremap <buffer> <silent> \+tf :call C_CodeTemplateFunct()<NL>inoremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")<NL>inoremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")<NL>inoremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")<NL>inoremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")<NL>inoremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")<NL>inoremap <buffer> <silent> \+m :call C_CodeMethod()<NL>inoremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
inoremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")
inoremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")
inoremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")
inoremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")
inoremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")
inoremap <buffer> <silent> \+m :call C_CodeMethod()
inoremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
inoremap <buffer> <silent> \ii :call C_CodeFopen("input")jf"a
inoremap <buffer> <silent> \ias assert();<Left><Left>
inoremap <buffer> <silent> \isi sizeof()<Left>
inoremap <buffer> <silent> \ima :call C_CodeMalloc("m")i
inoremap <buffer> <silent> \ica :call C_CodeMalloc("c")i
inoremap <buffer> <silent> \isc scanf("", & );F"i
inoremap <buffer> <silent> \ip printf("\n");2F"a
inoremap <buffer> <silent> \iu :call C_EST("union")o
inoremap <buffer> <silent> \is :call C_EST("struct")o
inoremap <buffer> <silent> \ie :call C_EST("enum")o
inoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
inoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
inoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
inoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
inoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
inoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
inoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")A
inoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")A
inoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")A
inoremap <buffer> <silent> \pu :call C_PPUndef()f	a
inoremap <buffer> <silent> \pd :call C_PPDefine()f	a
inoremap <buffer> <silent> \p" o#include	""<Left>
inoremap <buffer> <silent> \p< o#include	<><Left>
inoremap <buffer> <silent> \s{ :call C_Block("a")o
inoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
inoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
inoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
inoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
inoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
inoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
inoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
inoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
inoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
inoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
inoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
inoremap <buffer> <silent> \ct =strftime("%x %X %Z")<NL>inoremap <buffer> <silent> \cd =strftime("%x")<NL>inoremap <buffer> <silent> \ccl :call C_CommentTemplates("class")<NL>inoremap <buffer> <silent> \cme :call C_CommentTemplates("method")<NL>inoremap <buffer> <silent> \cfu :call C_CommentTemplates("function")<NL>inoremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")<NL>inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")a
inoremap <buffer> <silent> \cd =strftime("%x")
inoremap <buffer> <silent> \ccl :call C_CommentTemplates("class")
inoremap <buffer> <silent> \cme :call C_CommentTemplates("method")
inoremap <buffer> <silent> \cfu :call C_CommentTemplates("function")
inoremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")
inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")a
inoremap <buffer> <silent> \cl :call C_LineEndComment()a
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=~/.vim/c-support/wordlists/c-c++-keywords.list,~/.vim/c-support/wordlists/k+r.list,~/.vim/c-support/wordlists/stl_index.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'c'
setlocal filetype=c
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
setlocal syntax=c
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 13 - ((3 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
13
normal! 046l
tabedit src/rss_data.h
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <silent> <S-F9> :call C_Arguments()
imap <buffer> <silent> <C-F9> :call C_Run()
imap <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()
imap <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()
map <buffer> <silent> \h :call C_HelpCsupport()
map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call C_XtermSize()
map <buffer> <silent> \rs :call C_Settings()
vmap <buffer> <silent> \rh :call C_Hardcopy("v")
nmap <buffer> <silent> \rh :call C_Hardcopy("n")
omap <buffer> <silent> \rh :call C_Hardcopy("n")
vmap <buffer> <silent> \rd :call C_Indent("v"):redraw:call C_HlMessage()
nmap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()
omap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()
map <buffer> <silent> \ri :call C_SplintArguments()
map <buffer> <silent> \rp :call C_SplintCheck():redraw:call C_HlMessage()
map <buffer> <silent> \rg :call C_MakeArguments()
map <buffer> <silent> \rm :call C_Make()
map <buffer> <silent> \ra :call C_Arguments()
map <buffer> <silent> \rr :call C_Run()
map <buffer> <silent> \rl :call C_Link():redraw:call C_HlMessage()
map <buffer> <silent> \rc :call C_Compile():redraw:call C_HlMessage()
vnoremap <buffer> <silent> \+c. :call C_CodeCatch("v","...")
nnoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
onoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
vnoremap <buffer> <silent> \+ca :call C_CodeCatch("v"," const &ExceptObj ")f(fci
nnoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
vnoremap <buffer> <silent> \+tr :call C_CodeTryCatch("v")f(fci
nnoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
onoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
noremap <buffer> <silent> \+tf :call C_CodeTemplateFunct()
noremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")
noremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")
noremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")
noremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")
noremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")
noremap <buffer> <silent> \+m :call C_CodeMethod()
noremap <buffer> <silent> \ns :call C_ProtoShow()
noremap <buffer> <silent> \nc :call C_ProtoClear()
noremap <buffer> <silent> \ni :call C_ProtoInsert()
vnoremap <buffer> <silent> \np :call C_ProtoPick("v")
nnoremap <buffer> <silent> \np :call C_ProtoPick("n")
onoremap <buffer> <silent> \np :call C_ProtoPick("n")
noremap <buffer> <silent> \ne :call C_CodeSnippet("e")
vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")
nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
noremap <buffer> <silent> \nr :call C_CodeSnippet("r")
noremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
noremap <buffer> <silent> \ii :call C_CodeFopen("input")jf"a
vnoremap <buffer> <silent> \ias sassert();F(p
nnoremap <buffer> <silent> \ias oassert();<Left><Left>
onoremap <buffer> <silent> \ias oassert();<Left><Left>
vnoremap <buffer> <silent> \isi ssizeof()P
nnoremap <buffer> <silent> \isi isizeof()<Left>
onoremap <buffer> <silent> \isi isizeof()<Left>
noremap <buffer> <silent> \ima :call C_CodeMalloc("m")i
noremap <buffer> <silent> \ica :call C_CodeMalloc("c")i
noremap <buffer> <silent> \isc oscanf("", & );F"i
noremap <buffer> <silent> \ip oprintf("\n");2F"a
noremap <buffer> <silent> \iu :call C_EST("union")o
noremap <buffer> <silent> \is :call C_EST("struct")o
noremap <buffer> <silent> \ie :call C_EST("enum")o
vnoremap <buffer> <silent> \in :call C_CodeFor("down", "v")
nnoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
onoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
vnoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "v")
nnoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
onoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
vnoremap <buffer> <silent> \im :call C_CodeMain("v")
nnoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
onoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
vnoremap <buffer> <silent> \isf :call C_CodeFunction("sv")w
nnoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
onoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
vnoremap <buffer> <silent> \if :call C_CodeFunction("v")
nnoremap <buffer> <silent> \if :call C_CodeFunction("a")
onoremap <buffer> <silent> \if :call C_CodeFunction("a")
noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")
vnoremap <buffer> <silent> \pind :call C_PPifndef (         "v" )
vnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","v+")
vnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"v+")
vnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"v+")
nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
nnoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
onoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
nnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")
onoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")
nnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")
onoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")
nnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")
onoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")
noremap <buffer> <silent> \pu :call C_PPUndef()f	a
noremap <buffer> <silent> \pd :call C_PPDefine()f	a
noremap <buffer> <silent> \p" o#include	""<Left>
noremap <buffer> <silent> \p< o#include	<><Left>
vnoremap <buffer> <silent> \s{ :call C_Block("v")
nnoremap <buffer> <silent> \s{ :call C_Block("a")o
onoremap <buffer> <silent> \s{ :call C_Block("a")o
vnoremap <buffer> <silent> \sc :call C_CodeCaseVisual()
nnoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
onoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
vnoremap <buffer> <silent> \ss :call C_CodeSwitchVisual()f(la
nnoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
onoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
vnoremap <buffer> <silent> \swh :call C_StatBlock("v","while (  )")f(la
nnoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
onoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
vnoremap <buffer> <silent> \sw :call C_Stat("v","while (  )")f(la
nnoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
onoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
vnoremap <buffer> <silent> \sife :call C_IfBlockElse("v")f(la
nnoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
onoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
vnoremap <buffer> <silent> \sie :call C_IfElse("v")f(la
nnoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
onoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
vnoremap <buffer> <silent> \sif :call C_StatBlock("v","if (  )")f(la
nnoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
onoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
vnoremap <buffer> <silent> \si :call C_Stat("v","if (  )")f(la
nnoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
onoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
vnoremap <buffer> <silent> \sfo :call C_StatBlock("v","for ( ; ; )")f;i
nnoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
onoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
vnoremap <buffer> <silent> \sf :call C_Stat("v","for ( ; ; )")f;i
nnoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
onoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
vnoremap <buffer> <silent> \sd :call C_DoWhile("v")f(la
nnoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
onoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
noremap <buffer> <silent> \cy :call C_Toggle_C_Cpp()
noremap <buffer> <silent> \ct a=strftime("%x %X %Z")
noremap <buffer> <silent> \cd a=strftime("%x")
noremap <buffer> <silent> \ccl :call C_CommentTemplates("class")
noremap <buffer> <silent> \cme :call C_CommentTemplates("method")
noremap <buffer> <silent> \cfu :call C_CommentTemplates("function")
noremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")
vnoremap <buffer> <silent> \co :call C_CommentCode("v"):nohlsearch
nnoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch
onoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch
vnoremap <buffer> <silent> \c\ :call C_CodeComment("v","no"):nohlsearchj
nnoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
onoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
vnoremap <buffer> <silent> \c* :call C_CodeComment("v","yes"):nohlsearchj
nnoremap <buffer> <silent> \c* :call C_CodeComment("a","yes"):nohlsearchj
onoremap <buffer> <silent> \c* :call C_CodeComment("a","yes"):nohlsearchj
vnoremap <buffer> <silent> \ci :call C_CodeComment("v","yes"):nohlsearch
nnoremap <buffer> <silent> \ci o/*/kA 
onoremap <buffer> <silent> \ci o/*/kA 
noremap <buffer> <silent> \cs :call C_GetLineEndCommCol()
vnoremap <buffer> <silent> \cn :call C_MultiLineEndComments("// ")A
nnoremap <buffer> <silent> \cn :call C_LineEndComment("// ")A
onoremap <buffer> <silent> \cn :call C_LineEndComment("// ")A
vnoremap <buffer> <silent> \cl :call C_MultiLineEndComments()a
nnoremap <buffer> <silent> \cl :call C_LineEndComment()a
onoremap <buffer> <silent> \cl :call C_LineEndComment()a
vnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("v")
nnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")
onoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")
map <buffer> <silent> <S-F9> :call C_Arguments()
map <buffer> <silent> <C-F9> :call C_Run()
map <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()
map <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()
inoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
inoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
inoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
inoremap <buffer> <silent> \+tf :call C_CodeTemplateFunct()
inoremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")
inoremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")
inoremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")
inoremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")
inoremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")
inoremap <buffer> <silent> \+m :call C_CodeMethod()
inoremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
inoremap <buffer> <silent> \ii :call C_CodeFopen("input")jf"a
inoremap <buffer> <silent> \ias assert();<Left><Left>
inoremap <buffer> <silent> \isi sizeof()<Left>
inoremap <buffer> <silent> \ima :call C_CodeMalloc("m")i
inoremap <buffer> <silent> \ica :call C_CodeMalloc("c")i
inoremap <buffer> <silent> \isc scanf("", & );F"i
inoremap <buffer> <silent> \ip printf("\n");2F"a
inoremap <buffer> <silent> \iu :call C_EST("union")o
inoremap <buffer> <silent> \is :call C_EST("struct")o
inoremap <buffer> <silent> \ie :call C_EST("enum")o
inoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
inoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
inoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
inoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
inoremap <buffer> <silent> \if :call C_CodeFunction("a")
inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
inoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
inoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")A
inoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")A
inoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")A
inoremap <buffer> <silent> \pu :call C_PPUndef()f	a
inoremap <buffer> <silent> \pd :call C_PPDefine()f	a
inoremap <buffer> <silent> \p" o#include	""<Left>
inoremap <buffer> <silent> \p< o#include	<><Left>
inoremap <buffer> <silent> \s{ :call C_Block("a")o
inoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
inoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
inoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
inoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
inoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
inoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
inoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
inoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
inoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
inoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
inoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
inoremap <buffer> <silent> \ct =strftime("%x %X %Z")
inoremap <buffer> <silent> \cd =strftime("%x")
inoremap <buffer> <silent> \ccl :call C_CommentTemplates("class")
inoremap <buffer> <silent> \cme :call C_CommentTemplates("method")
inoremap <buffer> <silent> \cfu :call C_CommentTemplates("function")
inoremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")
inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")a
inoremap <buffer> <silent> \cl :call C_LineEndComment()a
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=~/.vim/c-support/wordlists/c-c++-keywords.list,~/.vim/c-support/wordlists/k+r.list,~/.vim/c-support/wordlists/stl_index.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'c'
setlocal filetype=c
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
setlocal syntax=c
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit src/rss_iconv.h
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <silent> <S-F9> :call C_Arguments()<NL>imap <buffer> <silent> <C-F9> :call C_Run()<NL>imap <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()<NL>imap <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()<NL>nmap <buffer> <silent> \rh :call C_Hardcopy("n")<NL>nmap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()<NL>nnoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>nnoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
imap <buffer> <silent> <C-F9> :call C_Run()
imap <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()
imap <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()
nnoremap <buffer> <silent> \s{ :call C_Block("a")o
nnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")
nnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")
nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
nnoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
nmap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()
nmap <buffer> <silent> \rh :call C_Hardcopy("n")
nnoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
nnoremap <buffer> <silent> \np :call C_ProtoPick("n")<NL>nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")<NL>nnoremap <buffer> <silent> \ias oassert();<Left><Left>
nnoremap <buffer> <silent> \isi isizeof()<Left>
nnoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
nnoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
nnoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
nnoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
nnoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
nnoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
nnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")<NL>nnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")<NL>nnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")<NL>nnoremap <buffer> <silent> \s{ :call C_Block("a")o
nnoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
nnoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
nnoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
nnoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
nnoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
nnoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
nnoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
nnoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
nnoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
nnoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
nnoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
nnoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch<NL>nnoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
nnoremap <buffer> <silent> \c* :call C_CodeComment("a","yes"):nohlsearchj
nnoremap <buffer> <silent> \ci o/*/kA 
nnoremap <buffer> <silent> \cn :call C_LineEndComment("// ")A
nnoremap <buffer> <silent> \cl :call C_LineEndComment()a
nnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")<NL>map <buffer> <silent> \h :call C_HelpCsupport()<NL>map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()<NL>map <buffer> <silent> \rx :call C_XtermSize()<NL>map <buffer> <silent> \rs :call C_Settings()<NL>vmap <buffer> <silent> \rh :call C_Hardcopy("v")<NL>omap <buffer> <silent> \rh :call C_Hardcopy("n")<NL>vmap <buffer> <silent> \rd :call C_Indent("v"):redraw:call C_HlMessage()<NL>omap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()<NL>map <buffer> <silent> \ri :call C_SplintArguments()<NL>map <buffer> <silent> \rp :call C_SplintCheck():redraw:call C_HlMessage()<NL>map <buffer> <silent> \rg :call C_MakeArguments()<NL>map <buffer> <silent> \rm :call C_Make()<NL>map <buffer> <silent> \ra :call C_Arguments()<NL>map <buffer> <silent> \rr :call C_Run()<NL>map <buffer> <silent> \rl :call C_Link():redraw:call C_HlMessage()<NL>map <buffer> <silent> \rc :call C_Compile():redraw:call C_HlMessage()<NL>vnoremap <buffer> <silent> \+c. :call C_CodeCatch("v","...")<NL>onoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>vnoremap <buffer> <silent> \+ca :call C_CodeCatch("v"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \ias oassert();<Left><Left>
onoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
map <buffer> <silent> \h :call C_HelpCsupport()
map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call C_XtermSize()
map <buffer> <silent> \rs :call C_Settings()
vmap <buffer> <silent> \rh :call C_Hardcopy("v")
omap <buffer> <silent> \rh :call C_Hardcopy("n")
vmap <buffer> <silent> \rd :call C_Indent("v"):redraw:call C_HlMessage()
omap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()
map <buffer> <silent> \ri :call C_SplintArguments()
map <buffer> <silent> \rp :call C_SplintCheck():redraw:call C_HlMessage()
map <buffer> <silent> \rg :call C_MakeArguments()
map <buffer> <silent> \rm :call C_Make()
map <buffer> <silent> \ra :call C_Arguments()
map <buffer> <silent> \rr :call C_Run()
map <buffer> <silent> \rl :call C_Link():redraw:call C_HlMessage()
map <buffer> <silent> \rc :call C_Compile():redraw:call C_HlMessage()
vnoremap <buffer> <silent> \+c. :call C_CodeCatch("v","...")
onoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
vnoremap <buffer> <silent> \+ca :call C_CodeCatch("v"," const &ExceptObj ")f(fci
nnoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
vnoremap <buffer> <silent> \+tr :call C_CodeTryCatch("v")f(fci
onoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
noremap <buffer> <silent> \+tf :call C_CodeTemplateFunct()<NL>noremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")<NL>noremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")<NL>noremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")<NL>noremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")<NL>noremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")<NL>noremap <buffer> <silent> \+m :call C_CodeMethod()<NL>noremap <buffer> <silent> \ns :call C_ProtoShow()<NL>noremap <buffer> <silent> \nc :call C_ProtoClear()<NL>noremap <buffer> <silent> \ni :call C_ProtoInsert()<NL>vnoremap <buffer> <silent> \np :call C_ProtoPick("v")<NL>onoremap <buffer> <silent> \np :call C_ProtoPick("n")<NL>noremap <buffer> <silent> \ne :call C_CodeSnippet("e")<NL>vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")<NL>onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")<NL>noremap <buffer> <silent> \nr :call C_CodeSnippet("r")<NL>noremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
noremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")
noremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")
noremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")
noremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")
noremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")
noremap <buffer> <silent> \+m :call C_CodeMethod()
noremap <buffer> <silent> \ns :call C_ProtoShow()
noremap <buffer> <silent> \nc :call C_ProtoClear()
noremap <buffer> <silent> \ni :call C_ProtoInsert()
vnoremap <buffer> <silent> \np :call C_ProtoPick("v")
onoremap <buffer> <silent> \np :call C_ProtoPick("n")
noremap <buffer> <silent> \ne :call C_CodeSnippet("e")
vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")
onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
noremap <buffer> <silent> \nr :call C_CodeSnippet("r")
noremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
noremap <buffer> <silent> \ii :call C_CodeFopen("input")jf"a
vnoremap <buffer> <silent> \ias sassert();F(p
nnoremap <buffer> <silent> \ias oassert();<Left><Left>
vnoremap <buffer> <silent> \isi ssizeof()P
onoremap <buffer> <silent> \isi isizeof()<Left>
noremap <buffer> <silent> \ima :call C_CodeMalloc("m")i
noremap <buffer> <silent> \ica :call C_CodeMalloc("c")i
noremap <buffer> <silent> \isc oscanf("", & );F"i
noremap <buffer> <silent> \ip oprintf("\n");2F"a
noremap <buffer> <silent> \iu :call C_EST("union")o
noremap <buffer> <silent> \is :call C_EST("struct")o
noremap <buffer> <silent> \ie :call C_EST("enum")o
vnoremap <buffer> <silent> \in :call C_CodeFor("down", "v")<NL>onoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
onoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
vnoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "v")<NL>onoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
onoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
vnoremap <buffer> <silent> \im :call C_CodeMain("v")<NL>onoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
onoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
vnoremap <buffer> <silent> \isf :call C_CodeFunction("sv")w
onoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
vnoremap <buffer> <silent> \if :call C_CodeFunction("v")<NL>onoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()<NL>vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")<NL>vnoremap <buffer> <silent> \pind :call C_PPifndef (         "v" )<NL>vnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","v+")<NL>vnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"v+")<NL>vnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"v+")<NL>onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
onoremap <buffer> <silent> \if :call C_CodeFunction("a")
noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")
vnoremap <buffer> <silent> \pind :call C_PPifndef (         "v" )
vnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","v+")
vnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"v+")
vnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"v+")
onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
onoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
onoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")<NL>onoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")<NL>onoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")<NL>noremap <buffer> <silent> \pu :call C_PPUndef()f	a
onoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")
onoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")
noremap <buffer> <silent> \pu :call C_PPUndef()f	a
noremap <buffer> <silent> \pd :call C_PPDefine()f	a
noremap <buffer> <silent> \p" o#include	""<Left>
noremap <buffer> <silent> \p< o#include	<><Left>
vnoremap <buffer> <silent> \s{ :call C_Block("v")<NL>onoremap <buffer> <silent> \s{ :call C_Block("a")o
onoremap <buffer> <silent> \s{ :call C_Block("a")o
vnoremap <buffer> <silent> \sc :call C_CodeCaseVisual()
onoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
vnoremap <buffer> <silent> \ss :call C_CodeSwitchVisual()f(la
onoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
vnoremap <buffer> <silent> \swh :call C_StatBlock("v","while (  )")f(la
onoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
vnoremap <buffer> <silent> \sw :call C_Stat("v","while (  )")f(la
onoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
vnoremap <buffer> <silent> \sife :call C_IfBlockElse("v")f(la
onoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
vnoremap <buffer> <silent> \sie :call C_IfElse("v")f(la
onoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
vnoremap <buffer> <silent> \sif :call C_StatBlock("v","if (  )")f(la
onoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
vnoremap <buffer> <silent> \si :call C_Stat("v","if (  )")f(la
onoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
vnoremap <buffer> <silent> \sfo :call C_StatBlock("v","for ( ; ; )")f;i
onoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
vnoremap <buffer> <silent> \sf :call C_Stat("v","for ( ; ; )")f;i
onoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
vnoremap <buffer> <silent> \sd :call C_DoWhile("v")f(la
onoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
noremap <buffer> <silent> \cy :call C_Toggle_C_Cpp()<NL>noremap <buffer> <silent> \ct a=strftime("%x %X %Z")<NL>noremap <buffer> <silent> \cd a=strftime("%x")<NL>noremap <buffer> <silent> \ccl :call C_CommentTemplates("class")<NL>noremap <buffer> <silent> \cme :call C_CommentTemplates("method")<NL>noremap <buffer> <silent> \cfu :call C_CommentTemplates("function")<NL>noremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")<NL>vnoremap <buffer> <silent> \co :call C_CommentCode("v"):nohlsearch<NL>onoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch<NL>vnoremap <buffer> <silent> \c\ :call C_CodeComment("v","no"):nohlsearchj
noremap <buffer> <silent> \ct a=strftime("%x %X %Z")
noremap <buffer> <silent> \cd a=strftime("%x")
noremap <buffer> <silent> \ccl :call C_CommentTemplates("class")
noremap <buffer> <silent> \cme :call C_CommentTemplates("method")
noremap <buffer> <silent> \cfu :call C_CommentTemplates("function")
noremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")
vnoremap <buffer> <silent> \co :call C_CommentCode("v"):nohlsearch
onoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch
vnoremap <buffer> <silent> \c\ :call C_CodeComment("v","no"):nohlsearchj
nnoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
vnoremap <buffer> <silent> \c* :call C_CodeComment("v","yes"):nohlsearchj
onoremap <buffer> <silent> \c* :call C_CodeComment("a","yes"):nohlsearchj
vnoremap <buffer> <silent> \ci :call C_CodeComment("v","yes"):nohlsearch<NL>onoremap <buffer> <silent> \ci o/*/kA 
onoremap <buffer> <silent> \ci o/*/kA 
noremap <buffer> <silent> \cs :call C_GetLineEndCommCol()<NL>vnoremap <buffer> <silent> \cn :call C_MultiLineEndComments("// ")A
vnoremap <buffer> <silent> \cn :call C_MultiLineEndComments("// ")A
onoremap <buffer> <silent> \cn :call C_LineEndComment("// ")A
vnoremap <buffer> <silent> \cl :call C_MultiLineEndComments()a
onoremap <buffer> <silent> \cl :call C_LineEndComment()a
vnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("v")<NL>onoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")<NL>map <buffer> <silent> <S-F9> :call C_Arguments()<NL>map <buffer> <silent> <C-F9> :call C_Run()<NL>map <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()<NL>map <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()<NL>inoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>inoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")
map <buffer> <silent> <S-F9> :call C_Arguments()
map <buffer> <silent> <C-F9> :call C_Run()
map <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()
map <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()
inoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
inoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
inoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
inoremap <buffer> <silent> \+tf :call C_CodeTemplateFunct()<NL>inoremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")<NL>inoremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")<NL>inoremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")<NL>inoremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")<NL>inoremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")<NL>inoremap <buffer> <silent> \+m :call C_CodeMethod()<NL>inoremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
inoremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")
inoremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")
inoremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")
inoremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")
inoremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")
inoremap <buffer> <silent> \+m :call C_CodeMethod()
inoremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
inoremap <buffer> <silent> \ii :call C_CodeFopen("input")jf"a
inoremap <buffer> <silent> \ias assert();<Left><Left>
inoremap <buffer> <silent> \isi sizeof()<Left>
inoremap <buffer> <silent> \ima :call C_CodeMalloc("m")i
inoremap <buffer> <silent> \ica :call C_CodeMalloc("c")i
inoremap <buffer> <silent> \isc scanf("", & );F"i
inoremap <buffer> <silent> \ip printf("\n");2F"a
inoremap <buffer> <silent> \iu :call C_EST("union")o
inoremap <buffer> <silent> \is :call C_EST("struct")o
inoremap <buffer> <silent> \ie :call C_EST("enum")o
inoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
inoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
inoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
inoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
inoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
inoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
inoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")A
inoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")A
inoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")A
inoremap <buffer> <silent> \pu :call C_PPUndef()f	a
inoremap <buffer> <silent> \pd :call C_PPDefine()f	a
inoremap <buffer> <silent> \p" o#include	""<Left>
inoremap <buffer> <silent> \p< o#include	<><Left>
inoremap <buffer> <silent> \s{ :call C_Block("a")o
inoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
inoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
inoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
inoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
inoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
inoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
inoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
inoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
inoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
inoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
inoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
inoremap <buffer> <silent> \ct =strftime("%x %X %Z")<NL>inoremap <buffer> <silent> \cd =strftime("%x")<NL>inoremap <buffer> <silent> \ccl :call C_CommentTemplates("class")<NL>inoremap <buffer> <silent> \cme :call C_CommentTemplates("method")<NL>inoremap <buffer> <silent> \cfu :call C_CommentTemplates("function")<NL>inoremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")<NL>inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")a
inoremap <buffer> <silent> \cd =strftime("%x")
inoremap <buffer> <silent> \ccl :call C_CommentTemplates("class")
inoremap <buffer> <silent> \cme :call C_CommentTemplates("method")
inoremap <buffer> <silent> \cfu :call C_CommentTemplates("function")
inoremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")
inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")a
inoremap <buffer> <silent> \cl :call C_LineEndComment()a
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=~/.vim/c-support/wordlists/c-c++-keywords.list,~/.vim/c-support/wordlists/k+r.list,~/.vim/c-support/wordlists/stl_index.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'c'
setlocal filetype=c
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
setlocal syntax=c
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 13 - ((12 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
13
normal! 020l
tabedit src/rss_list.c
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <silent> <S-F9> :call C_Arguments()<NL>imap <buffer> <silent> <C-F9> :call C_Run()<NL>imap <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()<NL>imap <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()<NL>nmap <buffer> <silent> \rh :call C_Hardcopy("n")<NL>nmap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()<NL>nnoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>nnoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
imap <buffer> <silent> <C-F9> :call C_Run()
imap <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()
imap <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()
nnoremap <buffer> <silent> \s{ :call C_Block("a")o
nnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")
nnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")
nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
nnoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
nmap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()
nmap <buffer> <silent> \rh :call C_Hardcopy("n")
nnoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
nnoremap <buffer> <silent> \np :call C_ProtoPick("n")<NL>nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")<NL>nnoremap <buffer> <silent> \ias oassert();<Left><Left>
nnoremap <buffer> <silent> \isi isizeof()<Left>
nnoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
nnoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
nnoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
nnoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
nnoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
nnoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
nnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")<NL>nnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")<NL>nnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")<NL>nnoremap <buffer> <silent> \s{ :call C_Block("a")o
nnoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
nnoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
nnoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
nnoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
nnoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
nnoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
nnoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
nnoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
nnoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
nnoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
nnoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
nnoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch<NL>nnoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
nnoremap <buffer> <silent> \c* :call C_CodeComment("a","yes"):nohlsearchj
nnoremap <buffer> <silent> \ci o/*/kA 
nnoremap <buffer> <silent> \cn :call C_LineEndComment("// ")A
nnoremap <buffer> <silent> \cl :call C_LineEndComment()a
nnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")<NL>map <buffer> <silent> \h :call C_HelpCsupport()<NL>map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()<NL>map <buffer> <silent> \rx :call C_XtermSize()<NL>map <buffer> <silent> \rs :call C_Settings()<NL>vmap <buffer> <silent> \rh :call C_Hardcopy("v")<NL>omap <buffer> <silent> \rh :call C_Hardcopy("n")<NL>vmap <buffer> <silent> \rd :call C_Indent("v"):redraw:call C_HlMessage()<NL>omap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()<NL>map <buffer> <silent> \ri :call C_SplintArguments()<NL>map <buffer> <silent> \rp :call C_SplintCheck():redraw:call C_HlMessage()<NL>map <buffer> <silent> \rg :call C_MakeArguments()<NL>map <buffer> <silent> \rm :call C_Make()<NL>map <buffer> <silent> \ra :call C_Arguments()<NL>map <buffer> <silent> \rr :call C_Run()<NL>map <buffer> <silent> \rl :call C_Link():redraw:call C_HlMessage()<NL>map <buffer> <silent> \rc :call C_Compile():redraw:call C_HlMessage()<NL>vnoremap <buffer> <silent> \+c. :call C_CodeCatch("v","...")<NL>onoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>vnoremap <buffer> <silent> \+ca :call C_CodeCatch("v"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \ias oassert();<Left><Left>
onoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
map <buffer> <silent> \h :call C_HelpCsupport()
map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call C_XtermSize()
map <buffer> <silent> \rs :call C_Settings()
vmap <buffer> <silent> \rh :call C_Hardcopy("v")
omap <buffer> <silent> \rh :call C_Hardcopy("n")
vmap <buffer> <silent> \rd :call C_Indent("v"):redraw:call C_HlMessage()
omap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()
map <buffer> <silent> \ri :call C_SplintArguments()
map <buffer> <silent> \rp :call C_SplintCheck():redraw:call C_HlMessage()
map <buffer> <silent> \rg :call C_MakeArguments()
map <buffer> <silent> \rm :call C_Make()
map <buffer> <silent> \ra :call C_Arguments()
map <buffer> <silent> \rr :call C_Run()
map <buffer> <silent> \rl :call C_Link():redraw:call C_HlMessage()
map <buffer> <silent> \rc :call C_Compile():redraw:call C_HlMessage()
vnoremap <buffer> <silent> \+c. :call C_CodeCatch("v","...")
onoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
vnoremap <buffer> <silent> \+ca :call C_CodeCatch("v"," const &ExceptObj ")f(fci
nnoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
vnoremap <buffer> <silent> \+tr :call C_CodeTryCatch("v")f(fci
onoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
noremap <buffer> <silent> \+tf :call C_CodeTemplateFunct()<NL>noremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")<NL>noremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")<NL>noremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")<NL>noremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")<NL>noremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")<NL>noremap <buffer> <silent> \+m :call C_CodeMethod()<NL>noremap <buffer> <silent> \ns :call C_ProtoShow()<NL>noremap <buffer> <silent> \nc :call C_ProtoClear()<NL>noremap <buffer> <silent> \ni :call C_ProtoInsert()<NL>vnoremap <buffer> <silent> \np :call C_ProtoPick("v")<NL>onoremap <buffer> <silent> \np :call C_ProtoPick("n")<NL>noremap <buffer> <silent> \ne :call C_CodeSnippet("e")<NL>vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")<NL>onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")<NL>noremap <buffer> <silent> \nr :call C_CodeSnippet("r")<NL>noremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
noremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")
noremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")
noremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")
noremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")
noremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")
noremap <buffer> <silent> \+m :call C_CodeMethod()
noremap <buffer> <silent> \ns :call C_ProtoShow()
noremap <buffer> <silent> \nc :call C_ProtoClear()
noremap <buffer> <silent> \ni :call C_ProtoInsert()
vnoremap <buffer> <silent> \np :call C_ProtoPick("v")
onoremap <buffer> <silent> \np :call C_ProtoPick("n")
noremap <buffer> <silent> \ne :call C_CodeSnippet("e")
vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")
onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
noremap <buffer> <silent> \nr :call C_CodeSnippet("r")
noremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
noremap <buffer> <silent> \ii :call C_CodeFopen("input")jf"a
vnoremap <buffer> <silent> \ias sassert();F(p
nnoremap <buffer> <silent> \ias oassert();<Left><Left>
vnoremap <buffer> <silent> \isi ssizeof()P
onoremap <buffer> <silent> \isi isizeof()<Left>
noremap <buffer> <silent> \ima :call C_CodeMalloc("m")i
noremap <buffer> <silent> \ica :call C_CodeMalloc("c")i
noremap <buffer> <silent> \isc oscanf("", & );F"i
noremap <buffer> <silent> \ip oprintf("\n");2F"a
noremap <buffer> <silent> \iu :call C_EST("union")o
noremap <buffer> <silent> \is :call C_EST("struct")o
noremap <buffer> <silent> \ie :call C_EST("enum")o
vnoremap <buffer> <silent> \in :call C_CodeFor("down", "v")<NL>onoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
onoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
vnoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "v")<NL>onoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
onoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
vnoremap <buffer> <silent> \im :call C_CodeMain("v")<NL>onoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
onoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
vnoremap <buffer> <silent> \isf :call C_CodeFunction("sv")w
onoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
vnoremap <buffer> <silent> \if :call C_CodeFunction("v")<NL>onoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()<NL>vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")<NL>vnoremap <buffer> <silent> \pind :call C_PPifndef (         "v" )<NL>vnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","v+")<NL>vnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"v+")<NL>vnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"v+")<NL>onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
onoremap <buffer> <silent> \if :call C_CodeFunction("a")
noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")
vnoremap <buffer> <silent> \pind :call C_PPifndef (         "v" )
vnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","v+")
vnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"v+")
vnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"v+")
onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
onoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
onoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")<NL>onoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")<NL>onoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")<NL>noremap <buffer> <silent> \pu :call C_PPUndef()f	a
onoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")
onoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")
noremap <buffer> <silent> \pu :call C_PPUndef()f	a
noremap <buffer> <silent> \pd :call C_PPDefine()f	a
noremap <buffer> <silent> \p" o#include	""<Left>
noremap <buffer> <silent> \p< o#include	<><Left>
vnoremap <buffer> <silent> \s{ :call C_Block("v")<NL>onoremap <buffer> <silent> \s{ :call C_Block("a")o
onoremap <buffer> <silent> \s{ :call C_Block("a")o
vnoremap <buffer> <silent> \sc :call C_CodeCaseVisual()
onoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
vnoremap <buffer> <silent> \ss :call C_CodeSwitchVisual()f(la
onoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
vnoremap <buffer> <silent> \swh :call C_StatBlock("v","while (  )")f(la
onoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
vnoremap <buffer> <silent> \sw :call C_Stat("v","while (  )")f(la
onoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
vnoremap <buffer> <silent> \sife :call C_IfBlockElse("v")f(la
onoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
vnoremap <buffer> <silent> \sie :call C_IfElse("v")f(la
onoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
vnoremap <buffer> <silent> \sif :call C_StatBlock("v","if (  )")f(la
onoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
vnoremap <buffer> <silent> \si :call C_Stat("v","if (  )")f(la
onoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
vnoremap <buffer> <silent> \sfo :call C_StatBlock("v","for ( ; ; )")f;i
onoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
vnoremap <buffer> <silent> \sf :call C_Stat("v","for ( ; ; )")f;i
onoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
vnoremap <buffer> <silent> \sd :call C_DoWhile("v")f(la
onoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
noremap <buffer> <silent> \cy :call C_Toggle_C_Cpp()<NL>noremap <buffer> <silent> \ct a=strftime("%x %X %Z")<NL>noremap <buffer> <silent> \cd a=strftime("%x")<NL>noremap <buffer> <silent> \ccl :call C_CommentTemplates("class")<NL>noremap <buffer> <silent> \cme :call C_CommentTemplates("method")<NL>noremap <buffer> <silent> \cfu :call C_CommentTemplates("function")<NL>noremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")<NL>vnoremap <buffer> <silent> \co :call C_CommentCode("v"):nohlsearch<NL>onoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch<NL>vnoremap <buffer> <silent> \c\ :call C_CodeComment("v","no"):nohlsearchj
noremap <buffer> <silent> \ct a=strftime("%x %X %Z")
noremap <buffer> <silent> \cd a=strftime("%x")
noremap <buffer> <silent> \ccl :call C_CommentTemplates("class")
noremap <buffer> <silent> \cme :call C_CommentTemplates("method")
noremap <buffer> <silent> \cfu :call C_CommentTemplates("function")
noremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")
vnoremap <buffer> <silent> \co :call C_CommentCode("v"):nohlsearch
onoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch
vnoremap <buffer> <silent> \c\ :call C_CodeComment("v","no"):nohlsearchj
nnoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
vnoremap <buffer> <silent> \c* :call C_CodeComment("v","yes"):nohlsearchj
onoremap <buffer> <silent> \c* :call C_CodeComment("a","yes"):nohlsearchj
vnoremap <buffer> <silent> \ci :call C_CodeComment("v","yes"):nohlsearch<NL>onoremap <buffer> <silent> \ci o/*/kA 
onoremap <buffer> <silent> \ci o/*/kA 
noremap <buffer> <silent> \cs :call C_GetLineEndCommCol()<NL>vnoremap <buffer> <silent> \cn :call C_MultiLineEndComments("// ")A
vnoremap <buffer> <silent> \cn :call C_MultiLineEndComments("// ")A
onoremap <buffer> <silent> \cn :call C_LineEndComment("// ")A
vnoremap <buffer> <silent> \cl :call C_MultiLineEndComments()a
onoremap <buffer> <silent> \cl :call C_LineEndComment()a
vnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("v")<NL>onoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")<NL>map <buffer> <silent> <S-F9> :call C_Arguments()<NL>map <buffer> <silent> <C-F9> :call C_Run()<NL>map <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()<NL>map <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()<NL>inoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>inoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")
map <buffer> <silent> <S-F9> :call C_Arguments()
map <buffer> <silent> <C-F9> :call C_Run()
map <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()
map <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()
inoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
inoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
inoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
inoremap <buffer> <silent> \+tf :call C_CodeTemplateFunct()<NL>inoremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")<NL>inoremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")<NL>inoremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")<NL>inoremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")<NL>inoremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")<NL>inoremap <buffer> <silent> \+m :call C_CodeMethod()<NL>inoremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
inoremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")
inoremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")
inoremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")
inoremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")
inoremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")
inoremap <buffer> <silent> \+m :call C_CodeMethod()
inoremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
inoremap <buffer> <silent> \ii :call C_CodeFopen("input")jf"a
inoremap <buffer> <silent> \ias assert();<Left><Left>
inoremap <buffer> <silent> \isi sizeof()<Left>
inoremap <buffer> <silent> \ima :call C_CodeMalloc("m")i
inoremap <buffer> <silent> \ica :call C_CodeMalloc("c")i
inoremap <buffer> <silent> \isc scanf("", & );F"i
inoremap <buffer> <silent> \ip printf("\n");2F"a
inoremap <buffer> <silent> \iu :call C_EST("union")o
inoremap <buffer> <silent> \is :call C_EST("struct")o
inoremap <buffer> <silent> \ie :call C_EST("enum")o
inoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
inoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
inoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
inoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
inoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
inoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
inoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")A
inoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")A
inoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")A
inoremap <buffer> <silent> \pu :call C_PPUndef()f	a
inoremap <buffer> <silent> \pd :call C_PPDefine()f	a
inoremap <buffer> <silent> \p" o#include	""<Left>
inoremap <buffer> <silent> \p< o#include	<><Left>
inoremap <buffer> <silent> \s{ :call C_Block("a")o
inoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
inoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
inoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
inoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
inoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
inoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
inoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
inoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
inoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
inoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
inoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
inoremap <buffer> <silent> \ct =strftime("%x %X %Z")<NL>inoremap <buffer> <silent> \cd =strftime("%x")<NL>inoremap <buffer> <silent> \ccl :call C_CommentTemplates("class")<NL>inoremap <buffer> <silent> \cme :call C_CommentTemplates("method")<NL>inoremap <buffer> <silent> \cfu :call C_CommentTemplates("function")<NL>inoremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")<NL>inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")a
inoremap <buffer> <silent> \cd =strftime("%x")
inoremap <buffer> <silent> \ccl :call C_CommentTemplates("class")
inoremap <buffer> <silent> \cme :call C_CommentTemplates("method")
inoremap <buffer> <silent> \cfu :call C_CommentTemplates("function")
inoremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")
inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")a
inoremap <buffer> <silent> \cl :call C_LineEndComment()a
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=~/.vim/c-support/wordlists/c-c++-keywords.list,~/.vim/c-support/wordlists/k+r.list,~/.vim/c-support/wordlists/stl_index.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'c'
setlocal filetype=c
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
setlocal syntax=c
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 25 - ((11 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
25
normal! 0
tabedit src/rss_list.h
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <silent> <S-F9> :call C_Arguments()<NL>imap <buffer> <silent> <C-F9> :call C_Run()<NL>imap <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()<NL>imap <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()<NL>nmap <buffer> <silent> \rh :call C_Hardcopy("n")<NL>nmap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()<NL>nnoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>nnoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
imap <buffer> <silent> <C-F9> :call C_Run()
imap <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()
imap <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()
nnoremap <buffer> <silent> \s{ :call C_Block("a")o
nnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")
nnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")
nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
nnoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
nmap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()
nmap <buffer> <silent> \rh :call C_Hardcopy("n")
nnoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
nnoremap <buffer> <silent> \np :call C_ProtoPick("n")<NL>nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")<NL>nnoremap <buffer> <silent> \ias oassert();<Left><Left>
nnoremap <buffer> <silent> \isi isizeof()<Left>
nnoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
nnoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
nnoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
nnoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
nnoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
nnoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
nnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")<NL>nnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")<NL>nnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")<NL>nnoremap <buffer> <silent> \s{ :call C_Block("a")o
nnoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
nnoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
nnoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
nnoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
nnoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
nnoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
nnoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
nnoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
nnoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
nnoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
nnoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
nnoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch<NL>nnoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
nnoremap <buffer> <silent> \c* :call C_CodeComment("a","yes"):nohlsearchj
nnoremap <buffer> <silent> \ci o/*/kA 
nnoremap <buffer> <silent> \cn :call C_LineEndComment("// ")A
nnoremap <buffer> <silent> \cl :call C_LineEndComment()a
nnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")<NL>map <buffer> <silent> \h :call C_HelpCsupport()<NL>map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()<NL>map <buffer> <silent> \rx :call C_XtermSize()<NL>map <buffer> <silent> \rs :call C_Settings()<NL>vmap <buffer> <silent> \rh :call C_Hardcopy("v")<NL>omap <buffer> <silent> \rh :call C_Hardcopy("n")<NL>vmap <buffer> <silent> \rd :call C_Indent("v"):redraw:call C_HlMessage()<NL>omap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()<NL>map <buffer> <silent> \ri :call C_SplintArguments()<NL>map <buffer> <silent> \rp :call C_SplintCheck():redraw:call C_HlMessage()<NL>map <buffer> <silent> \rg :call C_MakeArguments()<NL>map <buffer> <silent> \rm :call C_Make()<NL>map <buffer> <silent> \ra :call C_Arguments()<NL>map <buffer> <silent> \rr :call C_Run()<NL>map <buffer> <silent> \rl :call C_Link():redraw:call C_HlMessage()<NL>map <buffer> <silent> \rc :call C_Compile():redraw:call C_HlMessage()<NL>vnoremap <buffer> <silent> \+c. :call C_CodeCatch("v","...")<NL>onoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>vnoremap <buffer> <silent> \+ca :call C_CodeCatch("v"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \ias oassert();<Left><Left>
onoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
map <buffer> <silent> \h :call C_HelpCsupport()
map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call C_XtermSize()
map <buffer> <silent> \rs :call C_Settings()
vmap <buffer> <silent> \rh :call C_Hardcopy("v")
omap <buffer> <silent> \rh :call C_Hardcopy("n")
vmap <buffer> <silent> \rd :call C_Indent("v"):redraw:call C_HlMessage()
omap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()
map <buffer> <silent> \ri :call C_SplintArguments()
map <buffer> <silent> \rp :call C_SplintCheck():redraw:call C_HlMessage()
map <buffer> <silent> \rg :call C_MakeArguments()
map <buffer> <silent> \rm :call C_Make()
map <buffer> <silent> \ra :call C_Arguments()
map <buffer> <silent> \rr :call C_Run()
map <buffer> <silent> \rl :call C_Link():redraw:call C_HlMessage()
map <buffer> <silent> \rc :call C_Compile():redraw:call C_HlMessage()
vnoremap <buffer> <silent> \+c. :call C_CodeCatch("v","...")
onoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
vnoremap <buffer> <silent> \+ca :call C_CodeCatch("v"," const &ExceptObj ")f(fci
nnoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
vnoremap <buffer> <silent> \+tr :call C_CodeTryCatch("v")f(fci
onoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
noremap <buffer> <silent> \+tf :call C_CodeTemplateFunct()<NL>noremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")<NL>noremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")<NL>noremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")<NL>noremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")<NL>noremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")<NL>noremap <buffer> <silent> \+m :call C_CodeMethod()<NL>noremap <buffer> <silent> \ns :call C_ProtoShow()<NL>noremap <buffer> <silent> \nc :call C_ProtoClear()<NL>noremap <buffer> <silent> \ni :call C_ProtoInsert()<NL>vnoremap <buffer> <silent> \np :call C_ProtoPick("v")<NL>onoremap <buffer> <silent> \np :call C_ProtoPick("n")<NL>noremap <buffer> <silent> \ne :call C_CodeSnippet("e")<NL>vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")<NL>onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")<NL>noremap <buffer> <silent> \nr :call C_CodeSnippet("r")<NL>noremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
noremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")
noremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")
noremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")
noremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")
noremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")
noremap <buffer> <silent> \+m :call C_CodeMethod()
noremap <buffer> <silent> \ns :call C_ProtoShow()
noremap <buffer> <silent> \nc :call C_ProtoClear()
noremap <buffer> <silent> \ni :call C_ProtoInsert()
vnoremap <buffer> <silent> \np :call C_ProtoPick("v")
onoremap <buffer> <silent> \np :call C_ProtoPick("n")
noremap <buffer> <silent> \ne :call C_CodeSnippet("e")
vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")
onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
noremap <buffer> <silent> \nr :call C_CodeSnippet("r")
noremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
noremap <buffer> <silent> \ii :call C_CodeFopen("input")jf"a
vnoremap <buffer> <silent> \ias sassert();F(p
nnoremap <buffer> <silent> \ias oassert();<Left><Left>
vnoremap <buffer> <silent> \isi ssizeof()P
onoremap <buffer> <silent> \isi isizeof()<Left>
noremap <buffer> <silent> \ima :call C_CodeMalloc("m")i
noremap <buffer> <silent> \ica :call C_CodeMalloc("c")i
noremap <buffer> <silent> \isc oscanf("", & );F"i
noremap <buffer> <silent> \ip oprintf("\n");2F"a
noremap <buffer> <silent> \iu :call C_EST("union")o
noremap <buffer> <silent> \is :call C_EST("struct")o
noremap <buffer> <silent> \ie :call C_EST("enum")o
vnoremap <buffer> <silent> \in :call C_CodeFor("down", "v")<NL>onoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
onoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
vnoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "v")<NL>onoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
onoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
vnoremap <buffer> <silent> \im :call C_CodeMain("v")<NL>onoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
onoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
vnoremap <buffer> <silent> \isf :call C_CodeFunction("sv")w
onoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
vnoremap <buffer> <silent> \if :call C_CodeFunction("v")<NL>onoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()<NL>vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")<NL>vnoremap <buffer> <silent> \pind :call C_PPifndef (         "v" )<NL>vnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","v+")<NL>vnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"v+")<NL>vnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"v+")<NL>onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
onoremap <buffer> <silent> \if :call C_CodeFunction("a")
noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")
vnoremap <buffer> <silent> \pind :call C_PPifndef (         "v" )
vnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","v+")
vnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"v+")
vnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"v+")
onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
onoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
onoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")<NL>onoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")<NL>onoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")<NL>noremap <buffer> <silent> \pu :call C_PPUndef()f	a
onoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")
onoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")
noremap <buffer> <silent> \pu :call C_PPUndef()f	a
noremap <buffer> <silent> \pd :call C_PPDefine()f	a
noremap <buffer> <silent> \p" o#include	""<Left>
noremap <buffer> <silent> \p< o#include	<><Left>
vnoremap <buffer> <silent> \s{ :call C_Block("v")<NL>onoremap <buffer> <silent> \s{ :call C_Block("a")o
onoremap <buffer> <silent> \s{ :call C_Block("a")o
vnoremap <buffer> <silent> \sc :call C_CodeCaseVisual()
onoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
vnoremap <buffer> <silent> \ss :call C_CodeSwitchVisual()f(la
onoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
vnoremap <buffer> <silent> \swh :call C_StatBlock("v","while (  )")f(la
onoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
vnoremap <buffer> <silent> \sw :call C_Stat("v","while (  )")f(la
onoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
vnoremap <buffer> <silent> \sife :call C_IfBlockElse("v")f(la
onoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
vnoremap <buffer> <silent> \sie :call C_IfElse("v")f(la
onoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
vnoremap <buffer> <silent> \sif :call C_StatBlock("v","if (  )")f(la
onoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
vnoremap <buffer> <silent> \si :call C_Stat("v","if (  )")f(la
onoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
vnoremap <buffer> <silent> \sfo :call C_StatBlock("v","for ( ; ; )")f;i
onoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
vnoremap <buffer> <silent> \sf :call C_Stat("v","for ( ; ; )")f;i
onoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
vnoremap <buffer> <silent> \sd :call C_DoWhile("v")f(la
onoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
noremap <buffer> <silent> \cy :call C_Toggle_C_Cpp()<NL>noremap <buffer> <silent> \ct a=strftime("%x %X %Z")<NL>noremap <buffer> <silent> \cd a=strftime("%x")<NL>noremap <buffer> <silent> \ccl :call C_CommentTemplates("class")<NL>noremap <buffer> <silent> \cme :call C_CommentTemplates("method")<NL>noremap <buffer> <silent> \cfu :call C_CommentTemplates("function")<NL>noremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")<NL>vnoremap <buffer> <silent> \co :call C_CommentCode("v"):nohlsearch<NL>onoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch<NL>vnoremap <buffer> <silent> \c\ :call C_CodeComment("v","no"):nohlsearchj
noremap <buffer> <silent> \ct a=strftime("%x %X %Z")
noremap <buffer> <silent> \cd a=strftime("%x")
noremap <buffer> <silent> \ccl :call C_CommentTemplates("class")
noremap <buffer> <silent> \cme :call C_CommentTemplates("method")
noremap <buffer> <silent> \cfu :call C_CommentTemplates("function")
noremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")
vnoremap <buffer> <silent> \co :call C_CommentCode("v"):nohlsearch
onoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch
vnoremap <buffer> <silent> \c\ :call C_CodeComment("v","no"):nohlsearchj
nnoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
vnoremap <buffer> <silent> \c* :call C_CodeComment("v","yes"):nohlsearchj
onoremap <buffer> <silent> \c* :call C_CodeComment("a","yes"):nohlsearchj
vnoremap <buffer> <silent> \ci :call C_CodeComment("v","yes"):nohlsearch<NL>onoremap <buffer> <silent> \ci o/*/kA 
onoremap <buffer> <silent> \ci o/*/kA 
noremap <buffer> <silent> \cs :call C_GetLineEndCommCol()<NL>vnoremap <buffer> <silent> \cn :call C_MultiLineEndComments("// ")A
vnoremap <buffer> <silent> \cn :call C_MultiLineEndComments("// ")A
onoremap <buffer> <silent> \cn :call C_LineEndComment("// ")A
vnoremap <buffer> <silent> \cl :call C_MultiLineEndComments()a
onoremap <buffer> <silent> \cl :call C_LineEndComment()a
vnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("v")<NL>onoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")<NL>map <buffer> <silent> <S-F9> :call C_Arguments()<NL>map <buffer> <silent> <C-F9> :call C_Run()<NL>map <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()<NL>map <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()<NL>inoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>inoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")
map <buffer> <silent> <S-F9> :call C_Arguments()
map <buffer> <silent> <C-F9> :call C_Run()
map <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()
map <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()
inoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
inoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
inoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
inoremap <buffer> <silent> \+tf :call C_CodeTemplateFunct()<NL>inoremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")<NL>inoremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")<NL>inoremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")<NL>inoremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")<NL>inoremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")<NL>inoremap <buffer> <silent> \+m :call C_CodeMethod()<NL>inoremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
inoremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")
inoremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")
inoremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")
inoremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")
inoremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")
inoremap <buffer> <silent> \+m :call C_CodeMethod()
inoremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
inoremap <buffer> <silent> \ii :call C_CodeFopen("input")jf"a
inoremap <buffer> <silent> \ias assert();<Left><Left>
inoremap <buffer> <silent> \isi sizeof()<Left>
inoremap <buffer> <silent> \ima :call C_CodeMalloc("m")i
inoremap <buffer> <silent> \ica :call C_CodeMalloc("c")i
inoremap <buffer> <silent> \isc scanf("", & );F"i
inoremap <buffer> <silent> \ip printf("\n");2F"a
inoremap <buffer> <silent> \iu :call C_EST("union")o
inoremap <buffer> <silent> \is :call C_EST("struct")o
inoremap <buffer> <silent> \ie :call C_EST("enum")o
inoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
inoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
inoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
inoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
inoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
inoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
inoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")A
inoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")A
inoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")A
inoremap <buffer> <silent> \pu :call C_PPUndef()f	a
inoremap <buffer> <silent> \pd :call C_PPDefine()f	a
inoremap <buffer> <silent> \p" o#include	""<Left>
inoremap <buffer> <silent> \p< o#include	<><Left>
inoremap <buffer> <silent> \s{ :call C_Block("a")o
inoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
inoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
inoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
inoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
inoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
inoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
inoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
inoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
inoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
inoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
inoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
inoremap <buffer> <silent> \ct =strftime("%x %X %Z")<NL>inoremap <buffer> <silent> \cd =strftime("%x")<NL>inoremap <buffer> <silent> \ccl :call C_CommentTemplates("class")<NL>inoremap <buffer> <silent> \cme :call C_CommentTemplates("method")<NL>inoremap <buffer> <silent> \cfu :call C_CommentTemplates("function")<NL>inoremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")<NL>inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")a
inoremap <buffer> <silent> \cd =strftime("%x")
inoremap <buffer> <silent> \ccl :call C_CommentTemplates("class")
inoremap <buffer> <silent> \cme :call C_CommentTemplates("method")
inoremap <buffer> <silent> \cfu :call C_CommentTemplates("function")
inoremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")
inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")a
inoremap <buffer> <silent> \cl :call C_LineEndComment()a
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=~/.vim/c-support/wordlists/c-c++-keywords.list,~/.vim/c-support/wordlists/k+r.list,~/.vim/c-support/wordlists/stl_index.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'c'
setlocal filetype=c
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
setlocal syntax=c
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 24 - ((14 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
24
normal! 0
tabedit test/Makefile
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=sO:#\ -,mO:#\ \ ,b:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'make'
setlocal filetype=make
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=^\\s*include
setlocal includeexpr=
setlocal indentexpr=GetMakeIndent()
setlocal indentkeys=!^F,o,O,<:>,=else,=endif
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'make'
setlocal syntax=make
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 11 - ((10 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
11
normal! 043l
tabedit test/test.c
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <silent> <S-F9> :call C_Arguments()<NL>imap <buffer> <silent> <C-F9> :call C_Run()<NL>imap <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()<NL>imap <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()<NL>nmap <buffer> <silent> \rh :call C_Hardcopy("n")<NL>nmap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()<NL>nnoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>nnoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
imap <buffer> <silent> <C-F9> :call C_Run()
imap <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()
imap <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()
nnoremap <buffer> <silent> \s{ :call C_Block("a")o
nnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")
nnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")
nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
nnoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
nmap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()
nmap <buffer> <silent> \rh :call C_Hardcopy("n")
nnoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
nnoremap <buffer> <silent> \np :call C_ProtoPick("n")<NL>nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")<NL>nnoremap <buffer> <silent> \ias oassert();<Left><Left>
nnoremap <buffer> <silent> \isi isizeof()<Left>
nnoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
nnoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
nnoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
nnoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
nnoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
nnoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
nnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")<NL>nnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")<NL>nnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")<NL>nnoremap <buffer> <silent> \s{ :call C_Block("a")o
nnoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
nnoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
nnoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
nnoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
nnoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
nnoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
nnoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
nnoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
nnoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
nnoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
nnoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
nnoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch<NL>nnoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
nnoremap <buffer> <silent> \c* :call C_CodeComment("a","yes"):nohlsearchj
nnoremap <buffer> <silent> \ci o/*/kA 
nnoremap <buffer> <silent> \cn :call C_LineEndComment("// ")A
nnoremap <buffer> <silent> \cl :call C_LineEndComment()a
nnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")<NL>map <buffer> <silent> \h :call C_HelpCsupport()<NL>map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()<NL>map <buffer> <silent> \rx :call C_XtermSize()<NL>map <buffer> <silent> \rs :call C_Settings()<NL>vmap <buffer> <silent> \rh :call C_Hardcopy("v")<NL>omap <buffer> <silent> \rh :call C_Hardcopy("n")<NL>vmap <buffer> <silent> \rd :call C_Indent("v"):redraw:call C_HlMessage()<NL>omap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()<NL>map <buffer> <silent> \ri :call C_SplintArguments()<NL>map <buffer> <silent> \rp :call C_SplintCheck():redraw:call C_HlMessage()<NL>map <buffer> <silent> \rg :call C_MakeArguments()<NL>map <buffer> <silent> \rm :call C_Make()<NL>map <buffer> <silent> \ra :call C_Arguments()<NL>map <buffer> <silent> \rr :call C_Run()<NL>map <buffer> <silent> \rl :call C_Link():redraw:call C_HlMessage()<NL>map <buffer> <silent> \rc :call C_Compile():redraw:call C_HlMessage()<NL>vnoremap <buffer> <silent> \+c. :call C_CodeCatch("v","...")<NL>onoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>vnoremap <buffer> <silent> \+ca :call C_CodeCatch("v"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \ias oassert();<Left><Left>
onoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
map <buffer> <silent> \h :call C_HelpCsupport()
map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call C_XtermSize()
map <buffer> <silent> \rs :call C_Settings()
vmap <buffer> <silent> \rh :call C_Hardcopy("v")
omap <buffer> <silent> \rh :call C_Hardcopy("n")
vmap <buffer> <silent> \rd :call C_Indent("v"):redraw:call C_HlMessage()
omap <buffer> <silent> \rd :call C_Indent("a"):redraw:call C_HlMessage()
map <buffer> <silent> \ri :call C_SplintArguments()
map <buffer> <silent> \rp :call C_SplintCheck():redraw:call C_HlMessage()
map <buffer> <silent> \rg :call C_MakeArguments()
map <buffer> <silent> \rm :call C_Make()
map <buffer> <silent> \ra :call C_Arguments()
map <buffer> <silent> \rr :call C_Run()
map <buffer> <silent> \rl :call C_Link():redraw:call C_HlMessage()
map <buffer> <silent> \rc :call C_Compile():redraw:call C_HlMessage()
vnoremap <buffer> <silent> \+c. :call C_CodeCatch("v","...")
onoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
vnoremap <buffer> <silent> \+ca :call C_CodeCatch("v"," const &ExceptObj ")f(fci
nnoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
vnoremap <buffer> <silent> \+tr :call C_CodeTryCatch("v")f(fci
onoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
noremap <buffer> <silent> \+tf :call C_CodeTemplateFunct()<NL>noremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")<NL>noremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")<NL>noremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")<NL>noremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")<NL>noremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")<NL>noremap <buffer> <silent> \+m :call C_CodeMethod()<NL>noremap <buffer> <silent> \ns :call C_ProtoShow()<NL>noremap <buffer> <silent> \nc :call C_ProtoClear()<NL>noremap <buffer> <silent> \ni :call C_ProtoInsert()<NL>vnoremap <buffer> <silent> \np :call C_ProtoPick("v")<NL>onoremap <buffer> <silent> \np :call C_ProtoPick("n")<NL>noremap <buffer> <silent> \ne :call C_CodeSnippet("e")<NL>vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")<NL>onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")<NL>noremap <buffer> <silent> \nr :call C_CodeSnippet("r")<NL>noremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
noremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")
noremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")
noremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")
noremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")
noremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")
noremap <buffer> <silent> \+m :call C_CodeMethod()
noremap <buffer> <silent> \ns :call C_ProtoShow()
noremap <buffer> <silent> \nc :call C_ProtoClear()
noremap <buffer> <silent> \ni :call C_ProtoInsert()
vnoremap <buffer> <silent> \np :call C_ProtoPick("v")
onoremap <buffer> <silent> \np :call C_ProtoPick("n")
noremap <buffer> <silent> \ne :call C_CodeSnippet("e")
vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")
onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
noremap <buffer> <silent> \nr :call C_CodeSnippet("r")
noremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
noremap <buffer> <silent> \ii :call C_CodeFopen("input")jf"a
vnoremap <buffer> <silent> \ias sassert();F(p
nnoremap <buffer> <silent> \ias oassert();<Left><Left>
vnoremap <buffer> <silent> \isi ssizeof()P
onoremap <buffer> <silent> \isi isizeof()<Left>
noremap <buffer> <silent> \ima :call C_CodeMalloc("m")i
noremap <buffer> <silent> \ica :call C_CodeMalloc("c")i
noremap <buffer> <silent> \isc oscanf("", & );F"i
noremap <buffer> <silent> \ip oprintf("\n");2F"a
noremap <buffer> <silent> \iu :call C_EST("union")o
noremap <buffer> <silent> \is :call C_EST("struct")o
noremap <buffer> <silent> \ie :call C_EST("enum")o
vnoremap <buffer> <silent> \in :call C_CodeFor("down", "v")<NL>onoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
onoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
vnoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "v")<NL>onoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
onoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
vnoremap <buffer> <silent> \im :call C_CodeMain("v")<NL>onoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
onoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
vnoremap <buffer> <silent> \isf :call C_CodeFunction("sv")w
onoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
vnoremap <buffer> <silent> \if :call C_CodeFunction("v")<NL>onoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()<NL>vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")<NL>vnoremap <buffer> <silent> \pind :call C_PPifndef (         "v" )<NL>vnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","v+")<NL>vnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"v+")<NL>vnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"v+")<NL>onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
onoremap <buffer> <silent> \if :call C_CodeFunction("a")
noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")
vnoremap <buffer> <silent> \pind :call C_PPifndef (         "v" )
vnoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","v+")
vnoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"v+")
vnoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"v+")
onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
onoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
onoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")<NL>onoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")<NL>onoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")<NL>noremap <buffer> <silent> \pu :call C_PPUndef()f	a
onoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")
onoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")
noremap <buffer> <silent> \pu :call C_PPUndef()f	a
noremap <buffer> <silent> \pd :call C_PPDefine()f	a
noremap <buffer> <silent> \p" o#include	""<Left>
noremap <buffer> <silent> \p< o#include	<><Left>
vnoremap <buffer> <silent> \s{ :call C_Block("v")<NL>onoremap <buffer> <silent> \s{ :call C_Block("a")o
onoremap <buffer> <silent> \s{ :call C_Block("a")o
vnoremap <buffer> <silent> \sc :call C_CodeCaseVisual()
onoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
vnoremap <buffer> <silent> \ss :call C_CodeSwitchVisual()f(la
onoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
vnoremap <buffer> <silent> \swh :call C_StatBlock("v","while (  )")f(la
onoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
vnoremap <buffer> <silent> \sw :call C_Stat("v","while (  )")f(la
onoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
vnoremap <buffer> <silent> \sife :call C_IfBlockElse("v")f(la
onoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
vnoremap <buffer> <silent> \sie :call C_IfElse("v")f(la
onoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
vnoremap <buffer> <silent> \sif :call C_StatBlock("v","if (  )")f(la
onoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
vnoremap <buffer> <silent> \si :call C_Stat("v","if (  )")f(la
onoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
vnoremap <buffer> <silent> \sfo :call C_StatBlock("v","for ( ; ; )")f;i
onoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
vnoremap <buffer> <silent> \sf :call C_Stat("v","for ( ; ; )")f;i
onoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
vnoremap <buffer> <silent> \sd :call C_DoWhile("v")f(la
onoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
noremap <buffer> <silent> \cy :call C_Toggle_C_Cpp()<NL>noremap <buffer> <silent> \ct a=strftime("%x %X %Z")<NL>noremap <buffer> <silent> \cd a=strftime("%x")<NL>noremap <buffer> <silent> \ccl :call C_CommentTemplates("class")<NL>noremap <buffer> <silent> \cme :call C_CommentTemplates("method")<NL>noremap <buffer> <silent> \cfu :call C_CommentTemplates("function")<NL>noremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")<NL>vnoremap <buffer> <silent> \co :call C_CommentCode("v"):nohlsearch<NL>onoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch<NL>vnoremap <buffer> <silent> \c\ :call C_CodeComment("v","no"):nohlsearchj
noremap <buffer> <silent> \ct a=strftime("%x %X %Z")
noremap <buffer> <silent> \cd a=strftime("%x")
noremap <buffer> <silent> \ccl :call C_CommentTemplates("class")
noremap <buffer> <silent> \cme :call C_CommentTemplates("method")
noremap <buffer> <silent> \cfu :call C_CommentTemplates("function")
noremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")
vnoremap <buffer> <silent> \co :call C_CommentCode("v"):nohlsearch
onoremap <buffer> <silent> \co :call C_CommentCode("a"):nohlsearch
vnoremap <buffer> <silent> \c\ :call C_CodeComment("v","no"):nohlsearchj
nnoremap <buffer> <silent> \c\ :call C_CodeComment("a","no"):nohlsearchj
vnoremap <buffer> <silent> \c* :call C_CodeComment("v","yes"):nohlsearchj
onoremap <buffer> <silent> \c* :call C_CodeComment("a","yes"):nohlsearchj
vnoremap <buffer> <silent> \ci :call C_CodeComment("v","yes"):nohlsearch<NL>onoremap <buffer> <silent> \ci o/*/kA 
onoremap <buffer> <silent> \ci o/*/kA 
noremap <buffer> <silent> \cs :call C_GetLineEndCommCol()<NL>vnoremap <buffer> <silent> \cn :call C_MultiLineEndComments("// ")A
vnoremap <buffer> <silent> \cn :call C_MultiLineEndComments("// ")A
onoremap <buffer> <silent> \cn :call C_LineEndComment("// ")A
vnoremap <buffer> <silent> \cl :call C_MultiLineEndComments()a
onoremap <buffer> <silent> \cl :call C_LineEndComment()a
vnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("v")<NL>onoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")<NL>map <buffer> <silent> <S-F9> :call C_Arguments()<NL>map <buffer> <silent> <C-F9> :call C_Run()<NL>map <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()<NL>map <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()<NL>inoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")<NL>inoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
onoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")
map <buffer> <silent> <S-F9> :call C_Arguments()
map <buffer> <silent> <C-F9> :call C_Run()
map <buffer> <silent> <F9> :call C_Link():redraw:call C_HlMessage()
map <buffer> <silent> <M-F9> :call C_Compile():redraw:call C_HlMessage()
inoremap <buffer> <silent> \+c. :call C_CodeCatch("a","...")
inoremap <buffer> <silent> \+ca :call C_CodeCatch("a"," const &ExceptObj ")f(fci
inoremap <buffer> <silent> \+tr :call C_CodeTryCatch("a")o
inoremap <buffer> <silent> \+tf :call C_CodeTemplateFunct()<NL>inoremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")<NL>inoremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")<NL>inoremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")<NL>inoremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")<NL>inoremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")<NL>inoremap <buffer> <silent> \+m :call C_CodeMethod()<NL>inoremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
inoremap <buffer> <silent> \+tn :call C_CommentTemplates("CppTemplateClassUsingNew")
inoremap <buffer> <silent> \+t :call C_CommentTemplates("CppTemplateClass")
inoremap <buffer> <silent> \+ec :call C_CommentTemplates("CppErrorClass")
inoremap <buffer> <silent> \+cn :call C_CommentTemplates("CppClassUsingNew")
inoremap <buffer> <silent> \+c :call C_CommentTemplates("CppClass")
inoremap <buffer> <silent> \+m :call C_CodeMethod()
inoremap <buffer> <silent> \io :call C_CodeFopen("output")jf"a
inoremap <buffer> <silent> \ii :call C_CodeFopen("input")jf"a
inoremap <buffer> <silent> \ias assert();<Left><Left>
inoremap <buffer> <silent> \isi sizeof()<Left>
inoremap <buffer> <silent> \ima :call C_CodeMalloc("m")i
inoremap <buffer> <silent> \ica :call C_CodeMalloc("c")i
inoremap <buffer> <silent> \isc scanf("", & );F"i
inoremap <buffer> <silent> \ip printf("\n");2F"a
inoremap <buffer> <silent> \iu :call C_EST("union")o
inoremap <buffer> <silent> \is :call C_EST("struct")o
inoremap <buffer> <silent> \ie :call C_EST("enum")o
inoremap <buffer> <silent> \in :call C_CodeFor("down", "a")a
inoremap <buffer> <silent> \i0 :call C_CodeFor("up"  , "a")a
inoremap <buffer> <silent> \im :call C_CodeMain("a")3jA
inoremap <buffer> <silent> \isf :call C_CodeFunction("sa")w
inoremap <buffer> <silent> \if :call C_CodeFunction("a")<NL>inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")2ji
inoremap <buffer> <silent> \pind :call C_PPifndef (         "a" )2ji
inoremap <buffer> <silent> \pin :call C_PPIfElse("ifndef","a+")A
inoremap <buffer> <silent> \pid :call C_PPIfElse("ifdef" ,"a+")A
inoremap <buffer> <silent> \pie :call C_PPIfElse("if"    ,"a+")A
inoremap <buffer> <silent> \pu :call C_PPUndef()f	a
inoremap <buffer> <silent> \pd :call C_PPDefine()f	a
inoremap <buffer> <silent> \p" o#include	""<Left>
inoremap <buffer> <silent> \p< o#include	<><Left>
inoremap <buffer> <silent> \s{ :call C_Block("a")o
inoremap <buffer> <silent> \sc ocase 0:	break;2kf0s
inoremap <buffer> <silent> \ss :call C_CodeSwitch()f(la
inoremap <buffer> <silent> \swh :call C_StatBlock("a","while (  )")f(la
inoremap <buffer> <silent> \sw :call C_Stat("a","while (  )")f(la
inoremap <buffer> <silent> \sife :call C_IfBlockElse("a")f(la
inoremap <buffer> <silent> \sie :call C_IfElse("a")f(la
inoremap <buffer> <silent> \sif :call C_StatBlock("a","if (  )")f(la
inoremap <buffer> <silent> \si :call C_Stat("a","if (  )")f(la
inoremap <buffer> <silent> \sfo :call C_StatBlock("a","for ( ; ; )")f;i
inoremap <buffer> <silent> \sf :call C_Stat("a","for ( ; ; )")f;i
inoremap <buffer> <silent> \sd :call C_DoWhile("a")f(la
inoremap <buffer> <silent> \ct =strftime("%x %X %Z")<NL>inoremap <buffer> <silent> \cd =strftime("%x")<NL>inoremap <buffer> <silent> \ccl :call C_CommentTemplates("class")<NL>inoremap <buffer> <silent> \cme :call C_CommentTemplates("method")<NL>inoremap <buffer> <silent> \cfu :call C_CommentTemplates("function")<NL>inoremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")<NL>inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")a
inoremap <buffer> <silent> \cd =strftime("%x")
inoremap <buffer> <silent> \ccl :call C_CommentTemplates("class")
inoremap <buffer> <silent> \cme :call C_CommentTemplates("method")
inoremap <buffer> <silent> \cfu :call C_CommentTemplates("function")
inoremap <buffer> <silent> \cfr :call C_CommentTemplates("frame")
inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm("a")a
inoremap <buffer> <silent> \cl :call C_LineEndComment()a
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=~/.vim/c-support/wordlists/c-c++-keywords.list,~/.vim/c-support/wordlists/k+r.list,~/.vim/c-support/wordlists/stl_index.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'c'
setlocal filetype=c
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
setlocal syntax=c
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 154 - ((31 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
154
normal! 0
tabedit Makefile
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=sO:#\ -,mO:#\ \ ,b:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'make'
setlocal filetype=make
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=^\\s*include
setlocal includeexpr=
setlocal indentexpr=GetMakeIndent()
setlocal indentkeys=!^F,o,O,<:>,=else,=endif
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'make'
setlocal syntax=make
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 8 - ((7 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
8
normal! 0
tabedit src/Makefile
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=sO:#\ -,mO:#\ \ ,b:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'make'
setlocal filetype=make
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=^\\s*include
setlocal includeexpr=
setlocal indentexpr=GetMakeIndent()
setlocal indentkeys=!^F,o,O,<:>,=else,=endif
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'make'
setlocal syntax=make
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 25 - ((24 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
25
normal! 0
tabedit README
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != ''
setlocal filetype=
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit AUTHOR
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != ''
setlocal filetype=
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit TODO
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != ''
setlocal filetype=
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabnext 6
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . s:sx
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
