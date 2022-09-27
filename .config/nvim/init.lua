pcall(require, "impatient")

if require "mq.first_load"() then
  return
end

vim.g.mapleader = " "

vim.g.snippets = "luasnip"

require "mq.globals"

require "mq.disable_builtin"

require "mq.plugins"

require "mq.telescope.setup"
require "mq.telescope.mappings"
require "mq.dap"

-- require "mq.refactor"
require "mq.lsp"
