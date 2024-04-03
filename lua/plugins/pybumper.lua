return {
  -- Pybumper
  {
    "mgierada/pybumper.nvim",
    -- dir = "/Users/maciej/00_codes/pybumper.git/main",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function() require("pybumper").setup {} end,
    -- dev = true,
    event = "BufRead",
  },
}
