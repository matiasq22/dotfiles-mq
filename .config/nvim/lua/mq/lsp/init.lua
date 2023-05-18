-- LSP configuration

-- install servers and tools
require "mq.lsp.mason"

local lspconfig = require "lspconfig"
local servers = require "mq.lsp.servers"


for server, setup in pairs(servers) do
    lspconfig[server].setup(setup())
end

require "mq.lsp.null-ls"
