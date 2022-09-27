local telescope_mapper = require("mq.telescope.mappings")

local filetype_attach = setmetatable({
    go = function(_)
        vim.cmd([[
      augroup lsp_buf_format
        au! BufWritePre <buffer>
        autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()
      augroup END
    ]]   )
    end,

    gdscript = function(_) end,
}, {
    __index = function()
        return function() end
    end,
})

local function on_attach(client)
    local filetype = vim.api.nvim_buf_get_option(0, "filetype")
    -- keymaps for lsp
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, { buffer = 0 })
    vim.keymap.set("n", "<leader>vf", function()
        return vim.lsp.buf.format(nil, 2000, { async = true })
    end, { buffer = 0 })
    vim.keymap.set("n", "vn", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<leader>vp", vim.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, { buffer = 0 })
    vim.keymap.set("i", "<c-h>", vim.lsp.buf.signature_help, { buffer = 0 })
    vim.keymap.set("n", "<leader>vo", ":LspRestart<cr>", { noremap = true })

    telescope_mapper("gr", "lsp_references", nil, true)
    telescope_mapper("<leader>pv", "find_symbol", nil, true)
    telescope_mapper("<leader>pd", "lsp_document_symbols", nil, true)

    vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Attach any filetype specific options to the client
    filetype_attach[filetype](client)
end

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    if server.name == "emmet_ls" then
        opts.filetypes = { "html", "css", "blade", "typescriptreact", "php" }
    end

    opts.on_attach = on_attach
    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    server:setup(opts)
    vim.cmd([[ do User LspAttachBuffers ]])
end)

require("lspconfig").gdscript.setup({
    on_attach = on_attach,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 2, prefix = "●" },
    severity_sort = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local function formatting(options)
    local client = select_client("textDocument/formatting")
    if client == nil then
        return
    end

    local params = util.make_formatting_params(options)
    return client.request("textDocument/formatting", params, vim.api.nvim_get_current_buf())
end

vim.lsp.buf.formatting = formatting

function range_formatting(options, start_pos, end_pos)
    local client = select_client("textDocument/rangeFormatting")
    if client == nil then
        return
    end

    local params = util.make_given_range_params(start_pos, end_pos)
    params.options = util.make_formatting_params(options).options
    return client.request("textDocument/rangeFormatting", params)
end

vim.lsp.buf.range_formatting = range_formatting