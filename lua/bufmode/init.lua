--[[/* IMPORTS */]]

local libmodal = require 'libmodal'

--[[/* MODULE */]]

-- the key combos for this mode.
local _combos =
{
	['$'] = 'blast',
	['0'] = 'bfirst',
	['?'] = 'help bufmode-usage',
	['h'] = 'wincmd h',
	['j'] = 'wincmd k',
	['k'] = 'wincmd j',
	['l'] = 'wincmd l',
	['d'] = 'silent! bdelete',
	['w'] = 'bnext',
}

-- Add mappings for `barbar.nvim`
if vim.fn.exists ':BufferClose' > 0 then _combos =
	vim.tbl_extend('force', _combos,
	{
		['$'] = 'BufferLast',
		['0'] = 'BufferFirst',
		['B'] = 'BufferMovePrevious',
		['d'] = 'BufferDelete',
		['f'] = function()
			local buffer = vim.fn.input('Go to buffer: ', '', 'buffer')
			vim.api.nvim_command('BufferGoto '..vim.fn.bufnr(buffer))
		end,
		['p'] = 'BufferPick',
		['r'] = 'BufferClose',
		['w'] = 'BufferNext',
		['W'] = 'BufferMoveNext',
	})
end

-- add user mappings
_combos = vim.tbl_extend('force', _combos, vim.g.bufmode_mappings or {})

-- create a `new` link for some `existing` mapping
local function _inherit(child, parent)
	_combos[child] = _combos[parent]
end

-- Turn some special character value into a character code.
local function _to_char(val)
	return vim.api.nvim_replace_termcodes(val, true, true, true)
end

-- Synonyms for '0'
_inherit('^', '0')
_inherit(_to_char '<Home>', '0')


-- Synonyms for 'j'
_inherit(_to_char '<Up>',   'j')

-- Synonyms for 'k'
_inherit(_to_char '<Down>', 'k')

_inherit(_to_char '<Left>',   'h')
_inherit(_to_char '<PageUp>', 'b')

_inherit(_to_char '<Right>',   'l')
_inherit(_to_char '<PageDown>', 'l')

-- Synonyms for '?'
_inherit('?', '.')

-- Synonyms for 'B'
_inherit('J', 'B')
_inherit('H', 'B')
_inherit(_to_char '<S-Left>',   'B')
_inherit(_to_char '<S-PageUp>', 'B')

-- Synonyms for 'f'
_inherit('g', 'f')
_inherit('t', 'f')

--[[/* PUBLICIZE MODULE */]]

return function() libmodal.mode.enter('BUFFERS', _combos) end
