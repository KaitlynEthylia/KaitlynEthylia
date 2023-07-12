local function GetTerminalSize(term, axis)
	local val = ({
		["horizontal"] = math.ceil(vim.o.lines * 0.9),
		["vertical"] = math.ceil(vim.o.columns * 0.9),
		["float"] = {
			["width"] = math.ceil(vim.o.columns * 0.6),
			["height"] = math.ceil(vim.o.lines * 0.6),
		},
	})[term.direction]

	if type(val) == "table" then
		val = val[axis]
	end

	return val
end

return {
	{
		'akinsho/toggleterm.nvim',
		config = function()
			require("toggleterm").setup {
				open_mapping = "<C-t>",
				size = GetTerminalSize,
				direction = 'float',
				float_opts = {
					border = 'curved',
					width = function(term) return GetTerminalSize(term, "width") end,
					height = function(term) return GetTerminalSize(term, "height") end,
				},
				hightlights = {},
			}
		end,
		cmd = 'ToggleTerm',
		keys = { {
			'<C-t>',
			'<CMD>ToggleTerm<CR>',
			{ desc = "Open floating Terminal." },
		} }
	},
}
