vim.opt.number = true			-- set numbered lines
vim.opt.smartindent = true
vim.opt.shiftwidth = 4	
vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.mouse= 'a'
vim.opt.clipboard = "unnamedplus"	-- lets neovim copy to system clipboard
vim.opt.showmode = false		-- status line takes care of this now
vim.opt.cursorline = true		-- highlights cursorline
vim.opt.scrolloff = 8			-- 8 line vertical buffer when moving cursor

-- leftovers recommended by default config vim
vim.opt.showcmd = true
vim.opt.showmatch = true	        -- show matching brackets

-- these two work together
-- if search string all lowercase, search case-insensitve
-- if string capitalized then search capitalization sensitive 
vim.opt.ignorecase = true
vim.opt.smartcase = true

--plugins
local call = vim.call
local cmd = vim.cmd
local Plug = vim.fn['plug#']
local PATH = "~/.local/share/nvim/plugged"

call('plug#begin', PATH)

Plug 'https://github.com/neovim/nvim-lspconfig'		--
Plug 'https://github.com/itchyny/lightline.vim'		-- statusbar

-- themes --
Plug 'EdenEast/nightfox.nvim'			
Plug 'https://github.com/rebelot/kanagawa.nvim'		
Plug 'https://github.com/nanotech/jellybeans.vim'
Plug 'https://github.com/ofirgall/ofirkai.nvim'		

call('plug#end')

require'lspconfig'.pyright.setup{}

--theme
vim.cmd('colorscheme jellybeans')

-- set statusbar theme --
-- [[ executes multiple lines in a single call ]]
vim.cmd [[
let g:lightline = {
	 \'colorscheme': 'one'
	 \}
]]

-- return to last position when reopening file --
-- online resources exec through lua in a much more complicated way
-- yet it's working...
vim.cmd[[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]
