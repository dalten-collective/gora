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
        [%send-gora (ot ~[id+(se %uv) who=(as (se %p))])]
        [%send-plea (ot ~[id+(se %uv) host=(se %p)])]
      ::
        [%rm-gora (ot ~[id+(se %uv)])]
        [%set-max (ot ~[id+(se %uv) max+(mu ni)])]
        [%pub-gor (ot ~[id+(se %uv) ])]
        [%add-tag (ot ~[tag+sym gorae+(as (se %uv))])]
        [%rem-tag (ot ~[tag+sym gorae+(as (se %uv))])]
        [%set-pol (ot ~[id+(se %uv) pol+(mu so)])]
      ::
        :-  %mk-gora
        %-  ot
        :~  name+so
            pic+so
        ::
          :-  %type
          %-  ci
            |=  $=  gut
                $?  [%standard (set ship) (unit @ud)]
                    [%stakable (map ship @ud)]
                ==
            ?:(?=(%standard -.gut) [%.y +.gut] [%.n +.gut])
          %-  of
          :~
            [%standard (ot ~[hodl+(as (se %p)) max+(mu ni)])]
          ::
            :-  %stakable
            %-  ci
              |=  one=(set ship)
              %-  ~(rep in one)
              |=([s=ship o=stak] (~(put by o) s 1))
            (as (se %p))
          ==
        ==
      ::
        :-  [%stak-em]
        %-  ot
        :~  dez+(as (se %uv))
      ==
    --
  --
--