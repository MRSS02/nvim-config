local vim = vim
local Plug = vim.fn['plug#']

vim.api.nvim_command('filetype plugin indent on')
vim.call('plug#begin')

vim.g["airline#extensions#tabline#enabled"] = 1
vim.g.airline_section_z = "%p%% : %l/%L: Col:%c"
vim.g.blamer_enabled = 1
vim.g.blamer_prefix = ' > '
vim.g.mkdp_filetypes = { "markdown" }
vim.g.mkdp_page_title = '「${name}」'
vim.g.mkdp_highlight_css = ''
vim.g.mkdp_markdown_css = ''
vim.g.mkdp_preview_options = {
			mkit = {},
			katex = {},
			uml = {},
			maid = {},
			disable_sync_scroll = 0,
			sync_scroll_type = middle,
			hide_yaml_meta = 1,
			sequence_diagrams = {},
			flowchart_diagrams = {},
			content_editable = false,
			disable_filename = 0
  }

vim.opt.mouse = "a"
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4 
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.wildmenu = true 
vim.opt.hidden = true
vim.opt.cmdheight =2
vim.opt.updatetime = 300
vim.opt.encoding = "utf-8"
vim.opt.writebackup = false
vim.opt.backup = false
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'
vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'NONE', fg = 'NONE' })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "css",
  command = "setlocal iskeyword+=-",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "scss",
  command = "setlocal iskeyword+=@-,@",
})

-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup('CocGroup', {})
vim.api.nvim_create_autocmd('CursorHold', {
  group = 'CocGroup',
  command = "silent call CocActionAsync('highlight')",
  desc = 'Highlight symbol under cursor on CursorHold'
})

-- Setup formatexpr specified filetype(s)
vim.api.nvim_create_autocmd('FileType', {
  group = 'CocGroup',
  pattern = 'typescript,json',
  command = "setl formatexpr=CocAction('formatSelected')",
  desc = 'Setup formatexpr specified filetype(s).'
})

vim.opt.completeopt:append("preview")
vim.opt.shortmess:append("c")
vim.opt.clipboard:append("unnamedplus")
vim.opt.termguicolors = true -- Enable true color
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

-- List your plugins here
Plug('tribela/transparent.nvim')
Plug('andweeb/presence.nvim')
Plug('preservim/nerdtree')
Plug('joshdick/onedark.vim')
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')
Plug('roxma/nvim-yarp')
Plug('airblade/vim-gitgutter')
Plug('junegunn/fzf', { ['do'] = function()
  vim.fn['fzf#install']()
end })
Plug('fannheyward/coc-pyright')
Plug('iamcco/coc-flutter')
Plug('iamcco/markdown-preview.nvim', { ['do'] = function() 
    vim.fn['mkdp#util#install']()
    end,
    ['for'] = 'markdown,vim-plug'
})
Plug('prettier/vim-prettier', { 
	['do'] = 'yarn install --frozen-lockfile --production',  
	['for'] = 'javascript,typescript,css,less,scss,json,graphql,markdown,vue,svelte,yaml,html,typescriptreact,javascriptreact'
})
Plug('neoclide/coc-python')
Plug('Raimondi/delimitMate')
Plug('morhetz/gruvbox')
Plug('turbio/bracey.vim')
Plug('kassio/neoterm')
Plug('sbdchd/neoformat')
Plug('APZelos/blamer.nvim')
Plug('neoclide/coc.nvim', {['branch'] = 'release'})
Plug('uga-rosa/ccc.nvim')

vim.call('plug#end')

--ccc settings
local ccc = require("ccc")
local mapping = ccc.mapping

ccc.setup({
	-- Your preferred settings
	-- Example: enable highlighter
	highlighter = {
	    auto_enable = true,
	    lsp = true,
	  },
    })


-- coc settings
require("coc")

--
-- NERDTREE
-- Close NERDTREE if it is the only window in the buffer


-- vim.keymap.set('n', "<c-v>", ":NERDTree<CR>")
vim.keymap.set('n', "<c-c>", ":NERDTreeToggle<CR>")
vim.g.NERDTreeQuitOnOpen=1
vim.g.NERDTreeShowHidden=1


--
-- REMAPS
--

-- Select all
vim.keymap.set('n', "<C-a>", 'ggVG')

-- Comment selected
vim.keymap.set('v', '<leader>/', '<Esc>:normal gvgc<CR>')

-- Resize split windows using arrow keys by pressing:
-- CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.

vim.keymap.set('n', "<c-up>", "<c-w>+")
vim.keymap.set('n', "<c-down>", "<c-w>-")
vim.keymap.set('n', "<c-left>", "<c-w><")
vim.keymap.set('n', "<c-right>", "<c-w>>")

-- Open split view
vim.keymap.set('n', "<c-v>", "<c-w>v")

-- Search matches
vim.keymap.set('n', '<leader>\\', ':nohlsearch<CR>')
vim.keymap.set('n', '<c-z>', ':undo<CR>')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', 'Y', 'y$')
vim.keymap.set('i', '<Tab>', function()
  if vim.fn['coc#pum#visible']() == 1 then return vim.fn['coc#_select_confirm']() 
  else return '<Tab>' end 
  end, { silent = true, noremap = true, expr = true, replace_keycodes = true })
vim.keymap.set('i', '<Enter>', function()
  if vim.fn['coc#pum#visible']() == 1 then return vim.fn['coc#_select_confirm']() 
  else return '<CR>' end 
  end, { silent = true, noremap = true, expr = true, replace_keycodes = true })

-- ident
--

-- WASD walkthrough
vim.keymap.set('n', "<a-a>", "<Left>")
vim.keymap.set('n', "<a-d>", "<Right>")
vim.keymap.set('n', "<a-s>", "<Down>")
vim.keymap.set('n', "<a-w>", "<Up>")

-- Autocloses html tags
-- autocmd FileType xml,html inoremap </ </<C-x><C-o>

-- Tabs
vim.keymap.set('n', "<a-l>", ":bn<CR>")
vim.keymap.set('n', "<a-h>", ":bp<CR>")

-- coc
--

vim.keymap.set('i', '<c-space>', vim.fn['coc#refresh']) 

-- vim.keymap.set('n', '<C-s>', ':MarkdownPreview<CR>')
-- vim.keymap.set('n', '<M-s>', ':MarkdownPreviewStop<CR>')
-- vim.keymap.set('n', '<C-p>', ':MarkdownPreviewToggle<CR>')

-- Don't replace clipboard on paste over selected content
vim.keymap.set("x", "p", function() return 'pgv"' .. vim.v.register .. "y" end, { remap = false, expr = true })

-- Delete without copy
vim.keymap.set({"n", "v"}, "d", '"_d')
vim.keymap.set({"n", "v"}, "D", '"_D')

