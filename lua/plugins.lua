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
	  highlight = true
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
    	    require'cmp'.setup {
    		snippet = {
      		expand = function(args)
        	require'luasnip'.lsp_expand(args.body)
      	   	end
    	    },
	    sources = {
	      { name = 'luasnip' },
	      {name = "nvim_lsp"},
	    }
    	}
  	end
  },

   { 'saadparwaiz1/cmp_luasnip' },

  {
    "EdenEast/nightfox.nvim"
  },
}
