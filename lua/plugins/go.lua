return {
	"ray-x/go.nvim",
	dependencies = { -- Lazy load dependencies
		"ray-x/guihua.lua",
	},
	config = function()
		require("go").setup()
	end,
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()', -- installs binaries
}
