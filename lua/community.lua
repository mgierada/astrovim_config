-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
	"AstroNvim/astrocommunity",
	-- { import = "astrocommunity.pack.lua" },
	{
		import = "astrocommunity.completion.copilot-lua-cmp",
		-- override the default configuration so that it runs of markdown files

		config = {
			filetypes = { markdown = true, yaml = true },
		},
		--
	},
	-- import/override with your plugins folder
}
