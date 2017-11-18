" To push file which is being writen to server by rsync
" Author by genialx <admin@ihuxu.com>
autocmd BufWritePost * call WriteHestiaRPiFileToServer()

function! WriteHestiaRPiFileToServer()
    if (stridx(expand('%:p'), 'hestia-rpi') == -1)
        return
    endif
    let result = system('rsync -vzrtopg --delete --progress --password-file=/Users/GenialX/SF/rsyncd.hestiarpi.passwd '.expand('%:p').' pi@192.168.99.205::hestiarpi/'.expand('%'))
    if (stridx(result, 'rsync') != -1)
        echohl WarningMsg | echo result | echohl None
    endif
endfunction
