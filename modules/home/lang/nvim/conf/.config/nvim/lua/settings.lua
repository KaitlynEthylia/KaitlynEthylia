local opt = vim.o

opt.autochdir = true

opt.number = true
opt.relativenumber = true

opt.smarttab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false

opt.wrap = false

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 50

opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevelstart = 99
