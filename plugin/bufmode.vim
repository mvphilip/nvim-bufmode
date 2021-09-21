if exists('g:loaded_bufmode')
	finish
endif
let g:loaded_bufmode = 1

nnoremap <unique> <silent> <Plug>(BufmodeEnter) <Cmd>lua require('bufmode')()<CR>
nmap <unique> <silent> <leader>h <C-W>h<Plug>(BufmodeEnter)
nmap <unique> <silent> <leader>l <C-W>l<Plug>(BufmodeEnter)
nmap <unique> <silent> <leader>j <C-W>k<Plug>(BufmodeEnter)
nmap <unique> <silent> <leader>k <C-W>j<Plug>(BufmodeEnter)

tmap <unique> <silent> <leader>h <Esc><C-W>h<Plug>(BufmodeEnter)
tmap <unique> <silent> <leader>l <Esc><C-W>l<Plug>(BufmodeEnter)
tmap <unique> <silent> <leader>j <Esc><C-W>k<Plug>(BufmodeEnter)
tmap <unique> <silent> <leader>k <Esc><C-W>j<Plug>(BufmodeEnter)


if !exists(':BufmodeEnter')
	command! BufmodeEnter lua require('bufmode')()
endif
