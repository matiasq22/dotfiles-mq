require("formatting_sync")
require("mq.utils")
local function select_client(method)
    local clients = vim.tbl_values(vim.lsp.buf_get_clients())
    clients = vim.tbl_filter(function(client)
        return client.supports_method(method)
    end, clients)

    for i = 1, #clients do
        if clients[i].name == "efm" then
            return clients[i]
        end
    end

    return nil
end

function formatting_sync(options, timeout_ms)
    local client = select_client("textDocument/formatting")
    if client == nil then
        return
    end

    local params = util.make_formatting_params(options)
    local result, err =
    client.request_sync("textDocument/formatting", params, timeout_ms, vim.api.nvim_get_current_buf())
    if result and result.result then
        util.apply_text_edits(result.result)
    elseif err then
        vim.notify("vim.lsp.buf.formatting_sync: " .. err, vim.log.levels.WARN)
    end
end
