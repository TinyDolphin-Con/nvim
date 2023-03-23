-- ------------------------------------------------------------
--  Maintainer:
--
--        TinyDolphin
--
--  Awesome_version:
--        Get this config, nice color schemes and lots of plugins!
--
--        Install the awesome version from:
--
--            https://github.com/xxx/xxx
--
--  Modify:
--        Created by TinyDolphin on 2023/03/23
--        Last Modified: 2023/03/23 12:54:36
--
--  Sections:
--     -> General
--     -> VIM user interface
--     -> Colors and Fonts
--     -> Files and backups
--     -> Text, tab and indent related
--     -> Visual mode related
--     -> Moving around, tabs and buffers
--     -> Status line
--     -> Editing mappings
--     -> vimgrep searching and cope displaying
--     -> Spell checking
--     -> Misc
--     -> Helper functions
--
-- ------------------------------------------------------------


-- 启用全局选项处理
local opt = vim.api.nvim_set_option
-- 启用窗口选项处理
local wo = vim.api.nvim_win_set_option
-- 启用缓冲区选项处理
local bo = vim.api.nvim_buf_set_option

-- 设定保存历史记录的行数 (默认值: 50 )
opt('history', 1000)

-- 设置键盘启用情况
opt('mouse', 'c')

-- 设置系统粘贴板
vim.opt.clipboard:append('unnamedplus')

-- 显示普通行数
wo(0, 'number', true)
-- 显示相对行数
wo(0, 'relativenumber', true)
-- 显示 git 状态列
wo(0, 'signcolumn', 'auto')
-- 设置自动切换行数显示
vim.cmd([[
  augroup CursorLineOnlyInActiveWindow
    autocmd!
    " 离开插入模式时，显示相对行数
    autocmd InsertLeave * setlocal relativenumber signcolumn=auto
    " 进入插入模式时，显示普通行数
    autocmd InsertEnter * setlocal norelativenumber signcolumn=number
    " 进入缓冲区后，显示当前列、相对行数、自动显示标记栏
    autocmd BufEnter * setlocal cursorline relativenumber signcolumn=auto
    " 离开缓冲区后
    autocmd BufLeave * setlocal nocursorline norelativenumber signcolumn=number
  augroup END
]])

-- 避免中文窗口操作系统中的乱码字符
opt('langmenu', 'en')
-- 中文文档 cn
opt('helplang', 'en')

-- 启用 wildmenu 命令行菜单：Tab 键可显示匹配内容
opt('wildmenu', true)
-- 点击Tab键，将显示可能匹配的文件列表，并使用最长的子串进行补全；
--   再次点击Tab键，可以在wildmenu中遍历匹配的文件列表
opt('wildmode', 'list:longest,full')
-- 在匹配列表中忽略指定类型的文件
opt('wildignore', '.o,*~,*.pyc')

-- 左移键回到上一行的行尾，在行尾用右移键能够到下一行的开头
opt('whichwrap', '<,>,b,s,h,l')

-- 忽略搜索模式的大小写
opt('ignorecase', true)
-- 智能的判断要不要区分搜索模式大小写（只能在 ignorecase 开启时使用）
opt('smartcase', true)

-- 在执行宏命令时，不进行显示重绘；在宏命令执行完成后，一次性重绘，以便提高性能
opt('lazyredraw', true)

-- 高亮显示匹配的括号
opt('showmatch', true)
-- 高亮显示匹配括号的时间（单位：十分之一秒）
opt('matchtime', 15)

-- 在左边增加一列显示折叠栏
wo(0, 'foldcolumn', '1')

-- 光标距离buffer的顶部或底部保持 5 行距离
opt('scrolloff', 5)

-- 在被分割的窗口间显示空白，便于阅读
opt('fillchars', table.concat({
  'vert: ', 'stl: ', 'stlnc: '
}, ','))

-- 开启真彩色模式
opt('termguicolors', true)
-- 尝试设置主题
vim.cmd('colorscheme desert')
-- 设置背景透明
vim.cmd('highlight Normal ctermbg=NONE guibg=NONE')
vim.cmd('highlight NonText ctermbg=NONE guibg=NONE')
vim.cmd('highlight SignColumn ctermbg=NONE guibg=NONE')
vim.cmd('highlight VertSplit ctermbg=NONE guibg=NONE')
vim.cmd('highlight StatusLineNC ctermbg=NONE guibg=NONE')
vim.cmd('highlight TabLine ctermbg=NONE guibg=NONE')
vim.cmd('highlight TabLineFill ctermbg=NONE guibg=NONE')

-- 启用自动读取
opt('autoread', true)
-- 当文件被其他编辑器修改时，自动加载
vim.cmd('autocmd FocusGained,BufEnter * checktime')
-- 启用自动保存
opt('autowrite', true)
-- 当失去焦点或者离开当前的 buffer 的时候保存
vim.cmd('autocmd FocusLost,BufLeave * silent! update')

-- 不需要备份文件
opt('backup', false)
-- 编辑的时候不需要备份文件
opt('writebackup', false)
-- 不创建临时交换文件
bo(0, 'swapfile', false)
-- 开启持久性撤销功能
--  意味着即使关闭了缓冲区/Vim，重新进入时仍能执行撤销操作
-- 启用持久化 undo
vim.opt.undofile = true
-- 设置 undo 文件的保存路径
vim.opt.undodir = "/tmp/nvim/undo"

-- 设置折叠
wo(0, 'foldmethod', 'marker')
-- 折叠级别
vim.wo.foldlevel = 0
-- zf{motion} ：将指定动作的范围进行折叠（e.g. 将整个段落进行折叠 zfap）
-- zd ：删除折叠
-- zo ：打开当前折叠
-- zj ：跳转到下一个折叠
-- zk ：跳转到上一个折叠
-- zR ：打开所有折叠
-- zM ：关闭所有折叠

-- 使用空格而非制表符
bo(0, 'expandtab', true)
-- 将 tab 设置为 2 个空格
bo(0, 'tabstop', 2)
-- 每一级缩进 2 个空格
bo(0, 'shiftwidth', 2)
-- 自动缩进：每一行都和前一行有相同的缩进量，同时这种缩进形式能正确的识别出括号
bo(0, 'smartindent', true)
-- C 语言的缩进（比上述两种更严格，推荐 C 语言开发者使用）
vim.bo.cindent = true

-- 光标超过 80 行时，进行断行
bo(0, 'textwidth', 80)
-- 设置不在单词中断行
wo(0, 'linebreak', true)

-- 向右切分分屏
opt('splitright', true)
-- 向下切分分屏
opt('splitbelow', true)

-- 指定在缓冲区之间切换时的行为：直接切换过去，而不是新建一个
opt('switchbuf', 'useopen,usetab,newtab')

-- 打开文件时，返回到最后的编辑位置并且居中显示
vim.cmd([[autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute 'silent! ' . line("'\"") . 'foldopen!' | execute 'normal! ' . line("'\"") . 'Gzz' | endif]])

-- 保存时删除末尾空白
vim.cmd([[
  autocmd BufWritePre * :%s/\s\+$//e
]])

-- 设置光标
opt('guicursor', 'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175')

-- 当使用命令行时，总是报告文件有几行被修改过
opt('report', 0)

-- 配置 C++ 风格
vim.cmd([[
  autocmd FileType c,cpp set foldmethod=indent nofoldenable
  autocmd FileType c,cpp set commentstring=//\ %s
]])

-- 配置 Python 风格
vim.cmd([[
  autocmd FileType python set foldmethod=indent nofoldenable
  autocmd FileType python set commentstring=#\ %s
  autocmd FileType python syn keyword pythonDecorator True None False self

  autocmd BufNewFile,BufRead SConstruct set filetype=python
  autocmd BufNewFile,BufRead *.jinja set syntax=htmljinja
  autocmd BufNewFile,BufRead *.mako set ft=mako
]])