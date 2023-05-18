return {
  "tpope/vim-fugitive",
  keys = {
    { "<leader>ga", ":Git fetch --all -p<cr>", desc = "Git fetch" },
    { "<leader>gl", ":Git pull<cr>", desc = "Git pull" },
    { "<leader>gdh", ":diffget //2<cr>", desc = "Git diff grab from left" },
    { "<leader>gdl", ":diffget //3<cr>", desc = "Git diff grab from right" },
    { "<leader>gs", ":Git<cr>", desc = "Git Status" },
    { "<leader>ggl", ":Git log<cr>", desc = "Git Log" },
  },
  cmd = { "G", "Git" },
}
