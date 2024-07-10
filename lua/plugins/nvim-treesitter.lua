return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "go",
      "vue",
      "typescript",
      "javascript",
      "tsx",
      "css",
      "scss",
      "yaml",
      "python",
    },
    highlight = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
  build = ":TSUpdate",
  version = false,
}
