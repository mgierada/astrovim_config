return {
  -- nvim worktree
  {
    "/brandoncc/git-worktree.nvim",
    event = "VeryLazy",
    config = function() require("telescope").load_extension "git_worktree" end,
    branch = "catch-and-handle-telescope-related-error",
  },
}
