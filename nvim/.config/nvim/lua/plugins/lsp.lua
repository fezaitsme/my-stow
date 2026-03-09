return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      -- Your expert LSP config
      vim.lsp.config("expert", {
        cmd = { "expert", "--stdio" },
        root_markers = { "mix.exs", ".git" },
        filetypes = { "elixir", "eelixir", "heex" },
      })
      vim.lsp.enable("expert")
    end,
  },
}
