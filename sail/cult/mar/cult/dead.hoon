::  cult-mar - as expressed for gora
::
|_  moo=$%([%del *] [%add * term] [%kik @da] [%kil @da])
+$  cow
  $%([%del *] [%add * term] [%kik @da] [%kil @da])
++  grad  %noun
++  grow
  |%
  ++  noun  moo
  --
++  grab
  |%
  ++  noun  cow
  ++  json
    |=  hef=^json
    =,  dejs:format
    |^  ^-  cow
    %-  cow
    (milk hef)
    ::
    ::  TODO: you, the developer, modify milk for ur ids
    ::  seriously, we mean just the ones called "id" ok?
    ::
    ++  gups
      group+(se %tas)
    ++  milk
      %-  of
      :+  [%kik (ot ~[da+du])]
        [%kil (ot ~[da+du])]
      ::
      ::  you should only change the parsers below this.
      ::
      :~  [%del (ot ~[id+(se %uv)])]
          [%add (ot ~[id+(se %uv) gups])]
      ==
    --
  --
--