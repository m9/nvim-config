return {
	"github/copilot.vim",
	config = function()
		vim.g.copilot_filetypes = {
			["*"] = false,

			["lua"] = true,
			["ruby"] = true,
			["python"] = true,
			["javascript"] = true,
			["typescript"] = true,
			["go"] = true,
			["html"] = true,
			["css"] = true,
			["scss"] = true,
			["json"] = true,
			["yaml"] = true,
			["markdown"] = true,
			["sh"] = true,
			["vim"] = true,
			["sql"] = true,
			["elixir"] = true,
			["erlang"] = true,
			["perl"] = true,
			["bash"] = true,
		}
	end,
}
