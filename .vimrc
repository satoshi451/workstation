set encoding=UTF-8

set runtimepath+=~/.vim/bundle/nerdtree
set runtimepath+=~/.vim/bundle/vim-devicons
set runtimepath+=~/.vim/bundle/nerdtree-git-plugin
set runtimepath+=~/.vim/bundle/vim-airline
set runtimepath+=~/.vim/bundle/vim-autocmd
set runtimepath+=~/.vim/bundle/vim-go
set runtimepath+=~/.vim/bundle/vim-ansible-yaml
" set runtimepath+=~/.vim/bundle/syntastic

" " Vim themes
set runtimepath+=~/.vim/bundle/nighted.vim
set runtimepath+=~/.vim/bundle/gruvbox

syntax on
color dracula

"autocmd vimenter * NERDTree

map <C-n> :NERDTreeToggle<CR>

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

let g:go_version_warning = 0

" Syntastic settings

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


let g:ansible_options = {'ignore_blank_lines': 0, 'documentation_mapping': '<C-K>'}

au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
hi statusline gui=bold guifg=black guibg=#8fbfdc cterm=bold ctermfg=black ctermbg=cyan

autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")
        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction

set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\     " The current mode
set statusline+=%1*\ %<%F\                                  " File path
set statusline+=%3*│                                        " Separator
set statusline+=%4*%M%r%{StatuslineTrailingSpaceWarning()}  " modified, readonly, trailing space
set statusline+=%2*%h%w                                     " Helpfile, preview
set statusline+=%=                                          " Right Side
set statusline+=%2*\ %Y                                     " FileType
set statusline+=%3*│                                        " Separator
set statusline+=%1*\ %{''.(&fenc!=''?&fenc:&enc).''}        " Encoding
set statusline+=\ [%{&ff}]\                                 " FileFormat
set statusline+=%0*\ ≡\ %02l/%L\ :\ %02v\ [%3p%%]           " See next line

hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
hi User2 ctermfg=cyan ctermbg=236 guibg=#303030 guifg=#8fbfdc
hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
hi User4 ctermfg=001 ctermbg=236 guibg=#303030 guifg=#d75f5f


