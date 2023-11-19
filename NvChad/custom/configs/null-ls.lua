local present, null_ls = pcall(require, "null-ls")
if not present then
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
  sources = {
    -- choosed deno for ts/js files cuz its very fast!
    null_ls.builtins.formatting.deno_fmt,
    -- so prettier works only on these filetypes
    null_ls.builtins.formatting.prettier.with { filetypes = { "html", "markdown", "css", "json" } },

    -- Lua
    null_ls.builtins.formatting.stylua,

    -- cpp
    null_ls.builtins.formatting.clang_format,

    -- go
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines,
    null_ls.builtins.diagnostics.golangci_lint,

    -- shell
    null_ls.builtins.diagnostics.shellcheck,
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
return opts
