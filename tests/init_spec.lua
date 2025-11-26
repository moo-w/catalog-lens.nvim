---@module 'luassert'

local CatalogLen = require("catalog-lens")

describe("init module", function()
  it("setup delegates to config", function()
    local called_opts
    local Config = require("catalog-lens.config")
    local original_setup = Config.setup
    Config.setup = function(opts)
      called_opts = opts
    end

    CatalogLen.setup({ enabled = false })
    Config.setup = original_setup

    assert.are.same({ enabled = false }, called_opts)
  end)
end)
