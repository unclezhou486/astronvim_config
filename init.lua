-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  if vim.v.shell_error ~= 0 then
    -- stylua: ignore
    vim.api.nvim_echo({ { ("Error cloning lazy.nvim:\n%s\n"):format(result), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
  end
end

vim.opt.rtp:prepend(lazypath)


-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

vim.api.nvim_set_keymap('n','<C-A-c>',':CompetiTest receive persistently<CR>',{noremap = true,silent = true})
vim.api.nvim_set_keymap('n', '<C-A-b>', ':w<CR>:CompetiTest run<CR>', { noremap = true, silent = true }) -- 设置快捷键 Ctrl + Alt + B 来输入 :Competitest run
-- 设置快捷键 Ctrl + 回车（<C-CR>） add test
vim.api.nvim_set_keymap('n', '<C-CR>', ':CompetiTest add_testcase<CR>', { noremap = true, silent = true })
-- 设置全局的缩进为 4 格

vim.api.nvim_set_keymap('n','<C-b>',':w<CR>:!g++ -g -O0 -Wextra -fsanitize=address -std=c++20 -Wall \'%\' -o test.out<CR>',{noremap = true,silent =true})

vim.api.nvim_set_keymap('n',"<C-a>",":%y+<CR>",{noremap = true,silent = true} )

local opts = { noremap = true, silent = true }

-- 上移一行（Alt + k / Alt + Up）
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", opts)
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
vim.api.nvim_set_keymap("n", "<A-Up>", ":m .-2<CR>==", opts)
vim.api.nvim_set_keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)

-- 下移一行（Alt + j / Alt + Down）
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", opts)
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
vim.api.nvim_set_keymap("n", "<A-Down>", ":m .+1<CR>==", opts)
vim.api.nvim_set_keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)

vim.opt.tabstop = 4        -- 设置制表符为 4 格
vim.opt.shiftwidth = 4     -- 设置缩进量为 4 格
vim.opt.expandtab = true   -- 使用空格替代制表符
vim.opt.softtabstop = 4    -- 设置软制表符为 4 格

vim.g.autoformat = false


-- 强制覆盖所有文件类型为 4 空格
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
  end,
})

require "lazy_setup"
require "polish"
