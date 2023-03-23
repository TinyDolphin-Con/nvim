require 'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = { 'org', 'c', 'cpp', 'diff', 'markdown' },
    additional_vim_regex_highlighting = { 'org' },
  },
  -- 添加不同语言
  ensure_installed = { "vim", "help", "bash", "c", "cpp", "javascript", "json", "lua", "python", "typescript", "tsx", "css", "rust", "markdown", "markdown_inline" }, -- one of "all" or a list of languages
}

-- 从 https://github.com/nvim-treesitter/nvim-treesitter-textobjects 拷贝过来的配置
require('nvim-treesitter.configs').setup {
  textsubjects = {
    enable = true,
    prev_selection = ',', -- (Optional) keymap to select the previous selection
    keymaps = {
      ['.'] = 'textsubjects-smart',
      [';'] = 'textsubjects-container-outer',
      ['i;'] = 'textsubjects-container-inner',
    },
  },
}

require 'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        -- you can optionally set descriptions to the mappings (used in the desc parameter of nvim_buf_set_keymap
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
      },
      -- You can choose the select mode (default is charwise 'v')
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding xor succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      include_surrounding_whitespace = true,
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["xl"] = "@function.outer",
        ["xL"] = "@class.outer",
      },
      goto_next_end = {
        ["xk"] = "@function.outer",
        ["xK"] = "@class.outer",
      },
      goto_previous_start = {
        ["xh"] = "@function.outer",
        ["xH"] = "@class.outer",
      },
      goto_previous_end = {
        ["xj"] = "@function.outer",
        ["xJ"] = "@class.outer",
      },
    },
  },
}

require'nvim-treesitter.configs'.setup {
  -- 不同括号颜色区分
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}


