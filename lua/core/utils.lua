local var_dump = function(var)
	vim.notify(vim.inspect(var), vim.log.levels.DEBUG, {})
end

local safe_mt = {
	__newindex = function(_, key, _)
		error("You try to access not existent field (" .. key .. ")")
	end,
}

local function bool2str(var)
	if var == true then
		return "true"
	else
		return "false"
	end
end

local formatter = setmetatable({
	on = false,
	toggle = function(self)
		if self["on"] == true then
			self["on"] = false
			vim.notify("Turn OFF automatic formatter", vim.log.levels.INFO, { title = "config" })
		else
			self["on"] = true
			vim.notify("Turn ON automatic formatter", vim.log.levels.INFO, { title = "config" })
		end
		return self["on"]
	end,
}, safe_mt)

local M = {
	var_dump = var_dump,
	formatter = formatter,
}

return M
