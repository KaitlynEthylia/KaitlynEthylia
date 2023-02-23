function Transify(colour)
	colour = colour or 'rose-pine'
	vim.cmd.colorscheme(colour)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
end

if vim.bo.filetype == 'rust' then
	Transify("rose-pine")
else
	Transify()
end
