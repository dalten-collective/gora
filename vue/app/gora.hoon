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
/-  *gora
/+  *server, default-agent, dbug
::
|%
+$  versioned-state
    $%  state-one
        state-zero
    ==
::
+$  state-one
  $:  %1            =usps-mode
      =pita         =my-public
      =request-log  =offer-log
      =sent-log     =blacklist
      =tag-set      =tag-store
  ==
::
+$  state-zero
  $:  %0            pita-zero=(map gora-id gora-zero)
      =request-log  =offer-log
      =sent-log     =blacklist
  ==
+$  gora-zero
  $:  =gora-id     name=@t
      =gora-img    host=ship
      =issue-date  =hodl-list
  ==
::
+$  card     card:agent:gall
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
  `this
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
      [%pass /eyre/connect %arvo %e %disconnect `[%apps %gora ~]]~
  |-
  ?-    -.old
      %1
    :_  this(state old)
    caz
  ::
      %0
    %=    $
        old
      :*
        %1
        %.y
        (~(run by pita-zero.old) structure-gora)
        ~
        request-log.old
        offer-log.old
        ~
        blacklist.old
        ~
        ~
      ==
    ::
        caz
      %+  welp  caz
      :~  :*
        %pass   /init-sub/(scot %p our.bowl)/(scot %da now.bowl)
        %agent  [our.bowl %gora]
        %poke   %gora-man-1  !>(`manage-gora-1`[%resubscribe-all ~])
      ==  ==
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
    ==
  [cards this]
::
++  on-watch
  |=  =path
  ^-  (quip card _this)
  ?+  path  (on-watch:def path)
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
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card _this)
  ?+  -.sign  (on-agent:def wire sign)
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
    ~&  >>>  [%watch-nack (slav %uv +<.wire) %bummer]
    =+  (slav %uv +<.wire)
    :-  ~
    %=  this
      sent-log   (~(del ju sent-log) - [src.bol %ask])
      offer-log  (~(del in offer-log) -)
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
++  on-arvo  on-arvo:def
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
          r=(~(rep by sent-log) pending-requests)
  %-  pairs:enjs:format
  :~  ['ownd' `json`a/(~(rep by out.p) hedl)]
      ['offd' `json`a/(~(rep by q) hedl)]
      ['pend' `json`a/r]
  ==
  ::
  ++  hedl
    |=  [[key=@ goz=gora] out=(list json)]
    :-  %-  pairs:enjs:format
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
    ?>  ?&  
          !=(request-behavior.goz %reject)
          (~(has ju sent-log) gora-id [src.bol %giv])
          ::
          ?~  max-hodl.goz
            %.y
          %+  gte
              u.max-hodl.goz
              +((lent ~(tap in hodl-list.goz)))
        ==
    =?  goz
      ?~  max-hodl.goz
        %.n
      =(u.max-hodl.goz +((lent ~(tap in hodl-list.goz))))
    goz(request-behavior %reject)
    =.  goz  
      goz(hodl-list (~(put in hodl-list.goz) src.bol))
    =:
        pita
      (~(put by pita) gora-id.goz goz)
    ::
        sent-log
      (~(del ju sent-log) gora-id.goz (sy [src.bol %giv]~))
    ==
    :_  state
    :~  :*  
          %give
          %fact
          ~[/updates/(scot %uv gora-id.goz)]
          :-  %gora-transact-1
          !>  ^-  transact-1
          [%update %upd [~ [%new-hodlr src.bol]]]
    ==  ==
  ::
      %receive-request
    ~|  [%unexpected-request-received %invalid-id]
    =+  (~(got by pita) gora-id)
    ?>  ?&  
          =(our.bol host:(~(got by pita) gora-id))
          ?|
            ?~  max-hodl.-
              %.y
            (gte u.max-hodl.- +((lent ~(tap in hodl-list.-))))
          ::
            (~(has in hodl-list.-) src.bol)
          ==
        ==
    ?:  (~(has in hodl-list.-) src.bol)
      :_  state
      :~  :*
            %give
            %fact
            ~[/updates/(scot %uv gora-id)]
            :-  %gora-transact-1
            !>(`transact-1`[%update %upd [~ [%initialize -]]])
      ==  ==
    ::
    ?-    request-behavior.-
        %approve
      =/  goz=gora  -
      =?  goz
        ^-  ?
        ?~  max-hodl.goz
          %.y
        %+  gte
          u.max-hodl.goz
        +((lent ~(tap in hodl-list.goz)))
      %=  goz
        request-behavior  %reject
        hodl-list         (~(put in hodl-list) src.bol)
      ==
      =.  pita
        (~(put by pita) gora-id goz)
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
        ?~  max-hodl.-
          %.y
        (gte u.max-hodl.- +((lent ~(tap in hodl-list.-))))
        =.  pita
          (~(put by pita) gora-id -(request-behavior %reject))
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
      ?~  pat
        !!
      =/  id=@uv  (slav %uv +<.u.pat)
      ?>  =(src.bol host:(~(got by pita) id))
      =:
          sent-log
        (~(del ju sent-log) id [src.bol %ask])
      ::
          offer-log
        (~(del in offer-log) id)
      ==
      :_  state
      :~  :*  
            %pass   /updates/(scot %uv id)/(scot %p our.bol)
            %agent  [src.bol %gora]
            %leave  ~
          ==
          :*
            %give  %kick
            ~[/updates/(scot %uv id)]
            ~
      ==  ==
    ::
        %upd
      ?~  jot.transaction
        !!
      ?-    -.u.jot.transaction
          %update-image
        ~&  >>  [%not-implemented %sorry ~]
        `state
      ::
          %host-public
        ?<  ?=(~ pat)
        =+  (~(got by pita) (slav %uv +<.u.pat))
        =?  my-public
          !pub.u.jot.transaction
        (~(del in my-public) gora-id.-)
        =.  -
          -(host-public pub.u.jot.transaction)
        `state
      ::
          %new-hodlr
        ?~  pat
          ~|  [%unexpected-update %new-hodlr ~]
          !!
        =+  goz=(~(got by pita) (slav %uv +<.u.pat))
        =.  hodl-list.goz
          (~(put in hodl-list.goz) ship.u.jot.transaction)
        =?  sent-log
            ?&  (~(has in hodl-list.goz) our.bol)
                (~(has ju sent-log) gora-id.goz [src.bol %ask])
            ==
          (~(del ju sent-log) gora-id.goz [src.bol %ask])
        =.  pita
          (~(put by pita) gora-id.goz goz)
        `state
      ::
          %initialize
        =,  gora.u.jot.transaction
        =.  pita
          (~(put by pita) gora-id gora.u.jot.transaction)
        ?.  (~(has in hodl-list) our.bol)  
          `state
        =?  sent-log
            (~(has ju sent-log) gora-id [src.bol %ask])
          (~(del ju sent-log) gora-id [src.bol %ask])
        `state
      ::
          %reissue
        |^  ^-  (quip card _state)
        ~&  [transaction pat]
        =+  goz=(~(got by pita) id.u.jot.transaction)
        ?>  ?&  =(our.bol host.goz)
                =(%reissue give-permissions.goz)
                (~(has in hodl-list.goz) src.bol)
            ==
        =+  :-  caz=*(list card)
            nez=`(list ship)`~(tap in new.u.jot.transaction)
        =^  cards  sent-log
        |-  
        ?~  nez
          [caz sent-log]
        %=    $
          nez  t.nez
        ::
            sent-log
          (~(put ju sent-log) gora-id.goz [i.nez %giv])
        ::
            caz
          %+  welp  caz
          :~  :*
            %pass  /transact/send-giv/(scot %uv gora-id.goz)/(scot %p our.bol)/(scot %da now.bol)
            %agent  [i.nez %gora]
            %poke  %gora-transact-1  !>(`transact-1`[%receive-gora gora-id.goz give-permissions.goz])
          ==  ==
        ==
        [cards state]
        --
      ==
    ==
  ==
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
    =+  (~(got by pita) gora-id.v)
    ?>  =(our.bol host.-)
    =.  pita
      (~(put by pita) gora-id.v -(host-public public.v))
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
    =?  tag-set
      !(~(has in tag-set) tag.v)
    (~(put in tag-set) tag.v)
    =/  tag-me=(list @uv)  ~(tap in gorae.v)
    |-
    ?~  tag-me
      `state
    %=  $
      tag-me     t.tag-me
      tag-store  (~(put ju tag-store) tag.v i.tag-me)
    ==
  ::
      %mkgora
    ~|  [%failed-gora-make name.v %identical-hash]
    =+  [id=(mkgora-id name.v gora-img.v max.v req.v giv.v ~ our.bol) date=(yore now.bol)]
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
    ~|  [%unexpected-give %check-sent-log %check-max ~]
    =/  my-ships=(list ship)  ~(tap in new.v)
    =+  [caz=*(list card:agent:gall) goz=(~(got by pita) gora-id.v)]
    ?>  ?~(max-hodl.goz %.y (gte u.max-hodl.goz (lent ~(tap in (~(uni in hodl-list.goz) new.v)))))
    |-
    ?~  my-ships
      [caz state]
    ?>  !(~(has ju sent-log) gora-id.v [i.my-ships %giv])
    =?  sent-log
      !(~(has in hodl-list:(~(got by pita) gora-id.v)) i.my-ships)
    (~(put ju sent-log) gora-id.v [i.my-ships %giv])
    %=    $
        caz
      %+  welp  caz
      :~  :*
        %pass   /transact/send-giv/(scot %uv gora-id.v)/(scot %p our.bol)/(scot %da now.bol)
        %agent  [i.my-ships %gora]
        %poke   %gora-transact-1  !>(`transact-1`[%receive-gora gora-id.v give-permissions.goz])
      ==  ==
    ::
        my-ships
      t.my-ships
    ==
  ::
      %send-request
    ?>  !(~(has ju sent-log) gora-id.v [ship.v %ask])
    =.  sent-log
      (~(put ju sent-log) gora-id.v [ship.v %ask])
    :_  state
    :~  :* 
          %pass   /transact/send-req/(scot %uv gora-id.v)/(scot %p our.bol)/(scot %da now.bol)
          %agent  [ship.v %gora]
          %poke   %gora-transact-1  !>(`transact-1`[%receive-request gora-id.v])
        ==
        :*
          %pass   /updates/(scot %uv gora-id.v)/(scot %p our.bol)
          %agent  [ship.v %gora]
          %watch  /updates/(scot %uv gora-id.v)  
    ==  ==
  ::
      %approve-request
    ~|  [%bad-request (scot %uv gora-id.v) (scot %p ship.v)]
    =+  (~(got by pita) gora-id.v)
    ?>  ?&
            (~(has ju request-log) ship.v gora-id.v)
            =(our.bol host.-)
            ?~(max-hodl.- %.y (gte u.max-hodl.- +((lent ~(tap in hodl-list.-)))))
        ==
    =?  -
      ?~(max-hodl.- %.n =(u.max-hodl.- +((lent ~(tap in hodl-list)))))
    -(request-behavior %reject)
    =.  -  -(hodl-list (~(put in hodl-list) src.bol))
    =:
        pita
      (~(put by pita) gora-id.v -)
    ::
        request-log
      (~(del ju request-log) ship.v gora-id.v)
    ==
    :_  state
    :~  :*
          %give
          %fact
          ~[/updates/(scot %uv gora-id.v)]
          :-  %gora-transact-1
          !>(`transact-1`[%update %upd [~ [%initialize -]]])
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
            %poke   %gora-transact-1  !>(`transact-1`[%giv-ack gora-id.v])
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
    ::
        %sent-log
      =,  log.v
      :-  ~
      %=  state
          sent-log
        (~(del ju sent-log) gora-id [ship act])
      ==
    ==
  ::
      %send-reissue
    =+  (~(got by pita) gora-id.v)
    ~|  [%unexpected-reissue %no-reissue-permissions ~]
    ?>  =(%reissue give-permissions.-)
    ?~  max-hodl.-
      :_  state
      :~  :*
            %pass   /transact/reissue/(scot %uv gora-id.v)/(scot %p host.-)/(scot %da now.bol)
            %agent  [host.- %gora]
            %poke   %gora-transact-1  !>(`transact-1`[%update %upd [~ [%reissue gora-id.v new.v]]])
      ==  ==
    ::
    ~|  [%unexpected-reissue %over-max ~]
    ?>  (gte u.max-hodl.- +((lent ~(tap in hodl-list.-))))
    :_  state
    :~  :*
          %pass   /transact/reissue/(scot %uv gora-id.v)/(scot %p host.-)/(scot %da now.bol)
          %agent  [host.- %gora]
          %poke   %gora-transact-1  !>(`transact-1`[%update %upd [~ [%reissue gora-id.v new.v]]])
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
            nez=`(list ship)`~(tap in new.v)
            dez=(yore now.bol)
    :_  %=    state
            pita
          %+  ~(put by pita)
            gora-id.v
          goz(hodl-list (~(uni in hodl-list) new.v))
        ==
    |-
    ?~  nez
      caz
    =+  ^-  gora
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
    %=  $
      nez  t.nez
    ::
        caz  
      %+  welp  caz
      :~  :*
        %pass  /transact/send-giv/(scot %uv gora-id)/(scot %p our.bol)/(scot %da now.bol)
        %agent  [i.nez %gora]
        %poke  %gora-transact-1  !>(`transact-1`[%receive-transfer -])
      ==  ==
    ==
  ==
--