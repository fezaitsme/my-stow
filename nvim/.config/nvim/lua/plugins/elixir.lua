return {
  {
    "emmanueltouzery/elixir-extras.nvim",
    lazy = true,
    ft = "elixir",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      {
        "<leader>ed",
        function()
          require("elixir-extras").elixir_view_docs({})
        end,
        desc = "Elixir View Docs",
      },
      {
        "<leader>em",
        function()
          require("elixir-extras").elixir_view_docs({ include_mix_libs = true })
        end,
        desc = "Elixir View Docs (mix libs)",
      },
      {
        "<leader>ec",
        function()
          require("elixir-extras").module_complete()
        end,
        desc = "Elixir Module Complete",
      },
    },
    config = function()
      require("elixir-extras").setup_multiple_clause_gutter()
    end,
  },
  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")

      elixir.setup({
        nextls = { enable = true },
        elixirls = {
          enable = true,
          settings = elixirls.settings({
            dialyzerEnabled = false,
            enableTestLenses = false,
          }),
          on_attach = function(client, bufnr)
            vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
          end,
        },
        projectionist = {
          enable = true,
        },
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
