-- bootstrap lazy.nvim, LazyVim and your plugins

-- Adjust package.path to include the lua directory
package.path = package.path .. ';/Users/jonaslinke/workspace/github.com/jlinke1/.dotfiles/nvim2025/nvim/lua/?.lua'
require("config.lazy")
