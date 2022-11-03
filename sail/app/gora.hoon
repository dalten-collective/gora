::  /app/gora
::  
::    %gora now utilizes the following middleware:
::   - %gossip - by ~paldev
::   - %cult - by quartusco
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
::    interacting with gora:
::  [%ignore-give @uv]             ignores a given gorae
::  [%accept-give @uv]             accepts a given gorae
::  [%ignore-request @uv @p]       ignore pleas for gora
::  [%accept-request @uv @p]       accept pleas for gora
::  [%send-gora @uv (set ship)]    give a gora to people
::  [%send-plea @uv @p]            ask ship for gora @uv
::  [%kick ~]                      maybe gora is naughty
::
::    making & changing gorae:
::  [%rm-gora @uv]                               deletes a gora, local or remote
::  [%set-max @uv (unit @ud)]                    sets max hodlers, gora-standard
::  [%add-tag @tas (set id)]                     adds a tag across a set of gora
::  [%rem-tag @tas (set id)]                     remove a tag from a set of gora
::  [%stak-em (set id) @t @t]                    convert a set gorae into a stak
::  [%set-pol @uv u?(%approve %decline)]         (un)set a gora's request policy
::  [%mk-gora @t @t ?([%g hodl max] [%s stak])]  start a new gora with hodl/stak
::
::  %gora's scry endpoints include:
::    -  [%y %slam ~]
::      %slam integration
::    -  TBD
::
/-  *gora
/+  default-agent, rudder, gossip
::  CULT: added for cult                                ::  cult
::
/=  cult   /cult/cult
::
/~  pages  (page:rudder tack manage-gora-2)  /app/gora
::
/$  grab-hint  %noun  %gora
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
=|  state-2
=*  state  -
::  CULT: added for cult                                ::  cult
::
::
%-  %+  agent:gossip
      [2 %anybody %anybody]
    %+  ~(put by *(map mark $-(* vase)))
      %gora
    |=(n=* !>((grab-hint n)))
%-  %^  agent:cult
      ~  ~
    `|=(kex=* s/(scot %uv ;;(@uv kex)))
::
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
      [%wait (add (sub now.bowl (mod now.bol ~d1)) ~d1)]
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
      :~  =-  [%pass /eyre/connect %arvo %e -]
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
  :_  this(state old)
  :(welp coz caz cards (gora:subs:hc pita.old))
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
        :+  %arvo  %b
        [%wait (add (sub now.bowl (mod now.bol ~d1)) ~d1)]
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
    ^-  (mip id [ship act] [@da (unit ?)])
    =|  log=(mip id [ship act] [@da (unit ?)])
    =/  old=(list [i=id [s=ship g=gib] [w=@da d=?]])
      ~(tap bi p)
    |-  
    ?~  old  log
    %=    $
      old  t.old
    ::
        log
      ?+    g.i.old  log
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
    ::    %handle-http-request mark handled in helper   ::  sail -vue-ignores
    ::                                                  ::
        %handle-http-request
      =;  out=(quip card tack)
        ::  we get back a regular ole (quip card _state)
        ::  we handle like this, not tisket bcuz reasons
        ::
        [-.out [%2 +.out]]
      ::
      %.  [bowl !<(order:rudder vase) +.state]
      %:  (steer:rudder tack manage-gora-2)
        pages
      ::
        |=  =trail:rudder
        ^-  (unit place:rudder)
        ?~  site=(decap:rudder /apps/gora site.trail)  ~
        ?+  u.site  ~
          ~            `[%page & %pita]                 ::  main pita
          [%$ ~]       `[%away /apps/gora]              ::  main pita
          [%index ~]   `[%away (snip site.trail)]       ::  main pita
          [%asked ~]   `[%page & %asked]                ::  they want
          [%plead ~]   `[%page & %plead]                ::  begs them
          [%maker ~]   `[%page & %maker]                ::  make gora
          [%voyer ~]   `[%page & %voyer]                ::  blaq sofa
          [%tiket ~]   `[%page & %tiket]                ::  your logs
          [%stakm ~]   `[%page & %stakm]                ::  burn pile
          [%stakd ~]   `[%page & %stakd]                ::  they live
          [%public ~]  `[%page | %poser]                ::  show them
        ==
      ::
        |=  =order:rudder
        ^-  [[(unit reply:rudder) (list card)] tack]
        =;  msg=@t  [[`[%code 404 msg] ~] +.state]
        %+  rap  3
        ~['%gora page ' url.request.order ' not found']
      ::
        skipper:hc
      ==
    ::    %gora-man-2 mark handled in helper core
    ::
        %gora-man-2
      ?>  =(our.bowl src.bowl)
      (manage:hc !<(manage-gora-2 vase))
    ::    %gora-transact-2, handle %gack, %offered, %request
    ::
        %gora-transact-2
      =/  tan=transact-2  !<(transact-2 vase)
      ?+    -.tan  (on-poke:def mark vase)
      ::    %gack - affirmatively acknowledge a give
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
          =+  ole=state
          =/  new-hodl=(set ship)
            (~(put in hodl.u.gor) src.bowl)
          =.  pita
            %-  ~(put by pita)
            [id.u.gor u.gor(hodl new-hodl)]
          =?    requests.logs
              %-  ~(has ju requests.logs)
              [src.bowl id.u.gor]
            (~(del ju requests.logs) src.bowl id.u.gor)
          =?    requests.logs
              ?~  max.u.gor  %.n
              =(u.max.u.gor +(~(wyt in hodl.u.gor)))
            %-  ~(run by requests.logs)
            |=  v=(set id)
            ?.((~(has in v) id.u.gor) v (~(del in v) id.u.gor))
          =?    policy
              ?~  max.u.gor  %.n
              =(u.max.u.gor +(~(wyt in hodl.u.gor)))
            (~(put by policy) id.tan %decline)            
          =/  pat=path
            /gora/(scot %uv id.u.gor)
          ::  CULT: modified for cult                   ::  cult
          ::
          =;  [cards=(list card) state=_state]
            =+  gor=(~(got by pita) id.u.gor)
            =+  hodl=?>(?=(%g -.gor) hodl.gor)
            :_  state
            :_  cards
            =-  [%give %fact ~[/~/cult] %cult-easy -]
            !>(`easy:cult`[id.gor [%pak hodl]])
          ::
          =-  [[((diff:j-web:hc ole) +.-) -.-] +.-]
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
          =+  ole=state
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
          ::  CULT: modified for cult                   ::  cult
          ::
          =;  [cards=(list card) state=_state]
            =+  gor=(~(got by pita) id.u.gor)
            =+  hodl=?>(?=(%s -.gor) ~(key by stak.gor))
            :_  state
            :_  cards
            =-  [%give %fact ~[/~/cult] %cult-easy -]
            !>(`easy:cult`[id.gor [%pak hodl]])
          ::
          =-  [[((diff:j-web:hc ole) +.-) -.-] +.-]
          :_  state
          =-  [%give %fact ~[pat] %gora-transact-2 -]~
          !>  ^-  transact-2
          [%diff [%give-staks (my [src.bowl 1]~)]]
        ==
      ::    %offered - receive an offer of gora ownership
      ::  - if we don't have the gora, put it in
      ::  - if we aren't already owners, put it in offers
      ::  - run the sub function to sub to the gora
      ::
          %offered
        :: =;  neu=(quip card _state)                      ::  json -sail-removes
        ::   [[((diff:j-web:hc state) +.neu) -.neu] +.neu] ::
        ?:  ?&  (~(has by pita) id.gora.tan)
                =(our.bol host.gora.tan)
            ::
              ?~  gor=(~(get by pita) id.gora.tan)
                %.n
              =(our.bol host.u.gor)
            ==
          =;  sat=_state
            :_  sat
            =-  [%give %fact ~[/gora/(scot %uv id.gora.tan)] -]~
            :-  %gora-transact-2
            ?-    chg=(~(got by pita.sat) id.gora.tan)
                [%g *]
              !>(`transact-2`[%diff [%add-hodler hodl.chg]])
            ::
                [%s *]
              !>(`transact-2`[%diff [%give-staks stak.chg]])
            ==
          %=    state
              pita
            ?-    -.gora.tan
                %g  
              %+  ~(put by pita)  id.gora.tan
              %=  gora.tan
                hodl  (~(put in hodl.gora.tan) our.bowl)
              ==
            ::
                %s
              %+  ~(put by pita)  id.gora.tan
              %=    gora.tan
                  stak
                ?~  had=(~(get by stak.gora.tan) our.bowl)
                  (~(put by stak.gora.tan) our.bowl 1)
                (~(put by stak.gora.tan) [our.bowl u.had])
              ==
            ==
          ==
        ?>  =(host.gora.tan src.bowl)
        ?-   -.gora.tan
            %g
          =-  [(gora:subs:hc pita.-) -]
          %=    state
              offers.logs
            ?:  (~(has in hodl.gora.tan) our.bowl)
              offers.logs
            (~(put in offers.logs) id.gora.tan)
          ::
              pita
            ?~  go=(~(get by pita) id.gora.tan)
              (~(put by pita) id.gora.tan gora.tan)
            ?>  =(host.u.go src.bowl)
            (~(put by pita) id.gora.tan gora.tan)
          ==
        ::
            %s
          =-  [(gora:subs:hc pita.-) -]
          %=    state
              offers.logs
            ?:  (~(has in ~(key by stak.gora.tan)) our.bowl)
              offers.logs
            (~(put in offers.logs) id.gora.tan)
          ::
              pita
            ?^  nul.gora.tan
              %-  ~(put by (rm-nul:shim:hc u.nul.gora.tan))
              [id.gora.tan gora.tan]
            ?~  go=(~(get by pita) id.gora.tan)
              (~(put by pita) id.gora.tan gora.tan)
            ?>  =(host.u.go src.bowl)
            (~(put by pita) id.gora.tan gora.tan)
          ==
        ==
      ::
          %request
        :: =;  neu=(quip card _state)                      ::  json -sail-removes
        ::   [[((diff:j-web:hc state) +.neu) -.neu] +.neu] ::
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
            :-  ~
            %=    state
                requests.logs
              (~(put ju requests.logs) src.bowl id.tan)
            ==
          ?-    u.pol
            %decline  !!
          ::
              %approve
            :-  =-  [%give %fact ~[pat] %gora-transact-2 -]~
                !>  ^-  transact-2
                [%diff [%add-hodler (sy ~[src.bowl])]]
            %=    state
                policy
              ?.  ?~  max.u.gor  %.n
                  =(u.max.u.gor +(~(wyt in hodl.u.gor)))
              policy  (~(put by policy) id.tan %decline)
            ::
                pita
              %+  ~(put by pita)  id.tan
              u.gor(hodl (~(put in hodl.u.gor) src.bowl))
            ::
                requests.logs
              (~(del ju requests.logs) src.bowl id.tan)
            ==
          ==
          
        ::
            %s
          ?~  had=(~(get by stak.u.gor) src.bowl)
            :-  ~
            %=    state
                requests.logs
              (~(put ju requests.logs) src.bowl id.u.gor)
            ==
          :_  state
          =-  [%give %fact ~[pat] %gora-transact-2 -]~
          !>  ^-  transact-2
          [%diff [%give-staks (my [src.bowl u.had]~)]]
        ==
      ==
    ==
  [cards this]
::
++  on-watch
  |=  =path
  ^-  (quip card _this)
  ::  CULT: added for cult                              ::  cult
  ::
  ?:  =(/~/cult path)
    :_  this
    %+  murn  ~(val by pita)
    |=  gor=gora
    ?.  =(our.bowl host.gor)  ~
    =-  `[%give %fact ~ %cult-easy -]
    !>  ^-  easy:cult
    ?-    -.gor
        %g
      [id.gor [%pak hodl.gor]]
    ::
        %s
      [id.gor [%pak ~(key by stak.gor)]]
    ==
  ::
  ?:  =(/~/gossip/source path)
    :_  this
    %+  murn  ~(val by pita)
    |=  gor=gora
    ?.  ?&  =(our.bowl host.gor)
            (~(has in public) id.gor)
        ==
      ~
    `[%give %fact ~ %gora !>([id.gor our.bowl])]
  ?+    path  (on-watch:def path)
    [%http-response *]  `this
  ::
      [%website ~]
    ?>  (team:title our.bowl src.bowl)
    :_  this
    =-  [%give %fact ~ %json !>(`json`-)]~
    %-  pairs:enjs:format
    :~  pita+all:stat:j-web:hc
      ::
        owned+own:stat:j-web:hc
        made+mad:stat:j-web:hc
      ::
        public+pub:stat:j-web:hc
        policy+pol:stat:j-web:hc
        tags+tag:stat:j-web:hc
    ::
      :-  %logs
      %-  pairs:enjs:format
      :~  offers+off:stat:j-web:hc
          requests+req:stat:j-web:hc
          outgoing+out:stat:j-web:hc
      ==
    ==
  ::
      [%update @ ~]
    =/  id=@uv  (slav %uv i.t.path)
    ?~  gor=(~(get by pita) id)  !!
    ?>  &(?=(%g -.u.gor) =(our.bowl host.u.gor))
    =/  g=gora:one
      :^  id.u.gor  name.u.gor  pic.u.gor
      :+  host.u.gor
        =+((yore now.bowl) [y.- m.- d.t.-])
      [hodl.u.gor %.n max.u.gor %none %none]
    :_  this
    :~  =-  [%give %fact ~ %gora-transact-1 -]
        !>(`transact-1:one`[%update %upd `[%initialize g]])
      ::
        [%give %kick ~ ~]
    ==
  ::
      [%gora @ ~]
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
          :+  %arvo  %b
          [%wait (add (sub now.bowl (mod now.bol ~d1)) ~d1)]
        ==
      ~&  >>  [%behn %suichi error.sign-arvo]
      :_  this
      =-  [%pass /behn/suichi/(scot %da now.bowl) -]~
      :+  %arvo  %b
      [%wait (add (sub now.bowl (mod now.bol ~d1)) ~d1)]
    ==
  ==
::
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card _this)
  ::
    ?:  ?&  =(/~/gossip/gossip wire)
            ?=(%fact -.sign)
            =(%gora p.cage.sign)
        ==
      =+  !<([wat=@uv who=@p] q.cage.sign)
      ?:  (~(has by pita) wat)  `this
      =/  pat=path
        /gora/(scot %uv wat)/(scot %p who)
      :_  this
      [%pass pat %agent [who %gora] %watch /gora/(scot %uv wat)]~
  ?+    wire  (on-agent:def wire sign)
      [%updates @ ~]
    :_  this
    [%pass wire %agent [src.bowl %gora] %leave ~]~
  ::
      [%allow @ @ ~]
    :: =;  neu=(quip card _this)                           ::  json -sail-removes
    ::     :_  +.neu                                       ::
    ::     [((diff:j-web:hc state) state.+.neu) -.neu]     ::
    =/  id=@uv   (slav %uv i.t.wire)
    =/  hu=ship  (slav %p i.t.t.wire)
    ?.  ?=(%poke-ack -.sign)  (on-agent:def wire sign)
    ?~  got=(~(get bi outgoing.logs) id [hu %gack])
      ~_  leaf+"%gora -missing-offer-for-ack"  !!
    :-  ~
    %=    this
        outgoing.logs
      %+  ~(put bi:mip outgoing.logs)  id
      [[hu %gack] [-.u.got `?=(~ p.sign)]]
    ==
  ::
      [%offer @ @ ~]
    :: =;  neu=(quip card _this)                           ::  json -sail-removes
    ::     :_  +.neu                                       ::
    ::     [((diff:j-web:hc state) state.+.neu) -.neu]     ::
    =/  id=@uv   (slav %uv i.t.wire)
    =/  hu=ship  (slav %p i.t.t.wire)
    ?.  ?=(%poke-ack -.sign)  (on-agent:def wire sign)
    ?~  got=(~(get bi outgoing.logs) id [hu %give])
      ~_  leaf+"%gora -missing-offer-for-ack"  !!
    :-  ~
    %=    this
        outgoing.logs
      %+  ~(put bi:mip outgoing.logs)  id
      [[hu %give] [-.u.got `?=(~ p.sign)]]
    ==
  ::
      [%plead @ @ ~]
    :: =;  neu=(quip card _this)                           ::  json -sail-removes
    ::     :_  +.neu                                       ::
    ::     [((diff:j-web:hc state) state.+.neu) -.neu]     ::
    =/  id=@uv   (slav %uv i.t.wire)
    =/  hu=ship  (slav %p i.t.t.wire)
    ?.  ?=(%poke-ack -.sign)  (on-agent:def wire sign)
    ?~  got=(~(get bi outgoing.logs) id [hu %take])
      ~_  leaf+"%gora -missing-plead-for-ack"  !!
    :-  ~
    %=    this
        outgoing.logs
      %+  ~(put bi:mip outgoing.logs)  id
      [[hu %take] [-.u.got `?=(~ p.sign)]]
    ==
  ::
      [%gora @ @ ~]
    :: =;  neu=(quip card _this)                           ::  json -sail-removes
    ::     :_  +.neu                                       ::
    ::     [((diff:j-web:hc state) state.+.neu) -.neu]     ::
    =/  ud=@uv   (slav %uv i.t.wire)
    =/  ho=ship  (slav %p i.t.t.wire)
    ?~  gor=(~(get by pita) ud)
      ?+    sign  !!
      ::
          [%kick ~]
        :_  this
        =-  [%pass wire %agent [src.bowl %gora] -]~
        [%watch [%gora i.t.wire ~]]
      ::
          [%watch-ack *]
        ?~  p.sign  `this
        %.  `this
        (slog leaf+"%gora -watch-nack {<ud>} {<src.bowl>}" ~)
      ::
          [%fact %gora-transact-2 *]
        =+  ole=state
        =^  cards  state
          =/  tan=transact-2
            !<(transact-2 q.cage.sign)
          ?>  ?=([%diff *] tan)
          (transact:hc [+.tan ud wire gor])
        [cards this]
      ==
      ::
    ?.  =(host.u.gor src.bowl)
      :_  this
      [%pass wire %agent [src.bowl %gora] %leave ~]~
    ?+    sign  (on-agent:def wire sign)
        [%kick ~]
      :_  this
      =-  [%pass wire %agent [src.bowl %gora] -]~
      [%watch [%gora i.t.wire ~]]
    ::
        [%watch-ack *]
      ?~  p.sign  `this
      =-  ((slog leaf+- ~) `this)
      """
      %gora -watch-nack {<id.u.gor>}
            -{<host.u.gor>}-version-mismatch}
      """
    ::
        [%fact %gora-transact-1 *]
      =/  tan=transact-1:one
        !<(transact-1:one q.cage.sign)
      ?+    -.tan  `this
          %update
        ?-    act.tan
            %del
          :-  ~
          %=    this
            pita  (~(del by pita) ud)
          ::
              offers.logs
            (~(del in offers.logs) ud)
          ==
        ::
            %upd
          ?~  jot.tan  `this
          ?.  ?=(%new-hodlr -.u.jot.tan)  `this
          ?.  ?=(%g -.u.gor)  `this
          :-  ~
          %=  this
            pita
            %+  ~(put by pita)  id.u.gor
            u.gor(hodl (~(put in hodl.u.gor) ship.u.jot.tan))
          ==
        ==  
      ==
    ::
        [%fact %gora-transact-2 *]
      =^  cards  state
        =/  tan=transact-2
          !<(transact-2 q.cage.sign)
        ?>  ?=([%diff *] tan)
        (transact:hc [+.tan ud wire gor])
      [cards this]
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
      [%x %subscribed @ ~]
    ?>  (team:title our.bowl src.bowl)
    ``noun+!>((hears:subs:hc (slav %uv i.t.t.path)))
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
    (turn ~(tap in ~(key by tags)) (lead %s))
  ::
      [%x %tags @ ~]
    =-  ``noun+!>(`(list @tas)`-)
    =/  gor=gora
      (~(got by pita) (slav %uv i.t.t.path))
    %+  murn  ~(tap by tags)
    |=  [k=@tas v=(set id)]
    ?.((~(has in v) id.gor) ~ `k)
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
++  shim
  |%
  ++  id-stk
    |=  [n=name h=host p=pic r=[s=stak n=nul] m=@da]
    (sham n h p r m)
  ++  id-stn
    |=  [n=name h=host p=pic r=[h=hodl m=max] m=@da]
    (sham n h p r m)
  ++  rm-nul
    |=  l=(list gora-standard)
    ^-  _pita
    |-  ?~  l  pita
    %=  $
      l     t.l
      pita  (~(del by pita) id.i.l)
    ==
  --
::
++  subs
  |%
  ++  hears
    |=  i=@uv
    ^-  ?
    ?:  =(our.bol host:(~(got by pita) i))
      %.y
    (~(has in paths) /gora/(scot %uv i))
  ++  pivot
    ^-  (list card)
    %-  ~(rep by wex.bol)
    |=  $:  [[w=wire h=ship t=term] [a=? p=path]]
            o=(list card)
        ==
    ?.  &(=(%gora t) !?=([%gora @ @ ~] w))  o
    [[%pass w %agent [h %gora] %leave ~] o]
  ++  paths
    ^-  (set path)
    %-  ~(rep by wex.bol)
    |=  $:  [[w=wire h=ship t=term] [a=? p=path]]
            o=(set path)
        ==
    ?.  ?&  =(%gora t)
            ?=([%gora @ @ ~] w)
            |(?=([%updates @ ~] p) ?=([%gora @ ~] p))
        ==
      o
    ?.(a o (~(put in o) [%gora +.p]))
  ++  gora
    |=  p=_pita
    =+  pat=paths
    ^-  (list card)
    %+  murn  ~(tap by p)
    |=  [i=id g=^gora]
    ?:  =(our.bol host.g)  ~
    ?:  (~(has in pat) [%gora (scot %uv i) ~])  ~
    :-  ~
    :+  %pass  /gora/(scot %uv i)/(scot %p host.g)
    [%agent [host.g %gora] %watch [%gora (scot %uv i) ~]]
  --
::                                                      ::  +j-web
++  j-web                                               ::  json handlers
  =,  enjs:format
  |%
  ++  gson                                              ::  +gson:j-web
    |=  gun=gora                                        ::  gora handlers
    |^  ^-  json
    ?-   -.gun
      %g  (stn gun)
      %s  (sht gun)
    ==
    ++  stn                                             ::  +stn:gson:j-web
      |=  g=gora-standard                               ::  standard gora
      ^-  json
      %-  pairs
      :~  type+s+'g'
          pic+s+pic.g
          name+s+name.g
          made+(sect made.g)
          id+s+(scot %uv id.g)
          host+s+(scot %p host.g)
          max+?~(max.g ~ (numb u.max.g))
      ::
        :+  %hodl  %a
        (turn ~(tap in hodl.g) |=(s=@p s+(scot %p s)))
      ==
    ::
    ++  sht                                             ::  +sht:gson:j-web
      |=  g=gora-stakable                               ::  stakable gora
      ^-  json
      %-  pairs
      :~  type+s+'s'
          pic+s+pic.g
          name+s+name.g
          made+(sect made.g)
          id+s+(scot %uv id.g)
          host+s+(scot %p host.g)
          nul+?~(nul.g ~ a+(turn u.nul.g stn))
      ::
        :+  %stak  %a
        %+  turn  ~(tap by stak.g)
        |=  [whu=@p hud=@ud]
        (pairs ~[who+s+(scot %p whu) has+(numb hud)])
      ==
    --
  ::                                                    ::  +stat:j-web
  ++  stat                                              ::  state objects
    |%
    ::                                                  ::  -  pita
    ++  all                                             ::  +all:stat:j-web
      ^-  json                                          ::  gorae, as map
      a+(turn ~(val by pita) gson)
    ::                                                  ::  +  logic about pita
    ++  own                                             ::  +own:stat:j-web
      ^-  json                                          ::  gorae you own
      :-  %a
      %+  murn  ~(tap by pita)
      |=  [k=id v=gora]
      ?-    -.v
          %g
        ?.  (~(has in hodl.v) our.bol)  ~
        `s+(scot %uv id.v)
          %s
        ?.  (~(has in ~(key by stak.v)) our.bol)  ~
        `s+(scot %uv id.v)
      ==
    ::                                                  ::  +  logic about pita
    ++  mad                                             ::  +mad:stat:j-web
      ^-  json                                          ::  hosted goraes
      :-  %a
      %+  murn  ~(tap by pita)
      |=  [k=id v=gora]
      ?.  =(our.bol host.v)  ~
      `s+(scot %uv id.v)
    ::                                                  ::  -  public
    ++  pub                                             ::  +pub:stat:j-web
      ^-  json                                          ::  public goraes
      a+(turn ~(tap in public) |=(i=id s+(scot %uv i)))
    ::                                                  ::  -  policy
    ++  pol                                             ::  +pol:stat:j-web
      ^-  json                                          ::  auto-approve?
      :-  %a
      %+  turn  ~(tap by policy)
      |=  [k=id v=?(%approve %decline)]
      %-  pairs
      :~  id+s+(scot %uv k)
      ::
        :-  %policy
        ?:  ?=(%approve v)  b+%.y
        ~_  "%gora -strange-policy"
        ?>(?=(%decline v) b+%.n)
      ==
    ::                                                  ::  -  logs
    ++  off                                             ::  +off:stat:j-web
      ^-  json                                          ::  offered gorae
      :-  %a
      %+  turn  ~(tap in offers.logs)
      |=(i=id s+(scot %uv i))
    ::
    ++  req                                             ::  +req:stat:j-web
      ^-  json                                          ::  request inbox
      :-  %a
      %+  turn  ~(tap by requests.logs)
      |=  [k=@p v=(set id)]
      %-  pairs
      :~  requester+s+(scot %p k)
      ::
        :+  %id-list  %a
        (turn ~(tap in v) |=(i=id s+(scot %uv i)))
      ==
    ::
    ++  out                                             ::  +out:stat:j-web
      ^-  json                                          ::  sorted sended
      :-  %a
      %+  turn
        %+  sort  ~(tap bi outgoing.logs)
        |=  [a=[@ ^ [w=@da *]] b=[@ ^ [w=@da *]]]
        (gth w.a w.b)
      |=  [i=id [p=@p a=act] [w=@da dun=(unit ?)]]
      %-  pairs
      :~  when+(sect w)
          id+s+(scot %uv i)
          who+s+(scot %p p)
          act+s+(scot %tas a)
          status+?~(dun s+'pending' b+u.dun)
      ==
    ::                                                  ::  -  tags
    ++  tag                                             ::  +tag:stat:jweb
      ^-  json                                          ::  ur categories
      :-  %a
      %+  turn  ~(tap by tags)
      |=  [k=@tas v=(set id)]
      %-  pairs
      :~  tag+s+(scot %tas k)
      ::
        :+  %id-list  %a
        (turn ~(tap in v) |=(i=id s+(scot %uv i)))
      ==
    --
  ::
  ++  diff                                              ::  %-  %-  diff:j-web
    |=  stol=state-2                                    ::    old-state
    |=  stew=state-2                                    ::  new-state
    |^
    %-  rap
    %-  pairs
    :~  set+d-set
        rem+d-rem
    ==
    ::
    ++  rap
      |=  j=json
      ^-  card
      [%give %fact ~[/website] %json !>((frond diff+j))]
    ++  j-don
      %-  pairs
      :~  pita+all:stat
          owned+own:stat
          made+mad:stat
          public+pub:stat
          policy+pol:stat
          tags+tag:stat
      ::
        :-  %logs
        %-  pairs
        :~  offers+off:stat
            requests+req:stat
            outgoing+out:stat
        ==
      ==
    ::
    ++  d-set
      ^-  json
      =.  state
        %=  state
          pita    (c-pit %.y)
          public  (~(dif in public.stew) public.stol)
          policy  (~(dif by policy.stew) policy.stol)
          tags    (c-tag %.y)
            logs
          :+  (~(dif in offers.logs.stew) offers.logs.stol)
            (c-req %.y)
          (c-mip %.y)
        ==
      j-don
    ::
    ++  d-rem
      ^-  json
      =.  state
        %=  state
          pita    (c-pit %.n)
          public  (~(dif in public.stol) public.stew)
          policy  (~(dif by policy.stol) policy.stew)
          tags    (c-tag %.n)
            logs
          :+  (~(dif in offers.logs.stol) offers.logs.stew)
            (c-req %.n)
          (c-mip %.n)
        ==
      j-don
    ::
    ++  c-pit                                           ::  +c-pit
      |=  chg=?                                         ::  make pita changes
      ^-  _pita
      ?:  chg
        %-  ~(rep by pita.stew)
        |=  [[k=id v=gora] o=(map id gora)]
        ?~  ole=(~(get by pita.stol) k)
          (~(put by o) k v)
        ?:(=(u.ole v) o (~(put by o) k v))
      %-  ~(rep by pita.stol)
      |=  [[k=id v=gora] o=(map id gora)]
      ?:  (~(has by pita.stew) k)  o
      (~(put by o) k v)
    ::
    ++  c-req                                           ::  +c-req
      |=  chg=?                                         ::  make request changes
      ^-  _requests.logs
      ?:  chg
        %-  ~(rep by requests.logs.stew)
        |=  [[k=@p v=(set id)] o=(jug @p id)]
        ?~  ole=(~(get by requests.logs.stol) k)
          (~(put by o) k v)
        (~(put by o) k (~(dif in v) u.ole))
      %-  ~(rep by requests.logs.stol)
      |=  [[k=@p v=(set id)] o=(jug @p id)]
      ?~  neu=(~(get by requests.logs.stew) k)
        (~(put by o) k v)
      (~(put by o) k (~(dif in u.neu) v))
    ::
    ++  c-tag                                           ::  +c-tag
      |=  chg=?                                         ::  make tags changes
      ^-  _tags
      ?:  chg
        %-  ~(rep by tags.stew)
        |=  [[k=@tas v=(set id)] o=(jug @tas id)]
        ?~  ole=(~(get by tags.stol) k)
          (~(put by o) k v)
        (~(put by o) k (~(dif in v) u.ole))
      %-  ~(rep by tags.stol)
      |=  [[k=@tas v=(set id)] o=(jug @tas id)]
      ?~  neu=(~(get by tags.stew) k)
        (~(put by o) k v)
      (~(put by o) k (~(dif in u.neu) v))
    ::
    ++  c-mip                                           ::  +c-mip
      |=  chg=?                                         ::  make sent changes
      ^-  _outgoing.logs
      ?:  chg
        %-  ~(rep by outgoing.logs.stew)
        |=  $:  [k=id v=(map [@p act] [@da (unit ?)])]
                o=(mip id [@p act] [@da (unit ?)])
            ==
        ?~  ole=(~(get by outgoing.logs.stol) k)
          (~(put by o) k v)
        %+  ~(put by o)  k
        %.  (~(dif by v) u.ole)
        ~(uni by (~(uni by u.ole) v))
      %-  ~(rep by outgoing.logs.stew)
      |=  $:  [k=id v=(map [@p act] [@da (unit ?)])]
              o=(mip id [@p act] [@da (unit ?)])
          ==
      ?~  neu=(~(get by outgoing.logs.stew) k)
        (~(put by o) k v)
      (~(put by o) k (~(dif by v) u.neu))
    --
  --
::
++  skipper
  |=  act=manage-gora-2
  ::  $@(@t [brief:rudder (list card) state])
  ::  - either error or,
  ::  - some status message, a list cards, and state
  ::
  ^-  $@(@t [brief:rudder (list card) tack])
  ?-    -.act
      %ignore-give
    ?.  (~(has in offers.logs) id.act)
      '不足しているオファー'
    =/  name=tape
      (trip name:(~(got by pita) id.act))
    =/  host=tape
      (scow %p host:(~(got by pita) id.act))
    =^  cards  state
      (manage act)
    =-  [- cards +.state]
    %-  crip
    """
    ゴラの供物を無視 {name}
    - から {host}
    - 識別番号 {(scow %uv id.act)}
    """
  ::
      %accept-give
    ?.  ?&  (~(has in offers.logs) id.act)
            (~(has by pita) id.act)
        ==
      '不足しているオファー'
    =^  cards  state
      (manage act)
    =-  [- cards +.state]
    %-  crip
    """
    ❗アラート: Asynchronous Operation❗
    公認奉納ゴラ {(trip name:(~(got by pita) id.act))}
    - 出力ログに %gack を追加
    - からの応答を待っています:
      {(scow %p host:(~(got by pita) id.act))}
    """
  ::
      %ignore-request
    ?.  (~(has ju requests.logs) ship.act id.act)
      '不足しているリクエスト'
    =^  cards  state
      (manage act)
    =-  [- cards +.state]
    %-  crip
    """
    拒否されたリクエスト {(trip name:(~(got by pita) id.act))}
    - から {(scow %p ship.act)}
    - 識別番号 {(scow %uv id.act)}
    """
  ::
      %accept-request
    ?.  (~(has ju requests.logs) ship.act id.act)
      '不足しているリクエスト'
    =^  cards  state
      (manage act)
    =-  [- cards +.state]
    %-  crip
    """
    承認されたリクエスト {(trip name:(~(got by pita) id.act))}
    - 発送された更新 ⇶ [%updates {(scow %uv id.act)} ~]
    """
  ::
      %send-gora
    ?~  gor=(~(get by pita) id.act)  '行方不明のゴラ'
    ?.  =(our.bol host.u.gor)  '無効な権限'
    =^  cards  state
      (manage act)
    =-  [- cards +.state]
    %-  crip
    %+  weld
      """
      ゴラをパイロットに送った: {(trip name.u.gor)}
      パイロット:
      """
    ^-  tape
    %-  zing  %~  tap  in
    ^-  (set tape)
    %-  ~(run in who.act)
    |=(p=@p (weld ~(rend co %$ %p p) " "))
  ::
      %send-plea
    =^  cards  state
      (manage act)
    =-  [- cards +.state]
    %-  crip
    """
    ❗アラート: Asynchronous Operation❗
    ❗あなたは待たなければなりません❗
    ❗Do the needful: wait❗
    """
  ::
      %kick
    ``+.state
  ::
      %rm-gora
    ``+.state
  ::
      %set-max
    ``+.state
  ::
      %pub-gor
    ?.  (~(has by pita) id.act)
      'いたずらゴラ'
    =^  cards  state
      (manage act)
    =-  [- cards +.state]
    %-  crip
    """
    ゴラ マーク付き公開 {<how.act>}
    """
  ::
      %add-tag
    =+  wic=~(tap in gorae.act)
    ?<  ?=(~ wic)
    ?.  (~(has by pita) i.wic)
      'いたずらゴラ'
    =^  cards  state
      (manage act)
    =-  [- cards +.state]
    %-  crip
    """
    ゴラ に {<tag.act>} を適用するタグ
    """
  ::
      %rem-tag
    =+  wic=~(tap in gorae.act)
    ?<  ?=(~ wic)
    ?.  (~(has by pita) i.wic)
      'いたずらゴラ'
    =^  cards  state
      (manage act)
    =-  [- cards +.state]
    %-  crip
    """
    ゴラ に {<tag.act>} 削除するタグ
    """
  ::
      %set-pol
    ``+.state
  ::
      %mk-gora
    =|  ole=_pita
    =^  cards  state
      (manage act)
    =-  [- cards +.state]
    %-  crip
    "{(scow %uv id:(head ~(val by (~(dif by pita) ole))))}"
  ::
      %stak-em
    ?:  ?=(%.y -.which.act)
      =+  ole=`@uv`+.which.act
      =^  cards  state
        (manage act)
      [(scot %uv ole) cards +.state]
    =|  ole=_pita
    =^  cards  state
      (manage act)
    =-  [- cards +.state]
    %-  crip
    "{(scow %uv id:(head ~(val by (~(dif by pita) ole))))}"
  ::
  ==
::
++  transact
  |=  [=diff =id =wire gor=(unit gora)]
  :: =;  neu=(quip card _state)                            ::  json -sail-removes
  ::   [[((diff:j-web state) +.neu) -.neu] +.neu]          ::
  ^-  (quip card _state)
  ?-    -.diff
      %illustrate
    ?~  gor=(~(get by pita) id)
      :_  state
      [%pass wire %agent [src.bol %gora] %leave ~]~
    :-  ~
    %=    state
        pita
      (~(put by pita) id.u.gor u.gor(pic new.diff))
    ==
  ::
      %change-max
    ?>  ?=(^ gor)
    ?>  ?=(%g -.u.gor)
    ?~  max.diff
      :-  ~
      %=    state
          pita
        (~(put by pita) id.u.gor u.gor(max max.diff))
      ==
    ?>  (gte u.max.diff ~(wyt in hodl.u.gor))
    :-  ~
    %=    state
        pita
      %-  ~(put by pita)
      [id.u.gor u.gor(max max.diff)]
    ==
  ::
      %give-staks
    ?>  ?=(^ gor)
    ?>  ?=(%s -.u.gor)
    :-  ~
    %=    state
        pita
      %+  ~(put by pita)  id.u.gor
      u.gor(stak (~(uni by stak.u.gor) new.diff))
    ::
        offers.logs
      ?.  ?&  (~(has in offers.logs) id.u.gor)
              (~(has in ~(key by new.diff)) our.bol)
          ==
      offers.logs  (~(del in offers.logs) id.u.gor)
    ==
  ::
      %add-hodler
    ?>  ?=(^ gor)
    ?>  ?=(%g -.u.gor)
    :-  ~
    %=    state
        pita
      %+  ~(put by pita)  id.u.gor
      u.gor(hodl (~(uni in hodl.u.gor) new.diff))
    ::
        offers.logs
      ?:  ?~(max.u.gor %.n (gte ~(wyt in hodl.u.gor) u.max.u.gor))
        (~(del in offers.logs) id.u.gor)
      ?.  ?&  (~(has in offers.logs) id.u.gor)
              (~(has in new.diff) our.bol)
          ==
        offers.logs
      (~(del in offers.logs) id.u.gor)
    ==
  ::
      %start-stak
    ?>  ?&  (gte 32.768 (met 3 pic.diff))
            =(src.bol host.diff)
        ==
    ?~  nul.diff
      :-  ~
      %=    state
        pita  (~(put by pita) id.diff [%s +.diff])
      ::
          offers.logs
        ?.  ?&  (~(has in offers.logs) id.diff)
                (~(has in ~(key by stak.diff)) our.bol)
            ==
        offers.logs  (~(del in offers.logs) id.diff)
      ==
      ::
    ?>  %+  levy  u.nul.diff
        |=(g=gora =(src.bol host.g))
      ::
    :-  ~
    %=    state
        pita
      %-  ~(put by (rm-nul:shim u.nul.diff))
      [id.diff [%s +.diff]]
    ::
        offers.logs
      %-  ~(rep in (sy u.nul.diff))
      |=  $:  g=gora-standard
              o=_(~(del in offers.logs) id.diff)
          ==
      (~(del in o) id.g)
    ==
  ::
      %start-gora
    ?>  ?&  ?~  max.diff  %.y
            %+  gte  u.max.diff
            ~(wyt in hodl.diff)
          ::
            (gte 32.768 (met 3 pic.diff))
            =(src.bol host.diff)
        ==
    :-  ~
    %=    state
      pita  (~(put by pita) id.diff [%g +.diff])
    ::
        offers.logs
      ?.  ?&  (~(has in offers.logs) id.diff)
              (~(has in hodl.diff) our.bol)
          ==
      offers.logs  (~(del in offers.logs) id.diff)
    ==
  ::
      %deleted-me
    :-  ~
    %=  state
      pita         (~(del by pita) id)
      offers.logs  (~(del in offers.logs) id)
    ==
  ==
::
++  manage
  |=  man=manage-gora-2
  :: =;  neu=(quip card _state)                            ::  json -sail-removes
  ::   [[((diff:j-web state) +.neu) -.neu] +.neu]          ::
  |^  ^-  (quip card _state)
  ?-    -.man
      $?  %rm-gora
          %set-max
          %pub-gor
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
      :-  ~
      %=  state
        offers.logs  (~(del in offers.logs) id.man)
      ==
    =/  wir=path
      /gora/(scot %uv id.man)/(scot %p host.u.gor)
    :-  [%pass wir %agent [host.u.gor %gora] %leave ~]~
    %=  state
      pita         (~(del by pita) id.man)
      offers.logs  (~(del in offers.logs) id.man)
    ==
  ::
      %accept-give
    ?>  (~(has in offers.logs) id.man)
    ?~  gor=(~(get by pita) id.man)
      :-  ~
      %=  state
        offers.logs  (~(del in offers.logs) id.man)
      ==
    =/  wir=path
      /allow/(scot %uv id.man)/(scot %p host.u.gor)
    :-
      =-  [%pass wir %agent [host.u.gor %gora] %poke -]~
      [%gora-transact-2 !>(`transact-2`[%gack id.man])]
      ::
    %=    state
      offers.logs  (~(del in offers.logs) id.man)
    ::
        outgoing.logs
      %+  ~(put bi outgoing.logs)  id.man
      [[host.u.gor %gack] [now.bol ~]]
    ==
  ::
      %ignore-request
    ?>  (~(has ju requests.logs) ship.man id.man)
    ?~  gor=(~(get by pita) id.man)
      :-  ~
      %=  state
          requests.logs
        %-  ~(rep by requests.logs)
        |=  [[k=ship v=(set id)] r=(jug ship id)]
        ?.  (~(has in v) id.man)  (~(put by r) k v)
        (~(put by r) k (~(del in v) id.man))
      ==
    :-  ~
    %=  state
        requests.logs
      (~(del ju requests.logs) ship.man id.man)
    ==
      %accept-request
    ?>  (~(has ju requests.logs) ship.man id.man)
    ?~  gor=(~(get by pita) id.man)
      :-  ~
      %=  state
          requests.logs
        %-  ~(rep by requests.logs)
        |=  [[k=ship v=(set id)] r=(jug ship id)]
        ?.  (~(has in v) id.man)  (~(put by r) k v)
        (~(put by r) k (~(del in v) id.man))
      ==
    ?-  -.u.gor
        %g
      ::  CULT: modified for cult                       ::  cult
      ::
      =;  [cards=(list card) state=_state]
        =+  gor=(~(got by pita) id.u.gor)
        =+  hodl=?>(?=(%g -.gor) hodl.gor)
        :_  state
        :_  cards
        =-  [%give %fact ~[/~/cult] %cult-easy -]
        !>(`easy:cult`[id.gor [%pak hodl]])
      ::
      ?~  max.u.gor
        =/  pat=path
          /gora/(scot %uv id.u.gor)
        :-
          =-  [%give %fact ~[pat] %gora-transact-2 -]~
          !>  ^-  transact-2
          [%diff [%add-hodler (sy ~[ship.man])]]
          ::
        %=    state
            requests.logs
          (~(del ju requests.logs) ship.man id.man)
        ::
            pita
          %+  ~(put by pita)  id.u.gor
          u.gor(hodl (~(put in hodl.u.gor) ship.man))
        ==
      ?.  (gth u.max.u.gor ~(wyt in hodl.u.gor))
        =.  requests.logs
          (~(del ju requests.logs) ship.man id.man)
        `state
      =/  pat=path
        /gora/(scot %uv id.u.gor)
      :-
        =-  [%give %fact ~[pat] %gora-transact-2 -]~
        !>  ^-  transact-2
        [%diff [%add-hodler (sy ~[ship.man])]]
        ::
      %=    state
          requests.logs
        ?.  =(u.max.u.gor +(~(wyt in hodl.u.gor)))
          (~(del ju requests.logs) ship.man id.u.gor)
        %-  ~(rep by requests.logs)
        |=  [[k=ship v=(set id)] r=(jug ship id)]
        ?.  (~(has in v) id.man)  (~(put by r) k v)
        (~(put by r) k (~(del in v) id.man))
      ::
          policy
        ?.  =(u.max.u.gor +(~(wyt in hodl.u.gor)))
        policy  (~(put by policy) id.u.gor %decline)
      ::
          pita
        %+  ~(put by pita)  id.u.gor
        u.gor(hodl (~(put in hodl.u.gor) ship.man))
      ==
    ::
        %s
      ::  CULT: modified for cult                       ::  cult
      ::
      =;  [cards=(list card) state=_state]
        =+  gor=(~(got by pita) id.u.gor)
        =+  hodl=?>(?=(%s -.gor) ~(key by stak.gor))
        :_  state
        :_  cards
        =-  [%give %fact ~[/~/cult] %cult-easy -]
        !>(`easy:cult`[id.gor [%pak hodl]])
      ::
      =/  sats=@ud
        ?~  had=(~(get by stak.u.gor) ship.man)
        1  +(u.had)
      =/  pat=path
        /gora/(scot %uv id.u.gor)
      :-
        =-  [%give %fact ~[pat] %gora-transact-2 -]~
        !>  ^-  transact-2
        [%diff [%give-staks (my [ship.man sats]~)]]
        ::
      %=    state
          requests.logs
        (~(del ju requests.logs) ship.man id.u.gor)
      ::
          pita
        %+  ~(put by pita)  id.u.gor
        u.gor(stak (~(put by stak.u.gor) ship.man sats))
      ==
    ==
  ::
      %send-gora
    ?~  gor=(~(get by pita) id.man)  !!
    ?>  =(our.bol host.u.gor)
    ?:  =(~ who.man)  !!
    ?-    -.u.gor
        %g
      ::  CULT: modified for cult                       ::  cult
      ::
      =;  [cards=(list card) state=_state]
        =+  gor=(~(got by pita) id.u.gor)
        =+  hodl=?>(?=(%g -.gor) hodl.gor)
        :_  state
        :_  cards
        =-  [%give %fact ~[/~/cult] %cult-easy -]
        !>(`easy:cult`[id.gor [%pak hodl]])
      ::
      =;  [offers=(list card) legs=_outgoing.logs]
        :_  state(outgoing.logs legs)
        ?~  (~(dif in who.man) hodl.u.gor)
          :_  offers
          ((diff:j-web state) state(outgoing.logs legs))
        %+  weld  offers
        :~  ((diff:j-web state) state(outgoing.logs legs))
        ::  
          =-  [%give %fact ~[/gora/(scot %uv id.u.gor)] -]
          :-  %gora-transact-2
          !>(`transact-2`[%diff [%add-hodler hodl.u.gor]])
        ==
      %-  ~(rep in (~(dif in who.man) hodl.u.gor))
      |=  [s=ship [p=(list card) q=_outgoing.logs]]
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
      ::  CULT: modified for cult                       ::  cult
      ::
      =;  [cards=(list card) state=_state]
        =+  gor=(~(got by pita) id.u.gor)
        =+  hodl=?>(?=(%s -.gor) ~(key by stak.gor))
        :_  state
        :_  cards
        =-  [%give %fact ~[/~/cult] %cult-easy -]
        !>(`easy:cult`[id.gor [%pak hodl]])
      ::
      =;  [offers=(list card) stik=stak legs=_outgoing.logs]
        :-  :_  offers
            =-  [%give %fact ~[/gora/(scot %uv id.u.gor)] -]
            :-  %gora-transact-2
            !>  ^-  transact-2
            [%diff [%give-staks stik]]
        %=  state
          outgoing.logs  legs
        ::
            pita
          (~(put by pita) id.u.gor u.gor(stak stik))
        ==
      %-  ~(rep in who.man)
      |=  [s=ship [p=(list card) q=_stak.u.gor r=_outgoing.logs]]
      ?~  had=(~(get by stak.u.gor) s)
        ?:  =(our.bol s)
          [p (~(put by q) [s 1]) r]
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
    :_  %=    state
            outgoing.logs
          %^  ~(put bi outgoing.logs)  id.man
          [host.man %take]  [now.bol ~]
        ==
    :~
      =-  [%pass wir %agent [host.man %gora] %poke -]
      [%gora-transact-2 !>(`transact-2`[%request id.man])]
    ::
      =-  [%pass [%gora +.wir] %agent -]
      [[host.man %gora] %watch /gora/(scot %uv id.man)]
    ==
  ::
      %kick
    %-  (slog leaf+"%gora -ouch" ~)
    [(gora:subs pita) state]
  ==
  ::
  ++  g-hand
    |=  gal=gora-handle
    ^-  (quip card _state)
    ?-    -.gal
        %pub-gor
      =/  gor=gora
        (~(got by pita) id.gal)
      :-  ?.  &(=(our.bol host.gor) =(%.y how.gal))
            ~
          [(invent:gossip %gora !>([id.gor our.bol]))]~
      %=    state
          public
        ?:  =(%.y how.gal)
          (~(put in public) id.gal)
        (~(del in public) id.gal)
      ==
    ::
        %rm-gora
      ~_  "%gora -rm-{<id.gal>}-gora-not-found"
      =/  gor=gora
        (~(got by pita) id.gal)
      ?.  =(our.bol host.gor)
        =/  wir=path
          /gora/(scot %uv id.gal)/(scot %p host.gor)
        :_  state(pita (~(del by pita) id.gal))
        :~  %-  (diff:j-web state)
            state(pita (~(del by pita) id.gal))
        ::
          [%pass wir %agent [host.gor %gora] %leave ~]
        ==
        ::
      =/  pat=path
        /gora/(scot %uv id.gal)
      :_  state(pita (~(del by pita) id.gal))
      :~  %-  (diff:j-web state)
          state(pita (~(del by pita) id.gal))
      ::
        =-  [%give %fact ~[pat] %gora-transact-2 -]
        !>(`transact-2`[%diff [%deleted-me ~]])
      ==

    ::
        %set-max
      ~_  "%gora -set-max-failed"
      =/  gor=gora
        (~(got by pita) id.gal)
      ?>  ?=(%g -.gor)
      ?>  =(our.bol host.gor)
      =/  pat=path
        /gora/(scot %uv id.gal)
      ?~  max.gor
        ?~  max.gal  `state
        ?>  (gte u.max.gal ~(wyt in hodl.gor))
        :-  =-  [%give %fact ~[pat] %gora-transact-2 -]~
            !>(`transact-2`[%diff [%change-max max.gal]])
        state(pita (~(put by pita) id.gor gor(max max.gal)))
        ::
      ?~  max.gal
        :_  state(pita (~(put by pita) id.gor gor(max max.gal)))
        =-  [%give %fact ~[pat] %gora-transact-2 -]~
        !>(`transact-2`[%diff [%change-max max.gal]])
        ::
      ?>  (gth u.max.gal u.max.gor)
      :_  state(pita (~(put by pita) id.gor gor(max max.gal)))
      =-  [%give %fact ~[pat] %gora-transact-2 -]~
      !>(`transact-2`[%diff [%change-max max.gal]])
    ::
        %add-tag
      ?>  (~(all in gorae.gal) |=(i=id (~(has by pita) i)))
      :-  ~
      %=    state
          tags
        %+  ~(put by tags)  tag.gal
        (~(uni in (~(get ju tags) tag.gal)) gorae.gal)
      ==
    ::
        %rem-tag
      ?>  (~(all in gorae.gal) |=(i=id (~(has by pita) i)))
      :-  ~
      %=    state
          tags
        ?.  (~(has by tags) tag.gal)
          tags
        ?~  lef=(~(dif in (~(got by tags) tag.gal)) gorae.gal)
          (~(del by tags) tag.gal)
        (~(put by tags) tag.gal lef)
      ==
    ::
        %stak-em
      ~_  '%gora -stak-em-failed'
      |^
      ?.  ?=(%.y -.which.gal)
        =^  [caz=(list card) goz=(list gora-standard)]  dez.gal
          ^-  [(pair (list card) (list gora-standard)) (set id)]
          (rm-gor dez.gal)
          ::
        ?<  ?=(~ goz)
        =/  stik=stak
          +:((mk-stk ~) dez.gal)
          ::
        =/  new=gora-stakable
          =-  :^  %s  -  -.p.which.gal
              :+  +.p.which.gal  our.bol
              [(sub now.bol (mod now.bol ~d1)) stik `goz]
          %-  id-stk:shim
          :+  -.p.which.gal  our.bol 
          [+.p.which.gal [stik `goz] now.bol]
          ::
        ::  CULT: modified for cult                     ::  cult
        ::
        =;  [cards=(list card) state=_state]
          =+  hodl=~(key by stak.new)
          :_  state
          :_  cards
          =-  [%give %fact ~[/~/cult] %cult-easy -]
          !>(`easy:cult`[id.new [%pak hodl]])
        ::
        :-  (weld caz (mk-coz ~(key by stak.new) id.new new))
        %=  state
          pita           (~(put by (rm-nul:shim goz)) id.new new)
          outgoing.logs  (ch-log ~(key by stak.new) id.new)
        ==
        ::
      =/  ole=[s=stak g=gora-stakable]
        (ck-stk p.which.gal)
        ::
      =^  [caz=(list card) goz=(list gora-standard)]  dez.gal
        ^-  [(pair (list card) (list gora-standard)) (set id)]
        (rm-gor dez.gal)
        ::
      ?<  ?=(~ goz)
      =^  new  stak.g.ole
        ^-  [(set ship) stak]
        ((mk-stk stak.g.ole) dez.gal)
        ::
      =/  gnu=gora-stakable
        %=    g.ole
            nul
          ?~(nul.g.ole [~ goz] `(weld u.nul.g.ole goz))
        ==
      ::  CULT: modified for cult                       ::  cult
      ::
      =;  [cards=(list card) state=_state]
        =+  hodl=~(key by stak.gnu)
        :_  state
        :_  cards
        =-  [%give %fact ~[/~/cult] %cult-easy -]
        !>(`easy:cult`[id.gnu [%pak hodl]])
      ::
      :-  
        :-  (mk-upd ~(key by s.ole) id.gnu gnu)
        %+  weld  caz
        =-  (mk-coz - id.gnu gnu)
        (~(dif in new) ~(key by s.ole))
      %=    state
          pita
        (~(put by (rm-nul:shim goz)) id.gnu gnu)
      ::
          outgoing.logs
        (ch-log (~(dif in new) ~(key by s.ole)) id.gnu)
      ==
      ::
      ++  ck-stk
        |=  i=id
        ^-  [stak gora-stakable]
        =-  ?>(?=(%s -.-) [stak.- -])
        (~(got by pita) i)
      ::
      ++  mk-coz
        |=  [s=(set ship) i=id g=gora]
        ^-  (list card)
        %+  turn  ~(tap in s)
        |=  who=@p
        =/  wir=path
          /offer/(scot %uv i)/(scot %p who)
        ^-  card
        =-  [%pass wir %agent [who %gora] %poke -]
        [%gora-transact-2 !>(`transact-2`[%offered g])]
      ::
      ++  mk-upd
        |=  [s=(set ship) i=id g=gora-stakable]
        ^-  card
        =-  [%give %fact ~[/gora/(scot %uv i)] -]
        :-  %gora-transact-2
        !>(`transact-2`[%diff [%start-stak +.g]])
      ::
      ++  ch-log
        |=  [s=(set ship) i=id]
        %-  ~(rep in s)
        |=  [p=ship q=_outgoing.logs]
        (~(put bi q) [i [[p %give] [now.bol ~]]])
      ::
      ++  mk-stk
        |=  s-t=stak
        |=  s-i=(set id)
        ^-  [(set ship) stak]
        =-  [~(key by -) -]
        %-  ~(uni by s-t)
        ^-  stak
        %-  ~(rep in s-i)
        |=  [i=id s=_s-t]
        =+  gor=(~(got by pita) i)
        ?>  &(?=(%g -.gor) =(our.bol host.gor))
        %-  ~(uni by s)
        ^-  stak
        %-  ~(rep in hodl.gor)
        |=  [p=ship q=_s]
        ?~  had=(~(get by q) p)
          (~(put by q) p 1)
        (~(put by q) p +(u.had))
      ::
      ++  rm-gor
        |=  s-i=(set id)
        ^-  [(pair (list card) (list gora-standard)) (set id)]
        %-  ~(rep in s-i)
        |=  $:  i=id
            ::
              $:  (pair (list card) (list gora-standard))
                  r=(set id)
              ==
            ==
        ?~  gor=(~(get by pita) i)  [[p q] r]
        ?.  &(?=(%g -.u.gor) =(our.bol host.u.gor))
          [[p q] r]
        =/  pat=path
          /gora/(scot %uv id.u.gor)
        =-  [[- [u.gor q]] (~(put in r) id.u.gor)]
        ^-  (list card)
        :_  p
        =-  [%give %fact ~[pat] %gora-transact-2 -]
        !>(`transact-2`[%diff [%deleted-me ~]])
      --
    ::
        %set-pol
      ~_  leaf+"%gora -set-pol-failed -maybe-bad-id {<id.gal>}"
      ?~  gor=(~(get by pita) id.gal)  !!
      ?>  =(our.bol host.u.gor)
      ~_  leaf+"                      -maybe-gora-stakable"
      ?>  ?=(%g -.u.gor)
      ?~  pol.gal
        ?~  max.u.gor
          `state(policy (~(del by policy) id.gal))
        ?.  (gth u.max.u.gor ~(wyt in hodl.u.gor))
          `state(policy (~(put by policy) id.gal %decline))
        `state(policy (~(del by policy) id.gal))
        ::
      ?~  max.u.gor
        `state(policy (~(put by policy) id.gal u.pol.gal))
      ?-    u.pol.gal
          %approve
        ?.  (gth u.max.u.gor ~(wyt in hodl.u.gor))
          `state(policy (~(put by policy) id.gal %decline))
        `state(policy (~(put by policy) id.gal u.pol.gal))
      ::
          %decline
        `state(policy (~(put by policy) id.gal u.pol.gal))
      ==
    ::
        %mk-gora
      |^  ^-  (quip card _state)
      ?:  ?=(%.n -.type.gal)
        =;  new=gora-stakable
          ~_  leaf+"%gora -mk-gora-failed -maybe-bad-id"
          ?<  (~(has by pita) id.new)
          =^  cards  outgoing.logs
            (ca-off ~(key by stak.p.type.gal) new)
          [cards state(pita (~(put by pita) id.new new))]
          ::
        =/  stik=stak
          ?.  (~(has in ~(key by stak.p.type.gal)) our.bol)
          ~  (my [our.bol 1]~)
        :+  %s
          %-  id-stk:shim
          [name.gal our.bol pic.gal [stik ~] now.bol]
        :^  name.gal  pic.gal  our.bol
        [(sub now.bol (mod now.bol ~d1)) stik ~]
        ::
      =;  new=gora-standard
        ~_  leaf+"%gora -mk-gora-failed -maybe-bad-id"
        ?<  (~(has by pita) id.new)
        =^  cards  outgoing.logs
          (ca-off hodl.p.type.gal new)
        [cards state(pita (~(put by pita) id.new new))]
        ::
      =/  hedl=hodl
        ?.  (~(has in hodl.p.type.gal) our.bol)
        ~  (sy ~[our.bol])
      :+  %g
        %+  id-stn:shim
          name.gal
        [our.bol pic.gal [hedl max.p.type.gal] now.bol]
      :^  name.gal  pic.gal  our.bol
      [(sub now.bol (mod now.bol ~d1)) hedl max.p.type.gal]
      ++  ca-off
        |=  [s=(set ship) g=gora]
        ^-  (quip card _outgoing.logs)
        %-  ~(rep in s)
        |=  [sip=@p [q=(list card) r=_outgoing.logs]]
        ?:  =(our.bol sip)  [q r]
        =/  wir=path
          /offer/(scot %uv id.g)/(scot %p sip)
        :-
          ^-  (list card)
          :_  q
          ^-  card
          =-  [%pass wir %agent [sip %gora] %poke -]
          [%gora-transact-2 !>(`transact-2`[%offered g])]
        (~(put bi r) [id.g [sip %give] [now.bol ~]])
      --
    ==
  --
--