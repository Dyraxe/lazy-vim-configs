-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- 1. Disable LazyVim animations (CRUCIAL: stops frame-flooding during line jumps)

vim.g.snacks_animate = false
-- 3. Center the active line vertically
vim.opt.scrolloff = 999

-- 4. Do not let horizontal movement scroll abruptly
vim.opt.sidescrolloff = 8

-- 5. Stop virtual cursor traversal on empty space past line ends
vim.opt.virtualedit = ""

-- Allow arrow keys to wrap across lines so the nudge always returns to position 0
vim.opt.whichwrap = "<,>,h,l,[,]"

vim.o.shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell"
vim.o.shellcmdflag =
  "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.o.shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
vim.o.shellpipe = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'
vim.o.shellquote = ""
vim.o.shellxquote = ""
