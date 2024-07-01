local function git_branch()
	if vim.fn.isdirectory(".git") == 0 then
		return "[~]"
	end

	local branch = vim.fn.system("git branch --show-current | tr -d '\n'")
	return string.format("[%s]", branch)
end

local function lsp()
	local count = {}
	local levels = {
		errors = vim.diagnostic.severity.ERROR,
		warnings = vim.diagnostic.severity.WARN,
		info = vim.diagnostic.severity.INFO,
		hints = vim.diagnostic.severity.HINT,
	}

	for k, level in pairs(levels) do
		count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
	end

	local show_lsp = false
	local errors = ""
	local warnings = ""
	local hints = ""
	local info = ""

	if count["errors"] ~= 0 then
		show_lsp = true
		errors = " E: " .. count["errors"]
	end
	if count["warnings"] ~= 0 then
		show_lsp = true
		warnings = " W: " .. count["warnings"]
	end
	if count["hints"] ~= 0 then
		show_lsp = true
		hints = " H: " .. count["hints"]
	end
	if count["info"] ~= 0 then
		show_lsp = true
		info = " I: " .. count["info"]
	end

	if not show_lsp then
		return "%#Normal#"
	end

	return string.format(" [LSP:%s%s%s%s] %s", errors, warnings, hints, info, "%#Normal#")
end

Statusline = {}

Statusline.active = function()
	local file_name = " %f %m"
	local align_right = " %="
	local file_type = " %y"
	local percentage = " %p%%"
	local linecol = " %l:%c"

	return table.concat({
		git_branch(),
		file_name,
		"%#Normal#",
		lsp(),
		align_right,
		file_type,
		percentage,
		linecol,
	})
end

vim.opt.statusline = "%!v:lua.Statusline.active()"

return {}
