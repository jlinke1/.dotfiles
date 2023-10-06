# echo nvim_get_current_buf()

local atttach_to_buffer = function(output_bufnr, command, pattern)
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = vim.api.nvim_create_augroup("autosavemagic", { clear = true }),
		callback = function()
			local append_data = function(_, data)
				if data then
					vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, data)
				end
			end

			vim.api.nvim_buf_set_lines(output_bufnr, 0, -1, false, command)
			vim.fn.jobstart(command, {
				stdout_buffered = true,
				on_stdout = append_data,
				on_stderr = append_data,
			})
		end,
	})
end

-- attach_to_buffer(22, { "go", "run", "main.go" }, "*.go")

vim.api.nvim_create_user_command("AutoRun", function()
	local bufnr = vim.fn.input("Bufnr: ")
	local pattern = vim.fn.input("Pattern: ")
	local command = vim.split(vim.fn.input("Command: "), " ")
	atttach_to_buffer(tonumber(bufnr), command, pattern)
end, {})
