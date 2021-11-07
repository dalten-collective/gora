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
      =,  dejs:format
      %-  of
      :~  [%send-request (ot :~(['gora-id' (se %uv)] ['ship' (se %p)]))]
          [%approve-give (ot :~(['gora-id' (se %uv)]))]
          [%reject-give (ot :~(['gora-id' (se %uv)]))]
      ==
    --
  --
--