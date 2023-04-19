return
{
	{"jwalton512/vim-blade"},
	-- Example for neo-tree.nvim
{
  "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<C-f>", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    config = function()
      require("neo-tree").setup()
    end,
},
  {
    "tpope/vim-dispatch",
    cmd = { "Make", "Dispatch" },
  },
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-rhubarb",
  "tpope/vim-dotenv",
  "tpope/vim-eunuch",
}

