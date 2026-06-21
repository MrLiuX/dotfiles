local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
          custom_highlights = function(colors)
    return {
      StatusLine = { fg = colors.text, bg = "#1E1E2E" },   -- 激活窗口状态栏
      StatusLineNC = { bg = "#1E1E2E" },                  -- 非激活窗口状态栏
    }
  end,
        flavour = "mocha",
        transparent_background = false,
        term_colors = false,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
},

{
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && npm install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
},
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
  },
--  {
--    "OXY2DEV/markview.nvim",
--    lazy = false,

    -- Completion for `blink.cmp`
    -- dependencies = { "saghen/blink.cmp" },
--},
  -- 以下为插件示例，请按需取消注释或替换
  -- { '作者/仓库名' }
  -- {
  --   '作者/仓库名',
  --   cmd = { '命令' },
  --   event = { 'VeryLazy' },
  --   keys = { '<leader>k' },
  --   dependencies = { '依赖插件名' },
  --   config = function()
  --     -- 插件配置代码
  --   end,
  -- }
  -- { 'folke/tokyonight.nvim', priority = 1000, config = function()
  --   vim.cmd.colorscheme 'tokyonight-night'
  -- end },
}
