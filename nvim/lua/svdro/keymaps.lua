local keymap = vim.keymap -- alias vim.keymap

-- leader key
vim.g.mapleader = " "

-- search TODO: maybe change this
keymap.set("n", "<ESC>", ":nohl<CR>", { noremap=true, silent=true, desc = "Clear search highlights" })


-- navigation 
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" }) -- TODO: not sure about this
keymap.set("n", "<C-p>", ":b#<CR>", { noremap=true, silent=true, desc = "switch to prev buffer" }) -- switch to prev buffer

-- window (resize)
keymap.set("n", "<down>", ":resize -2<CR>", { noremap=true, silent=true, desc = "Resize window (shorter)" })            -- resize window (shorter)
keymap.set("n", "<up>", ":resize +2<CR>", { noremap=true, silent=true , desc = "Resize window (taller)" })              -- resize window (taller)
keymap.set("n", "<left>", ":vertical resize -2<CR>", { noremap=true, silent=true, desc = "Resize window (narrower)" })  -- resize window (narrower)
keymap.set("n", "<right>", ":vertical resize +2<CR>", { noremap=true, silent=true, desc = "Resize window (wider)" })    -- resize window (wider)

-- tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "Go to next tab" })                  -- go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabprev<CR>", { desc = "Go to prev tab" })                  -- go to next tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) -- open current buffer in new tab
--keymap.set("n", "<leader>ton", "<cmd>tabon<CR>", { desc = "Close all other tabs" })             -- close all other tabs
