
::
:: gora app file
::
:: Technical Debt/Nice To Haves
::  - Add remove-me transaction where a user deletes a poap they have, from someone else
::  - Teams for issuance of gora (e.g. ~sicdev-pilnup can create ~dalten gora)
::  - hashing of gora
::  - idk probably a lot of other shit.
::  - "feed watch" - sub on /feed/(scot %p host-ship) and get every new token they mint delivered, but you're not a hodler
/-  *gora
/+  *server, default-agent, dbug
|%
+$  versioned-state
    $%  state-zero
    ==
+$  state-zero  [%0 =pita =request-log =offer-log =sent-log]
+$  card  card:agent:gall
--
::
%-  agent:dbug
=|  state-zero
=*  state  -
^-  agent:gall
=<
::!.
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %|) bowl)
    hc    ~(. +> bowl)
++  on-init
  ^-  (quip card _this)
  ~&  >  '%gora initialized'
  =.  state  [%0 ~ ~ ~ ~]
  `this
++  on-save
  ^-  vase
  !>(state)
++  on-load
  |=  incoming-state=vase
  ^-  (quip card _this)
  ~&  >  '%gora loaded'
  =/  state-ver  !<(versioned-state incoming-state)
  ?-  -.state-ver
    %0
  `this(state state-ver)
  ==
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  |^
  =^  cards  state
  ?+  mark            (on-poke:def mark vase)
      %gora-man       (manag-hndl:hc !<(manage-gora vase))
      %gora-transact  (trans-hndl:hc !<(transact vase))
  ==
  [cards this]
  --
++  on-peek  on-peek:def
++  on-watch
  |=  =path
  ^-  (quip card _this)
  ~&  >>>  [-.path path]
  ~&  >  (~(get by pita) +:(scan (trip +<.path) bisk:so))
  ?+  i.-.path  (on-watch:def path)
    %updates
  =+  (~(got by pita) +:(scan (trip +<.path) bisk:so))
  :_  this
  :~  :*  %give
        %fact
      ~
    [%gora-transact !>((transact %update %upd -))]
  ==  ==
  ==
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card _this)
  ?+  -.sign  (on-agent:def wire sign)
      %fact
    =/  transaction=transact  !<(transact q.cage.sign)
    =^  cards  state
    (trans-hndl transaction)
    [cards this]
  ==
++  on-leave  on-leave:def
++  on-arvo  on-arvo:def
++  on-fail  on-fail:def
--
::!.
|_  bol=bowl:gall
++  trans-hndl
|=  transaction=transact
?-  -.transaction
      %update
    ?-  act.transaction
        %upd
      =.  pita  (~(put by pita) gora-id.gora.transaction gora.transaction)
      ?.  (~(has in hodl-list.gora.transaction) our.bol)
        `state
      =.  sent-log  (~(del ju sent-log) gora-id.gora.transaction [src.bol %ask])
      `state
        %del
      =.  pita  (~(del by pita) gora-id.gora.transaction gora.transaction)
      =.  sent-log  (~(del ju sent-log) gora-id.gora.transaction [src.bol %ask])
      `state
    ==
      %receive-request
    =.  request-log  (~(put ju request-log) src.bol gora-id.transaction)
    `state
      %receive-gora
    =.  offer-log  (~(put in offer-log) gora-id.gora.transaction)
    :_  state
    :~  :*  %pass   /updates/(scot %ud gora-id.gora.transaction)/(scot %p our.bol)/(scot %da now.bol)
            %agent  [src.bol %gora]
            %watch  /updates/(scot %ud gora-id.gora.transaction)  ==  ==
      %giv-ack
    ?>  &((~(has by pita) gora-id.transaction) (~(has ju sent-log) gora-id.transaction [src.bol %giv]))
    =+  (~(got by pita) gora-id.transaction)
    =.  pita  (~(put by pita) gora-id.transaction -(hodl-list (~(put in hodl-list.-) src.bol)))
    =.  sent-log  (~(del ju sent-log) gora-id.transaction [src.bol %giv])
    :_  state
    :~  :*  %give
        %fact
      ~[/updates/(scot %ud gora-id.transaction)]
    [%gora-transact !>((transact %update %upd -(hodl-list (~(put in hodl-list.-) src.bol))))]  ==  ==
    ==
++  manag-hndl
  |=  v=manage-gora
  |^
  ?>  (team:title our.bol src.bol)
  ?-  -.v
    %mkgora
  ~|  'Failed to %make-gora {<name.v>} - Identical gora-hash found.'
  =+  (mkgora-id name.v)
  ?<  (~(has by pita) -)
  =.  pita  (~(put by pita) - `gora`[- name.v gora-img.v our.bol ~])
  `state
    %delgora
  ?>  (team:title src.bol our.bol)
  ?:  (team:title our.bol host:(~(got by pita) gora-id.v))
    =.  pita  (~(del by pita) gora-id.v)
    :_  state
    :~  :*  %give
        %fact
      ~[/updates/(scot %ud gora-id.v)]
    [%gora-transact !>((transact %update %del -))]  ==  ==
  =.  pita  (~(del by pita) gora-id.v)
  `state
    %send-give
  ?<  &((~(has ju sent-log) gora-id.v [ship.v %giv]) !(~(has by pita) gora-id.v))
  =.  sent-log  (~(put ju sent-log) gora-id.v [ship.v %giv])
  :_  state
  :~  :*  %pass   /transact/send-giv/(scot %ud gora-id.v)/(scot %p our.bol)/(scot %da now.bol)
          %agent  [ship.v %gora]
          %poke   %gora-transact  !>((transact %receive-gora (~(got by pita) gora-id.v)))  ==  ==
    %send-request
  ?<  (~(has ju sent-log) gora-id.v [ship.v %ask])
  =.  sent-log  (~(put ju sent-log) gora-id.v [ship.v %ask])
  :_  state
  :~  :*  %pass   /transact/send-req/(scot %ud gora-id.v)/(scot %p our.bol)/(scot %da now.bol)
          %agent  [ship.v %gora]
          %poke   %gora-transact  !>((transact %receive-request gora-id.v))  ==  ==
    %approve-request
  ?>  &((~(has ju request-log) ship.v gora-id.v) (~(has by pita) gora-id.v))
  =.  request-log  (~(del ju request-log) ship.v gora-id.v)
  =/  act-gora=gora  (~(got by pita) gora-id.v)
  =.  pita  (~(put by pita) gora-id.v act-gora(hodl-list (~(put in hodl-list.act-gora) ship.v)))
  :_  state
  :~  :*  
    %give  %fact
    ~[/updates/(scot %ud gora-id.v)]
    [%gora-transact !>((transact %update %upd act-gora(hodl-list (~(put in hodl-list.act-gora) ship.v))))]
  ==  ==
    %approve-give
  ?>  (~(has in offer-log) gora-id.v)
  =.  offer-log  (~(del in offer-log) gora-id.v)
  =+  (~(got by pita) gora-id.v)
  :_  state
  :~  :*
    %pass   /transact/give-ack/(scot %ud gora-id.v)/(scot %p host.-)/(scot %da now.bol)
    %agent  [host.- %gora]
    %poke   %gora-transact  !>((transact %giv-ack gora-id.v))
      ==
      :* 
    %pass   /updates/(scot %ud gora-id.v)/(scot %p our.bol)/(scot %da now.bol)
    %agent  [host.- %gora]
    %watch  /updates/(scot %ud gora-id.v)
  ==  ==
  ==
  ++  mkgora-id
    :: This is a false hash and needs to be replaced
    |=  in=@t
    `@`in
  --
--