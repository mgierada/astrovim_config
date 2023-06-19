return {
  -- Octo
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    -- ops = {},
    config = function() require("octo").setup {} end,
    event = "VeryLazy",
  },
  -- harpoon
  { "ThePrimeagen/harpoon", config = function() require("harpoon").setup {} end },
  -- nvim coverage
  {
    "andythigpen/nvim-coverage",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("coverage").setup {
        commands = true, -- create commands
        highlights = {
          -- customize highlight groups created by the plugin
          covered = { fg = "#C3E88D" }, -- supports style, fg, bg, sp (see :h highlight-gui)
          uncovered = { fg = "#F07178" },
        },
        signs = {
          -- use your own highlight groups or text markers
          covered = { hl = "CoverageCovered", text = "▎" },
          uncovered = { hl = "CoverageUncovered", text = "▎" },
        },
        summary = {
          -- customize the summary pop-up
          min_coverage = 80.0, -- minimum coverage threshold (used for highlighting)
        },
        lang = {
          -- customize language specific settings
        },
      }
    end,
    event = "VeryLazy",
  },
  -- emoji
  {
    "xiyaowong/telescope-emoji.nvim",
    config = function() require("telescope").load_extension "emoji" end,
    event = "VeryLazy",
  },
  --- chatgpt
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function() require("chatgpt").setup() end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  -- nvim-metals
  {
    "scalameta/nvim-metals",
    name = "metals",
    ft = { "scala", "sbt", "java" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- stylua: ignore
    keys = {
      { "<leader>mh", function() require('metals').hover_worksheet() end, desc = "Metals Worksheet" },
      { "gd",         vim.lsp.buf.definition },
      { "gr",         vim.lsp.buf.references },
      { "gi",         vim.lsp.buf.implementation },
      { "gl",         vim.diagnostic.setloclist },
      { "<leader>f",  vim.lsp.buf.format },
      { "<leader>aa", vim.diagnostic.setqflist },
      {
        "<leader>mm",
        function() require('telescope').extensions.metals.commands() end,
        desc =
        "Telescope Metals Commands"
      },
    },
    config = function()
      local metals_config = require("metals").bare_config()

      metals_config.settings = {
        showImplicitArguments = true,
        showImplicitConversionsAndClasses = true,
        showInferredType = true,
        superMethodLensesEnabled = true,
      }
      metals_config.init_options.statusBarProvider = "on"
      metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt", "java" },
        callback = function() require("metals").initialize_or_attach(metals_config) end,
        group = nvim_metals_group,
      })
    end,
  },

  -- noice
  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          hover = {
            enabled = false,
          },
          signature = {
            enabled = false,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      }
    end,
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  -- oil
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
  },

  -- kangawa colorscheme
  {
    "rebelot/kanagawa.nvim",
  },

  -- everforest colorscheme
  {
    "sainnhe/everforest",
  },

  -- catppuccin colorscheme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  --neorg
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      }
    end,
    event = "VeryLazy",
  },
}
