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