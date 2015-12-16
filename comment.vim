"This script creates functions for commenting and uncommenting lines.
"
" Variables:
"    comments: a list of different styles of comments
"    languages: a dictionary of file extensions and their respective comments

let s:comments = ['//', '#', '"', '<!--']
let s:languages = {'java': s:comments[0], 'cpp': s:comments[0], 'c': s:comments[0], 'css': s:comments[0], 'py': s:comments[1], 'sh': s:comments[1], 'vim': s:comments[2], 'html': s:comments[3]}

" Gets the file type of the current file and sets the appropriate comment.
" This should be called whenever a new buffer is opened so that the
" approprtiate comment is loaded.
"
" Parameters:
"   None
"
" Returns:
"   Nothing. comment is initialized to the appropriate comment or is empty.
function ReloadComment()
    let s:comment = s:languages['sh']
    try
        let s:comment = s:languages[expand("%:e")]
    catch /E716:/
    catch /E713:/
    catch /E15:/
    endtry
endfunction

" Removes the leading comment of the given lines. A line has a leading comment
" if its first character is a comment. A line may begin with several comment
" characters, for example, // // // text. This function removes the first
" of them.
"
" Arguments:
"   range: A range of lines to uncomment.
"
" Returns:
"   Nothing. The lines within the range have their leading comment removed.
"
function Uncomment() range
    let line_idx = a:firstline
    for line in getline(a:firstline, a:lastline)
        let s = substitute(line, '\(^\s*\)' . s:comment, '\1', '&')
        call setline(line_idx, s)
        let line_idx = line_idx + 1
    endfor
endfunction

" Insert a leading comment at the beginning of the given lines, effectively
" commenting out the line. If the line already begins with a comment, then
" a new comment is inserted at the beginning anyway.
"
" Arguments:
"   range: A range of lines to comment.
"
" Returns:
"   Nothing. A comment is inserted at the beginning of every line in the range
"
function Comment() range
    let line_idx = a:firstline
    for line in getline(a:firstline, a:lastline)
        let s = substitute(line, '\(^\s*\)\(.*\)', '\1' . s:comment . '\2', '&')
        call setline(line_idx, s)
        let line_idx = line_idx + 1
    endfor
endfunction
