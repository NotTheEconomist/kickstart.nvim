local M = {}

local function join(...)
	return table.concat({ ... }, "/")
end

local function is_windows()
	return vim.loop.os_uname().sysname == "Windows_NT"
end

local function is_exe(p)
	return p and vim.fn.executable(p) == 1
end

local function is_windows_app_alias(p)
	return is_windows() and p:gsub("\\", "/"):lower():find("/microsoft/windowsapps/", 1, true) ~= nil
end

local function exepath(cmd)
	local p = vim.fn.exepath(cmd)
	if p and p ~= "" and not is_windows_app_alias(p) then
		return p
	end
end

local function venv_python(venv_dir)
	if is_windows() then
		return join(venv_dir, "Scripts", "python.exe")
	else
		return join(venv_dir, "bin", "python")
	end
end

function M.get_python_path(root_dir)
	-- activated virtualenv
	if vim.env.VIRTUAL_ENV and vim.env.VIRTUAL_ENV ~= "" then
		local p = venv_python(vim.env.VIRTUAL_ENV)
		if is_exe(p) then
			return p
		end
	end

	-- common project-local venv dirs
	for _, venv in ipairs({ ".venv", "venv", "env" }) do
		local p = venv_python(join(root_dir, venv))
		if is_exe(p) then
			return p
		end
	end

	-- Jedi needs a real interpreter path here, not the Windows "py" launcher.
	if is_windows() then
		return exepath("python") or exepath("python3")
	end
	return exepath("python3") or exepath("python")
end

function M.get_pylsp_cmd(root_dir)
	-- Prefer pylsp from the active venv / project venv if available
	local py = M.get_python_path(root_dir)

	if not py then
		return { "pylsp" }
	end

	-- If py is from a venv, try sibling pylsp first.
	local pylsp
	if is_windows() then
		pylsp = py:gsub("[/\\]Scripts[/\\]python%.exe$", "/Scripts/pylsp.exe")
	else
		pylsp = py:gsub("/bin/python$", "/bin/pylsp")
	end
	if pylsp ~= py and is_exe(pylsp) then
		return { pylsp }
	end

	-- Otherwise, use python -m pylsp if pylsp is importable in that interpreter
	-- (works if python-lsp-server is installed in the venv)
	return { py, "-m", "pylsp" }
end

return M
