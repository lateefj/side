local palette

if vim.o.background == "light" then
  palette = {
    base00 = "#f1efee",
    base01 = "#e6e2e0",
    base02 = "#a8a19f",
    base03 = "#9c9491",
    base04 = "#766e6b",
    base05 = "#68615e",
    base06 = "#2c2421",
    base07 = "#1b1918",
    base08 = "#f22c40",
    base09 = "#df5320",
    base0A = "#c38418",
    base0B = "#7b9726",
    base0C = "#3d97b8",
    base0D = "#407ee7",
    base0E = "#6666ea",
    base0F = "#c33ff3",
  }
end

if vim.o.background == "dark" then
  palette = {
    base00 = "#1b1918",
    base01 = "#2c2421",
    base02 = "#68615e",
    base03 = "#766e6b",
    base04 = "#9c9491",
    base05 = "#a8a19f",
    base06 = "#e6e2e0",
    base07 = "#f1efee",
    base08 = "#f22c40",
    base09 = "#df5320",
    base0A = "#c38418",
    base0B = "#7b9726",
    base0C = "#3d97b8",
    base0D = "#407ee7",
    base0E = "#6666ea",
    base0F = "#c33ff3",
  }
end

if palette then
  require('mini.base16').setup({ palette = palette })
  vim.g.colors_name = 'atelier-forest'
  vim.cmd [[ highlight WinSeparator guibg=None ]]
end
