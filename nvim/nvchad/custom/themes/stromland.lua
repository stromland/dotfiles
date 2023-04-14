local M = {}

M.base_30 = {
  white = "#DCDFE4",
  darker_black = "#181920",
  black = "#1f2028", --  nvim bg
  black2 = "#272932",
  one_bg = "#404352",
  one_bg2 = "#272932", -- StatusBar (filename)
  one_bg3 = "#404352",
  grey = "#939498", -- Line numbers
  grey_fg = "#67696f", -- Comments
  grey_fg2 = "#67696f",
  light_grey = "#939498",
  red = "#E06C75", -- StatusBar (username)
  baby_pink = "#E059AA",
  pink = "#E059AA",
  line = "#9E8672", -- for lines like vertsplit
  green = "#98C379", -- StatusBar (file percentage)
  vibrant_green = "#98C379",
  nord_blue = "#61AFEF", -- Mode indicator
  blue = "#61AFEF",
  teal = "#56B6C2",
  cyan = "#56B6C2",
  yellow = "#E5C07B",
  sun = "#E5C07B",
  orange = "#E5C07B",
  purple = "#C678DD",
  dark_purple = "#C678DD",
  statusline_bg = "#23242d",
  lightbg = "#1f2028",
  pmenu_bg = "#9E8672", -- Command bar suggestions
  folder_bg = "#61AFEF",
}

M.base_16 = {
  base00 = "#1f2028", -- Default bg
  base01 = "#272932", -- Lighter bg (status bar, line number, folding mks)
  base02 = "#404352", -- Selection bg
  base03 = "#6a553f", -- Comments, invisibles, line hl
  base04 = "#DCDFE4", -- Dark fg (status bars)
  base05 = "#DCDFE4", -- Default fg (caret, delimiters, Operators)
  base06 = "#DCDFE4", -- Light fg (not often used)
  base07 = "#DCDFE4", -- Light bg (not often used)
  base08 = "#DCDFE4", -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base09 = "#56B6C2", -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
  base0A = "#C678DD", -- Classes, Markup Bold, Search Text Background
  base0B = "#98C379", -- Strings, Inherited Class, Markup Code, Diff Inserted
  base0C = "#E5C07B", -- Support, regex, escape chars
  base0D = "#E5C07B", -- Function, methods, headings
  base0E = "#9E8672", -- Keywords
  base0F = "#DCDFE4", -- Deprecated, open/close embedded tags
}

M.type = "dark"

return M
