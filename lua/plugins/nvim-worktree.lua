return {
	-- nvim worktree
	{
		"mgierada/git-worktree.nvim",
		-- dir = "/Users/maciej/00_codes/git-worktree.nvim.git/do-not-notify-worktree-changed/",
		event = "VeryLazy",
		config = function()
			require("telescope").load_extension("git_worktree")
		end,
		-- branch = "do-not-notify-worktree-changed",

		-- config = function()
		-- 	local git_worktree = require("git-worktree")
		-- 	git_worktree.setup({
		-- 		enable_notifications = false,
		-- 	})
		-- 	require("telescope").load_extension("git_worktree")
		-- end,
	},
}
