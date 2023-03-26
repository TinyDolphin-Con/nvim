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
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    coc = {
      theme = 'ivy',
      prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
    }
  }
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('coc')
