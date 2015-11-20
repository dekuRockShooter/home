let s:pattern = ""
let s:comments = ['//', '#', '"', '<!--']
let s:languages = {'java': s:comments[0], 'cpp': s:comments[0], 'c': s:comments[0], 'css': s:comments[0], 'py': s:comments[1], 'sh': s:comments[1], 'vim': s:comments[2], 'html': s:comments[3]}
try
    let s:comment = s:languages[expand("%:e")]
    " Check if this line is a comment
    let s:pattern = '^\s*'. s:comment
catch /E716:/
endtry

function Uncomment() range
    let line_idx = a:firstline
    for line in getline(a:firstline, a:lastline)
        let s = substitute(line, '\(^\s*\)' . s:comment, '\1', '&')
        call setline(line_idx, s)
        let line_idx = line_idx + 1
    endfor
endfunction

function Comment() range
    "s:CommentHelper(a:firstline, a:lastline,'\(^\s*\)\(.*\)', '\1' . s:comment .  '\2')
    let line_idx = a:firstline
    for line in getline(a:firstline, a:lastline)
        let s = substitute(line, '\(^\s*\)\(.*\)', '\1' . s:comment . '\2', '&')
        call setline(line_idx, s)
        let line_idx = line_idx + 1
    endfor
endfunction

function s:CommentHelper(beg_idx, end_idx, pattern, replace)
    for line in getline(beg_idx, end_idx)
        let s = substitute(line, pattern, replace, '&')
        call setline(line_idx, s)
        let line_idx = line_idx + 1
    endfor
endfunction
