return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		spec = {
			{ '<leader>c', group = '[C]ode',     mode = { 'n' } },
			{ '<leader>d', group = '[D]ocument' },
			{ '<leader>r', group = '[R]ename' },
			{ '<leader>s', group = '[S]earch' },
			{ '<leader>w', group = '[W]orkspace' },
			{ '<leader>t', group = '[T]oggle' },
			{ '<leader>h', group = 'Git [H]unk', mode = { 'n' } },
		},
		delay = function(ctx)
			return 0
		end,
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({
					global = false,

				})
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
