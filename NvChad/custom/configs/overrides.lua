local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "go",
    "json",
    "yaml",
    "rust",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- go stuff
    "golangci-lint-langserver",
    "gopls",
    "golangci-lint",
    -- "gospel",
    "go-debug-adapter",
    "gofumpt",
    "goimports",
    "goimports-reviser",
    "golines",
    "gomodifytags",
    "gotests",
    "gotestsum",
    "delve",

    -- docker stuff
    "docker-compose-language-service",

    -- json stuff
    "json-lsp",

    -- markdown
    "marksman",

    -- rust stuff
    "rust-analyzer",

    -- toml stuff
    "taplo",

    -- yaml stuff
    "yaml-language-server",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
