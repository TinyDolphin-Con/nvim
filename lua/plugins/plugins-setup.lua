-- 自动安装packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- 保存此文件自动更新安装软件
-- 注意PackerCompile改成了PackerSync
-- plugins.lua改成了plugins-setup.lua，适应本地文件名字
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- UI && 颜色主题
  -- 启动界面
  use { 'mhinz/vim-startify' }
  -- 主题
  use { 'folke/tokyonight.nvim' }
  -- 透明背景插件
  use { 'xiyaowong/transparent.nvim', config = function()
    require("transparent").setup({}) end
  }
  -- 状态栏
  use { 'nvim-lualine/lualine.nvim', requires = 'kyazdani42/nvim-web-devicons' }
  -- 文档树
  use { 'nvim-tree/nvim-tree.lua', requires = 'nvim-tree/nvim-web-devicons' }
  -- 标签栏
  use { 'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons' }
  -- 快速切换窗口（支持 tmux）（快捷键 C-hjkl）
  use { 'christoomey/vim-tmux-navigator' }
  -- 窗口选择插件
  use { 's1n7ax/nvim-window-picker', config = function()
    require('window-picker').setup{ selection_chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890'} end
  }
  -- 缩进对齐线
  use { 'lukas-reineke/indent-blankline.nvim' }

  -- 高效编码
  -- 快速注释代码
  use { 'numToStr/Comment.nvim', config = function()
    require('Comment').setup() end
  }
  -- 语法高亮
  use { 'nvim-treesitter/nvim-treesitter', requires = 'p00f/nvim-ts-rainbow' }
  -- 自动补全括号
  use { 'windwp/nvim-autopairs' }

  -- 搜索
  -- 强大的搜索工具
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} , { 'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }}
  }
  -- fzf 替换默认搜索后端，可提升 telescope 搜索效率
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- 窗口内搜索并快速跳转
  use { 'phaazon/hop.nvim', config = function()
    require('hop').setup { keys = 'etovxqpdygfblzhckisuran' } end
  }

  -- 书签

  -- C/C++
  -- 智能语法补全
  use { 'neoclide/coc.nvim', branch = 'release' }
  -- 搜索 coc 提供的符号
  use { 'fannheyward/telescope-coc.nvim' }
  -- 代码片段库
  use { 'rafamadriz/friendly-snippets' }
  -- 代码片段引擎
  use { 'L3MON4D3/LuaSnip',
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets/snippets" } })
    end
  }

  -- Git
  -- 全面的 Git 客户端功能
  use { 'tpope/vim-fugitive' }
  -- 左则git提示
  use { 'lewis6991/gitsigns.nvim' }
  -- 智能终端
  use { 'akinsho/toggleterm.nvim' }

  -- 其他

  if packer_bootstrap then
    require('packer').sync()
  end
end)
