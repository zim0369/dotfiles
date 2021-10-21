
nnoremap <leader>b :!cp ~/boilerplates/boilerplate.%:e %<Enter> 

"shortcut to run current filetype
map <leader>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'rust'
        exec "!cargo build --manifest-path=%:p:h:h/Cargo.toml"
        exec "!time cargo run --manifest-path=%:p:h:h/Cargo.toml"
         
    "elseif &filetype == 'rust'
    "    exec "!rustc %:p --out-dir=%:p:h"
    "    exec "!time " .expand("%:p:r")
    " elseif expand('%:t') == 'main.rs'
    "     exec "!cargo build --manifest-path=%:p:h:h/Cargo.toml"
    "     exec "!time cargo run --manifest-path=%:p:h:h/Cargo.toml"

    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java -cp %:p:h %:t:r"
    elseif &filetype == 'sh'
        exec "!time bash %"
    elseif &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'lua'
        exec "!time lua %"
    elseif &filetype == 'javascript'
        exec "!time node %"
    elseif &filetype == 'html'
        exec "!chromium % &"
    elseif &filetype == 'tex'
        exec "!pdflatex --output-directory=%:p:h %"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'text'
        exec "!echo 'words : ' && wc -w % && echo 'lines : ' && wc -l % && echo 'size : ' && du -h %"
    elseif &filetype == 'markdown'
        exec "!echo 'words : ' && wc -w % && echo 'lines : ' && wc -l % && echo 'size : ' && du -h %"
    endif
endfunc

