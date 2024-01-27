-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode

  -- normal mode
  n = {
    -- nvim lsp
    ["<leader>aw"] = { function() vim.diagnostic.setqflist { severity = "W" } end },
    ["<leader>ae"] = { function() vim.diagnostic.setqflist { severity = "E" } end },

    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },

    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>s"] = { name = "Telescope" },

    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change scription but the same command

    -- harpoon mapping
    ["<leader>v"] = { function() require("harpoon.mark").add_file() end, desc = "Add mark to harpoon" },
    ["<leader>z"] = { function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle harpoon UI" },
    ["<tab>"] = { function() require("harpoon.ui").nav_next() end },

    -- Octo mappings
    ["<leader>pr"] = { "<cmd> Octo pr list<cr>", desc = "Toggle list of open PRs" },
    ["<leader>px"] = { "<cmd> Octo pr checks<cr>", desc = "Show checks for a given PR" },

    --Neotest mappings
    ["<leader>ts"] = { function() require("neotest").summary.toggle() end, desc = "Toggle tests summary" },

    -- git-worktree
    ["<leader>ss"] = {
      function() require("telescope").extensions.git_worktree.git_worktrees() end,
      desc = "Toggle git-worktree",
    },
    ["<leader>sc"] = {
      function() require("telescope").extensions.git_worktree.create_git_worktree() end,
      desc = "Create a new git-worktree",
    },

    -- trouble
    ["<leader>xx"] = { function() require("trouble").open() end, desc = "Open Trouble" },
    ["<leader>xw"] = {
      function() require("trouble").open "workspace_diagnostics" end,
      desc = "Open workspace diagnostics",
    },
    ["<leader>xd"] = {
      function() require("trouble").open "document_diagnostics" end,
      desc = "Open document diagnostics",
    },
    ["<leader>xq"] = { function() require("trouble").open "quickfix" end, desc = "Open quickfix" },
    ["<leader>xl"] = { function() require("trouble").open "loclist" end, desc = "Open loclist" },
    ["<leader>xR"] = { function() require("trouble").open "lsp_references" end, desc = "Open LSP references" },

    -- lsp additional mapping
    ["<leader>ll"] = { function() vim.lsp.inlay_hint(0, nil) end, desc = "Toggle Inlay Hints" },

    -- diff view current file history
    ["<leader>df"] = { "<cmd> DiffviewFileHistory % <cr>", desc = "Open file history of a current file" },
    ["<leader>dc"] = { "<cmd> DiffviewClose <cr>", desc = "Close diff view" },

    -- move lines in neovim - shortcut motion
    ["<A-j>"] = { ":m .+1<CR>==", desc = "Move line down" },
    ["<A-k>"] = { ":m .-2<CR>==", desc = "Move line up" },
  },

  -- visual line mode
  x = {
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", desc = "Move block of text down" },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv", desc = "Move block of text up" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
