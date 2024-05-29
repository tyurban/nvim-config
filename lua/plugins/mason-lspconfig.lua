return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
  },
  opts = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    return {
      ensure_installed = { "lua_ls" },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({
	    capabilities = capabilities,
          })
        end,
      },
    }
  end,
}
