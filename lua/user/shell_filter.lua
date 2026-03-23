local M = {}

local function normalize_visual_range(start_row, start_col, end_row, end_col)
	if start_row > end_row or (start_row == end_row and start_col > end_col) then
		return end_row, end_col, start_row, start_col
	end

	return start_row, start_col, end_row, end_col
end

local function leave_visual_mode()
	vim.schedule(function()
		vim.api.nvim_feedkeys(vim.keycode("<Esc>"), "nx", false)
	end)
end

local function reselect_replacement(mode, start_row, start_col, replacement)
	if #replacement == 0 or (#replacement == 1 and replacement[1] == "") then
		leave_visual_mode()
		return
	end

	local end_row = start_row + #replacement - 1
	if mode == "V" then
		vim.fn.setpos("'<", { 0, start_row + 1, 1, 0 })
		vim.fn.setpos("'>", { 0, end_row + 1, 1, 0 })
	else
		local last_line_len = #replacement[#replacement]
		local end_col = last_line_len
		if #replacement == 1 then
			end_col = start_col + last_line_len
		end

		vim.fn.setpos("'<", { 0, start_row + 1, start_col + 1, 0 })
		vim.fn.setpos("'>", { 0, end_row + 1, math.max(end_col, 1), 0 })
	end

	vim.schedule(function()
		vim.api.nvim_feedkeys("gv", "nx", false)
	end)
end

function M.filter_selection()
	local command = vim.fn.input("Shell command: ")
	if command == "" then
		return
	end

	local mode = vim.fn.visualmode()
	if mode == "\22" then
		vim.notify("Blockwise visual mode is not supported for shell filtering", vim.log.levels.WARN)
		return
	end

	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")
	local start_row, start_col, end_row, end_col = normalize_visual_range(
		start_pos[2] - 1,
		start_pos[3] - 1,
		end_pos[2] - 1,
		end_pos[3]
	)

	local input
	if mode == "V" then
		input = table.concat(vim.api.nvim_buf_get_lines(0, start_row, end_row + 1, false), "\n")
	else
		input = table.concat(vim.api.nvim_buf_get_text(0, start_row, start_col, end_row, end_col, {}), "\n")
	end

	local output = vim.fn.system(command, input)
	if vim.v.shell_error ~= 0 then
		local message = vim.trim(output)
		if message == "" then
			message = ("Shell command failed with exit code %d"):format(vim.v.shell_error)
		end
		vim.notify(message, vim.log.levels.ERROR)
		return
	end

	output = vim.trim(output)
	if mode == "V" then
		local replacement = output == "" and {} or vim.split(output, "\n", { plain = true })
		vim.api.nvim_buf_set_lines(0, start_row, end_row + 1, false, replacement)
		reselect_replacement(mode, start_row, start_col, replacement)
		return
	end

	local replacement = output == "" and { "" } or vim.split(output, "\n", { plain = true })
	vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col, replacement)
	reselect_replacement(mode, start_row, start_col, replacement)
end

return M
