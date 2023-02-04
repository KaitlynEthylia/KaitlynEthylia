function Transify(colour)
	colour = colour or 'dracula'
	vim.cmd.colorscheme(colour)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

Transify()
