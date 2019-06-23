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

