if exists('b:current_syntax')
  finish
endif

syn case match


" Comments
syn keyword     vTodo             contained TODO FIXME XXX BUG
syn cluster     vCommentGroup     contains=vTodo
syn region      vComment          start="//" end="$" contains=@vCommentGroup,@Spell
syn region      vComment          start="/\*" end="\*/" contains=@vCommentGroup,@Spell
syn region      vComment          start="//" end="$" contains=@vCommentGroup,@Spell

hi def link     vComment          Comment
hi def link     vTodo             Todo

" Escapes
syn match       vEscapeOctal      display contained "\\[0-7]\{3}"
syn match       vEscapeC          display contained +\\[abfnrtv\\'"]+
syn match       vEscapeX          display contained "\\x\x\{2}"
syn match       vEscapeU          display contained "\\u\x\{4}"
syn match       vEscapeBigU       display contained "\\U\x\{8}"
syn match       vEscapeError      display contained +\\[^0-7xuUabfnrtv\\'"]+

hi def link     vEscapeOctal      vSpecialString
hi def link     vEscapeC          vSpecialString
hi def link     vEscapeX          vSpecialString
hi def link     vEscapeU          vSpecialString
hi def link     vEscapeBigU       vSpecialString
hi def link     vSpecialString    Special
hi def link     vEscapeError      Error

" Strings
syn cluster     vStringGroup      contains=vEscapeOctal,vEscapeC,vEscapeX,vEscapeU,vEscapeBigU,vEscapeError
syn region      vString           start=+'+ skip=+\\\\\|\\"+ end=+'+ contains=@vStringGroup
syn region      vRawString        start=+`+ end=+`+

hi def link     vString           String
hi def link     vRawString        String

" Characters
syn cluster     vCharacterGroup   contains=vEscapeOctal,vEscapeC,vEscapeX,vEscapeU,vEscapeBigU
syn region      vCharacter        start=+`+ skip=+\\\\\|\\'+ end=+`+ contains=@vCharacterGroup

hi def link     vCharacter        Character

