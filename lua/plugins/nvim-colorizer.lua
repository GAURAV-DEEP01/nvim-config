return {
	"NvChad/nvim-colorizer.lua",
	opts = {
		filetypes = {
			"css",
			"scss",
			"html",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"astro",
		},
		user_default_options = {
			tailwind = true,
			css = true,
			names = true,
			mode = "virtualtext", -- ← show colored square instead of text
			virtualtext = "■", -- ← customize the square character
		},
	},
	config = function(_, opts)
		require("colorizer").setup(opts)
	end,
}
