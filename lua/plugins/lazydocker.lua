return {
  -- Lazydocker.nvim
  {
    "mgierada/lazydocker.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    -- dir = "/Users/maciej/00_codes/lazydocker.nvim.git/main",
    config = function() require("lazydocker").setup {} end,
    -- dev = true,
    event = "BufRead",
  },
}
