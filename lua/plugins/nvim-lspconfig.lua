return {
  "neovim/nvim-lspconfig",
  lazy = true,
  dependencies = { "folke/neodev.nvim" },
  config = function()
    vim.api.nvim_create_autocmd(
      "LspAttach",
      {
        callback = function(event)
          local bufmap = function(mode, lhs, rhs, desc)
            local opts = {buffer = event.buf, desc = desc}
            vim.keymap.set(mode, lhs, rhs, opts)
          end

          bufmap("n", "gd", vim.lsp.buf.definition, "Jumps to the definition of the symbol under the cursor.")
        end
      }
    )
  end,
}
