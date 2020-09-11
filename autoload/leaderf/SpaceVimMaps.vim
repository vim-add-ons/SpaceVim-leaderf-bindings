" ============================================================================
" File:        SpaceVim-lf-binds.vim
" Description:
" Author:      Sebastian Gniazdowski
" Website:     https://github.com/vim-add-ons
" Note:
" License:     GNU GPL v3
" ============================================================================

if leaderf#versionCheck() == 0
    finish
endif

exec g:Lf_py "import vim, sys, os.path"
exec g:Lf_py "cwd = vim.eval('expand(\"<sfile>:p:h\")')"
exec g:Lf_py "sys.path.insert(0, os.path.join(cwd, 'python'))"
exec g:Lf_py "from SpaceVimMapsExpl import *"

function! leaderf#SpaceVimMaps#Maps()
    nmapclear <buffer>
    nnoremap <buffer> <silent> <CR>          :exec g:Lf_py "SpaceVimMapsExplManager.accept()"<CR>
    nnoremap <buffer> <silent> o             :exec g:Lf_py "SpaceVimMapsExplManager.accept()"<CR>
    nnoremap <buffer> <silent> <2-LeftMouse> :exec g:Lf_py "SpaceVimMapsExplManager.accept()"<CR>
    nnoremap <buffer> <silent> x             :exec g:Lf_py "SpaceVimMapsExplManager.accept('h')"<CR>
    nnoremap <buffer> <silent> v             :exec g:Lf_py "SpaceVimMapsExplManager.accept('v')"<CR>
    nnoremap <buffer> <silent> t             :exec g:Lf_py "SpaceVimMapsExplManager.accept('t')"<CR>
    nnoremap <buffer> <silent> p             :exec g:Lf_py "SpaceVimMapsExplManager._previewResult(True)"<CR>
    nnoremap <buffer> <silent> q             :exec g:Lf_py "SpaceVimMapsExplManager.quit()"<CR>
    nnoremap <buffer> <silent> i             :exec g:Lf_py "SpaceVimMapsExplManager.input()"<CR>
    nnoremap <buffer> <silent> <F1>          :exec g:Lf_py "SpaceVimMapsExplManager.toggleHelp()"<CR>
    if has_key(g:Lf_NormalMap, "SpaceVimMaps")
        for i in g:Lf_NormalMap["SpaceVimMaps"]
            exec 'nnoremap <buffer> <silent> '.i[0].' '.i[1]
        endfor
    endif
endfunction

function! leaderf#SpaceVimMaps#managerId()
    " I've read that pyxeval() has a problem, so…
    if g:Lf_PythonVersion == 2
        return pyeval("id(SpaceVimMapsExplManager)")
    else
        return py3eval("id(SpaceVimMapsExplManager)")
    endif
endfunction

echom "Autoload called"
