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
        if is_exe(p) then return p end
    end

    -- fallback to common paths
    if is_windows() then
        -- "py" launcher is common on Windows
        if is_exe("py") then return "py" end
        if is_exe("python3") then return "python3" end
        return "python"
    else
        if is_exe("python3") then return "python3" end
        return "python"
    end
end

function M.get_pylsp_cmd(root_dir)
  -- Prefer pylsp from the active venv / project venv if available
  local py = M.get_python_path(root_dir)

  -- If py is an absolute venv python, try sibling "pylsp"
  -- venv layout: <venv>/bin/python and <venv>/bin/pylsp
  if py:match("^/") and py:match("/bin/python$") then
    local pylsp = py:gsub("/bin/python$", "/bin/pylsp")
    if is_exe(pylsp) then
      return { pylsp }
    end
  end

  -- Otherwise, use python -m pylsp if pylsp is importable in that interpreter
  -- (works if python-lsp-server is installed in the venv)
  return { py, "-m", "pylsp" }
end

return M
