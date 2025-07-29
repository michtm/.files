--[[
Couleurs de base pour la plupart des groupes Neovim
]]
local colors = {}

local function clair()
  return {
    -- Couleurs de base
    bg = '#cdc8b0',
    fg = '#4e4b42',
    critical = '#780606', -- Rouge sang
    popout = '#cd664d',   -- Rouge-orange
    strong = '#000000',   -- Noir
    salient = '#3ba99f',  -- Bleu turquoise ?
    faded = '#a49f8c',    -- ???
    subtle = '#b4af9a',   -- ???
    -- Autres
    cursor = '#cdc8b0',   -- ???
  }
end

local function obscur()
   return {
    -- Couleurs de base
    bg = '#4e4b42',
    fg = '#cdc8b0',
    critical = '#780606', -- Rouge sang
    popout = '#cd664d',   -- Rouge-orange
    strong = '#000000',   -- Noir
    salient = '#3ba99f',  -- Bleu turquoise ?
    faded = '#a49f8c',    -- ???
    subtle = '#b4af9a',   -- ???
    -- Autres
    cursor = '#cdc8b0',   -- ???
}
end

function colors.palette(opts)
  return opts.background == "dark" and obscur() or clair()
end

return colors
