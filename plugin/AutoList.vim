" ==================
" Automatically make numeric lists.
" ==================

func! AutoList#isLineInList(ln)
	let l:currentLine = line(".")
	let l:currentCol = col(".")
	let l:line = getline(a:ln)
	let l:found = match(l:line, "^\\s*\\d\\+\\.\\s\\+")
	if l:found == -1
		call setline(a:ln, l:line . " -- NO")
		"call setpos(".", [1, l:currentLine, l:currentCol, 0])
		return 0
	endif
	call setline(a:ln, l:line . " -- YES!")
	"call setpos(".", [0, l:currentLine, l:currentCol, 0])
	return 1
endf

func! AutoList#reList()
	
endf
