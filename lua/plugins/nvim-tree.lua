-- setup with some options
require("nvim-tree").setup({
  disable_netrw = true,   -- 禁用内置文件管理器 netrw
  update_cwd = true,      -- 更新文件树的根目录
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    highlight_git = true, -- 高亮 git
    indent_markers = {    -- 缩进对齐线
      enable = true
    },
    icons = {
      show = {
        folder_arrow = false, -- 不显示文件夹折叠标识
      }
    }
  },
  filters = {
    dotfiles = false,  -- 不隐藏 . 文件
    custom = {".git"}
  },
  view = {
    side = 'right',
    adaptive_size = 40, -- 宽度动态调整，最大值 40
  },
  actions = {
    open_file = {
    }
  }
})
