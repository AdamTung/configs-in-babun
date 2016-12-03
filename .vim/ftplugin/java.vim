

"Enable java file type
"if has("autocmd")
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
  autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
  autocmd FileType java inoremap <buffer> . .<C-X><C-U><C-P><DOWN>
"endif

autocmd FileType java compiler mvn
autocmd FileType pom compiler mvn

"To enable smart (trying to guess import option) inserting class imports with F4, add:
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
"To enable usual (will ask for import option) inserting class imports with F5, add:
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
"To add all missing imports with F6:
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
"To remove all missing imports with F7:
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

let test#strategy = "dispatch"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

if !exists('g:test#java#maven#file_pattern')
  let g:test#java#maven#file_pattern = '\v^.*[Tt]est\.java$'
endif

function! test#java#maventest#test_file(file) abort
  return a:file =~? g:test#java#maven#file_pattern
endfunction

function! test#java#maventest#build_position(type, position) abort
  let strip_extension = split(a:position['file'], "\.java")[1]
  let filename = split(strip_extension, "/")[-1]

  if a:type == 'nearest'
    let name = s:nearest_test(a:position)
    if !empty(name)
      return [name]
    else
      return [filename]
    endif
  elseif a:type == 'file'
    return [filename]
  else
    return []
  endif
endfunction

function! test#java#maventest#build_args(args) abort
  let args = ['-Dtest='] + a:args
  return [join(args, "")]

endfunction

function! test#java#maventest#executable() abort
  return 'mvn test'
endfunction

function! s:nearest_test(position) abort
  let name = test#base#nearest_test(a:position, g:test#java#patterns)
  return escape(join(name['namespace'] + name['test'], '#'), "#")
endfunction

