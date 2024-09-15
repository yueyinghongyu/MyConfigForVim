" Vim的主要配置

" 注意: 安装了"https://github.com/junegunn/vim-plug"(即下载plug.vim文件到"$HOME/.vim/autoload"目录)之后, 在vim中运行 ":PlugInstall" and ":CocInstall coc-clangd coc-tsserver".
"" COC plugins (node modules) are in "~/AppData/Local/coc/extensions" on Windows or "~/.config/coc/extensions/" on Unix.

" 我懒, 用自动命令去完成这事, 第一次下载完毕之后记得注释掉, 否则每次用Vim打开一个文件就会运行一次
"autocmd VimEnter * :PlugInstall
" 这条命令专门用于安装 clangd 语言服务器，它是一个用于 C/C++ 语言的语法分析工具。
"autocmd VimEnter * :CocInstall coc-clangd

" 这条是后备用
"autocmd VimEnter * :CocCommand clangd.install

set number numberwidth=9 relativenumber
" 启用状态栏中的标尺，显示当前光标位置。
set ruler
" 在底部显示正在输入的命令。
set showcmd
" 禁用超时设置，这意味着某些命令的超时限制将被取消。
set notimeout
" 启用鼠标支持，在所有模式下都可以使用鼠标。
set mouse=a
" 设置 Vim 使用无名寄存器作为系统剪贴板。
set clipboard=unnamedplus
" 高亮显示当前光标所在的行。
set cursorline
" 设置制表符（Tab）的显示宽度为 4 个空格。
set tabstop=4
" 设置软制表符宽度为 4 个空格，影响自动缩进。
set softtabstop=4
" 设置每次缩进的宽度为 4 个空格。
set shiftwidth=4
" 开启 C 语言风格的自动缩进。
set cindent
" 高亮显示匹配的括号。
set showmatch
" 设置匹配括号高亮显示的时间（单位为毫秒）。
set matchtime=5

" ==== UP主: 一点五编程 ====
" link: https://github.com/wallacegibbon/miscellaneous-configurations/blob/main/.vimrc
" 这是一个普通模式（normal mode）下的映射。它将 <space>b（空格键加 'b'）映射为执行 :buffers 命令，列出所有缓冲区，然后执行 :b 命令，跳转到输入的缓冲区编号。<cr> 代表回车键，用于执行命令。
nnoremap <space>b :buffers<cr>:b<space>

" 在普通模式下，将 <space>e 映射为执行 :b# 命令，这会跳转回上一个编辑的缓冲区。
nnoremap <space>e :b#<cr>

" 在普通模式下，将 <space>w 映射为执行 :w 命令，保存当前缓冲区的内容。
nnoremap <space>w :w<cr>

" 在普通模式下，将 <space>q 映射为执行 :qa 命令，这会保存所有更改并退出 Vim。
nnoremap <space>q :qa<cr>

" 这是一个插入模式（insert mode）下的映射。它将 jf 映射为 <esc> 键，用于从插入模式退出到普通模式。
inoremap jf <esc>

" 这是一个命令模式（command mode）下的映射。它将 jf 映射为 <c-c>（Ctrl+C），通常用于中断当前命令。
cnoremap jf <c-c>

" ==== 仿自吴咏炜写的文章中提及到的映射快捷键, 因为快捷键会与Tabby冲突就换成了<space>开头 (用于多窗口切换) ====
" link: https://learn.lianglianglee.com/专栏/Vim 实用技巧必知必会/06 窗口和标签页：修改、对比多个文件的正确姿势.md
nnoremap <space><Tab>   <C-W>w
inoremap <space><Tab>   <C-O><C-W>w
nnoremap <space><S-Tab> <C-W>W
inoremap <space><S-Tab> <C-O><C-W>W

" ==== 我自己设置的快捷键(注意: 插入模式下为避免误触快捷键需要按两次空格键) ====
"  用于在正常|插入模式下三击<;:>键进入底行模式
nnoremap ;;; :
inoremap ;;; <esc>:
"  用于在正常|插入模式下将光标后面所有的文字删除, 仅限于光标所在行
nnoremap <space>dd d$a
inoremap <space><space>dd <esc><Right>d$a
"  用于在插入模式下将上一次的操作撤回
inoremap <space><space>z <esc>:undo<cr>i
"  用于在正常|插入模式下将上一次的撤回操作撤回
nnoremap <space>r :redo<cr>i<Right>
inoremap <space><space>r <esc>:redo<cr>i<Right>


" 这是一个被注释掉的命令，如果取消注释（去掉前面的双引号），它会执行 source 命令来加载用户主目录下的 .vim-complex 文件。这个文件可能包含更复杂的 Vim 配置。
source ~/.vimrc-complex
