if !exists('*mq#save_and_exec')
  function! mq#save_and_exec() abort
    if &filetype == 'vim'
      :silent! write
      :source %
    elseif &filetype == 'lua'
      :silent! write
      :luafi %
    endif

    return
  endfunction
endif