if exists('b:current_syntax')
  finish
endif

syn case match

syn keyword     vDirective        module import
syn keyword     vDeclaration      mut const type pub
syn keyword     vDeclType         struct interface enum nextgroup=vIdentifier skipwhite skipempty

hi def link     vDirective        Statement
hi def link     vDeclaration      Keyword
hi def link     vDeclType         Keyword

syn match       vIdentifier       contains=vIdentifierPrime "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained

hi def link     vIdentifierPrime  vIdentifier
hi def link     vIdentifier       Identifier

" Predefined types
syn keyword     vType             bool string map
syn keyword     vSignedInts       rune int i8 i16 i32 i64
syn keyword     vUnsignedInts     byte u8 u16 u32 u64
syn keyword     vFloats           f32 f64
syn keyword     vPtr              byteptr voidptr

hi def link     vType             Type
hi def link     vSignedInts       Type
hi def link     vUnsignedInts     Type
hi def link     vFloats           Type
hi def link     vComplexes        Type

" Functions
syn match       vDeclaration      /^fn\>/

hi def link     vDeclaration      Keyword

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

