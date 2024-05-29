local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

local pre_lazy_runtime_paths = vim.api.nvim_list_runtime_paths()
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = {
    colorscheme = { "default" },
  },
  ui = { border = "rounded" },
})

for _, value in ipairs(pre_lazy_runtime_paths) do
  vim.opt.rtp:prepend(value)
end
