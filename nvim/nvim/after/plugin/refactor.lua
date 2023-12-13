local refactor = require("refactoring")
refactor.setup({
	prompt_func_return_type = {
		go = true,
	},
	-- prompt for function parameters
	prompt_func_param_type = {
		go = true,
	},
})

vim.keymap.set("x", "<leader>re", function() require('refactoring').refactor('Extract Function') end,
	{ desc = "[R]efactor [E]xtract" })
vim.keymap.set("x", "<leader>rv", function() require('refactoring').refactor('Extract Variable') end,
	{ desc = "[R]efactor extract [V]ariable" })
vim.keymap.set("n", "<leader>rI", function() require('refactoring').refactor('Inline Function') end, {
	desc = "[R]efactor [I]nline", })
-- Inline func supports only normal
vim.keymap.set({ "n", "x" }, "<leader>ri", function() require('refactoring').refactor('Inline Variable') end,
	{ desc = "[R]efactor [i]nline variable" })

-- You can also use below = true here to to change the position of the printf
-- statement (or set two remaps for either one). This remap must be made in normal mode.
vim.keymap.set(
	"n",
	"<leader>rp",
	function() require('refactoring').debug.printf({ below = false }) end,
	{ desc = "[R]efactor [P]rintf" }
)
vim.keymap.set("n", "<leader>rc", function() require('refactoring').debug.cleanup({}) end,
	{ desc = "[R]efactor [C]leanup" })
