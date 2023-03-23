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

-- 启用键盘映射
local keymap = vim.api.nvim_set_keymap

-- 设置 leader 键
vim.g.mapleader = " "

-- keymap('n', ' ', '', { noremap = true, silent = true })
-- 快速保存
keymap('n', 'W', ':w!<CR>', { noremap = true, silent = true })
-- 快速退出
keymap('n', 'Q', ':q<CR>', { noremap = true, silent = true })
-- 快速保存并退出
keymap('n', 'qw', ':wq<CR>', { noremap = true, silent = true })

-- 选中全文
keymap('n', 'VV', '<Esc>gg0vG$<CR>', { noremap = true, silent = true })

-- 取消搜索高亮
keymap('', '<leader><CR>', ':nohlsearch<CR>', { noremap = true, silent = true })

-- 插入模式下移动光标
keymap('i', '<C-k>', '<Up>', { noremap = true, silent = true })
keymap('i', '<C-j>', '<Down>', { noremap = true, silent = true })
keymap('i', '<C-h>', '<Left>', { noremap = true, silent = true })
keymap('i', '<C-l>', '<Right>', { noremap = true, silent = true })

-- 向后删除
keymap('i', '<C-d>', '<Delete>', { noremap = true, silent = true })

-- 移动一行文字
keymap('n', '<C-S-Up>', 'mz:m-2<CR>`z', { noremap = true, silent = true })
keymap('v', '<C-S-Up>', ':m\'<-2<CR>`>my`<mzgv`yo`z', { noremap = true, silent = true })
keymap('n', '<C-S-Down>', 'mz:m+<CR>`z', { noremap = true, silent = true })
keymap('v', '<C-S-Down>', ':m\'>+<CR>`<my`>mzgv`yo`z', { noremap = true, silent = true })

-- 切换粘贴模式
keymap('n', '<leader>P', ':setlocal paste!<CR>', { noremap = true, silent = true })

-- 开启拼写检查
keymap('n', '<leader>S', ':setlocal spell!<CR>', { noremap = true, silent = true })
-- ]s ：移动到下一个拼写错误处
-- [s ：移动到上一个拼写错误处
-- z= ：选择正确的拼写
-- zg ：添加用户拼写
-- zw ：删除用户拼写

-- 命令行中类似 Bash 的按键
keymap('c', '<C-a>', '<Home>', { noremap = true, silent = true })
keymap('c', '<C-e>', '<End>', { noremap = true, silent = true })

-- 可视模式下，针对选中内容，增加括号
keymap('v', '<leader>(', '<Esc>`>a)<Esc>`<i(<Esc>', { noremap = true, silent = true })
keymap('v', '<leader>[', '<Esc>`>a]<Esc>`<i[<Esc>', { noremap = true, silent = true })
keymap('v', '<leader>{', '<Esc>`>a}<Esc>`<i{<Esc>', { noremap = true, silent = true })
keymap('v', '<leader>"', '<Esc>`>a"<Esc>`<i"<Esc>', { noremap = true, silent = true })
keymap('v', '<leader>`', '<Esc>`>a`<Esc>`<i`<Esc>', { noremap = true, silent = true })
keymap('v', '<leader>\'', '<Esc>`>a\'<Esc>`<i\'<Esc>', { noremap = true, silent = true })

-- 插入模式，快速打印当前时间
keymap('i', 'xdate', [[<C-r>=strftime('%Y-%m-%d %H:%M:%S')<CR>]], { noremap = true, silent = true })

-- 切分分屏：右左上下
keymap('n', 'sl', ':set splitright<CR>:vsplit<CR>', { noremap = true, silent = true })
keymap('n', 'sh', ':set nosplitright<CR>:vsplit<CR>', { noremap = true, silent = true })
keymap('n', 'sk', ':set nosplitbelow<CR>:split<CR>', { noremap = true, silent = true })
keymap('n', 'sj', ':set splitbelow<CR>:split<CR>', { noremap = true, silent = true })
-- 调整分屏大小
keymap('n', 'sL', ':vertical resize-5<CR>', { noremap = true, silent = true })
keymap('n', 'sH', ':vertical resize+5<CR>', { noremap = true, silent = true })
keymap('n', 'sK', ':res +5<CR>', { noremap = true, silent = true })
keymap('n', 'sJ', ':res -5<CR>', { noremap = true, silent = true })

-- 关闭当前 buffer 缓冲区（但不关闭窗口）
keymap('n', '<leader>bc', ':bdel<CR>', { noremap = true, silent = true })
-- 关闭所有 buffer 缓冲区
keymap('n', '<leader>ba', ':bufdo bd<CR>', { noremap = true, silent = true })
-- 切换到下一个 buffer 缓冲区
keymap('n', '<leader>bj', ':bnext<CR>', { noremap = true, silent = true })
-- 切换到上一个 buffer 缓冲区
keymap('n', '<leader>bk', ':bprevious<CR>', { noremap = true, silent = true })
-- 列出所有缓冲区
keymap('n', '<leader>bl', ':ls<CR>', { noremap = true, silent = true })
-- 快速切换到指定编号的缓冲区
keymap('n', '<leader>b1', ':b1<CR>', { noremap = true, silent = true })
keymap('n', '<leader>b2', ':b2<CR>', { noremap = true, silent = true })
keymap('n', '<leader>b3', ':b3<CR>', { noremap = true, silent = true })
keymap('n', '<leader>b4', ':b4<CR>', { noremap = true, silent = true })
keymap('n', '<leader>b5', ':b5<CR>', { noremap = true, silent = true })
keymap('n', '<leader>b6', ':b6<CR>', { noremap = true, silent = true })
keymap('n', '<leader>b7', ':b7<CR>', { noremap = true, silent = true })
keymap('n', '<leader>b8', ':b8<CR>', { noremap = true, silent = true })
keymap('n', '<leader>b9', ':b9<CR>', { noremap = true, silent = true })

-- 新建标签页
keymap('n', '<leader>tn', ':tabnew<CR>', { noremap = true, silent = true })
-- 仅保留当前标签页
keymap('n', '<leader>to', ':tabonly<CR>', { noremap = true, silent = true })
-- 关闭当前标签页
keymap('n', '<leader>tc', ':tabclose<CR>', { noremap = true, silent = true })
-- 切换到下一个标签页（或命令 gt）
keymap('n', '<leader>tl', ':tabnext<CR>', { noremap = true, silent = true })
-- 切换到上一个标签页（或命令 gT）
keymap('n', '<leader>th', ':tabprevious<CR>', { noremap = true, silent = true })
-- 快速切换到指定编号的标签页
keymap('n', '<leader>t1', ':tabnext 1<CR>', { noremap = true, silent = true })
keymap('n', '<leader>t2', ':tabnext 2<CR>', { noremap = true, silent = true })
keymap('n', '<leader>t3', ':tabnext 3<CR>', { noremap = true, silent = true })
keymap('n', '<leader>t4', ':tabnext 4<CR>', { noremap = true, silent = true })
keymap('n', '<leader>t5', ':tabnext 5<CR>', { noremap = true, silent = true })
keymap('n', '<leader>t6', ':tabnext 6<CR>', { noremap = true, silent = true })
keymap('n', '<leader>t7', ':tabnext 7<CR>', { noremap = true, silent = true })
keymap('n', '<leader>t8', ':tabnext 8<CR>', { noremap = true, silent = true })
keymap('n', '<leader>t9', ':tabnext 9<CR>', { noremap = true, silent = true })
