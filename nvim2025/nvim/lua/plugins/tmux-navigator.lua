return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "NavigateLeft",
    "NavigateDown",
    "NavigateUp",
    "NavigateRight",
    "NavigatePrevious",
    "NavigatorProcessList",
  },
  keys = {
    { "<c-h>", "<cmd><C-U>NavigateLeft<cr>" },
    { "<c-j>", "<cmd><C-U>NavigateDown<cr>" },
    { "<c-k>", "<cmd><C-U>NavigateUp<cr>" },
    { "<c-l>", "<cmd><C-U>NavigateRight<cr>" },
    { "<c-\\>", "<cmd><C-U>NavigatePrevious<cr>" },
  },
}
