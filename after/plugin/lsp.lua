-- Add cmp_nvim_lsp capabilities settings to lspconfig
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
    vim.keymap.set({'n', 'x'}, '<F3>', function() vim.lsp.buf.format({async = true}) end, opts)
    vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
  end,
})

-- Basic LSP server setup examples
require('lspconfig').gleam.setup({})
require('lspconfig').ocamllsp.setup({})
require('lspconfig').jedi_language_server.setup{}

-- Mason setup with Lua LSP configuration
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'lua_ls'},
  handlers = {
    function(server_name)
      -- Check if we are setting up Lua LS and add diagnostic configurations
      if server_name == "lua_ls" then
        require('lspconfig').lua_ls.setup({
          settings = {
            Lua = {
              diagnostics = {
                globals = {'vim'},         -- Prevents warnings about the 'vim' global
                disable = {"lowercase-global", "undefined-global"}, -- Disable specific warnings
              },
            },
          },
        })
      else
        require('lspconfig')[server_name].setup({})
      end
    end,
  }
})

-- Completion configuration with a snippet engine
local cmp = require('cmp')
cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  snippet = {
    expand = function(args)
      -- Use the correct snippet expansion function, e.g., vsnip
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({}),
})



