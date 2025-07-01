-- C: GNU Style
vim.api.nvim_create_autocmd(
  "BufWritePre",
  {
    pattern = { "*.c", "*.h" },
    callback = function ()
      vim.cmd("%!clang-format")
    end,
  }
)
-- Application du schéma de couleurs
vim.cmd.colorscheme('clair')