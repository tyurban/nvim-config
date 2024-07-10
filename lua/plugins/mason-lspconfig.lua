return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
  },
  opts = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")

    return {
      ensure_installed = { "lua_ls", "gopls", "jsonls", "tsserver", "volar", "yamlls", "pyright" },
      handlers = {
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["tsserver"] = function()
          lspconfig.tsserver.setup({
            init_options = {
              plugins = {
                {
                  name = "@vue/typescript-plugin",
                  location = vim.api.nvim_call_function("stdpath", {"data"}) .. "/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin",
                  languages = { "javascript", "typescript", "vue" },
                },
              },
            },
            filetypes = { "javascript", "typescript", "vue" },
          })
        end,
      },
    }
  end,
}
