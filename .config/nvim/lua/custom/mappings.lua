---@type MappingsTable
local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
	},
}

M.custom = {
	n = {
		["<leader>u"] = { "yypv$r-", "Underline" },
	},
}

-- more keybinds!

return M
