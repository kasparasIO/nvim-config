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
    "EdenEast/nightfox.nvim"
  },
  {
    'neovim/nvim-lspconfig', 
  },
}
