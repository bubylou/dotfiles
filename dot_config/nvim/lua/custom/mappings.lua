---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
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

M.neotest = {
  plugin = true,
  n = {
    ["<leader>trn"] = {
      function()
        require("neotest").run.run()
      end,
      "Test run nearest",
    },
    ["<leader>trf"] = {
      function()
        require("neotest").run.run(vim.fn.expand "%")
      end,
      "Test run file",
    },
    ["<leader>tro"] = {
      function()
        require("neotest").output.open { enter = true }
      end,
      "Test run output",
    },
  },
}

M.coverage = {
  plugin = true,
  n = {
    ["<leader>tcl"] = {
      function()
        require("coverage").load(true)
      end,
      "Test coverage load",
    },
    ["<leader>tcs"] = {
      function()
        require("coverage").summary()
      end,
      "Test coverage summary",
    },
  },
}

return M
