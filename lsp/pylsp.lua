local venv_helper = require("python_find_venv")
return {
    before_init = function(_, config)
        local root = config.root_dir or vim.fn.getcwd()
        -- Use venv interpreter, if available
        local venv_helper = require("python_find_venv")
        local p = venv_helper.get_pylsp_cmd(root)
        config.cmd = p

        config.settings = config.settings or {}
        config.settings.pylsp = config.settings.pylsp or {}
        config.settings.pylsp.plugins = config.settings.pylsp.plugins or {}
        config.settings.pylsp.plugins.jedi = config.settings.pylsp.plugins.jedi or {}
        config.settings.pylsp.plugins.jedi.environment = venv_helper.get_python_path(root)
    end,

    settings = {
        pylsp = {
            plugins = {
                black = { enabled = true },
                pylsp_mypy = { enabled = true },
                isort = { enabled = true },
                jedi_completion = { enabled = true },
            },
        },
    },
}
