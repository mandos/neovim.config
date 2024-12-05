local M = {}

M.var_dump = function(var)
  vim.notify(vim.inspect(var), vim.log.levels.DEBUG, {}) 
end

return M
