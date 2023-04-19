return {
  "terrortylor/nvim-comment",
  keys = {
      { "<leader>cl", "<cmd>CommentToggle<cr>", desc = "CommentToggle" },
  },
  config = function()
    require('nvim_comment').setup({line_mapping = "<leader>cl", operator_mapping = "<leader>c", comment_chunk_text_object = "ic"});
  end
}
