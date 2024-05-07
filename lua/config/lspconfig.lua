require("neodev").setup{}
local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("mason").setup()
require("mason-lspconfig").setup()

local function lsp_keymap(bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, bufopts)
end


require("mason-lspconfig").setup_handlers {

  --default handler
  function (server_name)
    require("lspconfig")[server_name].setup {
      capabilites = capabilities,
      on_attach = function(client, bufnr)
      lsp_keymap(bufnr)
    end
  }
  end,


  --example custom hanlder:
  -- ["rust_analyzer"] = function ()
    --	require("rust-tools").setup {}
    -- end

    --Lua handler for neovim
    ["lua_ls"] = function ()
      lspconfig.lua_ls.setup{
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          lsp_keymap(bufnr)
        end,
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace"
            }
          }
        }
      }
    end
  }
