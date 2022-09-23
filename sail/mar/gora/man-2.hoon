::
::  gora-man mar file
::
/-  *gora
|_  man=manage-gora-2
++  grad  %noun
++  grow
  |%
  ++  noun  man
  --
++  grab
  |%
  ++  noun  manage-gora-2
  ++  json
    |=  jon=^json
    %-  manage-gora-2
    =<  (man-noun jon)
    |%
    ++  man-noun
      =,  dejs:format
      %-  of
      :~
        [%ignore-give (ot ~[id+(se %uv)])]
        [%accept-give (ot ~[id+(se %uv)])]
      ::
        [%ignore-request (ot ~[id+(se %uv) ship+(se %p)])]
        [%accept-request (ot ~[id+(se %uv) ship+(se %p)])]
      ::
        [%send-gora (ot ~[id+(se %uv) who+(as (se %p))])]
        [%send-plea (ot ~[id+(se %uv) host+(se %p)])]
      ::
        [%rm-gora (ot ~[id+(se %uv)])]
        [%set-max (ot ~[id+(se %uv) max+(mu ni)])]
        [%pub-gor (ot ~[id+(se %uv) how+bo])]
        [%add-tag (ot ~[tag+so gorae+(as (se %uv))])]
        [%rem-tag (ot ~[tag+so gorae+(as (se %uv))])]
        [%set-pol (ot ~[id+(se %uv) pol+(mu so)])]
      ::
        :-  %mk-gora
        %-  ot
        :~  name+so
            pic+so
        ::
          :-  %type
          %+  cu
            |=  gut=?([%g *] [%s *])
            ?:  ?=(%g -.gut)
            [%.y +.gut]  [%.n +.gut]
          %-  of
          :~
            [%g (ot ~[hodl+(as (se %p)) max+(mu ni)])]
          ::
            =-  [%s (ot ~[stak+-])]
            %+  cu
              |=  s-s=(set @p)
              ^-  (map @p @ud)
              %-  ~(rep in s-s)
              |=  [x=@p y=(map @p @ud)]
              (~(put by y) x 1)
            (as (se %p))
          ==
        ==
      ::
        :-  [%stak-em]
        %-  ot
        :~  dez+(as (se %uv))
        ::
          :-  %which
          %+  cu
            |=  gut=?([%existing @uv] [%new @t @t])
            ?:  ?=(%existing -.gut)
            [%.y +.gut]  [%.n +.gut]
          %-  of
          :~  [%existing (ot ~[id+(se %uv)])]
              [%new (ot ~[name+so pic+so])]
          ==
        ==
      ==
    --
  --
--