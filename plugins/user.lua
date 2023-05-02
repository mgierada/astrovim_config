return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  --
  -- {
  --   -- github copilot
  --   "github/copilot.vim",
  --   -- config = function() require("copilot").setup()
  --   event = "VeryLazy",
  -- },
  --
  --
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "nvim-lua/popup.nvim",
      "nvim-telescope/telescope.nvim",
    },
    -- ops = {},
    config = function() require("octo").setup {} end,
    event = "VeryLazy",
  },
  { "ThePrimeagen/harpoon", config = function() require("harpoon").setup {} end },
}
