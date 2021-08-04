local helper = {
	GLOBAL=vim.g,
	BUFFER=vim.b,
	WINDOW=vim.wo,
	TABPAGE=vim.t,
	PREDEFINED=vim.v,
	ENV=vim.env, 
	MODE={
		MAP='',
		NMAP='n',
		SMAP='v',
		XMAP='s',
		OMAP='x',
		MAPBANG='!',
		IMAP='i',
		LMAP='l',
		CMAP='c',
		TMAP='t'
	}
}


function helper.map(mode, lhs, rhs, opts)
	if helper.MODE[mode] ~= nil then
		print(mode .. ' is not in modes ')
		return
	end
	if opts == nil then
		opts = {}
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

return helper
