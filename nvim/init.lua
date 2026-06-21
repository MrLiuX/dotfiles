-- 插件管理器 lazy.nvim（自动安装 + 插件列表）
require('plugins.lazy')
require('plugins.markview')
require('core.options')
require('core.keymaps')
require('core.autocmds')

-- init.lua 本身自上而下执行，其中的 require 会按顺序加载和运行。如果你在插件配置中使用了其他模块的设置（例如，某个键映射依赖于插件的功能），就需要确保依赖的模块先被加载。
