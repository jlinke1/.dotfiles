local wezterm = require("wezterm")
local act = wezterm.action

local plugin = {}

local fd = "/opt/homebrew/bin/fd"
local workspace = "/Users/jonaslinke/workspace/github.com/"

plugin.toggle = function(window, pane)
	local projects = {}
	local home = os.getenv("HOME") .. "/"

	local success, stdout, stderr = wezterm.run_child_process({
		fd,
		"-HI",
		"-td",
		"--max-depth=1",
		"--prune",
		".",
		workspace .. "FlexPwr",
		workspace .. "jlinke1"
		-- add more paths here
	})

	if not success then
		wezterm.log_error("Failed to run fd: " .. stderr)
		return
	end

	-- fill table with results
	for line in stdout:gmatch("([^\n]*)\n?") do
		local project = line
		local label = project:gsub(home, "")
		local _, _, id = string.find(project, ".*/(.+)/")

		-- handle git bare repositories,
		-- assuming following name convention `myproject.git`
		if string.match(project, "%.git/$") then
			success, stdout, stderr =
			    wezterm.run_child_process({ fd, "-HI", "-td", "--max-depth=1", ".", project .. "worktrees" })
			if success then
				for wt_line in stdout:gmatch("([^\n]*)\n?") do
					local wt_project = wt_line
					local wt_label = wt_project:gsub(home, "")
					local wt_id = wt_project
					table.insert(projects, { label = tostring(wt_label), id = tostring(wt_id) })
				end
			else
				wezterm.log_error("Failed to run fd for git worktree: " .. stderr)
			end
		end

		table.insert(projects, { label = tostring(label), id = tostring(id) })
	end

	local last_workspace = wezterm.mux.get_active_workspace()
	window:perform_action(
		act.InputSelector({
			action = wezterm.action_callback(function(win, _, id, label)
				if not id and not label then
					wezterm.log_info("Cancelled")
				else
					wezterm.log_info("Selected " .. label)
					win:perform_action(
						act.SwitchToWorkspace({
							name = id,
							spawn = { cwd = home .. label },
						}),
						pane
					)
				end
			end),
			fuzzy = true,
			title = "Select project",
			fuzzy_description = "Select a project:",
			choices = projects,
		}),
		pane
	)

	plugin.set_most_recent_workspace(last_workspace)
end

plugin.active = function(window, pane)
	local projects = {}
	local workspaces = wezterm.mux.get_workspace_names()

	for _, ws in ipairs(workspaces) do
		table.insert(projects, { label = tostring(ws), id = tostring(ws) })
	end

	local last_workspace = wezterm.mux.get_active_workspace()
	window:perform_action(
		act.InputSelector({
			action = wezterm.action_callback(function(win, _, id, label)
				if not id and not label then
					wezterm.log_info("Cancelled")
				else
					wezterm.log_info("Selected " .. label)
					win:perform_action(
						act.SwitchToWorkspace({
							name = id,
						}),
						pane
					)
				end
			end),
			fuzzy = true,
			title = "Select project",
			fuzzy_description = "Select a project:",
			choices = projects,
		}),
		pane
	)

	plugin.set_most_recent_workspace(last_workspace)
end

plugin.set_most_recent_workspace = function(id)
	if not wezterm.GLOBAL.sessionzer then
		wezterm.GLOBAL.sessionzer = {}
	end

	wezterm.GLOBAL.sessionzer.most_recent = {
		id = id,
		label = "Recent (" .. id .. ")",
	}
end

plugin.get_most_recent_workspace = function()
	return wezterm.GLOBAL.sessionzer.most_recent
end

plugin.switch_to_most_recent_workspace = function(window, pane)
	local last_workspace = wezterm.mux.get_active_workspace()
	local recent = plugin.get_most_recent_workspace()
	if recent then
		window:perform_action(act.SwitchToWorkspace({ name = recent.id }), pane)
	end

	plugin.set_most_recent_workspace(last_workspace)
end

return plugin
