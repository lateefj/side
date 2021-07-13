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
for k,v in pairs(helper) do 
	print(k,v) 
	if k == 'MODE' then
		for sk,sv in pairs(v) do 
			print(k, key, value) 
		end
	end
end


function helper.map(mode, lhs, rhs, opts)
	if opts == nil then
		opts = {}
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

return helper
