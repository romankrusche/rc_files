" Vim syntax file
" Language: potion
" Maintainer: roman krusche
" Latest Revision: 03.09.2020

if exists("b:current_syntax")
   finish
endif

syntax keyword potionKeyword loop times to while
syntax keyword potionKeyword if elsif else
syntax keyword potionKeyword class return
syntax keyword potionFunction print join string

syntax match potionComment "\v#.*$"
syntax match potionOperator "\v\*"
syntax match potionOperator "\v/"
syntax match potionOperator "\v\+"
syntax match potionOperator "\v-"
syntax match potionOperator "\v\="
syntax match potionOperator "\v\?"
syntax match potionOperator "\v\*\="
syntax match potionOperator "\v/\="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v-\="

syntax region potionString start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region potionString start=/\v'/ skip=/\v\\./ end=/\v'/

hi link potionKeyword Keyword
hi link potionFunction Function
hi link potionComment Comment
hi link potionString String

let b:current_syntax = "potion"
