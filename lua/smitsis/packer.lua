vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
  requires = { {'nvim-lua/plenary.nvim'} }
}

  use { "catppuccin/nvim", as = "catppuccin" }
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use ("mbbill/undotree")
  use ("tpope/vim-fugitive")

  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
}

  use({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'})
  use({'neovim/nvim-lspconfig'})
  use({'hrsh7th/nvim-cmp'})
  use({'hrsh7th/cmp-nvim-lsp'})

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
}
  use('nvim-lua/plenary.nvim')
  use('ThePrimeagen/harpoon')


end)
