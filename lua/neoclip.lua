local M = {}

local settings = require('neoclip.settings')

M.stopped = false

local function setup_auto_command()
    vim.cmd([[
        augroup neoclip
            autocmd!
            autocmd TextYankPost * :lua require("neoclip.handlers").handle_yank_post()
        augroup end
    ]])
end

M.stop = function()
    M.stopped = true
end

M.start = function()
    M.stopped = false
end

M.toggle = function()
    M.stopped = not M.stopped
end

M.setup = function(opts)
    settings.setup(opts)
    setup_auto_command()
end

return M
