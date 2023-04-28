if vim.fn.has("win32") ~= 0 then
	vim.o.shell = "powershell"
	vim.o.shellcmdflag =
	"-NoLogo -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
	vim.o.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
	vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
	vim.o.shellquote = ""
	vim.o.shellxquote = ""
end
