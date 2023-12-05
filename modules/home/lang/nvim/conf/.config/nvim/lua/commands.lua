local function git_root()
	local output = vim.fn.system('git rev-parse --show-toplevel')
	output = output:match("(.*)\n")
	local result = vim.v.shell_error

	if result ~= 0 then return end
	vim.api.nvim_set_current_dir(output)
end

vim.api.nvim_create_user_command('Gitroot', git_root, {})
-- vim.api.nvim_create_autocmd("BufEnter", { callback = git_root })
