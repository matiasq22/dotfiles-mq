return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<C-f>", "<cmd>Neotree<cr>", desc = "NeoTree" },
		-- Example for neo-tree.nvim
	},
	config = function()
		require("mq.neotree")
	end,
}
