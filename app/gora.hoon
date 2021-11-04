
/-  *gora
/+  server, default-agent, dbug, schooner
/~  goraui   webpage    /app/gora/goraui
/~  errors  webpage  /app/gora/errors
|%
+$  versioned-state
    $%  state-zero
    ==
+$  state-zero  [%0 =pita =request-log =offer-log =sent-log =blacklist]
+$  card  card:agent:gall
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
++  on-init
  ^-  (quip card _this)
  ~&  >  '%gora initialized'
  :_  this
  ~[[%pass /eyre/connect %arvo %e %connect [~ [%apps %gora ~]] dap.bowl]]
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
      %handle-http-request  (http-hndl !<([=eyre-id =inbound-request:eyre] vase))
  ==
  [cards this]
  ++  http-hndl
  |=  [=eyre-id =inbound-request:eyre]
  =*  internal  ~(. (~(got by goraui) %index) bowl +.state)
  =*  errs    ~(. (~(got by errors) %index) bowl +.state)
  =/  ,request-line:server
    (parse-request-line:server url.request.inbound-request)
  ?+  `path`site  :_  state  (response:schooner eyre-id [404 ~ [%manx (build:errs %not-found ~)]])
      [%apps %gora %public ~]
    :_  state
    (response:schooner eyre-id [404 ~ [%manx (build:errs %not-found ~)]])
      [%apps %gora ~]
    ?.  authenticated.inbound-request
      :_  state
      (response:schooner eyre-id [307 ~ [%login-redirect './apps/gora']])
    =/  page=@ta
        ?~  args  %index
        %fail
    ?.  (~(has by goraui) page)
      [(response:schooner eyre-id [404 ~ [%manx (build:errs %not-found ~)]]) state]
    ::
    ?+  method.request.inbound-request  [(response:schooner eyre-id [405 ~ [%stock ~]]) state]
        %'GET'
      :_  state
      (response:schooner eyre-id [200 ~ [%manx (build:internal %gora-index ~)]])
        %'POST'
      =+  (rash `@t`+>.body.request.inbound-request yquy:de-purl:html)
      ~&  >>  (rash `@t`+>.body.request.inbound-request yquy:de-purl:html)
      ~&  >  -<.-
      ~&  >  `@uv`+>:(rush ->:- bisk:so)
      ~?  !?=(?(%reject-give %approve-give %send-request) -<.-)
        [%unexpected-post-from-sail ~]
      ?+  -<.-  [(response:schooner eyre-id [405 ~ [%manx (build:errs %not-found ~)]]) state]
          %approve-give
        =+  [web-action=-<.- id=`@uv`+>:(rush ->.- bisk:so) gora=(~(got by pita) `@uv`+>:(rush ->.- bisk:so))]
        =.  pita  (~(put by pita) id gora(hodl-list (~(put in hodl-list.gora) our.bowl)))
        :_  state(offer-log (~(del in offer-log) id))
        %+  weld  -:(on-poke [%gora-man !>(`manage-gora`[web-action id])])
        (response:schooner eyre-id [200 ~ [%manx (build:internal %gora-index ~)]])
          %reject-give
        =+  [web-action=-<.- id=`@uv`+>:(rush ->.- bisk:so)]
        ?.  (~(has in offer-log) id)
          [(response:schooner eyre-id [200 ~ [%manx (build:internal %gora-index ~)]]) state]
        :_  state(offer-log (~(del in offer-log) id))
        %+  weld  -:(on-poke [%gora-man !>(`manage-gora`[web-action id])])
        (response:schooner eyre-id [200 ~ [%manx (build:internal %gora-index ~)]])
          %send-request
        =+  [web-action=-<.- id=`@uv`+>:(rush ->.- bisk:so) host=`@p`+>:(rush +<+.- bisk:so)]
        ?.  (~(has ju sent-log) id [host %ask])
          [(response:schooner eyre-id [200 ~ [%manx (build:internal %gora-index ~)]]) state]
        :_  state
        %+  weld  -:(on-poke [%gora-man !>(`manage-gora`[web-action id host])])
        (response:schooner eyre-id [200 ~ [%manx (build:internal %gora-index ~)]])
      ==
    ==
  ==
  --
++  on-peek  on-peek:def
++  on-watch
  |=  =path
  ^-  (quip card _this)
  ?+  path  (on-watch:def path)
      [%http-response *]
    `this
      [%updates @ *]
    ?:  !(~(has by pita) +:(slaw %uv i.t.path))  
      ~&  >>>  [%unexpected-subscription %bad-id]
      :_  this
      :~  :*  %give
          %kick
        ~[~[%updates i.t.path]]
      `src.bowl
      ==  ==
    =+  (~(got by pita) +:(slaw %uv i.t.path))
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
    ?.  !=(%gora-transact p.cage.sign)
      =^  cards  state
      (trans-hndl !<(transact q.cage.sign))
      [cards this]
    ~&  >>>  [%unexpected-mark p.cage.sign]  !!
      %kick
    ?.  (~(has by pita) +:(slaw %ud +<.wire))
      =.  pita  (~(del by pita) +:(slaw %ud +<.wire))
      `this
    ~&  >>>  [%unexpected-kick wire src.bol]  !!
  ==
++  on-leave  on-leave:def
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  ?+  sign-arvo  (on-arvo:def wire sign-arvo)
      [%eyre %bound *]
    ~?  !accepted.sign-arvo
      [dap.bowl 'eyre bind rejected!' binding.sign-arvo]
    `this
  ==
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
    ~|  [%unexpected-request %not-watching-id]
    ?<  =(~ (~(get by pita) gora-id.transaction))
    ?>  &((~(has by pita) gora-id.transaction) =(our.bol host:(~(got by pita) gora-id.transaction)))
    =.  request-log  (~(put ju request-log) src.bol gora-id.transaction)
    `state
      %receive-gora
    ~|  [%unexpected-offer %duplicate-offer-id]
    ?>  ?&
          ?!  ?&
            (~(has by pita) gora-id.gora.transaction)
            !=(our.bol host:(~(got by pita) gora-id.gora.transaction))
          ==
          !(~(has in offer-log) gora-id.gora.transaction)
          !(~(has in blacklist) gora-id.gora.transaction)
        ==
    =.  offer-log  (~(put in offer-log) gora-id.gora.transaction)
    :_  state
    :~  :*  %pass   /updates/(scot %uv gora-id.gora.transaction)/(scot %p our.bol)
            %agent  [src.bol %gora]
            %watch  /updates/(scot %uv gora-id.gora.transaction)  
    ==  ==
      %giv-ack
    ?>  &((~(has by pita) gora-id.transaction) (~(has ju sent-log) gora-id.transaction [src.bol %giv]))
    =+  (~(got by pita) gora-id.transaction)
    =.  pita  (~(put by pita) gora-id.transaction -(hodl-list (~(put in hodl-list.-) src.bol)))
    =.  sent-log  (~(del ju sent-log) gora-id.transaction [src.bol %giv])
    :_  state
    :~  :*  %give
        %fact
      ~[/updates/(scot %uv gora-id.transaction)]
    [%gora-transact !>(`transact`(transact %update %upd -(hodl-list (~(put in hodl-list.-) src.bol))))]
    ==  ==
  ==
++  manag-hndl
  |=  v=manage-gora
  |^
  ?>  (team:title our.bol src.bol)
  ?-  -.v
      %mkgora
    ~|  [%failed-gora-make name.v %identical-hash-found]
    =+  [id=(mkgora-id name.v) date=(yore now.bol)]
    ?<  (~(has by pita) id)
    ~&  >  [%gora (trip name.v) %created (scow %uv id)]
    =.  pita  (~(put by pita) id `gora`[id name.v gora-img.v our.bol [y.date m.date d.t.date] ~])
    `state
      %delgora
    ?>  (team:title src.bol our.bol)
    ?:  (team:title our.bol host:(~(got by pita) gora-id.v))
      =.  pita  (~(del by pita) gora-id.v)
      :_  state
      :~  :*  %give  %fact
        ~[/updates/(scot %uv gora-id.v)]
      [%gora-transact !>((transact %update %del -))]
      ==  ==
    =/  host  host:(~(got by pita) gora-id.v)
    =.  pita  (~(del by pita) gora-id.v)
    :_  state
    :~  :*  %pass   /updates/(scot %uv gora-id.v)/(scot %p our.bol)
            %agent  [host %gora]
            %leave  ~
    ==  ==
      %send-give
    ?<  &((~(has ju sent-log) gora-id.v [ship.v %giv]) !(~(has by pita) gora-id.v))
    =.  sent-log  (~(put ju sent-log) gora-id.v [ship.v %giv])
    :_  state
    :~  :*  %pass   /transact/send-giv/(scot %uv gora-id.v)/(scot %p our.bol)/(scot %da now.bol)
            %agent  [ship.v %gora]
            %poke   %gora-transact  !>((transact %receive-gora (~(got by pita) gora-id.v)))
    ==  ==
      %send-request
    ?<  (~(has ju sent-log) gora-id.v [ship.v %ask])
    =.  sent-log  (~(put ju sent-log) gora-id.v [ship.v %ask])
    :_  state
    :~  :*  %pass   /transact/send-req/(scot %uv gora-id.v)/(scot %p our.bol)/(scot %da now.bol)
            %agent  [ship.v %gora]
            %poke   %gora-transact  !>((transact %receive-request gora-id.v))
        ==
        :*  %pass   /updates/(scot %uv gora-id.v)/(scot %p our.bol)
            %agent  [ship.v %gora]
            %watch  /updates/(scot %uv gora-id.v)  
    ==  ==
      %approve-request
    ?>  &((~(has ju request-log) ship.v gora-id.v) (~(has by pita) gora-id.v))
    =.  request-log  (~(del ju request-log) ship.v gora-id.v)
    =/  act-gora=gora  (~(got by pita) gora-id.v)
    =.  pita  (~(put by pita) gora-id.v act-gora(hodl-list (~(put in hodl-list.act-gora) ship.v)))
    :_  state
    :~  :*  %give
        %fact
      ~[/updates/(scot %uv gora-id.v)]
    [%gora-transact !>((transact %update %upd act-gora(hodl-list (~(put in hodl-list.act-gora) ship.v))))]
    ==  ==
      %approve-give
    ?.  (~(has in offer-log) gora-id.v)
        ~&  >>>  [%unrecognized-offer (scot %uv gora-id.v)]
        `state
    =.  offer-log  (~(del in offer-log) gora-id.v)
    =+  (~(got by pita) gora-id.v)
    :_  state
    :~  :*  %pass   /transact/give-ack/(scot %uv gora-id.v)/(scot %p host.-)/(scot %da now.bol)
            %agent  [host.- %gora]
            %poke   %gora-transact  !>((transact %giv-ack gora-id.v))
    ==  ==
      %reject-give
    ?.  (~(has in offer-log) gora-id.v)
        ~&  >>>  [%unrecognized-offer (scot %uv gora-id.v)]
        `state
    =.  offer-log  (~(del in offer-log) gora-id.v)
    =.  blacklist  (~(put in blacklist) gora-id.v)
    =+  (~(got by pita) gora-id.v)
    :_  state
    :~  :*  %pass   /updates/(scot %uv gora-id.v)
            %agent  [host %gora]
            %leave  ~
    ==  ==
      %reject-request
    ?>  (~(has in (~(got by request-log) ship.v)) gora-id.v)
    =.  request-log  (~(del ju request-log) ship.v gora-id.v)
    :_  state
    :~  :*
        %give  %kick
        ~[/updates/(scot %uv gora-id.v)]
        `ship.v
    ==  ==
  ==
  ++  mkgora-id
    |=  in=@t
    (sham our.bol now.bol in)
  --
--