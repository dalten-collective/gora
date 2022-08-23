::  /sur/gora
::
/-  *docket
::
/+  *mip
::
|%
:: defining gora (v2)
::
+$  id    @uv
+$  pic   cord
+$  max   (unit @ud)
+$  name  cord
+$  host  ship
+$  hodl  (set ship)
+$  stak  (map ship @ud)
+$  made  [y=@ud m=@ud d=@ud]
::
::  %g gorae are standard gorae
::  %s gorae are stakable gorae
::
+$  gora
  $%  [%g =id =name =pic =host =made =hodl =max]
      [%s =id =name =pic =host =made =stak]
  ==
::
::    poke actions
::  available to users
::  - [%ignore-give @uv]
::      ignore gora @uv sent to u
::  - [%accept-give @uv]
::      accept gora @uv sent to u
::  - [%ignore-request @uv @p]
::      ignore request for gora @uv from @p
::  - [%accept-request @uv @p]
::      accept request for gora @uv from @p
::  - [%send-gora @uv (set ship)]
::      send gora @uv to (set ship)
::  - [%send-plea @uv @p]
::      ask @p for gora @uv
::  - [%kick ~]
::      maybe gora is naughty
::
+$  manage-gora-2
  $%  gora-handle
      meigora-handle
      [%ignore-give =id]
      [%accept-give =id]
    ::
      [%ignore-request =id =ship]
      [%accept-request =id =ship]
    ::
      [%send-gora =id who=(set ship)]
      [%send-plea =id =host]
    ::
      [%kick ~]
  ==
::    gora-handle
::  for making and changing gorae
::  - [%rm-gora @uv]
::      delete the gora with id=@uv
::  - [%set-max @uv (unit @ud)]
::      set max allowed gorae
::  - [%add-tag @tas (set id)]
::      add a tag to some gorae
::  - [%rem-tag @tas (set id)]
::      remove a tag from some gorae
::  - [%stak-em (set id) @t @t]
::      convert a set of gorae into a stak
::  - [%mk-gora @t @t ?([%g hodl max] [%s stak])]
::      make a gora
::
+$  gora-handle
  $%  [%rm-gora =id]
      [%set-max =id =max]
      [%add-tag tag=@tas gorae=(set id)]
      [%rem-tag tag=@tas gorae=(set id)]
      [%stak-em dez=(set id) =name =pic]
      [%mk-gora =name =pic type=(each [=hodl =max] =stak)]
  ==
::    meigora-handle
::  for managing meigora
::  - [%give @p @ud]
::      gives @ud meigora to @p
::  - [%take @p @ud]
::      takes @ud meigora from @p
:: 
+$  meigora-handle
  $%  [%give =ship mei=@ud]
      [%take =ship mei=@ud]
  ==

:: agent actions
::
+$  transact-2
  $%  [%diff =diff]
      [%request =id]
      [%offered =id]
      [%meigora =m-diff]
  ==
+$  diff
  $%  [%illustrate new=pic]
      [%give-staks new=stak]
      [%add-hodler new=hodl]
      [%start-stak =id =name =pic =host =made =stak]
      [%start-gora =id =name =pic =host =made =hodl =max]
  ==
+$  m-diff
  $%  [%set src=ship snk=ship set=@ud]
      [%state state=(mip ship ship @ud)]
  ==
+$  update
  $%  [%update-image ~]
      [%host-public pub=?]
      [%new-hodlr =ship]
      [%initialize =gora]
      [%reissue =id new=(set ship)]
  ==
:: old state actions, objects
::
+$  log
  $%  [%offer-log =id]
      [%blacklist =id]
      [%request-log =ship =id]
  ==
++  one
  |%
  ::
  +$  manage-gora-1
    $%  [%set-max-hodl =id max=@ud]
        [%pubmod-host =id public=?]
        [%pubmod-hodl =id public=?]
        [%add-tag tag=@tas gorae=(set id)]
        [%del-tag tag=@tas gorae=(set id)]
        ::
        [%reject-give =id]
        [%approve-give =id]
        [%send-give =id new=(set ship)]
        ::
        [%send-request =id =ship]
        [%reject-request =id =ship]
        [%approve-request =id =ship]
        ::
        [%send-reissue =id new=(set ship)]
        [%send-transfer =id new=(set ship)]
        ::
        [%delgora =id]
        ::
        $:  %mkgora
            name=@t
            =pic
            public=?
            max=(unit @ud)
            req=?(%approve %reject %none)
            giv=?(%transfer %reissue %none)
        ==
        ::
        [%clean-log =log]
        [%usps-mode mode=?]
        [%resubscribe-all ~]
    ==
  ::
  +$  transact-1
    $%  [%giv-ack =id]
        [%receive-transfer =gora]
        [%receive-request =id]
        [%receive-gora =id giv=?(%transfer %reissue %none)]
        [%proxy-approve =id =ship]
        [%update act=?(%upd %del) jot=(unit update)]
    ==
  ::
  +$  update
    $%  [%update-image ~]
        [%host-public pub=?]
        [%new-hodlr =ship]
        [%initialize =gora]
        [%reissue =id new=(set ship)]
    ==
  ::
  +$  gora
    $:  =id
        =name
        =pic
        =host
        =made
        =hodl
        host-public=?
        =max
        request-behavior=?(%approve %reject %none)
        give-permissions=?(%transfer %reissue %none)
    ==
  --
++  zero
  |%
  +$  manage-gora
   $%  [%clean-log =log]
       [%delgora =id]
       [%reject-give =id]
       [%approve-give =id]
       [%mkgora name=@t =pic]
       [%send-give =id =ship]
       [%send-request =id =ship]
       [%reject-request =id =ship]
       [%approve-request =id =ship]
   ==
  ::
  +$  transact
    $%  [%giv-ack =id]
        [%receive-gora =gora]
        [%receive-request =id]
        [%proxy-approve =id =ship]
        [%update act=?(%upd %del) =gora]
    ==
  ::
  +$  gora
    $:  =id    =name
        =pic   =host
        =made  =hodl
    ==
  --
--