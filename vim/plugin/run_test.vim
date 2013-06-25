function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_spec.js.coffee\|_spec.coffee\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number)
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  if match(a:filename, '\.feature$') != -1
    return RunVimTmuxCommand("script/features " . a:filename)
  elseif match(a:filename, '\(_spec.js.coffee\|_spec.coffee\)$') != -1
    return VimuxRunCommand("./node_modules/.bin/mocha " . a:filename)
    
  else
    if filereadable("script/test")
      return VimuxRunCommand("script/test " . a:filename)
    elseif filereadable("Gemfile")
      " We assume rspec here
      if executable("zeus") == 1
        return VimuxRunCommand("zeus rspec " . a:filename)
      else
        return VimuxRunCommand("rspec --color " . a:filename)
      endif
    end
  end
endfunction
