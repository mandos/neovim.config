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
	value = true,
	is_on = function(self)
		return self["value"] == true
	end,
	is_off = function(self)
		return self["value"] == false
	end,
	toggle = function(self)
		if self["value"] == true then
			self["value"] = false
			vim.notify("Turn OFF automatic formatter", vim.log.levels.INFO, { title = "config" })
		else
			self["value"] = true
			vim.notify("Turn ON automatic formatter", vim.log.levels.INFO, { title = "config" })
		end
		return self["value"]
	end,
	on = function(self)
		self["value"] = true
		vim.notify("Turn ON automatic formatter", vim.log.levels.INFO, { title = "config" })
	end,
	off = function(self)
		self["value"] = false
		vim.notify("Turn OFF automatic formatter", vim.log.levels.INFO, { title = "config" })
	end,
}, safe_mt)

local M = {
	var_dump = var_dump,
	formatter = formatter,
}

return M
