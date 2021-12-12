::
::  %gora - by ~dalten Collective (vue version)
::  %gora is a proof of presence protocol (POPP) that is
::  intended to be extensible, flexible and educational
::  (at least for new hooners). %gora has two distros in
::  circulation - these can be found at:
::  ~laddys-dozzod-dalten (Vue.js frontend)
::  ~mister-dozzod-dalten (sail frontend)
::
::  %gora relies on schooner, a library also produced by
::  ~dalten Collective.
::
::  %gora has several available methods including:
::    &gora-man-1 actions:
::   ::  Making your own
::     $:  %mkgora                               -Make a new gora
::         name=@t
::         =gora-img
::         public=?
::         max=(unit @ud)
::         req=?(%approve %reject %none)
::         giv=?(%transfer %reissue %none)
::     ==
::     [%delgora =gora-id]                       -Delete an existing gora
::     [%reject-request =gora-id ~dev]           -Deny an incoming gora request
::     [%approve-request =gora-id ~dev]          -Approve an incoming gora request
::     [%pubmod-host =gora-id public=?]          -Set whether a gora can be public
::     [%set-max-hodl =gora-id max=@ud]          -Set max hodlers
::     [%send-give =gora-id new=(set ship)]      -Send a gora to a recipient
::     [%send-transfer =gora-id new=(set ship)]  -Send a chain letter
::
::   ::  Working with your collection
::     [%reject-give =gora-id]                   -Decline an incoming gora gift
::     [%approve-give =gora-id]                  -Approve an incoming gora gift
::     [%send-request =gora-id ~dalten]          -Request a gora from a host
::     [%send-reissue =gora-id new=(set ship)]   -Reissue a gora you hodl
::     [%send-transfer =gora-id new=(set ship)]  -Send a chain letter
::
::   ::  Other necessities
::     [%clean-log =log]                         -Clean log - (use a log below)
::                [%offer-log =gora-id]            +Offer Log
::                [%blacklist =gora-id]            +Blacklist
::                [%request-log =ship =gora-id]    +Request Log
::     [%usps-mode mode=?]                       -Turn off incoming chain letters
::     [%resubscribe-all ~]                      -Resub to all gorae
::   and others that are more oriented towards machine use.
::
::  %gora has several available scries as well:
::      [%x %requests @ ~]                          -Get gora-ids for gora requested from specified ship
::    .^((set @uv) %gx /=gora=/requests/~zod/noun)
::    ::
::      [%x %made-gora ~]
::    =g -build-file  /=gora=/sur/gora/hoon         -Get a set gora of gorae you've made
::    .^((set gora.g) %gy /=gora=/made-gora)
::    ::
::  join ~dalten/dalten-collective-public if you have ideas for others.
::  Or, swing by the repo: https://github.com/dalten-collective/gora
::
/-  *gora
/+  server, default-agent, dbug, schooner, *pal
::
::/~  mainui  webpage  /app/gora/goraui
/~  errors  webpage  /app/gora/errors
/~  publui  webpage  /app/gora/publui
::
|%
+$  versioned-state
    $%  state-one
        state-zero
    ==
::
+$  state-one
  $:  %1
      =usps-mode  =pita
      =my-public  =request-log
      =offer-log  =blacklist
      =tag-set    =tag-store
      =pend
  ==
::
+$  state-zero
  $:  %0            
      pita-zero=(map gora-id gora-zero)  =request-log
      =offer-log                         =sent-log
      =blacklist
  ==
+$  gora-zero
  $:  =gora-id     name=@t
      =gora-img    host=ship
      =issue-date  =hodl-list
  ==
::
+$  card     card:agent:gall
+$  eyre-id  @ta
--
::
%-  agent:dbug
=|  state-one
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
  :_  this
  :~  :*
    %pass     /eyre/connect
    %arvo     %e
    %connect  [[~ [%apps %gora %public ~]] dap.bowl]
  ==  ==
::
++  on-save
  ^-  vase
  !>(state)
::
++  on-load
  |=  ole=vase
  |^  ^-  (quip card _this)
  ~&  >>  [%gora %reload %vue]
  =+  :-  old=!<(versioned-state ole)
      ^-  caz=(list card)
      :~
        :*  %pass        /eyre/connect
            %arvo        %e
            %disconnect  [~ [%apps %gora ~]]
        ==
        :*  %pass     /eyre/connect
            %arvo     %e
            %connect  [[~ [%apps %gora %public ~]] dap.bowl]
        ==
      ==
  |-
  ?-    -.old
      %1
    :_  this(state old)
    caz
  ::
      %0
    =+  cuz=-:(manage-handle-1 [%resubscribe-all ~])
    %=    $
        old
      :*
        %1
        %.y              (~(run by pita-zero.old) structure-gora)
        ~                request-log.old
        offer-log.old    blacklist.old
        ~                ~
        ~
      ==
    ::
        caz
      (welp caz cuz)
    ==
  ==
  ++  structure-gora
    |=  old=gora-zero
    ^-  gora
    :*  gora-id.old
        name.old
        gora-img.old
        host.old
        issue-date.old
        hodl-list.old
        %.n
        ~
        %none
        %none
    ==
  --
::
::
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  =^  cards  state
    ?+    mark  (on-poke:def mark vase)
        %gora-man-1
      (manage-handle-1:hc !<(manage-gora-1 vase))
    ::
        %gora-transact
      (transact-handle:hc !<(transact:zero vase))
        %gora-transact-1
      (transact-handle-1:hc !<(transact-1 vase) ~)
    ::
        %handle-http-request
      %-  http-handle:hc
      !<([=eyre-id =inbound-request:eyre] vase)
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
      [%website ~]
    :_  this
    :~  :*  %give
            %fact  ~
            [%json !>(`json`json-hndl:hc)]
    ==  ==
  ::
      [%updates @ *]
    ~|  [%unexpected-subscription %bad-id `@uv`(slav %uv i.t.path)]
    =/  id=@uv  (slav %uv i.t.path)
    ?>  =(our.bowl host:(~(got by pita) id))
    =+  :+  %update  %upd
            :-  ~
            :-  %initialize
            (~(got by pita) (slav %uv i.t.path))
    :_  this
    :~  :*
          %give
          %fact
          ~
          [%gora-transact-1 !>(`transact-1`-)]
    ==  ==
  ==
::
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  ?+  sign-arvo  (on-arvo:def wire sign-arvo)
      [%eyre %bound *]
    ~?  !accepted.sign-arvo
      [dap.bowl [%eyre %bind %fail] binding.sign-arvo]
    `this
  ==
::
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card _this)
  ?-  -.sign
      %fact
    =^  cards  state
      ~|  :*  %unexpected-fact  p.cage.sign
              %for  dap.bowl  %from  src.bowl
          ==
      ?+  p.cage.sign  !!
          %gora-transact
        (transact-handle:hc !<(transact:zero q.cage.sign))
          %gora-transact-1
        %+  transact-handle-1:hc
        !<(transact-1 q.cage.sign)  [~ wire]
      ==
    [cards this]
  ::
      %kick
    =+  (slav %uv +<.wire)
    :_  this
    :~  :*  
      %pass   /updates/(scot %uv -)/(scot %p our.bol)
      %agent  [src.bol %gora]
      %watch  /updates/(scot %uv -)
    ==  ==
  ::
      %watch-ack
    ?:  =(~ p.sign)
       `this
    =+  gid=(slav %uv +<.wire)
    ~&  >>>  [%watch-nack gid %bummer]
    `this(offer-log (~(del in offer-log) gid))
  ::
      %poke-ack
    ?>  ?=([@ @ @ @ ~] wire)
    ?+    i.t.wire  `this
        %send-req
      =+  gid=(slav %uv i.t.t.wire)
      =+  sir=(slav %p i.t.t.t.wire)
      ?.  (~(has in (~(key bi pend) gid)) [sir %send-ask])
        `this(pend (~(put bi pend) gid [sir %send-ask] [now.bowl %.y]))
      =+  fax=(~(got bi pend) gid [sir %send-ask])
      `this(pend (~(put bi pend) gid [sir %send-ask] [wen.fax %.y]))
    ::
        %send-giv
      =+  gid=(slav %uv i.t.t.wire)
      =+  sir=(slav %p i.t.t.t.wire)
      ?.  (~(has in (~(key bi pend) gid)) [sir %send-giv])
        `this(pend (~(put bi pend) gid [sir %send-giv] [now.bowl %.y]))
      =+  fax=(~(got bi pend) gid [sir %send-giv])
      `this(pend (~(put bi pend) gid [sir %send-giv] [wen.fax %.y]))
    ::
        %give-ack
      =+  gid=(slav %uv i.t.t.wire)
      =+  sir=(slav %p i.t.t.t.wire)
      ?.  (~(has in (~(key bi pend) gid)) [sir %give-ack])
        `this(pend (~(put bi pend) gid [sir %give-ack] [now.bowl %.y]))
      =+  fax=(~(got bi pend) gid [sir %give-ack])
      `this(pend (~(put bi pend) gid [sir %give-ack] [wen.fax %.y]))
    ::
        %transfer
      =+  gid=(slav %uv i.t.t.wire)
      =+  sir=(slav %p i.t.t.t.wire)
      ?.  (~(has in (~(key bi pend) gid)) [sir %chain-it])
        `this(pend (~(put bi pend) gid [sir %chain-it] [now.bowl %.y]))
      =+  fax=(~(got bi pend) gid [sir %chain-it])
      `this(pend (~(put bi pend) gid [sir %chain-it] [wen.fax %.y]))
    ::
        %reissue
      =+  gid=(slav %uv i.t.t.wire)
      =+  sir=(slav %p i.t.t.t.wire)
      ?.  (~(has in (~(key bi pend) gid)) [sir %proxy-it])
        `this(pend (~(put bi pend) gid [sir %proxy-it] [now.bowl %.y]))
      =+  fax=(~(got bi pend) gid [sir %proxy-it])
      `this(pend (~(put bi pend) gid [sir %proxy-it] [wen.fax %.y]))
    ==
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
      [%x %made-gora ~]
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
      [%x %tags ~]
    ?>  (team:title our.bowl src.bowl)
    ``noun+!>(`(set @tas)`tag-set)
  ::
      [%x %offers ~]
    ?>  (team:title our.bowl src.bowl)
    ``noun+!>(`(set @uv)`offer-log)
  ==
::
++  on-leave  on-leave:def
++  on-fail  on-fail:def
--
::!.
|_  bol=bowl:gall
++  mkgora-id
  |=  $:  name=@t
          img=gora-img
          max=(unit @ud)
          req=@tas
          giv=@tas
          hedl=hodl-list
          host=ship
      ==
  (sham our.bol now.bol name img max req giv hedl host)
::
++  json-hndl
  |^
  =+  :+  p=(~(rep by pita) pita-filter)
          q=(roll ~(tap in offer-log) offer-map)
          r=(roll (sort ~(tap bi pend) pend-sort) wire-maker)
  %-  pairs:enjs:format
  :~  ['ownd' `json`a/(~(rep by out.p) hedl)]
      ['offd' `json`a/(~(rep by q) hedl)]
      ['wire' `json`a/r]
  ==
  ::
  ++  hedl
    |=  [[key=@ goz=gora] out=(list json)]
    :_  out
    %-  pairs:enjs:format
    :~  ['id' [%s `@t`(scot %uv gora-id.goz)]]
        ['goraName' [%s name.goz]]
        ['url' [%s gora-img.goz]]
        ['host' (ship:enjs:format host.goz)]
        ['date' (date-parse issue-date.goz)]
        ['public' [%b host-public.goz]]
        ::
        :-  'owners'
          :-  %a
        (turn ~(tap in hodl-list.goz) ship:enjs:format)
        :-  'max-hodl'
        ?~  max-hodl.goz
          [%s 'unlimited']
        (numb:enjs:format u.max-hodl.goz)
        ['req-behave' [%s `@t`request-behavior.goz]]
        ['giv-behave' [%s `@t`give-permissions.goz]]
    ==
  ::
  ++  wire-maker
    |=  $:
          $:
            x=@uv
            y=[@p ?(%chain-it %give-ack %proxy-it %send-ask %send-giv)]
            v=[wen=@da dun=?(%.y %.n)]
          ==
        ::
          out=(list json)
        ==
    =+  yor=(yore wen.v)
    :_  out
    %-  pairs:enjs:format
    :~  ['g-id' [%s (scot %uv x)]]
        ['targ' (ship:enjs:format -.y)]
        ['acts' [%s (scot %tas +.y)]]
        ['date' (date-parse [y.yor m.yor d.t.yor])]
        ['ackd' [%b dun.v]]
    ==
  ::
  ++  pend-sort
    |=  $:
          $:
            x=@uv
            y=[@p ?(%chain-it %give-ack %proxy-it %send-ask %send-giv)]
            v=[wen=@da dun=?(%.y %.n)]
          ==
          $:
            x=@uv
            y=[@p ?(%chain-it %give-ack %proxy-it %send-ask %send-giv)]
            v=[wen=@da dun=?(%.y %.n)]
          ==
        ==
    =+  [a=+<-.. b=+<+..]
    (gth wen.v.b wen.v.a)
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
    =+  [req=~(tap in q) goz=(~(got by pita) p)]
    |-
    ?~  req
      out
    ?:  =(~ (find [host.goz %ask]~ req))
      $(req t.req)
    %=  $
      req  t.req
      out  :_  out
           %-  pairs:enjs:format
           :~  ['id' [%s (scot %uv gora-id.goz)]]
               ['goraName' [%s name.goz]]
               ['url' [%s gora-img.goz]]
               ['host' [%s (scot %p host.goz)]]
               ['date' (date-parse issue-date.goz)]
               ['host-public' [%b host-public.goz]]
               ::
               :-  'owners'
                 :-  %a
               (turn ~(tap in hodl-list.goz) ship:enjs:format)
               :-  'max-hodl'
               ?~  max-hodl.goz
                 [%s 'unlimited']
               [%s (scot %ud u.max-hodl.goz)]
               ['req-behave' [%s request-behavior.goz]]
               ['giv-behave' [%s give-permissions.goz]]
           ==
    ==
  ++  date-parse
    |=  [y=@ud m=@ud d=@ud]
    ^-  json
    %-  pairs:enjs:format
    :~  ['year' (numb:enjs:format y)]
        ['month' (numb:enjs:format m)]
        ['day' (numb:enjs:format d)]
    ==
  --
::
++  transact-handle
  |=  transaction=transact:zero
  ^-  (quip card _state)
  =,  transaction
  ?-    -.+<
      %giv-ack
    (transact-handle-1 [%giv-ack gora-id] ~)
  ::
      %receive-gora
    (transact-handle-1 [%receive-gora gora-id.gora %none] ~)
  ::
      %receive-request
    (transact-handle-1 [%receive-request gora-id] ~)
  ::
      %proxy-approve
    ~|  [%unexpected-proxy-attempt ~]
    !!
  ::
      %update
    =,  gora
    =/  goz
      :*
        gora-id
        name
        gora-img
        host
        issue-date
        hodl-list
        %.n
        ~
        %none
        %none
      ==
    (transact-handle-1 [%update %upd [~ [%initialize goz]]] ~)
  ==
++  transact-handle-1
  |=  [transaction=transact-1 pat=(unit path)]
  ^-  (quip card _state)
  =,  transaction
  ?-    -.transaction
      %proxy-approve
    ~|  [%unexpected-proxy-attempt ~]
    !!
  ::
      %receive-gora
    ~|  [%unexpected-offer %duplicate-offer-id]
    ?>  ?&
          !(~(has in offer-log) gora-id)
          !(~(has in blacklist) gora-id)
          ?:  usps-mode
            %.y
          !=(%transfer giv)
        ==
    :_  state(offer-log (~(put in offer-log) gora-id))
    :~  :*  
      %pass   /updates/(scot %uv gora-id)/(scot %p our.bol)
      %agent  [src.bol %gora]
      %watch  /updates/(scot %uv gora-id)
    ==  ==
  ::
      %receive-transfer
    ?>  ?&
          !(~(has in offer-log) gora-id.gora)
          !(~(has in blacklist) gora-id.gora)
        ==
    =.  pita
      (~(put by pita) gora-id.gora gora)
    `state
  ::
      %giv-ack
    =+  goz=`gora`(~(got by pita) gora-id)
      
    ~|  [%give %rejected %over %limit]
    ?>  ?&  
          !=(request-behavior.goz %reject)
          (~(has in (~(key bi pend) gora-id)) [src.bol %send-giv])
          ::
          ?~  max-hodl.goz
            %.y
          %+  gte
              u.max-hodl.goz
              +((lent ~(tap in hodl-list.goz)))
        ==
    =?    goz
        ?~  max-hodl.goz
          %.n
        =(u.max-hodl.goz +((lent ~(tap in hodl-list.goz))))
      goz(request-behavior %reject)
    =.  goz  
      goz(hodl-list (~(put in hodl-list.goz) src.bol))
    :_  %=    state
            pita
          (~(put by pita) gora-id.goz goz)
        ::
            pend
          (~(put bi pend) gora-id [src.bol %send-giv] [now.bol %.y])
        ==
    :~  :*  
      %give
      %fact
      ~[/updates/(scot %uv gora-id.goz)]
      :-  %gora-transact-1
      !>(`transact-1`[%update %upd [~ [%new-hodlr src.bol]]])
    ==  ==
  ::
      %receive-request
    ~|  [%unexpected-request-received %invalid-id]
    =+  goz=(~(got by pita) gora-id)
    ?>  =(our.bol host:(~(got by pita) gora-id))
    ?:  (~(has in hodl-list.goz) src.bol)
      :_  state
      :~  :*
        %give
        %fact
        ~[/updates/(scot %uv gora-id)]
        :-  %gora-transact-1
        !>(`transact-1`[%update %upd [~ [%initialize goz]]])
      ==  ==
    ?>  ?~  max-hodl.goz
          %.y
        (gte u.max-hodl.goz +((lent ~(tap in hodl-list.goz))))
    ::
    ?-    request-behavior.goz
        %approve
      =/  behav=?(%approve %reject %none)
        ?:  ?=(~ max-hodl.goz)
          request-behavior.goz
        ?.  (gth u.max-hodl.goz +((lent ~(tap in hodl-list.goz))))
          %reject
        request-behavior.goz
      =.  goz
        goz(hodl-list (~(put in hodl-list.goz) src.bol))
      =.  pita
        (~(put by pita) gora-id goz(request-behavior behav))
      :_  state
      :~  :*
        %give
        %fact
        ~[/updates/(scot %uv gora-id)]
        :-  %gora-transact
        !>(`transact-1`[%update %upd [~ [%initialize goz]]])
      ==  ==
    ::
        %reject
      :_  state
      :~  :*
        %give  %kick
        ~[/updates/(scot %uv gora-id)]
        `src.bol
      ==  ==
    ::
        %none
      ?.  ^-  ?  
          ?~  max-hodl.goz
            %.y
          (gte u.max-hodl.goz +((lent ~(tap in hodl-list.goz))))
        =.  pita
          (~(put by pita) gora-id goz(request-behavior %reject))
        :_  state
        :~  :*
          %give  %kick
          ~[/updates/(scot %uv gora-id)]
          `src.bol
        ==  ==
      =.  request-log
        (~(put ju request-log) src.bol gora-id)
      :_  state
      :~  :*
        %give
        %fact
        ~[/updates/(scot %uv gora-id)]
        :-  %gora-transact
        !>(`transact-1`[%update %upd [~ [%initialize -]]])
      ==  ==
    ==
  ::
      %update
    ?-    act.transaction
        %del
      ~|  [%unexpected-update %del %no-path]
      ?<  ?=(~ pat)
      =/  gid=@uv  (slav %uv +<.u.pat)
      ?>  =(src.bol host:(~(got by pita) gid))
      =:
          pend
        =/  ion=(list [ship gib])
          ~(tap in (~(key bi pend) gid))
        |-
        ?~  ion
          pend
        $(ion t.ion, pend (~(del bi pend) gid i.ion))
      ::
          offer-log
        (~(del in offer-log) gid)
      ==
      :_  state
      :~  :*  
        %pass   /updates/(scot %uv gid)/(scot %p our.bol)
        %agent  [src.bol %gora]
        %leave  ~
      ==  ==
    ::
        %upd
      ~|  [%unexpected-update %upd %no-jot]
      ?<  ?=(~ jot)
      =+  up=`update`+.jot
      ?-    -.up
          %update-image
        ~&  >>  [%not-implemented %sorry ~]
        `state
      ::
          %host-public
        ~|  [%unexpected-update %host-public %no-path]
        ?<  ?=(~ pat)
        =+  goz=(~(got by pita) (slav %uv +<.u.pat))
        =?    my-public
            !pub.up
          (~(del in my-public) gora-id.goz)
        =.  goz
          goz(host-public pub.up)
        `state
      ::
          %new-hodlr
        ~|  [%unexpected-update %new-hodlr ~]
        ?<  ?=(~ pat)
        =+  goz=(~(got by pita) (slav %uv +<.u.pat))
        =.  pita
          %+  ~(put by pita)
            gora-id.goz
          goz(hodl-list (~(put in hodl-list.goz) ship.up))
        `state
      ::
          %initialize
        =.  pita
          (~(put by pita) gora-id.gora.up gora.up)
        `state
      ::
          %reissue
        ~|  [%unexpecte-update %reissue %bad-id]
        =+  goz=(~(got by pita) id.up)
        ?>  ?&  =(our.bol host.goz)
                =(%reissue give-permissions.goz)
                (~(has in hodl-list.goz) src.bol)
              ::
                ?~  max-hodl.goz
                  %.y
                %+  gte
                  u.max-hodl.goz
                (lent ~(tap in (~(uni in hodl-list.goz) new.up)))
            ==
        =^  cards  state
          (manage-handle-1 [%send-give id.up new.up])
        [cards state]
      ==
    ==
  ==
::
++  http-handle
  |=  [=eyre-id =inbound-request:eyre]
  =/  send
    (cury response:schooner eyre-id)
  =*  reject  ~(. (~(got by errors) %index) bol +.state)
  =*  public  ~(. (~(got by publui) %index) bol +.state)
  ::
  =/  ,request-line:server
    %-  parse-request-line:server
  url.request.inbound-request
  ::
  |^  ^-  (quip card _state)
  ?+    site  :_  state
              %-  send
              :+  404
                ~
              [%manx (build:reject %not-found ~)]
  ::
      [%apps %gora %public ~]
    call-public-index
      [%apps %gora %public %$ ~]
    :_  state
    %-  send
    [302 ~ [%redirect '/apps/gora/public']]
  ==
  ::
  ++  call-public-index
    ?+    method.request.inbound-request
      [(send [405 ~ [%stock ~]]) state]
    ::
        %'GET'
      :_  state
      %-  send
      [200 ~ [%manx (build:public %publ-index ~)]]
    ::
        %'POST'
      ?~  body.request.inbound-request
        [(send [405 ~ [%stock ~]]) state]
      =/  mop=(map @t @t)  
        %-  my
        ^-  (list (pair @t @t))
        %+  rash
          +>.body.request.inbound-request
        yquy:de-purl:html
      ?+    (~(got by mop) 'action')
        :_  state
        %-  send
        [405 ~ [%manx (build:reject %not-found ~)]]
      ::
          %show-tag
        :_  state
        %-  send
        :+  200
          ~
        :-  %manx
        %+  build:public
          %publ-index
        [[%tag (~(got by mop) 'tag')]]~
      ==
    ==
  --
::
++  manage-handle-1
  |=  v=manage-gora-1
  ^-  (quip card _state)
  ?>  (team:title our.bol src.bol)
  ?-    -.v
      %usps-mode
    =.  usps-mode
      mode.v
    `state
  ::
      %resubscribe-all
    =+  [caz=*(list card) kez=~(tap in ~(key by pita))]
    :_  state
    |-
    ?~  kez
      caz
    %=  $
      kez  t.kez
      ::
        caz  
      %+  welp  caz
      :~  :*
        %pass   /updates/(scot %uv i.kez)/(scot %p our.bol)
        %agent  [host:(~(got by pita) i.kez) %gora]
        %watch  /updates/(scot %uv i.kez)  
      ==  ==
    ==
  ::
      %pubmod-hodl
    ?:  public.v
      =.  my-public
        (~(put in my-public) gora-id.v)
      `state
    =.  my-public
      (~(del in my-public) gora-id.v)
    `state
  ::
      %set-max-hodl
    =+  goz=(~(got by pita) gora-id.v)
    ?>  ?&
          =(our.bol host.goz)
          =(~ max-hodl.goz)
        ==
    ?.  (gte max.v (lent ~(tap in hodl-list.goz)))
      `state
    =.  pita
      (~(put by pita) gora-id.v goz(max-hodl [~ max.v]))
    :_  state
    :~  :*
      %give
      %fact
      ~[/updates/(scot %uv gora-id.v)]
      :-  %gora-transact-1
      !>(`transact-1`[%update %upd [~ [%initialize goz(max-hodl [~ max.v])]]])
    ==  ==
  ::
      %pubmod-host
    =+  goz=(~(got by pita) gora-id.v)
    ?>  =(our.bol host.goz)
    =.  pita
      (~(put by pita) gora-id.v goz(host-public public.v))
    :_  state
    :~  :*
      %give
      %fact
      ~[/updates/(scot %uv gora-id.v)]
      :-  %gora-transact-1
      !>(`transact-1`[%update %upd [~ [%host-public public.v]]])
    ==  ==
  ::
      %add-tag
    =/  tag-me=(list @uv)  ~(tap in gorae.v)
    |-
    ?~  tag-me
      =.  tag-set  ~(key by tag-store)
      `state
    %=  $
      tag-me     t.tag-me
      tag-store  (~(put ju tag-store) tag.v i.tag-me)
    ==
  ::
      %del-tag
    =/  fre-me=(list @uv)  ~(tap in gorae.v)
    |-
    ?~  fre-me
      =.  tag-set  ~(key by tag-store)
      `state
    %=  $
      fre-me  t.fre-me
    ::
        tag-store
      (~(del ju tag-store) tag.v i.fre-me)
    ==
  ::
      %mkgora
    ~|  [%failed-gora-make name.v %identical-hash]
    =+  id=(mkgora-id name.v gora-img.v max.v req.v giv.v ~ our.bol) 
    =+  date=(yore now.bol)
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
          public.v
          ?:(=(giv.v %transfer) [~ 2] max.v)
          ?:(=(giv.v %transfer) %reject req.v)
          giv.v
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
            [%gora-transact-1 !>(`transact-1`[%update %del ~])]
          ==
          :*
            %give  %kick
            ~[/updates/(scot %uv gora-id.v)]
            ~
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
    ~|  [%unexpected-give %check-max ~]
    =/  my-ships=(list ship)  ~(tap in new.v)
    =+  [caz=*(list card:agent:gall) goz=(~(got by pita) gora-id.v)]
    ?>  ?~  max-hodl.goz
          %.y
        (gte u.max-hodl.goz (lent ~(tap in (~(uni in hodl-list.goz) new.v))))
    |-
    ?~  my-ships
      [caz state]
    ~?  (~(has in (~(key bi pend) gora-id.v)) [i.my-ships %send-giv])
      [%duplicate %giv %detected `@tas`(scot %ud gora-id.v)]
    =/  wir
      ;:  welp
        /transact
        /send-giv
        /(scot %uv gora-id.v)
        /(scot %p i.my-ships)
      ==
    %=    $
        pend
      (~(put bi pend) gora-id.v [i.my-ships %send-giv] [now.bol %.n])
    ::
        caz
      %+  welp  caz
      :~  :*
        %pass   wir
        %agent  [i.my-ships %gora]
        %poke   %gora-transact-1
        !>(`transact-1`[%receive-gora gora-id.v give-permissions.goz])
      ==  ==
    ::
        my-ships
      t.my-ships
    ==
  ::
      %send-request
    ~?  (~(has in (~(key bi pend) gora-id.v)) [ship.v %send-ask])
      [%duplicate %ask %detected `@tas`(scot %ud gora-id.v)]
    =/  wir
      ;:  welp
        /transact
        /send-req
        /(scot %uv gora-id.v)
        /(scot %p ship.v)
      ==
    :_  %=    state
            pend
          (~(put bi pend) gora-id.v [ship.v %send-ask] [now.bol %.n])
        ==
    :~  :* 
          %pass   wir
          %agent  [ship.v %gora]
          %poke   %gora-transact-1
          !>(`transact-1`[%receive-request gora-id.v])
        ==
        :*
          %pass   /updates/(scot %uv gora-id.v)/(scot %p our.bol)
          %agent  [ship.v %gora]
          %watch  /updates/(scot %uv gora-id.v)  
    ==  ==
  ::
      %approve-request
    ~|  [%bad-request (scot %uv gora-id.v) (scot %p ship.v)]
    =+  goz=(~(got by pita) gora-id.v)
    ?>  ?&
          =(our.bol host.goz)
        ::
          ?~  max-hodl.goz
            %.y
          (gte u.max-hodl.goz +((lent ~(tap in hodl-list.goz))))
        ==
    =?    goz
        ?~  max-hodl.goz
          %.n
        =(u.max-hodl.goz +((lent ~(tap in hodl-list.goz))))
      goz(request-behavior %reject)
    =.  goz
      goz(hodl-list (~(put in hodl-list.goz) src.bol))
    :-  :~  :*
          %give
          %fact
          ~[/updates/(scot %uv gora-id.v)]
          :-  %gora-transact-1
          !>(`transact-1`[%update %upd [~ [%initialize goz]]])
        ==  ==
    %=    state
        pita
      (~(put by pita) gora-id.v goz)
    ::
        request-log
      (~(del ju request-log) ship.v gora-id.v)
    ==
  ::
      %approve-give
    ~|  [%unrecognized-offer (scot %uv gora-id.v)]
    ?>  (~(has in offer-log) gora-id.v)
    =+  goz=(~(got by pita) gora-id.v)
    =/  wir=path
      ;:  welp
        /transact
        /give-ack
        /(scot %uv gora-id.v)
        /(scot %p host.goz)
      ==
    :-  :~  :*  
          %pass   wir
          %agent  [host.goz %gora]
          %poke   %gora-transact-1
          !>(`transact-1`[%giv-ack gora-id.v])
        ==  ==
    %=    state
        offer-log
      (~(del in offer-log) gora-id.v)
    ::
        pend
      (~(put bi pend) gora-id.v [host.goz %give-ack] [now.bol %.n])
    ==
  ::
      %reject-give
    ~|  [%unrecognized-offer `@tas`(scot %uv gora-id.v)]
    ?>  (~(has in offer-log) gora-id.v)
    =+  goz=(~(got by pita) gora-id.v)
    :-  :~  :*
          %pass   /updates/(scot %uv gora-id.v)
          %agent  [host.goz %gora]
          %leave  ~
        ==  ==
    %=    state
        offer-log
      (~(del in offer-log) gora-id.v)
    ::
        blacklist
      (~(put in blacklist) gora-id.v)
    ==
  ::
      %reject-request
    ~|  [%bad-request `@tas`(scot %uv gora-id.v) `@tas`(scot %p ship.v)]
    ?>  (~(has in (~(got by request-log) ship.v)) gora-id.v)
    :_  state(request-log (~(del ju request-log) ship.v gora-id.v))
    :~  :*
      %give  %kick
      ~[/updates/(scot %uv gora-id.v)]
      `ship.v
    ==  ==
  ::
      %clean-log
    ?-  -.log.v
        %offer-log
      =,  log.v
      `state(offer-log (~(del in offer-log) gora-id))
    ::
        %blacklist
      =,  log.v
      `state(blacklist (~(del in blacklist) gora-id))
    ::
        %request-log
      =,  log.v
      :-  ~
      %=  state
          request-log
        (~(del ju request-log) ship gora-id)
      ==
    ==
  ::
      %send-reissue
    ~|  [%unrecognized-reissue (scot %uv gora-id.v)]
    =+  goz=(~(got by pita) gora-id.v)
    ~|  [%unexpected-reissue %no-reissue-permissions ~]
    ?>  ?&  =(%reissue give-permissions.goz)
            (~(has in hodl-list.goz) our.bol)
        ==
    =/  wir=path
      ;:  welp
        /transact
        /reissue
        /(scot %uv gora-id.v)
        /(scot %p host.goz)
      ==
    ?~  max-hodl.goz
      :_  %=    state
              pend
            (~(put bi pend) gora-id.v [host.goz %proxy-it] [now.bol %.n])
          ==
      :~  :*
        %pass   wir
        %agent  [host.goz %gora]
        %poke   %gora-transact-1
        !>(`transact-1`[%update %upd [~ [%reissue gora-id.v new.v]]])
      ==  ==
    ::
    ~|  [%unexpected-reissue %over-max ~]
    ?>  (gte u.max-hodl.goz +((lent ~(tap in hodl-list.goz))))
    :_  %=    state
            pend
          (~(put bi pend) gora-id.v [host.goz %proxy-it] [now.bol %.n])
        ==
    :~  :*
      %pass   wir
      %agent  [host.goz %gora]
      %poke   %gora-transact-1
      !>(`transact-1`[%update %upd [~ [%reissue gora-id.v new.v]]])
    ==  ==
  ::
      %send-transfer
    ~|  [%unexpected-transfer %check-permissions %check-max ~]
    =+  :-  goz=(~(got by pita) gora-id.v)
        hedl=(lent ~(tap in hodl-list:(~(got by pita) gora-id.v)))
    ?~  max-hodl.goz
      !!
    ?>  ?&  =(our.bol host.goz)
            =(%transfer give-permissions.goz)
            (gte u.max-hodl.goz (add (lent ~(tap in new.v)) hedl))
        ==
    =,  goz
    =+  :+  caz=*(list card:agent:gall)
            nez=~(tap in new.v)
            dez=(yore now.bol)
    =^  cards  state
    |-
      ?~  nez
        [caz state]
      =/  goz=gora
        :*
          gora-id
          name
          gora-img
          i.nez
          [y.dez m.dez d.t.dez]
          (~(uni in hodl-list) new.v)
          %.n
          [~ (mul 2 u.max-hodl.goz)]
          %reject
          %transfer
        ==
      =/  wir=path
        ;:  welp
          /transact
          /transfer
          /(scot %uv gora-id)
          /(scot %p our.bol)
        ==
      %=    $
          nez
        t.nez
      ::
          caz
        %+  welp  caz
        :~  :*
          %pass   wir
          %agent  [i.nez %gora]
          %poke   %gora-transact-1  !>(`transact-1`[%receive-transfer goz])
        ==  ==
      ::
          pita
        (~(put by pita) gora-id.v goz(hodl-list (~(put in hodl-list) i.nez)))
      ::
          pend
        (~(put bi pend) gora-id.v [i.nez %chain-it] [now.bol %.n])
      ==
    [cards state]
  ==
--