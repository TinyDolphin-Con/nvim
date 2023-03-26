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
-- local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set

-- 设置 leader 键
vim.g.mapleader = " "

-- keymap('n', ' ', '', { noremap = true, silent = true })
-- 快速保存
keymap('n', 'W', ':w!<CR>', { noremap = true, silent = true })
-- 快速退出
keymap('n', 'Q', ':q<CR>', { noremap = true, silent = true })
-- 快速保存并退出
keymap('n', 'qw', ':wq<CR>', { noremap = true, silent = true })

-- 选中全文（普通模式、可视模式和选择模式）
keymap({'n', 'x'}, 'VV', '<Esc>gg0vG$<CR>', { noremap = true, silent = true })

-- 取消搜索高亮
keymap({'n', 'x'}, '<leader><CR>', ':nohlsearch<CR>', { noremap = true, silent = true })

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

-- 折叠快捷键
-- zf{motion} ：将指定动作的范围进行折叠（e.g. 将整个段落进行折叠 zfap）
-- zd ：删除折叠
-- zo ：打开当前折叠
-- zj ：跳转到下一个折叠
-- zk ：跳转到上一个折叠
-- zR ：打开所有折叠
-- zM ：关闭所有折叠


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

-- 使用 bufferline.nvim 替换 Vim 的缓冲区
-- -- 关闭当前 buffer 缓冲区（但不关闭窗口）
-- keymap('n', '<leader>bc', ':bdel<CR>', { noremap = true, silent = true })
-- -- 关闭所有 buffer 缓冲区
-- keymap('n', '<leader>ba', ':bufdo bd<CR>', { noremap = true, silent = true })
-- -- 切换到下一个 buffer 缓冲区
-- keymap('n', '<leader>bj', ':bnext<CR>', { noremap = true, silent = true })
-- -- 切换到上一个 buffer 缓冲区
-- keymap('n', '<leader>bk', ':bprevious<CR>', { noremap = true, silent = true })
-- -- 列出所有缓冲区
-- keymap('n', '<leader>bl', ':ls<CR>', { noremap = true, silent = true })
-- -- 快速切换到指定编号的缓冲区
-- keymap('n', '<leader>b1', ':b1<CR>', { noremap = true, silent = true })
-- keymap('n', '<leader>b2', ':b2<CR>', { noremap = true, silent = true })
-- keymap('n', '<leader>b3', ':b3<CR>', { noremap = true, silent = true })
-- keymap('n', '<leader>b4', ':b4<CR>', { noremap = true, silent = true })
-- keymap('n', '<leader>b5', ':b5<CR>', { noremap = true, silent = true })
-- keymap('n', '<leader>b6', ':b6<CR>', { noremap = true, silent = true })
-- keymap('n', '<leader>b7', ':b7<CR>', { noremap = true, silent = true })
-- keymap('n', '<leader>b8', ':b8<CR>', { noremap = true, silent = true })
-- keymap('n', '<leader>b9', ':b9<CR>', { noremap = true, silent = true })

-- 使用 bufferline.nvim 可视化缓冲区列表形式，可替换 Vim 的标签页操作
-- -- 新建标签页
-- keymap('n', '<leader>tn', ':tabnew<CR>', { noremap = true, silent = true })
-- -- 仅保留当前标签页
-- keymap('n', '<leader>to', ':tabonly<CR>', { noremap = true, silent = true })
-- -- 关闭当前标签页
-- keymap('n', '<leader>tc', ':tabclose<CR>', { noremap = true, silent = true })
-- -- 切换到下一个标签页（或命令 gt）
-- keymap('n', '<leader>tl', ':tabnext<CR>', { noremap = true, silent = true })
-- -- 切换到上一个标签页（或命令 gT）
-- keymap('n', '<leader>th', ':tabprevious<CR>', { noremap = true, silent = true })
-- -- 快速切换到指定编号的标签页
-- keymap('n', '<leader>t1', ':tabnext 1<CR>', { noremap = true, silent = true })
-- keymap('n', '<leader>t2', ':tabnext 2<CR>', { noremap = true, silent = true })
-- keymap('n', '<leader>t3', ':tabnext 3<CR>', { noremap = true, silent = true })
-- keymap('n', '<leader>t4', ':tabnext 4<CR>', { noremap = true, silent = true })
-- keymap('n', '<leader>t5', ':tabnext 5<CR>', { noremap = true, silent = true })
-- keymap('n', '<leader>t6', ':tabnext 6<CR>', { noremap = true, silent = true })
-- keymap('n', '<leader>t7', ':tabnext 7<CR>', { noremap = true, silent = true })
-- keymap('n', '<leader>t8', ':tabnext 8<CR>', { noremap = true, silent = true })
-- keymap('n', '<leader>t9', ':tabnext 9<CR>', { noremap = true, silent = true })

-- 插件：nvim-tree/nvim-tree.lua 配置：nvim-tree.lua
keymap('n', '<leader>nt', '<Cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })

-- 插件：akinsho/bufferline.nvim 配置：bufferline.lua
-- 切换到下一个 buffer 缓冲区
keymap('n', '<leader>bl', '<Cmd>BufferLineCycleNext<CR>', { noremap = true, silent = true })
-- 切换到上一个 buffer 缓冲区
keymap('n', '<leader>bh', '<Cmd>BufferLineCyclePrev<CR>', { noremap = true, silent = true })
-- 选择缓冲区
keymap('n', '<leader>bp', '<Cmd>BufferLinePick<CR>', { noremap = true, silent = true })
-- 关闭所有 buffer 除当前 buffer
keymap('n', '<leader>bo', '<Cmd>BufferLineCloseLeft<CR><Cmd>BufferLineCloseRight<CR>', { noremap = true, silent = true })

-- 插件：s1n7ax/nvim-window-picker 窗口选择
-- 使用 vim.keymap.set 调用匿名函数
vim.keymap.set("n", "<leader>w", function()
    local picked_window_id = require('window-picker').pick_window() or vim.api.nvim_get_current_win()
    vim.api.nvim_set_current_win(picked_window_id)
end, { desc = "Pick a window" })

-- 插件：numToStr/Comment.nvim 快速注释代码
-- gc{motion} ：行注释，范围：指定动作
-- gb{motion} ：块注释，范围：指定动作
-- {motion}: c 当前行、o 下一行、O 上一行、A 行尾等

-- 插件：phaazon/hop.nvim 窗口内搜索并快速跳转
keymap('n', 'ss', '<Cmd>HopChar1<CR>', { noremap = true, silent = true })
keymap('n', 'SS', '<Cmd>HopChar2<CR>', { noremap = true, silent = true })

-- 插件：telescope.nvim 强大的搜索工具 配置：
-- File & Vim Picker
-- 当前工作目录中，搜索文件
keymap('n', '<leader>ff', '<Cmd>Telescope find_files<CR>', { noremap = true, silent = true })
-- 搜索历史文件
keymap('n', '<leader>fm', '<Cmd>Telescope oldfiles<CR>', { noremap = true, silent = true })
-- 搜索已打开的 buffer 缓冲区
keymap('n', '<leader>fb', '<Cmd>Telescope buffers<CR>', { noremap = true, silent = true })
-- 当前工作目录中，搜索字符串
keymap('n', '<leader>fl', '<Cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
-- 当前工作目录中，搜索当前光标或选择的字符串
keymap('n', '<leader>fL', '<Cmd>Telescope grep_string<CR>', { noremap = true, silent = true })
-- Git Picker
-- 列出 git 提交历史版本
keymap('n', '<leader>fgc', '<Cmd>Telescope git_commits<CR>', { noremap = true, silent = true })
-- 列出 git 所有文件的修改
keymap('n', '<leader>fgs', '<Cmd>Telescope git_status<CR>', { noremap = true, silent = true })
-- 列出 git 所有暂存文件
keymap('n', '<leader>fgS', '<Cmd>Telescope git_stash<CR>', { noremap = true, silent = true })
-- treesitter
-- 列出所有函数名称、变量等
keymap('n', '<leader>fv', '<Cmd>Telescope treesitter<CR>', { noremap = true, silent = true })
-- coc Picker
-- 搜索当前光标下的符号引用
keymap('n', '<leader>cr', '<Cmd>Telescope coc references<CR>', { noremap = true, silent = true })
-- 搜索当前光标下的符号定义
keymap('n', '<leader>cd', '<Cmd>Telescope coc definitions<CR>', { noremap = true, silent = true })
-- 搜索当前光标下的符号实现
keymap('n', '<leader>ci', '<Cmd>Telescope coc implementations<CR>', { noremap = true, silent = true })
-- 搜索当前光标下的符号类型定义
keymap('n', '<leader>ct', '<Cmd>Telescope coc type_definitions<CR>', { noremap = true, silent = true })
-- 搜索当前光标下的符号列表
keymap('n', '<leader>cs', '<Cmd>Telescope coc document_symbols<CR>', { noremap = true, silent = true })

-- 插件：tpope/vim-fugitive 全面的 Git 客户端功能
-- git status：显示 Git 状态
keymap('n', '<leader>gs', '<Cmd>Git status<CR>', { noremap = true, silent = true })
-- git blame：显示 Git 当前文件中每一行的修改信息（包括：提交 ID、作者和该行内容）
keymap('n', '<leader>gb', '<Cmd>Git blame<CR>', { noremap = true, silent = true })
-- git diff：显示当前文件与上一次提交的 diff
keymap('n', '<leader>gd', '<Cmd>Git diff<CR>', { noremap = true, silent = true })

-- 插件：akinsho/toggleterm.nvim 智能终端
vim.cmd([[
  autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
]])
-- 开启终端
-- 支持多终端：2<C-t> 即打开终端 2
keymap('n', '<C-t>', '<Cmd>exe v:count1 . "ToggleTerm"<CR><CR>', { noremap = true, silent = true })
-- 退出终端模式
keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
keymap('t', 'Q', '<Cmd>close<CR>', { noremap = true, silent = true })
