-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- nvim lsp
    ["<leader>aw"] = { function() vim.diagnostic.setqflist { severity = "W" } end },
    ["<leader>aa"] = { function() vim.diagnostic.setqflist { severity = "E" } end },
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
    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change scription but the same command
    -- harpoon mapping
    ["<leader>a"] = { function() require("harpoon.mark").add_file() end, desc = "Add mark to harpoon" },
    ["<leader>z"] = { function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle harpoon UI" },
    ["<tab>"] = { function() require("harpoon.ui").nav_next() end },
    -- Octo mappings
    ["<leader>pr"] = { "<cmd> Octo pr list<cr>", desc = "Toggle list of open PRs" },
    --Neotest mappings
    ["<leader>ts"] = { function() require("neotest").summary.toggle() end, desc = "Toggle tests summary" },
    -- git-worktree
    ["<leader>ss"] = {
      function() require("telescope").extensions.git_worktree.git_worktrees() end,
      desc = "Toggle git-worktree",
    },
    ["<leader>sc"] = {
      function() require("telescope").extensions.git_worktree.create_git_worktree() end,
      desc = "Toggle git-worktree",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
