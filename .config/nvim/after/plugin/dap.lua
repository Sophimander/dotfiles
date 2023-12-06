vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = '[F5] Continue'})
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = '[F10] Step over'})
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = '[F11] Step into'})
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, { desc = '[F12] Step out'})
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end, { desc = 'Toggle [b]reakpoint'})
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end, { desc = 'Set [B]reakpoint'})
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { desc = 'Set [L]og [P]oint'})
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end, { desc = 'Open [D]ap [R]epl'})
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end, { desc = '[D]ap run [L]ast'})

local dap = require('dap')
dap.adapters.go = {
  type = 'executable';
  command = 'node';
  args = {os.getenv('HOME') .. '/vscode-go/dist/debugAdapter.js'};
}
dap.configurations.go = {
  {
    type = 'go';
    name = 'Debug';
    request = 'launch';
    showLog = false;
    program = "${file}";
    dlvToolPath = vim.fn.exepath(os.getenv('HOME') .. '/go/bin/dlv')  -- Adjust to where delve is installed
  },
}
dap.adapters.python = function(cb, config)
  if config.request == 'attach' then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or '127.0.0.1'
    cb({
      type = 'server',
      port = assert(port, '`connect.port` is required for a python `attach` configuration'),
      host = host,
      options = {
        source_filetype = 'python',
      },
    })
  else
    cb({
      type = 'executable',
      command = '/home/sophia/.virutalenv/debugpy/bin/python',
      args = { '-m', 'debugpy.adapter' },
      options = {
        source_filetype = 'python',
      },
    })
  end
end

local dap = require('dap')
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}
