::
::  gora-man mar file
::
/-  *gora
|_  man=manage-gora
++  grad  %noun
++  grow
  |%
  ++  noun  man
  --
++  grab
  |%
  ++  noun  manage-gora
  ++  json
    |=  jon=^json
    %-  manage-gora
    =<  (man-noun jon)
    |%
    ++  man-noun
      %-  of
      :~  [%send-request (ot :~(['gora-id' (ni)] ['ship' (se %p)]))]
      ==
  --
--