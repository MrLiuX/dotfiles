-- KeyMap
----------------------------------------------
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set("n", "<Leader>w", ":w<CR>", {desc = "保存文件"})
vim.keymap.set("n", "<Leader>q", ":q<CR>", {desc = "退出文件"})
vim.keymap.set("i", "<C-a>", "<C-o>^", { desc = "跳到第一个非空字符" })
vim.keymap.set('i', '<C-k>', '<C-o>D', { desc = '删除到行尾' })

--[[
-- 禁用方向键（鼓励使用hjkl）
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")

-- 插入模式映射
vim.keymap.set("i", "jj", "<Esc>", {desc = "退出插入模式"})

-- 可视模式映射
vim.keymap.set("v", "J", ":m '>+1<CR>gv", {desc = "向下移动行"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv", {desc = "向上移动行"})

-- 命令行模式映射
vim.keymap.set("c", "<C-a>", "<Home>", {desc = "命令行光标到行首"})

-- 函数映射
vim.keymap.set("n", "<Leader>lf", function()
    vim.lsp.buf.format()
end, {desc = "LSP格式化"})

-- 递归映射（谨慎使用）
vim.keymap.set("n", "J", "5j", {remap = true})

-- 表达式映射
vim.keymap.set("i", "<C-h>", function()
    return vim.fn.strpart(vim.fn.getline('.'), 0, vim.fn.col('.') - 1)
end, {expr = true})

-- Buffer 本地映射
vim.keymap.set("n", "<Leader>q", ":q<CR>", {buffer = 0, desc = "关闭当前buffer"})

-- 批量设置映射
local opts = {silent = true, noremap = true}
local mappings = {
    ["<Leader>w"] = ":w<CR>",
    ["<Leader>q"] = ":q<CR>",
    ["<Leader>e"] = ":Ex<CR>",
}
for lhs, rhs in pairs(mappings) do
    vim.keymap.set("n", lhs, rhs, opts)
end
]]
