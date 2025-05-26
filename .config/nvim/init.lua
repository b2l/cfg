
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = ","

require('lazy').setup({
	'tpope/vim-sensible',
	'tpope/vim-repeat',
	'tpope/vim-surround',
	'tpope/vim-vinegar',
	'ayu-theme/ayu-vim',
	  {
	  -- LSP Configuration & Plugins
	  'neovim/nvim-lspconfig',
	  dependencies = {
	  -- Automatically install LSPs to stdpath for neovim
	  { 'williamboman/mason.nvim', config = true },
	  'williamboman/mason-lspconfig.nvim',

	  -- Useful status updates for LSP
	  -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
	  { 'j-hui/fidget.nvim', opts = {} },

	  -- Additional lua configuration, makes nvim stuff amazing!
		  'folke/neodev.nvim',
	  },
	  },
	  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'catppuccin',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
    {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
    -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },
 {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },


})


-- Set highlight on search
vim.o.hlsearch = false
vim.wo.number = true
vim.o.mouse = 'a'

vim.o.breakindent = true
vim.o.undofile = true
vim.o.swapfile = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
vim.keymap.set('c', 'W', 'w')
vim.keymap.set('c', 'Q', 'q')
vim.keymap.set('c', 'Qa', 'qa')
vim.keymap.set('c', 'Wa', 'wq')
vim.keymap.set('c', 'Wqa', 'wqa')
vim.keymap.set('c', 'QQ', 'qa!')
vim.keymap.set('c', 'WW', '!sudo tee % > /dev/null | edit!')

-- REST OF FILE CONTAINS MAPPINGS

-- open files in directory of current file
-- cnoremap %% <c-r>=expand('%:h').'/'<cr>
