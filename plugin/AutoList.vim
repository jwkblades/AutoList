" ==================
" Automatically make numeric lists.
" ==================
"

let g:AutoList#enabledFiletypes = "markdown"

func! AutoList#isLineInList(ln, indent)
	let l:line = getline(a:ln)
	let l:found = match(l:line, "^" . a:indent . "\\d\\+\\.\\s\\+")
	if l:found == -1
		return 0
	endif
	return 1
endf

func! AutoList#getListNumber(line, indent)
	let l:match = matchstr(a:line, "^" . a:indent . "\\d\\+")
	let l:num = str2nr(l:match)
	return l:num
endf

func! AutoList#reList()
	let l:indent = matchstr(getline("."), "^\\s*")
	let l:cline = line(".")
	let l:ccol = col(".")
	let l:line = line(".") - 1
	if l:line < 1
		let	l:line = 1
	endif

	let l:text = getline(l:line)
	let l:expectedNumber = 1
	let l:first = 1

	while l:text != ""

		if AutoList#isLineInList(l:line, l:indent)
			let l:number = AutoList#getListNumber(l:text, l:indent)
			
			if l:first
				let l:expectedNumber = l:number
				let l:first = 0
			endif

			if l:expectedNumber != l:number
				let l:parts = split(l:text, "^" . l:indent . "\\d\\+\\.")
				call setline(l:line, l:indent . l:expectedNumber . "." . l:parts[0])
			endif

			let l:expectedNumber = l:expectedNumber + 1
		endif

		let l:line = l:line + 1
		let l:text = getline(l:line)
	endwhile
	
	call setpos(".", [0, l:cline, l:ccol, 0])
endf

func! AutoList#addItem(searchBelow)
	let l:cline = line(".")
	if l:cline <= 1 && !a:searchBelow
		return
	endif

	if !a:searchBelow
		let l:line = l:cline - 1
	else
		let l:line = l:cline + 1
	endif
	let l:text = getline(l:line)
	let l:indent = matchstr(l:text, "^\\s*")
	if !AutoList#isLineInList(l:line, l:indent)
		return
	endif

	let l:number = AutoList#getListNumber(l:text, l:indent)
	let l:final = l:indent . l:number . ". "
	call setline(l:cline, l:final)
	call setpos(".", [0, l:cline, strlen(l:final), 0])
	call AutoList#reList()
endf


imap <CR> <NL><Esc>:call AutoList#addItem(0)<CR>A
nmap O 0i<NL><Esc>k:call AutoList#addItem(1)<CR>A
nmap o A<NL><Esc>:call AutoList#addItem(0)<CR>A

