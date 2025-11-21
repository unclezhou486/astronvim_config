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

vim.api.nvim_set_keymap('n', '<C-A-b>', ':CompetiTest run<CR>', { noremap = true, silent = true }) -- 设置快捷键 Ctrl + Alt + B 来输入 :Competitest run
-- 设置快捷键 Ctrl + 回车（<C-CR>） add test
vim.api.nvim_set_keymap('n', '<C-CR>', ':CompetiTest add_testcase<CR>', { noremap = true, silent = true })
-- 设置全局的缩进为 4 格

vim.api.nvim_set_keymap('n','<C-b>',':w<CR>:!g++ -g -std=c++20 -Wall % -o test.out<CR>',{noremap = true,silent =true})

vim.o.tabstop = 4        -- 设置制表符为 4 格
vim.o.shiftwidth = 4     -- 设置缩进量为 4 格
vim.o.expandtab = true   -- 使用空格替代制表符
vim.o.softtabstop = 4    -- 设置软制表符为 4 格


require "lazy_setup"
require "polish"
