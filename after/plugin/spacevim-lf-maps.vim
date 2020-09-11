" ============================================================================
" File:        leaderf.vim
" Description:
" Author:      Sebastian Gniazdowski
" Website:     https://github.com/vim-add-ons
" Note:
" License:     GNU GPL v3
" ============================================================================

let s:extension = {
            \   "name": "SpaceVim-maps",
            \   "help": "navigate the SpaceVim maps",
            \   "manager_id": "leaderf#SpaceVimMaps#managerId",
            \   "arguments": [
            \   ]
            \ }

" Make `Leaderf SpaceVim-maps` available.
call g:LfRegisterPythonExtension(s:extension.name, s:extension)

command! -bar -nargs=0 LeaderfSpaceVimMaps Leaderf SpaceVim-maps

" To be listed by :LeaderfSelf.
call g:LfRegisterSelf("LeaderfSpaceVimMaps", "navigate the SpaceVim maps")

echom "After called"
