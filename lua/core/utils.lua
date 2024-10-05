local M = {}

function _get_config()
	local _config = {
		autoformat = true,
	}

	return function()
		return {
			toogle = function(key)
				_config[key] = not _config[key]
				vim.notify(
					"Option '" .. key .. "' is set to " .. tostring(_config[key]),
					vim.log.levels.INFO,
					{ title = "Mine configuration" }
				)
			end,

			get = function(key)
				-- vim.notify(
				-- 	"Try to get " .. key .. " and get " .. tostring(_config) .. ": " .. vim.inspect(_config),
				-- 	vim.log.levels.INFO,
				-- 	{ title = "Mine configuration" }
				-- )
				return _config[key]
			end,

			set = function(key, value)
				_config[key] = value
				vim.notify(
					"Option '" .. key .. "' is set to " .. tostring(_config[key]),
					vim.log.levels.INFO,
					{ title = "Mine configuration" }
				)
			end,
		}
	end
end

return {
	config = _get_config(),
}
