return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    handlers = {
      function(server_name)
        require("lspconfig")[server_name].setup({})
      end,
    },
  },
}
