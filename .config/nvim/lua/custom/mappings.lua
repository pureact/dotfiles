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
    ["<leader>tw"] = { "<cmd> %s/\\s\\+$//e <CR>", "Trim Whitespace"}
	},
}

-- more keybinds!

return M
