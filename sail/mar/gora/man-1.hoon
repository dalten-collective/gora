::
::  gora-man mar file
::
/-  *gora
|_  man=manage-gora-1:one
++  grad  %noun
++  grow
  |%
  ++  noun  man
  --
++  grab
  |%
  ++  noun  manage-gora-1:one
  ++  json
    |=  jon=^json
    %-  manage-gora-1:one
    =<  (man-noun jon)
    |%
    ++  man-noun
      =,  dejs:format
      %-  of
      :~  
        [%set-max-hodl (ot :~(['gora-id' (se %uv)] ['max' ni]))]
        [%pubmod-host (ot :~(['gora-id' (se %uv) ['public' bo]]))]
        [%pubmod-hodl (ot :~(['gora-id' (se %uv) ['public' bo]]))]
        [%add-tag (ot :~(['tag' (se %tas)] ['gorae' (as (se %uv))]))]
        [%del-tag (ot :~(['tag' (se %tas)] ['gorae' (as (se %uv))]))]
        ::
        [%reject-give (ot :~(['gora-id' (se %uv)]))]
        [%approve-give (ot :~(['gora-id' (se %uv)]))]
        [%send-give (ot :~(['gora-id' (se %uv)] ['new' (as (se %p))]))]
        ::
        [%send-request (ot :~(['gora-id' (se %uv)] ['ship' (se %p)]))]
        [%reject-request (ot :~(['gora-id' (se %uv)] ['ship' (se %p)]))]
        [%approve-request (ot :~(['gora-id' (se %uv)] ['ship' (se %p)]))]
        ::
        [%send-reissue (ot :~(['gora-id' (se %uv)] ['new' (as (se %p))]))]
        [%send-transfer (ot :~(['gora-id' (se %uv)] ['new' (as (se %p))]))]
        ::
        [%del-gora (ot :~(['gora-id' (se %uv)]))]
        :-  %mkgora
        %-  ot
        :~  ['name' so]
            ['gora-img' so]
            ['public' bo]
            ['max' (mu ni)]
            ['req' (se %tas)]
            ['giv' (se %tas)]
        ==
      ==
    --
  --
--