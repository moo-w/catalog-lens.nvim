local M = {}

---@param opts? catalog-lens.Config
function M.setup(opts)
  require("catalog-lens.config").setup(opts)

  local server_paths = vim.api.nvim_get_runtime_file("catalog-lens-lsp/server.js", false)[1]
  require("catalog-lens.lsp").setup(server_paths)

  if not require("catalog-lens.config").enabled then
    M.disable()
  end
end

function M.enable()
  require("catalog-lens.config").enabled = true
  vim.lsp.enable("catalog_ls", true)
end

function M.disable()
  require("catalog-lens.config").enabled = false
  vim.lsp.enable("catalog_ls", false)
end

function M.toggle()
  if require("catalog-lens.config").enabled then
    M.disable()
  else
    M.enable()
  end
end

return M
