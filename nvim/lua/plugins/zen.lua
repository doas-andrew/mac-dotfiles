local M = {}

local nu  = { number = false, relativenumber = false }
local ata = { window = { width = 0.70, options = nu } }
local foc = { window = { width = 1 } }
local cen = { window = { width = 0.70 } }
local min = { window = { width = 80, options = nu } }

function M.ataraxis()
    vim.cmd("PackerLoad zen-mode.nvim")
    require("zen-mode").toggle(ata)
end

function M.focus()
    vim.cmd("PackerLoad zen-mode.nvim")
    require("zen-mode").toggle(foc)
end

function M.centered()
    vim.cmd("PackerLoad zen-mode.nvim")
    require("zen-mode").toggle(cen)
end

function M.minimal()
    vim.cmd("PackerLoad zen-mode.nvim")
    require("zen-mode").toggle(min)
end

return M
