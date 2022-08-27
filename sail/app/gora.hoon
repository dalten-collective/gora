::  /app/gora
::
::  %gora - a proof of presence protocol (sail version)
::    by quartus and the dalten collective
::
::  %gora has two versions in circulation:
::    ~laddys-dozzod-dalten (Vue.js frontend)
::    ~mister-dozzod-dalten (sail frontend)
::
::  %gora's sail version has moved to utilizing rudder,
::  by paldev. more here: https://github.com/Fang-/suite
::
::  %gora's user pokes include the following:
::
::  interacting with gora:
::  -  [%ignore-give @uv]
::    ignore gora @uv sent to u
::  -  [%accept-give @uv]
::    accept gora @uv sent to u
::  -  [%ignore-request @uv @p]
::    ignore request for gora @uv from @p
::  -  [%accept-request @uv @p]
::    accept request for gora @uv from @p
::  -  [%send-gora @uv (set ship)]
::    send gora @uv to (set ship)
::  -  [%send-plea @uv @p]
::    ask @p for gora @uv
::  -  [%kick ~]
::    maybe gora is naughty
::
::  making & changing gorae:
::  -  [%rm-gora @uv]
::    delete the gora with id=@uv
::  -  [%set-max @uv (unit @ud)]
::    set max allowed gorae
::  -  [%add-tag @tas (set id)]
::    add a tag to some gorae
::  -  [%rem-tag @tas (set id)]
::    remove a tag from some gorae
::  -  [%stak-em (set id) @t @t]
::    convert a set of gorae into a stak
::  -  [%set-pol @uv u?(%approve %decline)]
::    (un)set a gora's acceptance policy
::  -  [%mk-gora @t @t ?([%g hodl max] [%s stak])]
::    make a gora
::
::  %gora's scry endpoints include:
::    -  [%y %slam ~]
::      %slam integration
::    -  TBD
::
/-  *gora
/+  default-agent, dbug
::
|%
::
+$  card     card:agent:gall
+$  eyre-id  @ta
::
+$  versioned-state
  $%  state-2
      state-1
      state-0
  ==
:: state-2 structures
::
+$  state-2
  $:  %2
      =pita                                             ::  known gorae
      =public                                           ::  public gorae
      =policy                                           ::  gorae policies
      =logs                                             ::  logging information
      =tags                                             ::  tagging information
      =blacklist                                        ::  blocked gorae
  ==
+$  tag        @tas
+$  act        ?(%give %take %gack)
+$  tags       (jug tag id)
+$  pita       (map id gora)
+$  public     (set id)
+$  blacklist  (set id)
+$  logs                                                ::  activity log
  $:  offers=(set id)                                   ::  - incoming offers
      requests=(jug ship id)                            ::  - incoming requests
  ::                                                    ::   -and-
    $=  outgoing                                        ::  - outgoing actions
    (mip id [=ship =act] [wen=@da dun=(unit ?)])
  ==
+$  policy  (map id ?(%approve %decline))               ::  optional auto-action
:: old state structures
::
+$  state-1
  $:  %1
      =usps-mode  
      pita=pita-1
      =public     
      =request-log
      =offer-log  
      =blacklist
      =tag-set    
      =tags
      pend=(mip id [=ship =gib] [wen=@da dun=?])
  ==
::
+$  state-0
  $:  %0            
      pita=pita-0
      =request-log
      =offer-log
      =sent-log
      =blacklist
  ==
::
+$  tag-set      (set tag)
+$  sent-log     (jug id [ship ?(%ask %giv)])
+$  offer-log    (set id)
+$  usps-mode    ?
+$  request-log  (jug ship id)
+$  gib
  ?(%send-ask %send-giv %give-ack %chain-it %proxy-it)
::
+$  pita-1  (map id gora:one)
+$  pita-0  (map id gora:zero)
--
::
%-  agent:dbug
=|  state-2
=*  state  -
^-  agent:gall
=<
::!.
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %|) bowl)
    hc    ~(. +> bowl)
    ak    ((on @da ,[id ship act (unit ?)]) gth)
::
++  on-init
  ^-  (quip card _this)
  %-  (slog leaf+"%gora -sail-start" ~)
  :_  this(state [%2 ~ ~ ~ [~ ~ ~] ~ ~])
  :~  =-  [%pass /eyre/connect %arvo %e -]
      [%connect [[~ [%apps %gora ~]] dap.bowl]]
  ::
      =-  [%pass /behn/suichi/(scot %da now.bowl) -]
      :+  %arvo  %b
  ::  XX replace: [%wait (add (sub now (mod now ~d1)) ~d1)]
      [%wait (add now.bowl ~m1)]
  ==
::
++  on-save
  ^-  vase
  !>(state)
::
++  on-load
  |=  ole=vase
  |^  ^-  (quip card _this)
  =/  old=versioned-state  !<(versioned-state ole)
  =/  cards=(list card)
      :~  =-  [%pass /eyre/disconnect %arvo %e -]
          [%disconnect [~ [%apps %gora %public ~]]]
        ::
          =-  [%pass /eyre/connect %arvo %e -]
          [%connect [[~ [%apps %gora ~]] dap.bowl]]  
      ==
  =^  caz  old
    ?:(?=(%0 -.old) (from-0 old) [~ old])
  =^  coz  old
    ?:(?=(%1 -.old) (from-1 old) [~ old])
  ?>  ?=(%2 -.old)
  %-  (slog leaf+"%gora -sail-loaded" ~)
  [:(welp coz caz cards) this(state old)]
  ::
  ++  from-0
    |=  sta=state-0
    ^-  (quip card state-1)
    :-  ~ 
    :^    %1
        %.y
      %-  ~(run by pita.sta)
      |=  o=gora:zero
      ^-  gora:one
      :+  id.o  name.o
      [pic.o host.o made.o hodl.o %.n ~ %none %none]
    [~ request-log.sta offer-log.sta blacklist.sta ~ ~ ~]
  ::
  ++  from-1
    |=  sta=state-1
    ^-  (quip card state-2)
    =/  new-pita=_pita
      (mk-gora2 pita.sta)
    :-  :_  (weld pivot:subs:hc (gora:subs:hc new-pita))
        =-  [%pass /behn/suichi/(scot %da now.bowl) -]
        [%arvo %b [%wait (add now.bowl ~m1)]]
    :*  %2
        new-pita
        public.sta
        (mk-policy pita.sta)
        [offer-log.sta request-log.sta (mk-logs pend.sta)]
        tags.sta
        blacklist.sta
    ==
  ::
  ++  mk-gora2
    |=  p=pita-1
    |^  ^-  _pita
    %-  ~(run by p)
    |=  o=gora:one
    ^-  gora
    [%g id.o name.o pic.o host.o (to-da made.o) hodl.o max.o]
    ++  to-da
      |=  [y=@ud m=@ud d=@ud]
      (slav %da (crip "~{(a-co:co y)}.{<m>}.{<d>}"))
    --
  ::
  ++  mk-policy
    |=  p=pita-1
    ^-  _policy
    %-  ~(rep by p)
    |=  $:  [key=id val=gora:one]
            pol=(map id ?(%approve %decline))
        ==
    ?.  =(our.bowl host.val)  pol
    ?-  request-behavior.val
      %none     pol
      %reject   (~(put by pol) key %decline)
      %approve  (~(put by pol) key %approve)
    ==
  ::
  ++  mk-logs
    |=  p=(mip id [=ship =gib] [wen=@da dun=?])

    =+  log=*(mip id [ship act] [@da (unit ?)])
    =/  old=(list [i=id [s=ship g=gib] [w=@da d=?]])
      ~(tap bi p)
    |-  ^-  (mip id [ship act] [@da (unit ?)])
    ?~  old  log
    %=    $
      old  t.old
    ::
        log
      ?+    g.i.old  ~
          %send-ask
        %-  ~(put bi log)
        =,  i.old
        [i [s %take] [(sub w (mod w ~d1)) `d]]
      ::
          %send-giv
        %-  ~(put bi log)
        =,  i.old
        [i [s %give] [(sub w (mod w ~d1)) `d]]
      ::
          %give-ack
        %-  ~(put bi log)
        =,  i.old
        [i [s %gack] [(sub w (mod w ~d1)) `d]]
      ==
    ==
  --
::
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  =^  cards  state
    ?+    mark  (on-poke:def mark vase)
    ::    %gora-man-2 mark handled in helper core
    ::
        %gora-man-2
      (manage:hc !<(manage-gora-2 vase))
    ::    %gora-transact-2, handle %gack, %offered, %request
    ::
        %gora-transact-2
      =/  tan=transact-2  !<(transact-2 vase)
      ?+    -.tan  (on-poke:def mark vase)
      ::    %gack - Affirmatively acknowledge a give
      ::  - check that we have this gora
      ::  - check that we are the host
      ::  - check that we have a record of giving
      ::    this gora to that person
      ::
          %gack
        ?~  gor=(~(get by pita) id.tan)  !!
        ?>  =(our.bowl host.u.gor)
        ?>  %-  ~(has bi outgoing.logs)
            [id.tan [src.bowl %give]]
        ?-    -.u.gor
            %g
          ::  if the given gora is a standard gora,
          ::  - check that we're not above our max
          ::  - add to the set of hodl
          ::  - clear any requests for that gora
          ::  - set a policy if necessary
          ::  - send a card indicating the new holder
          ::
          ?>  ?~  max.u.gor  %.y
              (gth u.max.u.gor ~(wyt in hodl.u.gor))
          =/  new-hodl=(set ship)
            (~(put in hodl.u.gor) src.bowl)
          =.  pita
            %-  ~(put by pita)
            [id.u.gor u.gor(hodl new-hodl)]
          =?    requests.logs
              %-  ~(has ju requests.logs)
              [src.bowl id.u.gor]
            (~(del ju requests.logs) src.bowl id.u.gor)
          =?    policy
              ?~  max.u.gor  %.n
              =(u.max.u.gor +(~(wyt in hodl.u.gor)))
            (~(put by policy) id.tan %decline)            
          =/  pat=path
            /gora/(scot %uv id.u.gor)
          :_  state
          =-  [%give %fact ~[pat] %gora-transact-2 -]~
          !>  ^-  transact-2
          [%diff [%add-hodler (sy ~[src.bowl])]]
        ::
            %s
          ::  if the given gora is a stakable gora
          ::  - make sure they don't already have it
          ::    * giving a stakable only requires a gack
          ::      once. thereafter, its automatic
          ::  - add them to the stak
          ::  - clear any requests for that gora
          ::  - send a card indicating the new holder
          ::
          ?<  (~(has in ~(key by stak.u.gor)) src.bowl)
          =/  new-stak=stak
            (~(put by stak.u.gor) src.bowl 1)
          =.  pita
            %-  ~(put by pita)
            [id.u.gor u.gor(stak new-stak)]
          =?    requests.logs
              %-  ~(has ju requests.logs)
              [src.bowl id.u.gor]
            (~(del ju requests.logs) src.bowl id.u.gor)
          =/  pat=path
            /gora/(scot %uv id.u.gor)
          :_  state
          =-  [%give %fact ~[pat] %gora-transact-2 -]~
          !>  ^-  transact-2
          [%diff [%give-staks (my [src.bowl 1]~)]]
        ==
      ::
          %offered
        =?    pita
            !(~(has by pita) id.gora.tan)
          (~(put by pita) id.gora.tan gora.tan)
        =?    logs
            ?-    -.gora.tan
              %g  !(~(has in hodl.gora.tan) our.bowl)
            ::
                %s
              ?!  %.  our.bowl
              ~(has in ~(key by stak.gora.tan))
            ==
          :-  (~(put in offers.logs) id.gora.tan)
          [requests.logs outgoing.logs]
        :_  state
        (gora:subs:hc pita)
      ::
          %request
        ?~  gor=(~(get by pita) id.tan)  !!
        ?>  =(our.bowl host.u.gor)
        =/  pat=path
          /gora/(scot %uv id.tan)/(scot %p host.u.gor)
        ?-    -.u.gor
            %g
          ?~  pol=(~(get by policy) id.tan)
            ?:  (~(has in hodl.u.gor) src.bowl)
              :_  state
              =-  [%give %fact ~[pat] %gora-transact-2 -]~
              !>  ^-  transact-2
              [%diff [%add-hodler (sy ~[src.bowl])]]
            =.  requests.logs
                (~(put ju requests.logs) src.bowl id.tan)
            `state
          ?-    u.pol
            %decline  !!
          ::
              %approve
            =?    policy
                ?~  max.u.gor  %.n
                =(u.max.u.gor +(~(wyt in hodl.u.gor)))
              (~(put by policy) id.tan %decline)
            =.  pita
              %+  ~(put by pita)  id.tan
              u.gor(hodl (~(put in hodl.u.gor) src.bowl))
            =.  requests.logs
              (~(del ju requests.logs) src.bowl id.tan)
            `state
          ==
          
        ::
            %s
          ?:  (~(has in ~(key by stak.u.gor)) src.bowl)
            :_  state
            =-  [%give %fact ~[pat] %gora-transact-2 -]~
            !>  ^-  transact-2
            [%diff [%give-staks stak.u.gor]]
          =.  requests.logs
            (~(put ju requests.logs) src.bowl id.u.gor)
          `state
        ==
      ==
    ==
  [cards this]
::
++  on-watch
  |=  =path
  ^-  (quip card _this)
  ?.  ?=([%updates @ ~] path)  (on-watch:def path)
  ~_  :-  %leaf
      """
      %gora -bad-sub
      > id: {(trip i.t.path)}
      > from: {(scow %p src.bowl)}
      """
  =/  id=@uv  (slav %uv i.t.path)
  ?~  gor=(~(get by pita) id)  !!
  ?>  =(our.bowl host.u.gor)
  :_  this
  =-  [%give %fact ~ [%gora-transact-2 -]]~
  ?-    -.u.gor
      %g
    !>(`transact-2`[%diff [%start-gora +.u.gor]])
  ::
      %s
    !>(`transact-2`[%diff [%start-stak +.u.gor]])
  ==
::
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  ?+   wire  (on-arvo:def wire sign-arvo)
      [%eyre %connect ~]
    ?+  sign-arvo  (on-arvo:def wire sign-arvo)
        [%eyre %bound *]
      ~?  !accepted.sign-arvo
        [dap.bowl [%eyre %bind %fail] binding.sign-arvo]
      `this
    ==
  ::
      [%behn %suichi @ ~]
    ?+  sign-arvo  (on-arvo:def wire sign-arvo)
        [%behn %wake *]
      ?~  error.sign-arvo
        ~&  >  [%behn %suichi ~]
        :_  this
        ;:  welp
          (gora:subs:hc pita)
          =-  [%pass /behn/suichi/(scot %da now.bowl) -]~
          [%arvo %b [%wait (add now.bowl ~m1)]]
        ==
      ~&  >>  [%behn %suichi error.sign-arvo]
      :_  this
      =-  [%pass /behn/suichi/(scot %da now.bowl) -]~
      [%arvo %b [%wait (add now.bowl ~m1)]]
    ==
  ==
::
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card _this)
  ?+    wire  (on-agent:def wire sign)
      [%updates @ @ ~]
    :_  this
    [%pass wire %agent [src.bowl %gora] %leave ~]~
  ::
      [%offer @ @ ~]
    =/  id=@uv   (slav %uv i.t.wire)
    =/  hu=ship  (slav %p i.t.t.wire)
    ?.  ?=(%poke-ack -.sign)  (on-agent:def wire sign)
    ?~  got=(~(get bi outgoing.logs) id [hu %give])
      ~_  leaf+"%gora -missing-offer-for-ack"  !!
    =.  outgoing.logs
      %+  ~(put bi:mip outgoing.logs)  id
      [[hu %give] [-.u.got `?=(~ p.sign)]]
    `this
  ::
      [%plead @ @ ~]
    =/  id=@uv   (slav %uv i.t.wire)
    =/  hu=ship  (slav %p i.t.t.wire)
    ?.  ?=(%poke-ack -.sign)  (on-agent:def wire sign)
    ?~  got=(~(get bi outgoing.logs) id [hu %take])
      ~_  leaf+"%gora -missing-plead-for-ack"  !!
    =.  outgoing.logs
      %+  ~(put bi:mip outgoing.logs)  id
      [[hu %take] [-.u.got `?=(~ p.sign)]]
    `this
  ::
      [%gora @ @ ~]
    =/  id=@uv   (slav %uv i.t.wire)
    =/  ho=ship  (slav %p i.t.t.wire)
    ?~  gor=(~(get by pita) id)
      ?+    sign
        :_  this
        [%pass wire %agent [[src.bowl %gora] %leave ~]]~
      ::
          [%kick ~]
        :_  this
        =-  [%pass wire %agent [src.bowl %gora] -]~
        [%watch [%updates i.t.wire ~]]
      ::
          [%watch-ack *]
        ?~  p.sign  `this
        ~&  >  "506"
        ((slog leaf+"%gora -watch-nack {<id>}" ~) `this)
      ::
          [%fact %gora-transact-2 *]
        =/  tan=transact-2
          !<(transact-2 q.cage.sign)
        ?+    tan  ~_  leaf+"%gora -strange-exit"  !!
            [%diff %start-stak *]
          ?>  ?&  (gte 32.768 (met 3 pic.diff.tan))
                  =(src.bowl host.diff.tan)
              ==
          ?~  nul.diff.tan
            =?    offers.logs
                ?&  (~(has in offers.logs) id.u.gor)
                ::
                    %.  our.bowl
                    ~(has in ~(key by stak.diff.tan))
                ==
              (~(del in offers.logs) id.u.gor)
            =.  pita
              (~(put by pita) id.diff.tan [%s +.diff.tan])
            `this
            ::
          ?>  %+  levy  u.nul.diff.tan
            |=(g=gora =(src.bowl host.g))
          =/  ids=(set id)
            (sy (turn u.nul.diff.tan |=(g=gora id.g)))
          =?    offers.logs
              ?&  (~(has in offers.logs) id.u.gor)
                  %.  our.bowl
                  ~(has in ~(key by stak.diff.tan))
              ==
            (~(del in offers.logs) id.u.gor)
          =.  pita
            %.  [id.diff.tan [%s +.diff.tan]]
            %~  put  by
            %-  ~(rep by pita)
            |=  [[k=^id v=gora] r=_pita]
            ?:  (~(has in ids) k)  r
            (~(put by r) k v)
          `this
        ::
            [%diff %start-gora *]
          ?>  ?&  ?~  max.diff.tan  %.y
                  %+  gte  u.max.diff.tan
                  ~(wyt in hodl.diff.tan)
                ::
                  (gte 32.768 (met 3 pic.diff.tan))
                  =(src.bowl host.diff.tan)
              ==
          =?    offers.logs
              ?&  (~(has in offers.logs) id.u.gor)
                  (~(has in new.diff.tan) our.bowl)
              ==
            (~(del in offers.logs) id.u.gor)
          =.  pita
            (~(put by pita) id.diff.tan [%g +.diff.tan])
          `this
        ==
      ==
      ::
    ?.  =(host.u.gor src.bowl)
      :_  this
      [%pass wire %agent [src.bowl %gora] %leave ~]~
    ?+    sign  (on-agent:def wire sign)
        [%kick ~]
      :_  this
      =-  [%pass wire %agent [src.bowl %gora] -]~
      [%watch [%updates i.t.wire ~]]
    ::
        [%watch-ack *]
      ?~  p.sign  `this
      %.  `this
      ~&  >  "557"
      (slog leaf+"%gora -watch-nack {<id.u.gor>}" ~)
    ::
        [%fact %gora-transact-1 *]
      =/  tan=transact-1:one
        !<(transact-1:one q.cage.sign)
      ?+    -.tan  `this
          %update
        ?-    act.tan
          %del  `this(pita (~(del by pita) id))
        ::
            %upd
          ?~  jot.tan  `this
          ?.  ?=(%new-hodlr -.u.jot.tan)  `this
          ?.  ?=(%g -.u.gor)  `this
          =.  pita
            %+  ~(put by pita)  id.u.gor
            u.gor(hodl (~(put in hodl.u.gor) ship.u.jot.tan))
          `this
        ==  
      ==
    ::
        [%fact %gora-transact-2 *]
      =/  tan=transact-2
        !<(transact-2 q.cage.sign)
      ?>  ?=(%diff -.tan)
      ?-    -.diff.tan
          %illustrate
        ?~  gor=(~(get by pita) id)
          :_  this
          [%pass wire %agent [src.bowl %gora] %leave ~]~
        =.  pita
          %+  ~(put by pita)
            id.u.gor
          u.gor(pic new.diff.tan)
        `this
          %change-max
        ?>  ?=(%g -.u.gor)
        ?~  max.diff.tan
          =.  pita
            %-  ~(put by pita)
            [id.u.gor u.gor(max max.diff.tan)]
          `this
        ?>  (gte u.max.diff.tan ~(wyt in hodl.u.gor))
        =.  pita
          %-  ~(put by pita)
          [id.u.gor u.gor(max max.diff.tan)]
        `this
          %give-staks
        ?>  ?=(%s -.u.gor)
        =?    offers.logs
            ?&  (~(has in offers.logs) id.u.gor)
                (~(has in new.diff.tan) our.bowl)
            ==
          (~(del in offers.logs) id.u.gor)
        =.  pita
          %+  ~(put by pita)  id.u.gor
          u.gor(stak (~(uni by stak.u.gor) new.diff.tan))
        `this
          %add-hodler
        ?>  ?=(%g -.u.gor)
        =?    offers.logs
            ?&  (~(has in offers.logs) id.u.gor)
                (~(has in new.diff.tan) our.bowl)
            ==
          (~(del in offers.logs) id.u.gor)
        =.  pita
          %+  ~(put by pita)  id.u.gor
          u.gor(hodl (~(uni in hodl.u.gor) new.diff.tan))
        `this
      ::
          %start-stak
        `this
      ::
          %start-gora
        `this
      ::
          %deleted-me
        =.  pita
          (~(del by pita) id)
        `this
      ==
    ==
  ==
::
++  on-peek
  |=  =path
  ^-  (unit (unit cage))
  ?+    path  (on-peek:def path)
       [%y %slam ~]
    =-  ``noun+!>(`(list [@t @t @p])`-)
    %-  ~(rep by pita)
    |=  [[@uv g=gora] l=(list [@t @t @p])]
    ?-    -.g
        %g
      ?.  (~(has in hodl.g) our.bowl)  l
      [[name.g pic.g host.g] l]
    ::
        %s
      ?.  (~(has in ~(key by stak.g)) our.bowl)  l
      [[name.g pic.g host.g] l]
    ==
  ::
      [%x %offers ~]
    ?>  (team:title our.bowl src.bowl)
    =-  ``json+!>(`json`a+-)
    (turn ~(tap in offers.logs) |=(o=@uv s+(scot %uv o)))
  ::
      [%x %requests @ ~]
    ?>  (team:title our.bowl src.bowl)
    =-  ``json+!>(`json`a+-)
    %+  turn
      %~  tap  in
      (~(get ju requests.logs) (slav %p i.t.t.path))
    |=(o=@uv s+(scot %uv o))
  ::
      [%x %tags ~]
    ?>  (team:title our.bowl src.bowl)
    =-  ``json+!>(`json`a+-)
    (turn ~(tap in ~(key by tags)) |=(t=@tas s+t))
  ::
      [%x %made-gora ~]
    ?>  (team:title our.bowl src.bowl)
    =-  ``noun+!>(`(set gora)`-)
    %-  ~(rep by pita)
    |=  [[k=id v=gora] s=(set gora)]
    ?.(=(our.bowl host.v) s (~(put in s) v))
  ==
::
++  on-leave  on-leave:def
++  on-fail   on-fail:def
--
::
|_  bol=bowl:gall
++  subs
  |%
  ++  pivot
    ^-  (list card)
    %-  ~(rep by wex.bol)
    |=  $:  [[w=wire h=ship t=term] [a=? p=path]]
            o=(list card)
        ==
    ?:  &(=(%gora t) !?=([%updates @ @ ~] w))  o
    [[%pass w %agent [h %gora] %leave ~] o]
  ++  paths
    ^-  (set path)
    %-  ~(rep by wex.bol)
    |=  $:  [[w=wire h=ship t=term] [a=? p=path]]
            o=(set path)
        ==
    ?.  ?&  =(%gora t)
            ?=([%gora @ @ ~] w)
            ?=([%updates @ ~] p)
        ==
      o
    ?.(a o (~(put in o) p))
  ++  gora
    |=  p=_pita
    =+  pat=paths
    ^-  (list card)
    %+  murn  ~(tap by p)
    |=  [i=id g=^gora]
    ?:  =(our.bol host.g)  ~
    ?:  (~(has in pat) [%updates (scot %uv i) ~])  ~
    :-  ~
    :+  %pass  /gora/(scot %uv i)/(scot %p host.g)
    [%agent [host.g %gora] %watch [%updates (scot %uv i) ~]]
  --
++  manage
  |=  man=manage-gora-2
  |^  ^-  (quip card _state)
  ?-    -.man
      $?  %rm-gora
          %set-max
          %add-tag
          %rem-tag
          %stak-em
          %set-pol
          %mk-gora
      ==
    (g-hand man)
  ::
      %ignore-give
    ?>  (~(has in offers.logs) id.man)
    ?~  gor=(~(get by pita) id.man)
      `state(offers.logs (~(del in offers.logs) id.man))
    =.  pita
      (~(del by pita) id.man)
    `state(offers.logs (~(del in offers.logs) id.man))
  ::
      %accept-give
    ?>  (~(has in offers.logs) id.man)
    ?~  gor=(~(get by pita) id.man)
      `state(offers.logs (~(del in offers.logs) id.man))
    =/  wir=path
      /allow/(scot %uv id.man)/(scot %p host.u.gor)
    :_  state(offers.logs (~(del in offers.logs) id.man))
    =-  [%pass wir %agent [host.u.gor %gora] %poke -]~
    [%gora-transact-2 !>(`transact-2`[%gack id.man])]
  ::
      %ignore-request
    ?>  (~(has ju requests.logs) ship.man id.man)
    ?~  gor=(~(get by pita) id.man)
      =.  requests.logs
        %-  ~(rep by requests.logs)
        |=  [[k=ship v=(set id)] r=(jug ship id)]
        ?.  (~(has in v) id.man)  (~(put by r) k v)
        (~(put by r) k (~(del in v) id.man))
      `state
    =.  requests.logs
      (~(del ju requests.logs) ship.man id.man)
    `state
      %accept-request
    ?>  (~(has ju requests.logs) ship.man id.man)
    ?~  gor=(~(get by pita) id.man)
      =.  requests.logs
        %-  ~(rep by requests.logs)
        |=  [[k=ship v=(set id)] r=(jug ship id)]
        ?.  (~(has in v) id.man)  (~(put by r) k v)
        (~(put by r) k (~(del in v) id.man))
      `state
    ?-  -.u.gor
        %g
      ?~  max.u.gor
        =.  requests.logs
          (~(del ju requests.logs) ship.man id.man)
        =.  pita
          %+  ~(put by pita)  id.u.gor
          u.gor(hodl (~(put in hodl) ship.man))
        =/  pat=path
          /updates/(scot %uv id.u.gor)
        :_  state
        =-  [%give %fact ~[pat] %gora-transact-2 -]~
        !>  ^-  transact-2
        [%diff [%add-hodler (sy ~[ship.man])]]
      ?>  (gth u.max.u.gor ~(wyt in hodl.u.gor))
      =.  requests.logs
        ?.  =(u.max.u.gor +(~(wyt in hodl.u.gor)))
          (~(del ju requests.logs) ship.man id.u.gor)
        %-  ~(rep by requests.logs)
        |=  [[k=ship v=(set id)] r=(jug ship id)]
        ?.  (~(has in v) id.man)  (~(put by r) k v)
        (~(put by r) k (~(del in v) id.man))
      =?    policy
          =(u.max.u.gor +(~(wyt in hodl.u.gor)))
        (~(put by policy) id.u.gor %decline)
      =.  pita
        %+  ~(put by pita)  id.u.gor
        u.gor(hodl (~(put in hodl.u.gor) ship.man))
      =/  pat=path
        /updates/(scot %uv id.u.gor)
      :_  state
      =-  [%give %fact ~[pat] %gora-transact-2 -]~
      !>  ^-  transact-2
      [%diff [%add-hodler (sy ~[ship.man])]]
    ::
        %s
      =/  new-stak=stak
        ?~  (~(get by stak.u.gor) ship.man)
        ::  YY  return here
      `state
    ==
  ::
      %send-gora
    ?~  gor=(~(get by pita) id.man)  !!
    ?>  =(our.bol host.u.gor)
    ?:  =(~ who.man)  !!
    ?-    -.u.gor
        %g
      =;  [offers=(list card) legs=_outgoing.logs]
        :_  state(outgoing.logs legs)
        ?:  =(who.man (~(dif in who.man) hodl.u.gor))
          offers
        :_  offers
        ^-  card
        =-  [%give %fact ~[/gora/(scot %uv id.u.gor)] -]
        :-  %gora-transact-2
        !>(`transact-2`[%diff [%add-hodler hodl.u.gor]])
      %-  ~(rep in (~(dif in who.man) hodl.u.gor))
      |:  [s=*ship [p=*(list card) q=outgoing.logs]]
      :_  (~(put bi q) id.u.gor [s %give] [now.bol ~])
      :_  p
      ^-  card
      =/  wir=path
        /offer/(scot %uv id.u.gor)/(scot %p s)
      =-  [%pass wir %agent [s %gora] %poke -]
      :-  %gora-transact-2
      !>(`transact-2`[%offered u.gor])
    ::
        %s
      =;  [offers=(list card) stik=stak legs=_outgoing.logs]
        :-  :_  offers
            =-  [%give %fact ~[/gora/(scot %uv id.u.gor)] -]
            :-  %gora-transact-2
            !>(`transact-2`[%diff [%give-staks stik]])
        %=  state
          outgoing.logs  legs
        ::
            pita
          (~(put by pita) id.u.gor u.gor(stak stik))
        ==
      %-  ~(rep in who.man)
      |:  :-  s=~zod
          [p=*(list card) q=stak.u.gor r=outgoing.logs]
      ?~  had=(~(get by stak.u.gor) s)
        =/  wir=path
          /offer/(scot %uv id.u.gor)/(scot %p s)
        :+  :_  p
            ^-  card
            =-  [%pass wir %agent [s %gora] %poke -]
            :-  %gora-transact-2
            !>(`transact-2`[%offered u.gor])
          q
        (~(put bi r) id.u.gor [s %give] [now.bol ~])
      :+  p
        (~(put by q) [s +(u.had)])
      (~(put bi r) id.u.gor [s %give] [now.bol ~])
    ==
  ::
      %send-plea
    =/  wir=path
      /plead/(scot %uv id.man)/(scot %p host.man)
    =.  outgoing.logs
      %^  ~(put bi outgoing.logs)  id.man
      [host.man %take]  [now.bol ~]
    :_  state
    =-  [%pass wir %agent [host.man %gora] %poke -]~
    [%gora-transact-2 !>(`transact-2`[%request id.man])]
  ::
      %kick
    %-  (slog leaf+"%gora -ouch" ~)
    [(gora:subs pita) state]
  ==
  ++  g-hand
    |=  gal=gora-handle
    ^-  (quip card _state)
    ?-    -.gal
        %rm-gora
      `state
    ::
        %set-max
      `state
    ::
        %add-tag
      `state
    ::
        %rem-tag
      `state
    ::
        %stak-em
      `state
    ::
        %set-pol
      `state
    ::
        %mk-gora
      `state
    ::
    ==
  --
--