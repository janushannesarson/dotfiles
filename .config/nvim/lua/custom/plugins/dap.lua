return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-dap-python",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		require("dapui").setup()
		require('dap-python').setup("~/.virtualenvs/debugpy/bin/python")
	end,
}
