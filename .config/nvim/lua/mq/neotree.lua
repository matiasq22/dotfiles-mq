require("neo-tree").setup({
      window = {
        position = 'right',
        width = 50,
        mappings = {
          ["P"] = { "toggle_preview", config = { use_float = true } },
        }
      }
})
