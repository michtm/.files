local colors = require('colorscheme.clairobscur.colors')
local groups = require('colorscheme.clairobscur.groups')
-- TODO Appeler un module qui contrôle le niveau de contraste suivant WCAG 2.2
-- Contrôle de contraste: https://www.audioeye.com/color-contrast-checker/
local theme = {}

local function set_terminal_colors(opts)
  local palette = colors.palette(opts)
  vim.g.terminal_color_0 = '#000000'
  vim.g.terminal_color_1 = '#800000'
  vim.g.terminal_color_2 = '#008000'
  vim.g.terminal_color_3 = '#808000'
  vim.g.terminal_color_4 = '#000080'
  vim.g.terminal_color_5 = '#800080'
  vim.g.terminal_color_6 = '#008080'
  vim.g.terminal_color_7 = '#c0c0c0'
  vim.g.terminal_color_8 = '#808080'
  vim.g.terminal_color_9 = '#ff0000'
  vim.g.terminal_color_10 = '#00ff00'
  vim.g.terminal_color_11 = '#ffff00'
  vim.g.terminal_color_12 = '#0000ff'
  vim.g.terminal_color_13 = '#ff00ff'
  vim.g.terminal_color_14 = '#00ffff'
  vim.g.terminal_color_15 = '#ffffff' 
  vim.g.terminal_color_background = palette.bg
  vim.g.terminal_color_foreground = palette.fg
end

function theme.load(opts)
  vim.cmd.highlight('clear')
  vim.opt.termguicolors = true
  vim.opt.background = opts.background
  vim.g.colors_name = opts.background == "dark" and 'obscur' or 'clair'
  set_terminal_colors(opts)
  groups.apply(opts)
end

return theme
