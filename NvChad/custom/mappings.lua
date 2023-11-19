---@type MappingsTable
local M = {}

M.general = {
  i = {
    ["<C-s>"] = { "<cmd>w<CR><ESC>", "Save file" },

    ["<A-j>"] = { "<ESC><cmd>m .+1<CR>==gi", "Move down" },
    ["<A-k>"] = { "<ESC><cmd>m .-2<CR>==gi", "Move up" },
  },

  n = {
    ["<C-s>"] = { "<cmd>w<CR><ESC>", "Save file" },

    ["<A-j>"] = { "<cmd>m .+1<CR>==", "Move down" },
    ["<A-k>"] = { "<cmd>m .-2<CR>==", "Move up" },

    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
  },

  v = {
    ["<C-s>"] = { "<cmd>w<CR><ESC>", "Save file" },

    ["<A-j>"] = { ":m '>+1<CR>gv=gv", "Move down" },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv", "Move up" },

    [">"] = { ">gv", "Indent" },
  },

  x = {
    ["<C-s>"] = { "<cmd>w<CR><ESC>", "Save file" },
  },

  s = {
    ["<C-s>"] = { "<cmd>w<CR><ESC>", "Save file" },
  },
}

M.tmuxnavigator = {
  plugin = true,
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft <CR>", "Tmux Navigator to window Left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight <CR>", "Tmux Navigator to window Right" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp <CR>", "Tmux Navigator to window Up" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown <CR>", "Tmux Navigator to window Down" },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>du"] = {
      function()
        require("dapui").toggle()
      end,
      "Dedug UI",
    },
    ["<leader>db"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Breakpoint",
    },
    ["<leader>ds"] = {
      function()
        require("dap").continue()
      end,
      "Start",
    },
    ["<leader>dn"] = {
      function()
        require("dap").step_over()
      end,
      "Step over",
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug go test",
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug last go test",
    },
  },
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags",
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags",
    },
  },
}

return M
