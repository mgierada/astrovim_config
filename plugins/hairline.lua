return {
  --hairline
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astronvim.utils.status"
      local package_info = require "package-info"
      -- Get the status from your custom component
      local custom_component_status = package_info.get_status()
      opts.statusline = { -- statusline
        hl = { fg = "fg", bg = "bg" },
        status.component.mode { mode_text = { padding = { left = 1, right = 1 } } }, -- add the mode text
        status.component.git_branch(),
        status.component.file_info { filetype = {}, filename = false, file_modified = false },
        status.component.git_diff(),
        status.component.diagnostics(),
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.lsp(),
        status.component.treesitter(),
        status.component.nav(),
        -- Add your custom component
        {
          text = custom_component_status,
          hl = { fg = "custom_fg_color", bg = "custom_bg_color" }, -- Adjust colors as needed
          padding = { left = 1, right = 1 }, -- Adjust padding as needed
        },
      }
      -- return the final configuration table
      return opts
    end,
  },
}
