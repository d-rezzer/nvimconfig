set nocompatible
filetype off

" Colors {{{
"syntax enable       "enable syntax processing 
" colorscheme dracula 
colorscheme nord

" }}}
" MISC {{{
set noswapfile "I dnt need no steenking swap file. 
set path+=**

set ignorecase
set relativenumber
set shortmess+=c    "don't give |ins-completion-menu| mesages

" }}}
" Spaces And Tabs {{{
set expandtab       "convert tabs to spaces.
set shiftwidth=4    "indent level
set tabstop=4       "4 space tabs
" }}}
" UI Layout {{{ 

set number
set showcmd
set cursorline  "highlights the current cursor line 
set lazyredraw    
set showmatch

" }}}
" GTK Gui {{{ 

    if exists('g:GtkGuiLoaded')
"        augroup muhfont
"            autocmd!
"            autocmd  FileType rust call rpcnotify(1, 'Gui', 'Font', 'Fira Code 11')
"            
"        augroup END
  endif



" }}}
" Editor SEttings {{{
filetype plugin indent on
set encoding=utf-8
set scrolloff=3
" set noshowmode
" required for operations modifying multiple buffers like rename.
set hidden
"====================================================
"Sane Splits
"====================================================
set splitright
set splitbelow
"auto indent
"set invlist
" }}}

" Take me to your leader {{{
set undodir=$VIMDATA
let mapleader="\<Space>"
let maplocalleader=","
" }}}
" Searching {{{
set ignorecase
set incsearch
set hlsearch

" }}}
" Folding {{{
set foldmethod=marker
set foldlevel=0
set modelines=1

" }}}
" Undoing {{{
"turn on persistent undo and save to my special place.{
set undofile
"don't do undo for any temp files.
augroup vimrc
        autocmd!
        autocmd BufWritePre /tmp/* setlocal noundofile
augroup END
" }}}
" Plugins {{{
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('dracula/vim')
call minpac#add('arcticicestudio/nord-vim')
call minpac#add('rafi/awesome-vim-colorschemes')
" The popester.
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-scriptease')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-obsession')

" Fuzzy finder
call minpac#add('airblade/vim-rooter')
call minpac#add('junegunn/fzf',{ 'dir': '~/.fzf', 'do': './install --all'})
call minpac#add('junegunn/fzf.vim')
call minpac#add('junegunn/vader.vim')

call minpac#add('d-rezzer/vim-hi')
"call minpac#add('d-rezzer/nvim-telearena')

call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('scrooloose/nerdtree')
call minpac#add('godlygeek/tabular')
call minpac#add('plasticboy/vim-markdown')
call minpac#add('easymotion/vim-easymotion')

call minpac#add('rust-lang/rust.vim') "Rust
call minpac#add('mattn/webapi-vim')  "Web Api

call minpac#add('neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'})
"call minpac#add('neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'})
"call minpac#add('HerringtonDarkholme/yats.vim') "Typescript
call minpac#add('leafgarland/typescript-vim')

"Terminal

call minpac#add('kassio/neoterm')

" GUI enhancements
call minpac#add('machakann/vim-highlightedyank')  "highlights muh yanks!


set completeopt=noinsert,menuone,noselect

" }}}


command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

"open this config file with a lil command. 
" My commands {{{
command! EditCfg exe 'edit' stdpath('config').'/init.vim'
command! EditCT exe 'tabedit' stdpath('config').'/init.vim'

command! EditBsh exe 'edit' '~/.bashrc'
command! EditZsh exe 'edit' '~/.zshrc'
" }}}

" Teminal config {{{

if has('nvim') " I can haz nvim? 

        tnoremap <Esc> <C-\><C-n>
        tnoremap <C-v><Esc> <Esc>

        " switch to normal mode
        tnoremap jk  <C-\><C-n> 

        "when we switch to normal mode in terminal
        "show a cursor marker indicating where we were in terminal mode
        highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15

        "map keys for moving focus between open vim windows
        tnoremap <M-h> <c-\><c-n><c-w>h
        tnoremap <M-j> <c-\><c-n><c-w>j
        tnoremap <M-k> <c-\><c-n><c-w>k
        tnoremap <M-l> <c-\><c-n><c-w>l
        tnoremap <C-q> :q<CR>


endif

augroup TBone
        autocmd!
        "when we switch to a terminal window, put us in terminal mode.
        autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif 

augroup end
" }}}

" My Normal Remaps {{{
" Open hotkeys 
"open vimrc in a new tab
nnoremap <leader>cvt :EditCT<CR>
"open vimrc in a new vertical window
nnoremap <leader>cvv :vsplit $MYVIMRC<cr>
"open vimrc in a horizontal window
nnoremap <leader>cvs :split $MYVIMRC<cr>
"source the vimrc file to reload changes
nnoremap <leader>csv :w<cr> :source $MYVIMRC<cr>
"edit bashrc file
noremap <leader>cb :EditBsh<CR>
"edit zshrc file
nnoremap <leader>cz :EditZsh<CR>
"go to next tab
nnoremap <leader>tt gt
"go to previous tab
nnoremap <leader>tr gT
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
"equalize the width of open windows
nnoremap <leader>w= <C-w>=
nnoremap <leader>w- <C-w>-
nnoremap  <leader>zz Lzz
nnoremap  <leader>zx Lzt

"next Buffer 
nnoremap [b :bn<cr>
"previous Buffer 
nnoremap ]b :bp<cr>
"next tab
nnoremap [t gt
"previous tab
nnoremap ]t gT
"toggle fold
nnoremap ,f za

" open vertical split window
nnoremap <leader>vv :vsplit<cr>
" open horizontal split window
nnoremap <leader>vs :split<cr>
" close active window
nnoremap <leader>vc :q!<cr>

"Quick Save
nnoremap <leader>w :w<CR>
" toggle the Nerd tree file explorer.
nmap <silent> <leader>n :NERDTreeToggle<CR>
"remove highlight from search by hitting enter
nnoremap <CR> :noh<CR><CR>

"Fuzzy find
nnoremap <silent> <leader>b :Buffers<CR>
"open fzf from working directory
nnoremap <leader>f :<C-u>FZF<CR>
"open fzf from home directory
nnoremap <leader><leader>f :<C-u>FZF ~<CR>

"motion
"goto end of line
nnoremap <leader>e <S-$>
"goto begginning of line
nnoremap <leader>a <S-^>

"COC maps
nnoremap <leader>dd <Plug>(coc-definition)
nnoremap <leader>dr <Plug>(coc-references)
nnoremap <leader>dj <Plug>(coc-implementation)


"====================================================
" switching between terminal buffer and another pane.
"====================================================
nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l

nnoremap <localleader>rr :w<cr> :Crun<cr>
nnoremap <localleader>rb :Cbuild<cr>
nnoremap <localleader>rt :Ctest<cr>
nnoremap <localleader>rd :Cdoc<cr>
nnoremap <localleader>rc :Cclean<cr>
nnoremap <localleader>ri :Cinit<cr>
nnoremap <localleader>ru :Cupdate<cr>


"highlight last inserted text
nnoremap gV `[v`] 

" ======================================================
" surround a word
" ======================================================
"surround word with a character. 
"1. press the leader + {char} tp trigger:
"2. viw : enter visual mode, select the word text object
"3. <esc> : go back to normal mode.
"4. a : go to insert mode after the current character under the cursor. 
"5. {char} enter a character
"6. <esc> go to normal mode
"7. bi :  go to beggining of  word and go to insert mode
"8. {char} enter a character
"9. <esc>lel go to normal mode, move cursor 1 char right, go to end of word
" ======================================================
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader><leader>" viW<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader><leader>' viW<esc>a'<esc>bi'<esc>lel

nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>bi{<esc>lel
nnoremap <leader>< viw<esc>a><esc>bi<<esc>lel
nnoremap <localleader>tn  :tabnew<cr>
nnoremap <localleader>tc  :tabclose<cr>

"resize window
nnoremap <silent><localleader><localleader>w  :resize -10<cr>
nnoremap <silent><localleader><localleader>s  :resize +10<cr>
nnoremap <silent><localleader><localleader>a  :vertical resize -10<cr>
nnoremap <silent><localleader><localleader>d  :vertical resize +10<cr>

"clear the entire buffer
nnoremap <leader>da ggdG


nnoremap <silent> <leader>rf :TREPLSendFile<cr>
nnoremap <silent> <leader>rl :TREPLSendLine<cr>
nnoremap <silent>  <leader>rs :TREPLSendSelection<cr>

" }}}

" My Insert Remaps {{{
" easy brace
inoremap <A-[> {}<Esc>i  
inoremap <A-]> []<Esc>i
inoremap <A-\> ()<Esc>i
inoremap ;mm ()<Esc>i
"=================================================
"go to normal mode 
inoremap jk <esc>
"supress using esc button to go to normal mode
inoremap <esc> <nop>
" }}}
" insert mode remaps {{{         
"====================================================
"emacs residual insert movement keys..
"====================================================
inoremap <C-n> <Esc>ji
inoremap <C-p> <Esc>ki
inoremap <C-l> <Esc><S-l>zzi
" }}}

augroup filetype_typescript
        autocmd!
        autocmd VimEnter,BufRead,BufNewFile *.ts set filetype=typescript
        autocmd VimEnter,BufRead,BufNewFile *.tsx set filetype=typescript
augroup END


" Rust settings {{{
augroup filetype_rust
        autocmd!
        autocmd FileType rust nnoremap <buffer> <localleader>c I//<esc>
        autocmd FileType rust nnoremap <buffer> <localleader>pp :RustPlay<cr>
        autocmd FileType rust nnoremap ,,d i#[derive()]<Esc>hi
        autocmd FileType rust inoremap ;l println!("{}",);<esc>hi
        autocmd FileType rust inoremap ;db #[derive(Debug)]
        autocmd FileType rust inoremap ;;t #[cfg(test)]
        autocmd FileType rust inoremap ;t #[test]<esc><cr><S-o>
        autocmd FileType rust inoremap ;v vec![]<esc>li
        autocmd FileType rust inoremap ;w .unwrap();
        "replace a {} in quotes with "{:?}" 
        autocmd FileType rust inoremap ;dq <esc><S-^>ci"{:?}  

        autocmd FileType rust inoremap ;kk () { }<esc>ho<esc>o<esc>o<esc>kka
        autocmd FileType rust inoremap ;sf String::From("")<esc>hi

augroup END

inoremap /. <Cmd>:call Snakecase()<cr>

function! Snakecase()
    let line = split(getline('.'), ' ')
    if line[-1] != "="
        call add(line,"=")        
    endif

    let subln = line[0] . ' ' . join(line[1:-2], '_') . ' ' . line[-1]
    call setline('.', subln)
    execute "normal! magg`a$" 
    
endfunction

command! SnakeIt call Snakecase()



let g:rustc_path = "/home/d-rezzer/.cargo/bin/rustc"

let g:rustfmt_autosave = 1  "format rust file whenever it is saved

" }}}

if executable('rg') "use ripgrep (rg) instead of regular grep.

        set grepprg=rg\ --no-heading\ --vimgrep
        set grepformat=%f:%1:%c:%m
endif

" test bitss and bobs {{{
"surround in double quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
noremap <leader>tn :call <SID>ToggleNumber()<CR>

function! Runterm() 
        let fileToRun =  expand("%:p") 
        
endfunction





"toggle between showing line number and relative line numbers
function! <SID>ToggleNumber() 
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" }}}

" iabbrev {{{
iabbrev @@ ryanlmartin@gmail.com
" }}}
"vim:foldmethod=marker:foldlevel=0

":echo b:terminal_job_id

"Teleareana quick bits

tnoremap ;h he

function! CheckHealth()
    call jobsend(32, "he\<cr>")
endfunction






