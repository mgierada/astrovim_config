return {
  -- tokyonight colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  -- kangawa colorscheme
  {
    "rebelot/kanagawa.nvim",
  },

  -- everforest colorscheme
  {
    "sainnhe/everforest",
    config = function() vim.g.everforest_background = "medium" end,
    event = "VimEnter",
  },

  -- nightfly colorscheme
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },

  -- moonflight colorscheme
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },

  -- catppuccin colorscheme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- onedarkpro colorscheme
  {
    "olimorris/onedarkpro.nvim",
    -- priority = 1000 -- Ensure it loads first
  },
  { "rose-pine/neovim", name = "rose-pine", event = "VimEnter" },
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, event = "VimEnter" },
}
