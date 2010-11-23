"-------------------------
" Базовые настройки
"-------------------------

" история команд
set history=50

" Не делать бекап файлов
set nobackup

" Включаем несовместимость настроек с Vi (ибо Vi нам и не понадобится).
set nocompatible

" Показывать положение курсора всё время.
set ruler  

" Показывать незавершённые команды в статусбаре
set showcmd  

" Включаем нумерацию строк
set nu

" Фолдинг по отсупам
"set foldmethod=indent

" Поиск по набору текста (очень полезная функция)
set incsearch

" Отключаем подстветку найденных вариантов, и так всё видно.
set nohlsearch

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы подняться
" в режиме редактирования
set scrolljump=7

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы
" опуститься в режиме редактирования
set scrolloff=7

" Выключаем надоедливый "звонок"
set novisualbell
set t_vb=   

" Поддержка мыши
set mouse=a
set mousemodel=popup

" Кодировка текста по умолчанию
set termencoding=utf-8

" Не выгружать буфер, когда переключаемся на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без
" необходимости сохранения каждый раз
" когда переключаешься между ними
set hidden

" Скрыть панель в gui версии ибо она не нужна
set guioptions-=T

" Сделать строку команд высотой в одну строку
set ch=1

" Скрывать указатель мыши, когда печатаем
set mousehide

" Включить автоотступы
set autoindent

" Влючить подстветку синтаксиса
syntax on

" allow to use backspace instead of "x"
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Преобразование Таба в пробелы
set expandtab

" Размер табулации по умолчанию
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Формат строки состояния
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P 
set laststatus=2

" Включаем "умные" отспупы ( например, автоотступ после {)
set smartindent

" Fix <Enter> for comment
set fo+=cr

"-------------------------
" Горячие клавишы
"-------------------------

" Пробел в нормальном режиме перелистывает страницы
nmap <Space> <PageDown>

map <C-k> <PageUp>
map <C-j> <PageDown>

" C-c and C-v - Copy/Paste в "глобальный клипборд"
vmap <C-C> "+yi
imap <C-V> <esc>"+gPi

" Заставляем shift-insert работать как в Xterm
map <S-Insert> <MiddleMouse>

" C-y - удаление текущей строки
nmap <C-y> dd
imap <C-y> <esc>ddi

" C-d - дублирование текущей строки
imap <C-d> <esc>yypi

" Поиск и замена слова под курсором
" удобно, но бесит...когда промахиваешсья при :w например
"  nmap ; :s/\<<c-r>=expand("<cword>")<cr>\>/g


" F2 - быстрое сохранение
nmap <F2> :w<cr><esc>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i

" F12 - обозреватель файлов
map <F11> :Ex<cr>
vmap <F11> <esc>:Ex<cr>i
imap <F11> <esc>:Ex<cr>i

" < & > - делаем отступы для блоков
vmap < <gv
vmap > >gv

" Выключаем ненавистный режим замены
imap >Ins> <Esc>i

" Меню выбора кодировки текста (koi8-r, cp1251, cp866, utf8)
set wildmenu
set wcm=<Tab> 
menu Encoding.koi8-r :e ++enc=koi8-r<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.cp866 :e ++enc=cp866<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>

" Редко когда надо [ без пары =)
" imap [ []<LEFT>
" Аналогично и для {
" imap {<CR> {<CR>}<Esc>O

" С-q - выход из Vim 
" map <C-Q> <Esc>:qa<cr>

" тема как в textmate 
" colorscheme vividchalk

" отступы в rails
autocmd User Rails set sw=2 sts=2 expandtab
filetype plugin indent on

" подсветка синтаксиса
au BufRead,BufNewFile COMMIT_EDITMSG set filetype=diff
au BufRead,BufNewFile *.plm,*.inc,*.module,*.install set filetype=php ts=4 sts=4 sw=4 noet

" навигация по табам
map <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr>

" даже мне надоело набирать tabnew :)
map <C-o> :tabnew 
imap <C-o> :tabnew 

"map <C-w> :tabclose<cr>
"imap <C-w> <ESC>:tabclose<cr>

" настройки taglist~
" горячая клавиша F8 
nnoremap <silent> <F8> :TlistToggle<CR>

" уберем пустые линии и ненужную инфу
let Tlist_Compact_Format = 1

" держим теги после закрытия файла
let Tlist_Process_File_Always = 1

" справа место менее ценно. там и откроем /* заодно глаза в стрельбе тренироваться
let Tlist_Use_Right_Window = 1

" показывать теги только для текущего окна
let Tlist_Show_One_File = 1

" передача фокуса окну при открытии
let Tlist_GainFocus_On_ToggleOpen = 1

" NERD tree explorer setting
" горячая клавиша <F5>
map <silent> <F5> :NERDTreeToggle<CR>


filetype on " auto definition of filetype

" not sure, that this working
" Add recently accessed projects menu (project plugin)
set viminfo^=!

" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <M-p> :cprevious <CR>
map <silent> <M-n> :cnext <CR>
map <silent> <M-c> :clist <CR>


" fuzzy
"map <silent> <C-f> :FuzzyFinderFile<CR>
"set list
"set listchars=tab:\ \ ,extends:>,precedes:<

"Use fuzzy finder instead standard
"nnoremap <silent> <C-]>:FuzzyFinderTag! <C-r>=expand('<cword>')<CR><CR>

"make <c-l> clear the highlight as well as redraw
" nnoremap <C-L> :nohls<CR><C-L>
" inoremap <C-L> <C-O>:nohls<CR>



" surround
" helper only
" Normal mode
"
" ysiw yss ysS
" -----------
" - ds  - delete a surrounding
" - cs  - change a surrounding
" - ys  - add a surrounding
" - yS  - add a surrounding and place the surrounded text on a new line + indent it
" - yss - add a surrounding to the whole line
" - ySs - add a surrounding to the whole line, place it on a new line + indent it
" - ySS - same as ySs
" - 
" - Visual mode
" - -----------
" - s   - in visual mode, add a surrounding
" - S   - in visual mode, add a surrounding but place text on new line + indent it

nmap + yss

" search
nmap fs :grep -Ri 'def <c-r>=expand("<cword>")<cr>' ./

map <S-z> <C-^>


"nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/



" vimcasts.org. copy paste
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" assign to F3 clearing trailing whitespaces
nnoremap <silent> <F3> :call <SID>StripTrailingWhitespaces()<CR>
" auto clean whitespaces
"autocmd BufWritePre *.rb,*.js,*.erb,*.html :call <SID>StripTrailingWhitespaces()


" commandT
" set CommandTMaxFiles=5000
" set CommandTNeverShowDotFiles=1
" set CommandTScanDotDirectories=0

set wildignore+=.git,vendor/**,.backbone-cached-copy/**
map <silent> <C-f> :CommandT<CR>

" russian keys / http://habrahabr.ru/blogs/vim/98393/
" set keymap=russian-jcukenwin
" set iminsert=0
" set imsearch=0
" highlight lCursor guifg=NONE guibg=Cyan
" setlocal spell spelllang=ru_yo,en_us

" есть гит. копии и свап не нужны
set nobackup
set nowritebackup
set noswapfile 


" disable arrows
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" stupid key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" for one key press less
nnoremap ; :

" save open tabs at exit / or change
au FocusLost * :wa

" for user - specific key bindings. by default - '\'
" let mapleader = ","

" we have problem with type jj - but we quickly return to command mode
inoremap jj <ESC>:wa<CR>

" ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

nnoremap <leader>a :Ack

" fold tags
nnoremap <leader>ft Vatzf

" text-mate 're-hardwrap paragraphs of text:'
nnoremap <leader>q gqip

" enable syntastic
let g:syntastic_enable_signs=1
