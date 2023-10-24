return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity
  {
    import = "astrocommunity.completion.copilot-lua-cmp",
    -- override the default configuration so that it runs of markdown files

    config = {
      filetypes = { markdown = true, yaml = true },
    },
    --
  },
  --brew install font-hack-nerd-fontcolorscheme
}
