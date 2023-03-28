require('telescope').setup({
  defaults = {
    layout_config = {
      width = 0.9, -- 设置宽度为当前窗口的90%
      height = 0.9, -- 设置高度为当前窗口的90%
      preview_width = 0.5, -- 设置预览宽度为当前窗口宽度的50%
    },
  },
  -- You dont need to set any of these options. These are the default ones. Only
  -- the loading is important
  extensions = {
    coc = {
      theme = 'ivy',
      prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
    }
  }
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('coc')
