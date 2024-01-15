return {

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

  --- chatgpt
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup {
        openai_params = {
          max_tokens = 500,
        },
      }
    end,
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
      -- add integrations with nvim-dap
      metals_config.on_attach = function(client, bufnr) require("metals").setup_dap() end

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

  -- flash
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          -- default options: exact mode, multi window, all directions, with a backdrop
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          -- show labeled treesitter nodes around the cursor
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          -- jump to a remote location to execute the operator
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "n", "o", "x" },
        function()
          -- show labeled treesitter nodes around the search matches
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
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
    event = "BufRead",
  },

  -- flutter lsp and tools
  {
    "akinsho/flutter-tools.nvim",
    -- lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function() require("flutter-tools").setup {} end,
    ft = { "dart" },
    event = "BufRead",
  },

  -- neotest
  {
    "nvim-neotest/neotest",
    config = function()
      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace "neotest"
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
      require("neotest").setup {
        -- your neotest config here
        adapters = {
          require "neotest-go",
          require "neotest-rust",
          require "neotest-python",
          require "neotest-scala" {
            runner = "sbt",
          },
        },
      }
    end,
    ft = { "go", "rust", "python" },
    dependencies = {
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-python",
      "rouge8/neotest-rust",
      "stevanmilic/neotest-scala",
    },
  },

  -- rust tools
  {
    "simrat39/rust-tools.nvim",
    config = function()
      require("rust-tools").setup {
        tools = {
          autoSetHints = true,
          -- hover_with_actions = true,
          runnables = {
            use_telescope = true,
          },
          inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "<-",
            other_hints_prefix = "=>",
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
          },
        },
      }
    end,
    ft = { "rust" },
    event = "BufRead",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
  },

  -- nvim worktree
  {
    "/brandoncc/git-worktree.nvim",
    event = "VeryLazy",
    config = function() require("telescope").load_extension "git_worktree" end,
    branch = "catch-and-handle-telescope-related-error",
  },

  -- Twilight
  {
    "folke/twilight.nvim",
    opts = {},
    event = "VeryLazy",
  },

  -- Trouble
  {
    "folke/trouble.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
  },

  -- ZenMode
  {
    "folke/zen-mode.nvim",
    opts = {},
    event = "VeryLazy",
  },

  -- TODO comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    event = "BufRead",
  },

  -- Wakatime
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
  },

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
  -- Snowsql.nvim
  {
    -- "mgierada/snowsql.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    dir = "/Users/maciej/00_codes/snowsql.nvim.git/main",
    -- dir = "/Users/maciejgierada/01_PRACA_IT/02_side_projects/snowsql.nvim.git/main",
    config = function() require("snowsql").setup {} end,
    -- dev = true,
    event = "BufRead",
  },

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
