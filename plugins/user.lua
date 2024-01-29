return {

  -- VimDadBod
  {
    "mgierada/vim-dadbod",
    event = "BufRead",
  },

  -- VimDadBodUi
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "mgierada/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  -- Package-info
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function() require("package-info").setup {} end,
    event = "BufRead",
  },

  --hairline
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astronvim.utils.status"
      local package_info = require "package-info"
      -- Get the status from your custom component
      local custom_component_status = package_info.get_status()
      opts.statusline = { -- statusline
        hl = { fg = "fg", bg = "bg" },
        status.component.mode { mode_text = { padding = { left = 1, right = 1 } } }, -- add the mode text
        status.component.git_branch(),
        status.component.file_info { filetype = {}, filename = false, file_modified = false },
        status.component.git_diff(),
        status.component.diagnostics(),
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.lsp(),
        status.component.treesitter(),
        status.component.nav(),
        -- Add your custom component
        {
          text = custom_component_status,
          hl = { fg = "custom_fg_color", bg = "custom_bg_color" }, -- Adjust colors as needed
          padding = { left = 1, right = 1 }, -- Adjust padding as needed
        },
      }
      -- return the final configuration table
      return opts
    end,
  },

  -- Pybumper
  {
    "mgierada/pybumper.nvim",
    -- dir = "/Users/maciej/00_codes/pybumper.git/main",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function() require("pybumper").setup {} end,
    -- dev = true,
    event = "BufRead",
  },

  -- -- Snowsql.nvim
  -- {
  --   -- "mgierada/snowsql.nvim",
  --   dependencies = { "akinsho/toggleterm.nvim" },
  --   -- dir = "/Users/maciej/00_codes/snowsql.nvim.git/main",
  --   -- dir = "/Users/maciejgierada/01_PRACA_IT/02_side_projects/snowsql.nvim.git/main",
  --   config = function() require("snowsql").setup {} end,
  --   -- dev = true,
  --   event = "BufRead",
  -- },

  -- Lazydocker.nvim
  {
    "mgierada/lazydocker.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    -- dir = "/Users/maciej/00_codes/lazydocker.nvim.git/main",
    config = function() require("lazydocker").setup {} end,
    -- dev = true,
    event = "BufRead",
  },

  -- transparent
  {
    "xiyaowong/transparent.nvim",
    event = "VeryLazy",
  },
}
