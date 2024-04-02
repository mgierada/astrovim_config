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
    event = "BufRead",
  },
}
