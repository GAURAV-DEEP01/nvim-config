return {
	"dfinity/motoko",
	ft = "motoko",
	config = function()
		vim.cmd("set filetype=motoko")
	end,
	init = function()
		vim.filetype.add({
			extension = {
				mo = "motoko",
			},
		})
	end,
}
