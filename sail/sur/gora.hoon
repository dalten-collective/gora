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
+$  tag   @tas
+$  pic   cord
+$  max   (unit @ud)
+$  name  cord
+$  host  ship
+$  hodl  (set ship)
+$  stak  (map ship @ud)
+$  made  @da
+$  act   ?(%give %take %gack)
+$  nul   (unit (list gora-standard))
::
::  %g gorae are standard gorae
::  %s gorae are stakable gorae
::
+$  gora
  $%  gora-standard
      gora-stakable
  ==
+$  gora-standard
  [%g =id =name =pic =host =made =hodl =max]
+$  gora-stakable
  [%s =id =name =pic =host =made =stak =nul]
::
::    poke actions
::  available to users
::  -  gora-handle
::  gora-handle                    advanced user actions
::  [%ignore-give @uv]             ignores a given gorae
::  [%accept-give @uv]             accepts a given gorae
::  [%ignore-request @uv @p]       ignore pleas for gora
::  [%accept-request @uv @p]       accept pleas for gora
::  [%send-gora @uv (set ship)]    give a gora to people
::  [%send-plea @uv @p]            ask ship for gora @uv
::  [%kick ~]                      maybe gora is naughty
::
+$  manage-gora-2
  $%  gora-handle
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
::  [%rm-gora @uv]                               deletes a gora, local or remote
::  [%set-max @uv (unit @ud)]                    sets max hodlers, gora-standard
::  [%add-tag @tas (set id)]                     adds a tag across a set of gora
::  [%rem-tag @tas (set id)]                     remove a tag from a set of gora
::  [%stak-em (set id) @t @t]                    convert a set gorae into a stak
::  [%set-pol @uv u?(%approve %decline)]         (un)set a gora's request policy
::  [%mk-gora @t @t ?([%g hodl max] [%s stak])]  start a new gora with hodl/stak
::
+$  gora-handle
  $%  [%rm-gora =id]
      [%set-max =id =max]
      [%pub-gor =id how=?]
      [%add-tag tag=@tas gorae=(set id)]
      [%rem-tag tag=@tas gorae=(set id)]
      [%set-pol =id pol=(unit ?(%approve %decline))]
      [%mk-gora =name =pic type=(each [=hodl =max] =stak)]
      [%stak-em dez=(set id) which=(each id [=name =pic])]
  ==
:: agent actions
::
+$  transact-2
  $%  [%gack =id]
      [%diff =diff]
      [%request =id]
      [%offered =gora]
  ==
+$  diff
  $%  [%illustrate new=pic]
      [%change-max =max]
      [%give-staks new=stak]
      [%add-hodler new=hodl]
      [%start-stak =id =name =pic =host =made =stak =nul]
      [%start-gora =id =name =pic =host =made =hodl =max]
      [%deleted-me ~]
  ==
::  state for rudder
::
+$  tack
  $:  pita=(map id gora)
      public=(set id)
      policy=(map id ?(%approve %decline))
  ::
    $=  logs
    $:  offers=(set id)
        requests=(jug ship id)
    ::
      $=  outgoing
      (mip id [ship act] [@da (unit ?)])
    ==
  ::
    tags=(jug @tas id)
    blacklist=(set id)
  ==
::
:: old state actions, objects
::
++  old
  |%
  +$  log
    $%  [%offer-log =id]
        [%blacklist =id]
        [%request-log =ship =id]
    ==
  +$  made  [y=@ud m=@ud d=@ud]
  --
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
        [%clean-log =log:old]
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
        =made:old
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
   $%  [%clean-log =log:old]
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
    $:  =id        =name
        =pic       =host
        =made:old  =hodl
    ==
  --
--