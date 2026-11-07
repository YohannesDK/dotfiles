require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
require "nvchad.mappings" 
-- add yours here 
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" }) 
map("i", "kj", "<ESC>") 
map("n", "<A-h>", "<C-w>h", { desc = "Switch to left pane" }) 
map("n", "<A-j>", "<C-w>j", { desc = "Switch to bottom pane" }) 
map("n", "<A-k>", "<C-w>k", { desc = "Switch to top pane" }) 
map("n", "<A-l>", "<C-w>l", { desc = "Switch to right pane" }) 
map("i", "<A-h>", "<C-w>h", { desc = "Switch to left pane" }) 
map("i", "<A-j>", "<C-w>j", { desc = "Switch to bottom pane" }) 
map("i", "<A-k>", "<C-w>k", { desc = "Switch to top pane" }) 
map("i", "<A-l>", "<C-w>l", { desc = "Switch to right pane" })

map("v", "<leader>bb", 'c**<C-r>"**<Esc>', { desc = "Bold selection (markdown)" })

map("n", "<leader>bb", "<C-q>", { desc = "Visual block mode" })
map("n", "<leader>n", "<cmd>enew<cr>", { desc = "New buffer" })

map("n", "<leader>bv", "<cmd>vsplit<cr>", { desc = "Split vertical" })
map("n", "<leader>bh", "<cmd>split<cr>", { desc = "Split horizontal" })

map("n", "<leader>h", "<C-w>h", { desc = "Window left" })
map("n", "<leader>j", "<C-w>j", { desc = "Window down" })
map("n", "<leader>k", "<C-w>k", { desc = "Window up" })
map("n", "<leader>l", "<C-w>l", { desc = "Window right" })
