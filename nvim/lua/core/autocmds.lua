-- 自动命令与映射
vim.fn.mkdir(vim.fn.stdpath 'config' .. '/undo', 'p')

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 200 }
  end,
})

vim.api.nvim_create_autocmd({ 'InsertEnter', 'InsertLeave' }, {
  callback = function(args)
    if args.event == 'InsertEnter' then
      vim.opt.relativenumber = false
    else
      vim.opt.relativenumber = true
    end
  end,
})