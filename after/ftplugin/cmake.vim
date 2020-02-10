"avoid source twice
if exists('b:did_ftplugin_loaded')
    finish
endif

syntax on

let b:did_ftplugin_loaded = 1

let b:ale_fixers = ['cmakeformat']
