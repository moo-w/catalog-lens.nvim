local M = {}

---@param opts? catalog-lens.Config
function M.setup(opts)
  require("catalog-lens.config").setup(opts)

  local server_paths = vim.api.nvim_get_runtime_file("catalog-lens-lsp/server.js", false)[1]
  require("catalog-lens.lsp").setup(server_paths)
end

return M
