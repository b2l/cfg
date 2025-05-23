if &filetype !=# 'html' || v:version < 700 || &compatible
  finish
endif

let b:hasP = call prettier#PrettierCliPath()
if b:hasP
  autocmd BufWritePre *.js,*.jsx Prettier
end

