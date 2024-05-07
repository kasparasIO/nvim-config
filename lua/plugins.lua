local cmp_config = require("config.cmp_config")
return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function ()
      return require("config.treesitter")
    end,
    config = function ()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {"typescript", "javascript", "html", "css", "svelte"},
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        modules = {},
        ignore_install = {},
        sync_install = true,
        auto_install = true
      })
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function ()
      require("mason").setup()
      require("mason-lspconfig").setup()
    end
  },
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require("config.lspconfig")
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    version = "v2.3.0",
    build = "make install_jsregexp"
  },

  {
    'hrsh7th/nvim-cmp',
    config = function ()
      local cmp = require("cmp")
      cmp.setup(cmp_config(cmp))
    end
  },

  { 'saadparwaiz1/cmp_luasnip' },

  { "folke/neodev.nvim", opts = {} },

  { "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
  },

  {
    "EdenEast/nightfox.nvim"
  },
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      require("telescope").setup{}
    end
    },
    {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
      'akinsho/bufferline.nvim', version = "*",
       dependencies = 'nvim-tree/nvim-web-devicons',
       config = function ()
       local bufferline = require("bufferline")
        bufferline.setup{
         options = {
            style_preset = {
                bufferline.style_preset.no_italic,
                bufferline.style_preset.no_bold
            },
          },
          highlights = {
            fill = {
              bg = "#0f172a"
            },
          }
        }
       end
    },

  {
    'nvim-lualine/lualine.nvim',
     dependencies = { 'nvim-tree/nvim-web-devicons' },
     config = function ()
      require("lualine").setup({})
     end
   },
}
