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
    =+  cuz=-:(mange [%resubscribe-all ~])
    %=    $
        old
      :*
        %1
        %.y              (~(run by pita-zero.old) struc)
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
  ++  struc
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
      (mange:hc !<(manage-gora-1 vase))
    ::
        %gora-transact
      (trans-0:hc !<(transact:zero vase))
        %gora-transact-1
      (trans:hc !<(transact-1 vase) ~)
    ::
        %handle-http-request
      %-  https:hc
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
    =^  cards  state
      (javas:hc [%none ~])
    [cards this]
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
        (trans-0:hc !<(transact:zero q.cage.sign))
          %gora-transact-1
        %+  trans:hc
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
  ?+    path  (on-peek:def path)
      [%y %pub ~]
    =-  ``noun+!>(`(list [name=@t url=@t])`-)
    (~(rep by pita) pfpic:hc)
  ::
      [%y %check ~]
    =-  ``noun+!>(`(set gora)`-)
    (~(rep by pita) blues:hc)
  ::
      [%x %requests @ ~]
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
++  mkgor
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
++  pfpic
  |=  [inn=[gid=gora-id gor=gora] out=(list [name=@t url=@t])]
  ?.  ?&  =(%.y host-public.gor.inn)
          (~(has in my-public) gid.inn)
      ==
    out
  [[name.gor.inn gora-img.gor.inn] out]
::
++  blues
  |=  [inn=[gid=gora-id gor=gora] out=(set gora)]
  |^
  =/  hop  ?&  =(%.y host-public.gor.inn)
                 (~(has in my-public) gid.inn)
           ==
  =/  hol  (gte 20 (rank hodl-list.gor.inn))
  ?.  &(hop hol)
    out
  (~(put in out) gor.inn)
  ++  rank
    |=  hod=hodl-list
    =+  [hol=~(tap in hod) hud=0]
    |-
    ?~  hol
      hud
    =/  rnk  ?|  =(%duke (clan:title i.hol))
                 =(%duke (clan:title i.hol))
                 =(%duke (clan:title i.hol))
             ==
    $(hol t.hol, hud ?:(rnk +(hud) hud))
  --
::
++  javas
  |=  giv=?([%id gid=gora-id] [%none ~] [%success =term] [%failure =term])
  |^
  :_  state
  =-  :~  :*
        %give
        %fact  ~[/website]
        [%json !>(`json`jon)]
      ==  ==
  ^-  jon=json
  =+  :^  p=(~(rep by pita) pfil)
          q=(roll ~(tap in offer-log) omap)
          r=(roll (sort ~(tap bi pend) port) line)
          s=tugs
  %-  pairs:enjs:format
  ?-    -.giv
      %id
    :~  ['ownd' `json`a/(~(rep by out.p) hedl)]
        ['offd' `json`a/(~(rep by q) hedl)]
        ['wire' `json`a/r]
        ['pita' `json`a/(~(rep by pita) hedl)]
        ['reqs' `json`a/give]
        ['newg' `json`s/(scot %uv +.giv)]
        ['tags' `json`tugs]
    ==
  ::
      %none
    :~  ['ownd' `json`a/(~(rep by out.p) hedl)]
        ['offd' `json`a/(~(rep by q) hedl)]
        ['wire' `json`a/r]
        ['pita' `json`a/(~(rep by pita) hedl)]
        ['reqs' `json`a/give]
        ['tags' `json`tugs]
    ==
  ::  
      %failure
    :~  ['ownd' `json`a/(~(rep by out.p) hedl)]
        ['offd' `json`a/(~(rep by q) hedl)]
        ['wire' `json`a/r]
        ['pita' `json`a/(~(rep by pita) hedl)]
        ['reqs' `json`a/give]
        ['fail' `json`s/(scot %tas +.giv)]
        ['tags' `json`tugs]
    ==
  ::
      %success
    :~  ['ownd' `json`a/(~(rep by out.p) hedl)]
        ['offd' `json`a/(~(rep by q) hedl)]
        ['wire' `json`a/r]
        ['pita' `json`a/(~(rep by pita) hedl)]
        ['reqs' `json`a/give]
        ['succ' `json`s/(scot %tas +.giv)]
        ['tags' `json`tugs]
    ==
  ==
  ::
  ++  omap
    |=  [in=gora-id out=^pita]
    ?:  (~(has by pita) in)
      (~(put by out) in (~(got by pita) in))
    out
  ::
  ++  pfil
    |=  [[p=gora-id q=gora] out=^pita]
    ?:  (~(has in hodl-list.q) our.bol)
      (~(put by out) p q)
    out
  ::
  ++  dias
    |=  [y=@ud m=@ud d=@ud]
    ^-  json
    %-  pairs:enjs:format
    :~  ['year' (numb:enjs:format y)]
        ['month' (numb:enjs:format m)]
        ['day' (numb:enjs:format d)]
    ==
  ::
  ++  tugs
    =+  tor=tag-store
    |^
    =+  kez=~(tap in ~(key by tor))
    =+  dez=(roll kez duz)
    =+  nez=~(tap by (roll dez nuz))
    ::[%s 'test']
    (pairs:enjs:format (roll nez puz))
    ::
    ++  nuz
      |=  [inn=[=tag gid=gora-id] out=(jug gora-id @t)]
      (~(put ju out) [gid.inn `@t`tag.inn])
    ::
    ++  duz
      |=  [inn=tag out=(list [=tag gid=gora-id])]
      =+  haz=~(tap in (~(get ju tor) inn))
      |-
      ?~  haz
        out
      $(haz t.haz, out [[inn i.haz] out])
    ::
    ++  puz
      |=  [inn=[gid=gora-id taz=(set tag)] out=(list [@t json])]
      =+  tal=~(tap in taz.inn)
      =/  taj=json
        [%a (roll tal |=(=[@t (list json)] [[%s +<-..] +<+..]))]
      [[`@t`(scot %uv gid.inn) taj] out]
    --
  ++  port
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
  ++  line
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
    :~  ['g-id' s+(scot %uv x)]
        ['targ' s+(scot %p -.y)]
        ['acts' s+(scot %tas +.y)]
        ['date' (dias [y.yor m.yor d.t.yor])]
        ['ackd' b+dun.v]
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
        ['date' (dias issue-date.goz)]
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
  ++  give
    ^-  (list json)
    =+  [muny=~(tap in ~(key by request-log)) out=*(list json)]
    |-
    ?~  muny  out
    =+  want=~(tap in (~(get ju request-log) i.muny))
    %=  $
      muny  t.muny
      out   =+  oot=*(list json)
            %+  weld  out
            |-  ^-  (list json)
            ?~  want
              oot
            %=    $
                want
              t.want
            ::
                oot
              :_  oot
              %-  pairs:enjs:format
              :~  ['id' [%s `@t`(scot %uv i.want)]]
                  ['ship' (ship:enjs:format i.muny)]
              ==
            ==
    ==
  --
::
++  trans-0
  |=  transaction=transact:zero
  ^-  (quip card _state)
  =,  transaction
  ?-    -.+<
      %giv-ack
    (trans [%giv-ack gora-id] ~)
  ::
      %receive-gora
    (trans [%receive-gora gora-id.gora %none] ~)
  ::
      %receive-request
    (trans [%receive-request gora-id] ~)
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
    (trans [%update %upd [~ [%initialize goz]]] ~)
  ==
::
++  trans
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
    =.  offer-log
      (~(put in offer-log) gora-id)
    =^  cards  state
      (javas [%success 'gora-received'])
    :_  state
    %+  welp  cards
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
    =^  cards  state
      (javas [%success 'spam-received'])
    [cards state]
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
    =.  pita
      (~(put by pita) gora-id.goz goz)
    =^  cards  state
      (javas [%success (cat 3 (scot %p src.bol) ' accepted gora')])
    :_  state
    %+  welp  cards
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
      =^  cards  state
        (javas [%success (cat 3 (scot %p src.bol) ' resubscribed')])
      :_  state
      %+  welp  cards
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
      =^  cards  state
        %-  javas
        [%success (cat 3 (scot %p src.bol) ' auto-approved for gora')]
      :_  state
      %+  welp  cards
      :~  :*
        %give
        %fact
        ~[/updates/(scot %uv gora-id)]
        :-  %gora-transact
        !>(`transact-1`[%update %upd [~ [%initialize goz]]])
      ==  ==
    ::
        %reject
      =^  cards  state
        %-  javas
        [%success (cat 3 (scot %p src.bol) ' requested a full gora')]
      :_  state
      %+  welp  cards
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
        =^  cards  state
          %-  javas
          [%success :((cury cat 3) (scot %p src.bol) ' requested ' name.goz)]
        :_  state
        %+  welp  cards
        :~  :*
          %give  %kick
          ~[/updates/(scot %uv gora-id)]
          `src.bol
        ==  ==
      =^  cards  state
        %-  javas
        [%success :((cury cat 3) (scot %p src.bol) ' requests ' name.goz)]
      =.  request-log
        (~(put ju request-log) src.bol gora-id)
      :_  state
      %+  welp  cards
      :~  :*
        %give
        %fact
        ~[/updates/(scot %uv gora-id)]
        :-  %gora-transact
        !>(`transact-1`[%update %upd [~ [%initialize goz]]])
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
      =^  cards  state
        (javas [%success (cat 3 (scot %uv gid) ' gora deleted')])
      :_  state
      %+  welp  cards
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
        =^  cards  state
          (javas [%success (cat 3 name.goz ' made public by host')])
        [cards state]
      ::
          %new-hodlr
        ~|  [%unexpected-update %new-hodlr ~]
        ?<  ?=(~ pat)
        =+  goz=(~(got by pita) (slav %uv +<.u.pat))
        =.  pita
          %+  ~(put by pita)
            gora-id.goz
          goz(hodl-list (~(put in hodl-list.goz) ship.up))
        =?    request-log
            ?&  (~(has ju request-log) src.bol gora-id.goz)
                (~(has in hodl-list.goz) our.bol)
            ==
          (~(del ju request-log) src.bol gora-id.goz)
        =^  cards  state
          %-  javas
          [%success :((cury cat 3) (scot %p ship.up) ' owns ' name.goz)]
        [cards state]
      ::
          %initialize
        =.  pita
          (~(put by pita) gora-id.gora.up gora.up)
        =?    request-log
            ?&  (~(has ju request-log) src.bol gora-id.gora.up)
                (~(has in hodl-list.gora.up) our.bol)
            ==
          (~(del ju request-log) src.bol gora-id.gora.up)
        =^  cards  state
          %-  javas
          [%success :((cury cat 3) src.bol ' initialized ' name.gora.up)]
        [cards state]
      ::
          %reissue
        ~|  [%unexpected-update %reissue %bad-id]
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
        =/  wir
          ;:  welp
            /reissue
            /send-giv
            /(scot %uv id.up)
            /(scot %p src.bol)
          ==
        :_  state
        :~  :*
          %pass   wir
          %agent  [our.bol %gora]
          %poke   %gora-man-1
          !>(`manage-gora-1`[%send-give id.up new.up])
        ==  ==
      ==
    ==
  ==
::
++  https
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
    pub
      [%apps %gora %public %$ ~]
    :_  state
    %-  send
    [302 ~ [%redirect '/apps/gora/public']]
  ==
  ::
  ++  pub
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
++  mange
  |=  v=manage-gora-1
  ^-  (quip card _state)
  ?>  (team:title our.bol src.bol)
  ?-    -.v
      %usps-mode
    =.  usps-mode
      mode.v
    =^  cards  state
      ?:  mode.v
        (javas [%success 'spam-mode activated'])
      (javas [%success 'spam-mode terminated'])
    [cards state]
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
      =^  cards  state
        (javas [%success (cat 3 (scot %uv gora-id.v) ' made public')])
      [cards state]
    =.  my-public
      (~(del in my-public) gora-id.v)
    =^  cards  state
      (javas [%success (cat 3 (scot %uv gora-id.v) ' made private')])
    [cards state]
  ::
      %set-max-hodl
    =+  goz=(~(got by pita) gora-id.v)
    ?>  ?&
          =(our.bol host.goz)
          =(~ max-hodl.goz)
        ==
    ?.  (gte max.v (lent ~(tap in hodl-list.goz)))
      =^  cards  state
        %-  javas
        [%failure (cat 3 (scot %uv gora-id.v) ' max was set too low')]
      [cards state]
    =.  pita
      (~(put by pita) gora-id.v goz(max-hodl [~ max.v]))
    =^  cards  state
      (javas [%success (cat 3 (scot %uv gora-id.v) ' max set')])
    :_  state
    %+  welp  cards
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
    =+  coz=*(list card)
    |-
    ?~  tag-me
      =.  tag-set  ~(key by tag-store)
      [coz state]
    =^  cards  state
      %-  javas
      [%success :((cury cat 3) (scot %uv i.tag-me) ' tag ' (scot %tas tag.v))]
    %=  $
      tag-me     t.tag-me
      tag-store  (~(put ju tag-store) tag.v i.tag-me)
      coz        (welp cards coz)
    ==
  ::
      %del-tag
    =/  fre-me=(list @uv)  ~(tap in gorae.v)
    =+  coz=*(list card)
    |-
    ?~  fre-me
      =.  tag-set  ~(key by tag-store)
      [coz state]
    =^  cards  state
      %-  javas
      [%success (cat 3 'removed tag from ' (scot %uv i.fre-me))]
    %=  $
      fre-me  t.fre-me
      coz     (welp coz cards)
    ::
        tag-store
      (~(del ju tag-store) tag.v i.fre-me)
    ==
  ::
      %mkgora
    ~|  [%failed-gora-make name.v %identical-hash]
    =+  id=(mkgor name.v gora-img.v max.v req.v giv.v ~ our.bol) 
    =+  date=(yore now.bol)
    =?    max.v
        ?~(max.v %.y =(0 u.max.v))
      ~
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
    =^  cards  state
      %-  javas
      [%success :((cury cat 3) name.v ' made with id ' (scot %uv id))]
    [cards state]
  ::
      %delgora
    ~|  [%failed-delete (scow %uv gora-id.v)]
    ?>  (~(has by pita) gora-id.v)
    ?:  =(our.bol host:(~(got by pita) gora-id.v))
      =+  (~(got by pita) gora-id.v)
      =.  pita  (~(del by pita) gora-id.v)
      =^  cards  state
        (javas [%success (cat 3 (scot %uv gora-id.v) ' deleted')])
      :_  state
      %+  welp  cards
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
    =^  cards  state
      (javas [%success (cat 3 (scot %uv gora-id.v) ' deleted')])
    :_  state
    %+  welp  cards
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
    =^  cards  state
      =+  msg=:((cury cat 3) name.goz ' sent to ' (scot %p i.my-ships))
      (javas [%success msg])
    %=    $
        pend
      (~(put bi pend) gora-id.v [i.my-ships %send-giv] [now.bol %.n])
    ::
        caz
      ;:  welp  caz  cards
          :~  :*
            %pass   wir
            %agent  [i.my-ships %gora]
            %poke   %gora-transact-1
            !>(`transact-1`[%receive-gora gora-id.v give-permissions.goz])
      ==  ==  ==
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
    =:
        pend
      (~(put bi pend) gora-id.v [ship.v %send-ask] [now.bol %.n])
    ::
        request-log
      (~(put ju request-log) ship.v gora-id.v)
    ==
    =^  cards  state
      (javas [%success 'request sent'])
    :_  state
    %+  welp  cards
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
    =:
        pita
      (~(put by pita) gora-id.v goz)
    ::
        request-log
      (~(del ju request-log) ship.v gora-id.v)
    ==
    =^  cards  state
      (javas [%success (cat 3 (scot %p src.bol) 'request approved')])
    :_  state
    %+  welp  cards
    :~  :*
      %give
      %fact
      ~[/updates/(scot %uv gora-id.v)]
      :-  %gora-transact-1
      !>(`transact-1`[%update %upd [~ [%initialize goz]]])
    ==  ==
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
    =:
        offer-log
      (~(del in offer-log) gora-id.v)
    ::
        pend
      (~(put bi pend) gora-id.v [host.goz %give-ack] [now.bol %.n])
    ==
    =^  cards  state
      (javas [%success (cat 3 (scot %p src.bol) ' request approved')])
    :_  state
    %+  welp  cards
    :~  :*  
      %pass   wir
      %agent  [host.goz %gora]
      %poke   %gora-transact-1
      !>(`transact-1`[%giv-ack gora-id.v])
    ==  ==
  ::
      %reject-give
    ~|  [%unrecognized-offer `@tas`(scot %uv gora-id.v)]
    ?>  (~(has in offer-log) gora-id.v)
    =+  goz=(~(got by pita) gora-id.v)
    =:
        offer-log
      (~(del in offer-log) gora-id.v)
    ::
        blacklist
      (~(put in blacklist) gora-id.v)
    ==
    =^  cards  state
      (javas [%success (cat 3 (scot %uv gora-id.v) ' give rejected')])
    :_  state
    %+  welp  cards
    :~  :*
      %pass   /updates/(scot %uv gora-id.v)
      %agent  [host.goz %gora]
      %leave  ~
    ==  ==
  ::
      %reject-request
    ~|  [%bad-request `@tas`(scot %uv gora-id.v) `@tas`(scot %p ship.v)]
    ?>  (~(has in (~(got by request-log) ship.v)) gora-id.v)
    =.  request-log
      (~(del ju request-log) ship.v gora-id.v)
    =^  cards  state
      (javas [%success (cat 3 (scot %p src.bol) 'request approved')])
    :_  state
    %+  welp  cards
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
    ~?  !(~(has by pita) gora-id.v)
      [%unrecognized-reissue (scot %uv gora-id.v)]
    =+  goz=(~(got by pita) gora-id.v)
    ~|  [%unexpected-reissue %no-reissue-permissions %or %over-max ~]
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
      =.  pend
        (~(put bi pend) gora-id.v [host.goz %proxy-it] [now.bol %.n])
      =^  cards  state
        (javas [%success (cat 3 name.goz ' reissue sent')])
      :_  state
      %+  welp  cards
      :~  :*
        %pass   wir
        %agent  [host.goz %gora]
        %poke   %gora-transact-1
        !>(`transact-1`[%update %upd [~ [%reissue gora-id.v new.v]]])
      ==  ==
    ::
    ?>  (gte u.max-hodl.goz +((lent ~(tap in hodl-list.goz))))
    =.  pend
      (~(put bi pend) gora-id.v [host.goz %proxy-it] [now.bol %.n])
    =^  cards  state
      (javas [%success (cat 3 name.goz ' reissue sent')])
    :_  state
    %+  welp  cards
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
    =^  cuz  state
      (javas [%success (cat 3 name.goz ' spam sent')])
    [(welp cards cuz) state]
  ==
--