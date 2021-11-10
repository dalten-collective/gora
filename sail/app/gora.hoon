::
::  %gora - by ~dalten Collective (sail version)
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
::     [%reject-give 0vid.g032h.34300]               -Decline an incoming gora gift
::     [%approve-give 0vid.g032h.34300]              -Approve an incoming gora gift
::     [%reject-request 0vid.g032h.34300 ~dev]       -Deny an incoming gora request
::     [%send-request 0vid.g032h.34300 ~dalten]      -Request a gora from a host
::     [%approve-request 0vid.g032h.34300 ~dev]      -Approve an incoming gora request
::     [%send-give 0vid.g032h.34300 ~sampel-palnet]  -Send a gora to a recipient
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
::  Currently outstanding technical debt/improvment roadmap:
::   - Implement all/most &gora-man pokes as front-end functions
::   - Tighten business logic to avoid need for %clean-log
::   - State upgrades and new features (join the support channel to hear more)
::   - Await decrement
::
/-  *gora
/+  server, default-agent, dbug, schooner
::
/~  main    webpage  /app/gora/goraui
/~  errors  webpage  /app/gora/errors
::
|%
+$  versioned-state
    $%  state-zero
    ==
    ::
+$  state-zero  
    $:  %0            =pita
        =request-log  =offer-log
        =sent-log     =blacklist
    ==
    ::
+$  card     card:agent:gall
+$  eyre-id  @ta
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
::
++  on-init
  ^-  (quip card _this)
  ~&  >>>  [%gora %start %sail]
  =+  [[~ [%apps %gora ~]] dap.bowl]
  :_  this
  [%pass /eyre/connect %arvo %e %connect -]~
::
++  on-save
  ^-  vase
  !>(state)
::
++  on-load
  |=  ole=vase
  ^-  (quip card _this)
  ~&  >>  [%gora %reload %sail]
  =/  old  !<(versioned-state ole)
  ?-  -.old
    %0
  =+  [[~ [%apps %gora ~]] dap.bowl]
  :_  this(state old)
  [%pass /eyre/connect %arvo %e %connect -]~
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
        %handle-http-request
      %-  http-handle:hc
      !<([=eyre-id =inbound-request:eyre] vase)
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
          [%gora-transact !>(`transact`[%update %upd -])]
    ==  ==
    ::
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
  ?+  -.sign  (on-agent:def wire sign)
      %fact
    ?.  !=(%gora-transact p.cage.sign)
      =^  cards  state
        (transact-handle:hc !<(transact q.cage.sign))
      [cards this]
      ::
    ~&  >>>  [%unexpected-mark p.cage.sign]  !!
    ::
      %kick
    ?.  (~(has by pita) (slav %ud +<.wire))
      =.  pita  (~(del by pita) (slav %ud +<.wire))
      ?~  (~(get ju sent-log) (slav %ud +<.wire))
        `this
      =.  sent-log
        %+  ~(del ju sent-log)  (slav %ud +<.wire)
        [src.bol %ask]
      `this
      ::
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
++  on-fail   on-fail:def
--
::
|_  bol=bowl:gall
++  mkgora-id
  |=  in=@t
  (sham our.bol now.bol in)
::
++  transact-handle
  |=  transaction=transact
  ^-  (quip card _state)
  =,  transaction
  ?-  -.+<
      %proxy-approve
    ~|  [%unexpected-proxy-attempt ~]
    ?>  ?&
          (~(has by pita) gora-id)
          (team:title src.bol our.bol)
        ==
    ?>  =(our.bol host:(~(got by pita) gora-id))
    ::
    =+  (~(got by pita) gora-id)
    =.  pita
      %+  ~(put by pita)  gora-id
    -(hodl-list (~(put in hodl-list) ship))
    :_  state
    :~  :*
          %give
          %fact
          ~[/updates/(scot %uv gora-id)]
          :-  %gora-transact
          !>(`transact`[%update %upd -])
    ==  ==

      %receive-request
    ~|  [%unexpected-request %not-watching-id]
    ?>  ?&  
          (~(has by pita) gora-id)
          ::
          =(our.bol host:(~(got by pita) gora-id))
        ==
    ?.  %-  ~(has in hodl-list:(~(got by pita) gora-id))
        src.bol 
      =.  request-log
        (~(put ju request-log) src.bol gora-id)
      `state
    =+  (~(got by pita) gora-id)
    :_  state
    :~  :*
          %give
          %fact
          ~[/updates/(scot %uv gora-id)]
          :-  %gora-transact
          !>(`transact`[%update %upd -])
    ==  ==
    ::
      %receive-gora
    ~|  [%unexpected-offer %duplicate-offer-id]
    ?>  ?&
          !(~(has in offer-log) gora-id.gora)
          ::
          !(~(has in blacklist) gora-id.gora)
        ==
    =;  [caz=(list card:agent:gall) saz=_state]
      ?:  ?&  
            (~(has by pita) gora-id.gora)
            ::
            %+  team:title
                (sein:title our.bol now.bol host.gora)
                host.gora
          ==
        [caz saz]
    :-  caz
    %=  saz
      offer-log  (~(put in offer-log) gora-id.gora)
    ==
    ::
    :_  state
    :~  :*  
          %pass   /updates/(scot %uv gora-id.gora)/(scot %p our.bol)
          %agent  [src.bol %gora]
          %watch  /updates/(scot %uv gora-id.gora)
    ==  ==
    ::
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
    ::
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
      ?:  %+  ~(has ju sent-log)
              gora-id.gora
              [src.bol %ask]
        =.  sent-log
        (~(del ju sent-log) gora-id.gora [src.bol %ask])
        `state
      `state
      ::
    ==
    ::
  ==
::
++  http-handle
  |=  [=eyre-id =inbound-request:eyre]
  =/  send
    (cury response:schooner eyre-id)
  ~&  >>  inbound-request
  ^-  (quip card _state)
  =*  intern  ~(. (~(got by main) %index) bol +.state)
  =*  reject  ~(. (~(got by errors) %index) bol +.state)
  ::=*  public  ~(. (~(got by public) %index) bol some-state)
  ::
  =/  ,request-line:server
    %-  parse-request-line:server
  url.request.inbound-request
  ::
  |^
  ?+  site
    :_  state
    (send [404 ~ [%manx (build:reject %not-found ~)]])
    ::
    ::  [%apps %gora %public ~]
    :::_  state
    ::(send [404 ~ [%stock ~]])
    ::
      [%apps %gora %wuttis ~]
    ?.  authenticated.inbound-request
      :_  state
      (send [307 ~ [%login-redirect './apps/gora/wuttis']])
      ::
    ?+  method.request.inbound-request
      [(send [405 ~ [%stock ~]]) state]
      ::
        %'GET'
      :_  state
      %-  send
      [200 ~ [%manx (build:intern %wuttar-gorae ~)]]
    ==
    ::
      [%apps %gora ~]
    call-gora-index
      [%apps %gora %$ ~]
    call-gora-index
  ==
  ++  call-gora-index
    ?.  authenticated.inbound-request
      :_  state
      (send [307 ~ [%login-redirect './apps/gora']])
      ::
    ?+  method.request.inbound-request  
      [(send [405 ~ [%stock ~]]) state]
      ::
        %'GET'
      :_  state
      %-  send
      [200 ~ [%manx (build:intern %gora-index ~)]]
      ::
        %'POST'
      =+  %+  rash
       `@t`+>.body.request.inbound-request
      yquy:de-purl:html
      ?+  -<.-
        :_  state
        %-  send
        [405 ~ [%manx (build:reject %not-found ~)]]
        ::
          %approve-give
        =+  :+  web-action=-<.- 
          id=`@uv`+:(rash ->.- bisk:so)
        gora=(~(got by pita) `@uv`+:(rash ->.- bisk:so))
        ?:  !(~(has in offer-log) id)
          ~&  >>>  [%unrecognized-id id %offer-log]
          :_  state
          =+  
          :~
            'id'^(scot %uv id)
            'failed-action'^web-action
            'method'^method.request.inbound-request
          ==
          %-  send  
          [405 ~ [%manx (build:reject %bad-method -)]] 
        :_  state
        %+  welp
          %-  send
          =+  (~(got by pita) id)
          =.  -  
            -(hodl-list (~(put in hodl-list.-) our.bol))
          =.  state  %=  state
                      offer-log  (~(del in offer-log) id)
                      pita       (~(put by pita) id -)
                     ==
          [200 ~ [%manx (build:intern %gora-index ~)]]
        :~  :*
              %pass   /approve-give/(scot %uv id)/(scot %da now.bol)
              %agent  [our.bol %gora]
              %poke   %gora-man  !>(`manage-gora`[web-action id])
        ==  ==
        ::
          %reject-give
        =+  :-  web-action=-<.-
            id=`@uv`+:(rash ->.- bisk:so)
        ?.  (~(has in offer-log) id)
          =+  
          :~
            'id'^(scot %uv id)
            'failed-action'^web-action
            'method'^method.request.inbound-request
          ==
          :_  state
          %-  send
          [405 ~ [%manx (build:reject %bad-method -)]]
          ::
        :_  state
        %+  welp
          %-  send
          =.  state
            state(offer-log (~(del in offer-log) id))
          [200 ~ [%manx (build:intern %gora-index ~)]]
        :~  :*
              %pass   /reject-give/(scot %uv id)/(scot %p our.bol)/(scot %da now.bol)
              %agent  [our.bol %gora]
              %poke   %gora-man  !>(`manage-gora`[web-action id])
        ==  ==
        ::
          %send-request
        =+
          :+  web-action=-<.-
              id=`@uv`+:(rash ->.- bisk:so)
              host=`@p`+:(rash +<+.- bisk:so)
        ?.  (~(has ju sent-log) id [host %ask])
          :_  state
          %-  send
          [200 ~ [%manx (build:intern %gora-index ~)]]
          ::
        :_  state
        %+  welp
          %-  send
          [200 ~ [%manx (build:intern %gora-index ~)]]
        :~  :*
              %pass   /send-request/(scot %uv id)/(scot %p our.bol)/(scot %da now.bol)
              %agent  [our.bol %gora]
              %poke   %gora-man  !>(`manage-gora`[web-action id host])
        ==  ==
        ::
      ==
    ==
  --
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
    =;  [caz=(list card) saz=_state]
    ?:  %-
      ~(has in hodl-list:(~(got by pita) gora-id.v))
      ship.v
      [caz saz]
    =.  sent-log.saz
      (~(put ju sent-log.saz) gora-id.v [ship.v %giv])
    [caz saz]
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
    =+  host:(~(got by pita) gora-id.v)
    ?>  ?&
            (~(has ju request-log) ship.v gora-id.v)
            (~(has by pita) gora-id.v)
            (team:title our.bol -)
        ==
    ?.  =(our.bol -)
      =.  request-log
        (~(del ju request-log) ship.v gora-id.v)
      :_  state
      :~  :*
            %pass   /transact/proxy-approve/(scot %uv gora-id.v)/(scot %p our.bol)/(scot %da now.bol)
            %agent  [- %gora]
            %poke   %gora-transact  !>(`transact`[%proxy-approve gora-id.v ship.v])
      ==  ==
    =.  request-log
      (~(del ju request-log) ship.v gora-id.v)
    =+  (~(got by pita) gora-id.v)
    =.  -  
      %=  -
        hodl-list  (~(put in hodl-list) ship.v)
      ==
    =.  pita  (~(put by pita) gora-id.v -)
    :_  state
    :~  :*
          %give
          %fact
          ~[/updates/(scot %uv gora-id.v)]
          :-  %gora-transact
          !>(`transact`[%update %upd -])
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
      ::
        %sent-log
      =,  log.v
      :-  ~
      %=  state
          sent-log
        (~(del ju sent-log) gora-id [ship act])
      ==
      ::
    ==
  ==
--