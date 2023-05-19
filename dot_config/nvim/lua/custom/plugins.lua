local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  -- "gc" to comment visual regions/lines
  { "numToStr/Comment.nvim", lazy = false },
  { "christoomey/vim-tmux-navigator", lazy = false },

  { "tpope/vim-repeat", lazy = false },
  { "tpope/vim-surround", lazy = false },
  { "tpope/vim-fugitive", lazy = false },
  { "tpope/vim-obsession", lazy = false },

  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings "gopher"
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  {
    "nvim-neotest/neotest",
    ft = { "python", "go" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-go",
    },
    config = function()
      require("core.utils").load_mappings "neotest"
      require("neotest").setup {
        adapters = {
          require "neotest-python" {
            runner = "pytest",
            args = { "--cov" },
          },
          require "neotest-go",
        },
      }
    end,
  },

  {
    "andythigpen/nvim-coverage",
    ft = { "python", "go" },
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("core.utils").load_mappings "coverage"
      require("coverage").setup {
        auto_reload = true,
      }
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      char = "┊",
      show_trailing_blankline_indent = false,
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",

      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },

      -- Useful status updates for LSP
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
}

return plugins
