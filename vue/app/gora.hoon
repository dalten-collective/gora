::
::  %gora - by ~dalten Collective (vue version)
::  %gora is a proof of presence protocol (POPP) that is
::  intended to be extensible, flexible and educational
::  (at least for new hooners). %gora has two distros in
::  circulation - these can be found at:
::  ~laddys-dozzod-dalten (Vue.js frontend)
::  ~mister-dozzod-dalten (sail frontend)
::
::  %gora sail relies on schooner, a library also produced
::  by ~dalten Collective. The library is included in the
::  sail package.
::
::  %gora has several available methods including:
::    &gora-man actions:
::     [%mkgora 'title' 'url']                       -Make a new gora
::     [%delgora 0vid.g032h.34300]                   -Delete an existing gora
::     [%send-give 0vid.g032h.34300 ~sampel-palnet]  -Send a gora to a recipient
::     [%send-request 0vid.g032h.34300 ~dalten]      -Request a gora from a host
::     [%approve-give 0vid.g032h.34300]              -Approve an incoming gora gift
::     [%approve-request 0vid.g032h.34300 ~dev]      -Approve an incoming gora request
::     [%reject-give 0vid.g032h.34300]               -Decline an incoming gora gift
::     [%reject-request 0vid.g032h.34300 ~dev]       -Deny an incoming gora request
::   and others that are more oriented towards machine use.
::
::  %gora has several available scries as well:
::      [%x %requests @ ~]                           -Get gora-ids for gora requested from specified ship
::    .^((set @uv) %gx /=gora=/requests/~zod/noun)
::    ::
::      [%y %made-gora ~]
::    =g -build-file  /=gora=/sur/gora/hoon          -Get a set gora of gorae you've made
::    .^((set gora.g) %gy /=gora=/made-gora)
::    ::
::  join ~dalten/dalten-collective-public if you have ideas for others.
::  Or, swing by the repo: https://github.com/dalten-collective/gora
::
/-  *gora
/+  *server, default-agent, dbug, schooner
::
|%
+$  versioned-state
    $%  state-zero
    ==
+$  state-zero  
    $:  %0            =pita
        =request-log  =offer-log
        =sent-log     =blacklist
    ==
+$  card  card:agent:gall
+$  eyre-id  @ta
--
::
%-  agent:dbug
=|  state-zero
=*  state  -
^-  agent:gall
=<
::
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %|) bowl)
    hc    ~(. +> bowl)
::
++  on-init
  ^-  (quip card _this)
  ~&  >>>  [%gora %start %vue]
  `this
::
++  on-save
  ^-  vase
  !>(state)
::
++  on-load
  |=  ole=vase
  ^-  (quip card _this)
  ~&  >>  [%gora %reload %vue]
  =/  old  !<(versioned-state ole)
  ?-  -.old
    %0
  :_  this(state old)
  [%pass /eyre/connect %arvo %e %disconnect `[%apps %gora ~]]~
  ::
  ==
::
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  =^  cards  state
    ?+  mark  (on-poke:def mark vase)
        %gora-man
      (manage-handle:hc !<(manage-gora vase))
      ::
        %gora-transact
      (transact-handle:hc !<(transact vase))
      ::
    ==
  [cards this]
::
++  on-watch
  |=  =path
  ^-  (quip card _this)
  ?+  path  (on-watch:def path)
      [%http-response *]
    `this
    ::
      [%updates @ *]
    ?:  !(~(has by pita) (slav %uv i.t.path))  
      ~&  >>>  [%unexpected-subscription %bad-id]
      :_  this
      :~  :*
            %give
            %kick
            ~[~[%updates i.t.path]]
            `src.bowl
      ==  ==
      ::
    =+  (~(got by pita) (slav %uv i.t.path))
    :_  this
    :~  :*
          %give
          %fact
          ~
          [%gora-transact !>((transact %update %upd -))]
    ==  ==
    ::
  ==
::
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card _this)
  ?+  -.sign  (on-agent:def wire sign)
      %fact
    ?.  !=(%gora-transact p.cage.sign)
      =^  cards  state
      (transact-handle !<(transact q.cage.sign))
      [cards this]
    ~&  >>>  [%unexpected-mark p.cage.sign]  !!
      %kick
    ?.  (~(has by pita) +:(slaw %ud +<.wire))
      =.  pita  (~(del by pita) +:(slaw %ud +<.wire))
      `this
    ~&  >>>  [%unexpected-kick wire src.bol]  !!
  ==
::
++  on-peek
  |=  =path
  ^-  (unit (unit cage))
  ?+  path  (on-peek:def path)
      [%x %requests @ ~]
    ?>  (team:title our.bowl src.bowl)
    =-  ``noun+!>(`(set @uv)`-)
    (~(get ju request-log) (slav %p i.t.t.path))
    ::
      [%y %made-gora ~]
    ?>  (team:title our.bowl src.bowl)
    =-  ``noun+!>(`(set gora)`-)
    =+  :-  mine=*(set gora)
    all=~(tap in ~(key by pita))   
    |-  ^-  (set gora)
    ?~  all
      mine
    ?.  %+  team:title  our.bowl
    host:(~(got by pita) i.all)
      $(all t.all)
    %=  $
      all   t.all
      mine  (~(put in mine) (~(got by pita) i.all))
    ==
    ::
  ==
::
++  on-leave  on-leave:def
++  on-arvo  on-arvo:def
++  on-fail  on-fail:def
--
::!.
|_  bol=bowl:gall
++  mkgora-id
  |=  in=@t
  (sham our.bol now.bol in)
::
++  json-hndl
  |^
  =+  :+  p=(~(rep by pita) pita-filter)
          q=(roll ~(tap in offer-log) offer-map)
          r=(~(rep by sent-log) pending-requests)
  %-  pairs:enjs:format
  :~  ['ownd' `json`a/(~(rep by out.p) hedl)]
      ['offd' `json`a/(~(rep by q) hedl)]
      ['pend' `json`a/r]
  ==
  ::
  ++  hedl
    |=  [[key=@ val=gora] out=(list json)]
    :-  %-  pairs:enjs:format
    :~  ['id' [%s (scot %uv gora-id.val)]]
        ['goraName' [%s name.val]]
        ['url' [%s gora-img.val]]
        ['host' [%s (scot %p host.val)]]
        ['date' (date-parse issue-date.val)]
        ::
        :-  'owners'
          :-  %a
        (turn ~(tap in hodl-list.val) ship:enjs:format)
    ==
    out
  ::
  ++  offer-map
    |=  [in=gora-id out=^pita]
    ?:  (~(has by pita) in)
      (~(put by out) in (~(got by pita) in))
    out
  ::
  ++  pita-filter
    |=  [[p=gora-id q=gora] out=^pita]
    ?:  (~(has in hodl-list.q) our.bol)
      (~(put by out) p q)
    out
  ::
  ++  pending-requests
    |=  [[p=gora-id q=(set [ship ?(%ask %giv)])] out=(list json)]
    ^-  (list json)
    ~|  [%unexpected-web-request %missing-gora]
    ?>  (~(has by pita) p)
    =+  [req=~(tap in q) gor=(~(got by pita) p)]
    |-
    ?~  req
      out
    ?:  =(~ (find [host.gor %ask]~ req))
      $(req t.req)
    %=  $
      req  t.req
      out  :_  out
           %-  pairs:enjs:format
           :~  ['id' [%s (scot %uv gora-id.gor)]]
               ['goraName' [%s name.gor]]
               ['url' [%s gora-img.gor]]
               ['host' [%s (scot %p host.gor)]]
           ==
    ==
  ++  date-parse
    |=  [y=@ud m=@ud d=@ud]
    ^-  json
    %-  pairs:enjs:format
    :~  ['year' (numb:enjs:format y)]
        ['month' (numb:enjs:format)]
        ['day' (numb:enjs:format d)]
    ==
  --
++  transact-handle
  |=  transaction=transact
  ^-  (quip card _state)
  =,  transaction
  ?-  -.+<
      %update
    ?-  +<.+<
        %del
      =.  pita
        (~(del by pita) gora-id.gora gora)
      =.  sent-log
        (~(del ju sent-log) gora-id.gora [src.bol %ask])
      `state
      ::
        %upd
      =.  pita
        (~(put by pita) gora-id.gora gora)
      ?.  (~(has in hodl-list.gora) our.bol)
        `state
        ::
      =.  sent-log
        (~(del ju sent-log) gora-id.gora [src.bol %ask])
      `state
      ::
    ==
    ::
      %receive-request
    ~|  [%unexpected-request %not-watching-id]
    ?>  ?&  
          (~(has by pita) gora-id)
          =(our.bol host:(~(got by pita) gora-id))
        ==
    =.  request-log
      (~(put ju request-log) src.bol gora-id)
    `state
    ::
      %receive-gora
    ~|  [%unexpected-offer %duplicate-offer-id]
    ?>  ?&
          !(~(has in offer-log) gora-id.gora)
          !(~(has in blacklist) gora-id.gora)
        ==
    =.  offer-log  (~(put in offer-log) gora-id.gora)
    :_  state
    :~  :*  
          %pass   /updates/(scot %uv gora-id.gora)/(scot %p our.bol)
          %agent  [src.bol %gora]
          %watch  /updates/(scot %uv gora-id.gora)
    ==  ==
      %giv-ack
    ?>  ?&  (~(has by pita) gora-id)
            (~(has ju sent-log) gora-id [src.bol %giv])
        ==
    =+  (~(got by pita) gora-id)
    =.  -  -(hodl-list (~(put in hodl-list.-) src.bol))
    =.  pita  
    (~(put by pita) gora-id -)
    =.  sent-log
      (~(del ju sent-log) gora-id (sy [src.bol %giv]~))
    :_  state
    :~  :*  
          %give
          %fact
          ~[/updates/(scot %uv gora-id)]
          :-  %gora-transact
          !>(`transact`[%update %upd -])
    ==  ==
  ==
::
++  manage-handle
  |=  v=manage-gora
  ^-  (quip card _state)
  ?>  (team:title our.bol src.bol)
  ?-  -.v
      %mkgora
    ~|  [%failed-gora-make name.v %identical-hash]
    =+  [id=(mkgora-id name.v) date=(yore now.bol)]
    ?>  !(~(has by pita) id)
    =.  pita  
      %+  ~(put by pita)
        id
      :*  id
          name.v
          gora-img.v
          our.bol
          [y.date m.date d.t.date]
          ~
      ==
    ~&  >  [%gora (trip name.v) %created (scow %uv id)]
    `state
    ::
      %delgora
    ~|  [%failed-delete (scow %uv gora-id.v)]
    ?>  (~(has by pita) gora-id.v)
    ?:  =(our.bol host:(~(got by pita) gora-id.v))
      =+  (~(got by pita) gora-id.v)
      =.  pita  (~(del by pita) gora-id.v)
      :_  state
      :~  :*  
            %give
            %fact
            ~[/updates/(scot %uv gora-id.v)]
            [%gora-transact !>(`transact`[%update %del `gora`-])]
      ==  ==
      ::
    =/  host  host:(~(got by pita) gora-id.v)
    =.  pita  (~(del by pita) gora-id.v)
    :_  state
    :~  :*  
          %pass   /updates/(scot %uv gora-id.v)/(scot %p our.bol)
          %agent  [host %gora]
          %leave  ~
    ==  ==
    ::
      %send-give
    ?>  ?&  
          (~(has by pita) gora-id.v)
          !(~(has ju sent-log) gora-id.v [ship.v %giv])
        ==
    =.  sent-log
      (~(put ju sent-log) gora-id.v [ship.v %giv])
    :_  state
    :~  :*
          %pass   /transact/send-giv/(scot %uv gora-id.v)/(scot %p our.bol)/(scot %da now.bol)
          %agent  [ship.v %gora]
          %poke   %gora-transact  !>((transact %receive-gora (~(got by pita) gora-id.v)))
    ==  ==
    ::
      %send-request
    ?>  !(~(has ju sent-log) gora-id.v [ship.v %ask])
    =.  sent-log
      (~(put ju sent-log) gora-id.v [ship.v %ask])
    :_  state
    :~  :* 
          %pass   /transact/send-req/(scot %uv gora-id.v)/(scot %p our.bol)/(scot %da now.bol)
          %agent  [ship.v %gora]
          %poke   %gora-transact  !>((transact %receive-request gora-id.v))
        ==
        :*
          %pass   /updates/(scot %uv gora-id.v)/(scot %p our.bol)
          %agent  [ship.v %gora]
          %watch  /updates/(scot %uv gora-id.v)  
    ==  ==
    ::
      %approve-request
    ~|  [%bad-request (scot %uv gora-id.v) (scot %p ship.v)]
    ?>  ?&
          (~(has ju request-log) ship.v gora-id.v)
          (~(has by pita) gora-id.v)
        ==
    =.  request-log
      (~(del ju request-log) ship.v gora-id.v)
    =+  (~(got by pita) gora-id.v)
    =/  act-gora=gora
      %=  -
        hodl-list  (~(put in hodl-list) ship.v)
      ==
    =.  pita  (~(put by pita) gora-id.v act-gora)
    :_  state
    :~  :*
          %give
          %fact
          ~[/updates/(scot %uv gora-id.v)]
          :-  %gora-transact
          !>(`transact`[%update %upd act-gora])
    ==  ==
    ::
      %approve-give
    ~|  [%unrecognized-offer (scot %uv gora-id.v)]
    ?>  (~(has in offer-log) gora-id.v)
    =+  (~(got by pita) gora-id.v)
    :_  %=  state
          offer-log  (~(del in offer-log) gora-id.v)
        ==
    :~  :*  %pass   /transact/give-ack/(scot %uv gora-id.v)/(scot %p host.-)/(scot %da now.bol)
            %agent  [host.- %gora]
            %poke   %gora-transact  !>((transact %giv-ack gora-id.v))
    ==  ==
    ::
      %reject-give
    ~|  [%unrecognized-offer (scot %uv gora-id.v)]
    ?>  (~(has in offer-log) gora-id.v)
    =.  offer-log  (~(del in offer-log) gora-id.v)
    =.  blacklist  (~(put in blacklist) gora-id.v)
    =+  (~(got by pita) gora-id.v)
    :_  state
    :~  :*
          %pass   /updates/(scot %uv gora-id.v)
          %agent  [host %gora]
          %leave  ~
    ==  ==
    ::
      %reject-request
    ~|  [%bad-request (scot %uv gora-id.v) (scot %p ship.v)]
    ?>  (~(has in (~(got by request-log) ship.v)) gora-id.v)
    =.  request-log
      (~(del ju request-log) ship.v gora-id.v)
    :_  state
    :~  :*
        %give  %kick
        ~[/updates/(scot %uv gora-id.v)]
        `ship.v
    ==  ==
  ==
--