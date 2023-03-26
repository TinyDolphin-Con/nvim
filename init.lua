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
--        Created by TinyDolphin on 2022/12/13
--        Last Modified: 2023/03/23 12:54:36
--
--  Sections:
--     -> Initialize
--     -> Loading
--
-- ------------------------------------------------------------
require('plugins.plugins-setup')

require('plugins.lualine')
require('plugins.nvim-tree')
require('plugins.bufferline')
require('plugins.indent-blankline')
require('plugins.nvim-treesitter')
require('plugins.nvim-autopairs')
require('plugins.telescope')
require('plugins.coc')
require('plugins.toggleterm')

require('core.basic')
require('core.keymaps')
require('plugins.color')
