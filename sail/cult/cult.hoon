::  cult - make a murder cult, the easy way.
::  by quartus
::
::  v.0.1.0
::
::  cult's state is called cargo.
::
::  rituals are for those with elaborate rites
::  for a cut and dry cult use %cult-easy mark
::
::    using cult:
::  1.  copy /cult/lib, ../sur to your desk's /lib, /sur
::  2.  import cult in agent with `/=  cult  /cult/cult`
::  3.  expect a subscription on `/~/cult` in your agent
::  4.  call cult `%-  (agent:cult ~ ~)` as default case
::    -  alternatively, call agent:cult with a club babe
::  5.  emit a cage `[%cult-easy !>(easy)]` on `/~/cult`
::    -  alternatively, use native facts that babe knows
::  6.  user adds to `clique` with `cult-dead` mark poke
::    -  alternatively, see our /cult/mar/cult/dead.hoon
::  7.  cult handles the rest, making or modifying group
::
::  need help? join ~mister-hilper-dozzod-dalten/quartus
::
/-  gup=groups
/+  verb
::
|%
::
::    cargo objects
::  $clique - maps key to cult
::  $ritual - elaborage change
::  $relics - for failed cages
::
+$  clique  (map * term)
+$  ritual  (map mark $-(vase (unit easy)))
+$  relics  (map @da cage)
+$  augury  (unit $-(* json))
::
::    $cow - cult-dead mark
::  [%del *]       ::  removes a key from clique
::  [%add * term]  ::  correlates noun with term
::
::    $skull - $cows subset
::  [%kik @da]     ::  reprocess relic, maybe new ritual
::  [%kil @da]     ::  remove one relic from the chamber
::
+$  cow
  $%  [%del *]
      [%add * term]
      skull
  ==
::
+$  skull
  $%  [%kik @da]
      [%kil @da]
  ==
::
::    $easy - use cult-easy
::  $diff - how to treat em
::
+$  easy  [* diff]       ::  the key! induct them
::
+$  diff
  $%  [%put (set ship)]  ::  induct new initiates
      [%pak (set ship)]  ::  only these initiates
      [%pop (set ship)]  ::  excommunication now!
  ==
::
::  +agent:cult - what's he up to? he looks weird
::
++  agent
  |=  $:  club=clique    ::  just a social club
          babe=ritual    ::  a babe-lon working
          crow=augury    ::  divine divinations
      ==
  ^-  $-(agent:gall agent:gall)
  |^  agent
  ::
  +$  card     card:agent:gall
  +$  cargo-0  [%0 =clique =ritual =relics]
  ::
  ++  agent
    |=  inner=agent:gall
    =|  cargo-0
    =*  cargo  -
    %+  verb  |
    ^-  agent:gall
    |_  dish=bowl:gall
    +*  this  .
        ho    ~(. helps dish cargo)
        og    ~(. inner dish)
        now   (scot %da now.dish)
        our   (scot %p our.dish)
    ::
    ++  on-peek
      |=  =path
      ^-  (unit (unit cage))
      ::  ~>  %bout.[0 '%cult +on-peek']
      ?:  =(/x/~/cult/state path)
        ``noun+!>(cargo)
      (on-peek:og path)
    ++  on-arvo
      |=  [wire sign-arvo]
      ^-  (quip card _this)
      ::  ~>  %bout.[0 '%cult +on-arvo']
      =^  cards  inner  (on-arvo:og +<)
      [cards this]
    ++  on-fail
      |=  [term tang]
      ^-  (quip card _this)
      =^  cards  inner  (on-fail:og +<)
      [cards this]
    ++  on-leave
      |=  path
      ^-  (quip card _this)
      =^  cards  inner  (on-leave:og +<)
      [cards this]
    ::
    ++  on-watch
      |=  path
      ^-  (quip card _this)
      ?:  ?=([%~.~ %augury ~] +<)
        ?~  crow  `this
        [~(all omen:ho u.crow) this]
      =^  cards  inner  (on-watch:og +<)
      [cards this]
    ::
    ++  on-init
      ::  ~>  %bout.[0 '%cult +on-init']
      ^-  (quip card _this)
      =.  clique  (~(uni by clique) club)
      =.  ritual  (~(uni by ritual) babe)
      =^  cards   inner  on-init:og
      [[hear:ho cards] this]
    ++  on-save  !>([[%cult cargo] on-save:og])
    ++  on-load
      |=  ole=vase
      ::  ~>  %bout.[0 '%cult +on-load']
      ^-  (quip card _this)
      ?.  ?=([[%cult *] *] q.ole)
        =.  clique  club
        =.  ritual  babe
        =^  cards   inner  (on-load:og ole)
        [[hear:ho cards] this]
      =+  !<([[%cult old=cargo-0] oil=vase] ole)
      =.  cargo   old
      =.  ritual  babe
      =^  cards   inner  (on-load:og oil)
      [[hear:ho cards] this]
    ++  on-agent
      |=  [wir=wire sig=sign:agent:gall]
      ?.  ?=([%~.~ %cthulhu ~] wir)
        =^  cards  inner  (on-agent:og wir sig)
        [cards this]
      ?-    -.sig
          %watch-ack
        [?~(p.sig ~ [hear:ho]~) this]
      ::
          %poke-ack
        ~&  >>  [cult+dap.dish %unexpected-poke-ack wir]
        `this
      ::
          %kick
        [[hear:ho]~ this]
      ::
          %fact
        =^  cards  cargo
          (go-easy:go:ho cage.sig)
        [cards this]
      ==
    ::
    ++  on-poke
      |=  [=mark =vase]
      ::  ~>  %bout.[0 '%cult +on-poke']
      ?.  ?=(%cult-dead mark)
        =^  cards  inner
          (on-poke:og mark vase)
        [cards this]
      =/  calf=cow  !<(cow vase)
      ?-    -.calf
          %del
        ~&  [%cult-remove +.calf]
        :_  this(clique (~(del by clique) +.calf))
        ?~(crow ~ (~(del omen:ho u.crow) +.calf))
      ::
          %add
        ~&  [%cult-form +>.calf %for +<.calf]
        :_  this(clique (~(put by clique) +.calf))
        ?~(crow ~ (~(add omen:ho u.crow) +.calf))
      ::
          %kik  `this  ::  TODO: make functional
          %kil  `this  ::  TODO: make functional
      ==
    --
  ::
  ++  helps
    |_  [dish=bowl:gall cargo=cargo-0]
    +*  dis  .
    ++  hear
      ^-  card
      =-  [%pass /~/cthulhu %agent -]
      [[our.dish dap.dish] [%watch /~/cult]]
    ++  omen
      =,  enjs:format
      |_  lock=$-(* json)
      ++  del
        |=  key=*
        =-  [%give %fact [/~/augury]~ json+!>(-)]~
        (frond del+(frond key+(lock key)))
      ++  add
        |=  [key=* vault=@tas]
        =-  [%give %fact [/~/augury]~ json+!>(-)]~
        %+  frond  %add
        %-  pairs
        ~[key+(lock key) vault+s/(scot %tas vault)]
      ++  all
      =-  [%give %fact [/~/augury]~ json+!>(-)]~
      %+  frond  %set
      :-  %a
      %+  turn  ~(tap by clique.cargo)
      |=  [kex=* vault=term]
      %-  pairs
      ~[key+(lock kex) vault+s/(scot %tas vault)]
      --
    ::       +go - roll ur own cults
    ::
    ::  +go-emit - add card to cards
    ::  +go-emil - add list of cards
    ::  +go-abet - and state changes
    ::  +go-dick - inspect the group
    ::  +go-form - maybe form a cult
    ::  +go-diff - handle easy diffs
    ::  +go-easy - start cult engine
    ::
    ++  go
      |_  $:  =flag:gup
              real=?
              door=(unit cordon:gup)
              team=(set ship)
              cord=[pend=(set ship) act=(set ship)]
              cards=(list card)
          ==
      +*  now  (scot %da now.dish)
          our  (scot %p our.dish)
          go   .
      ::
      ++  go-emit  |=(=card go(cards [card cards]))
      ++  go-emil
        |=(lac=(list card) go(cards (welp lac cards)))
      ++  go-abet
        ^-  (quip card _cargo)
        [(flop cards) cargo]
      ::
      ++  go-easy
        |=  egg=cage
        ^-  (quip card _cargo)
        |^
        ?:  ?=(%cult-easy p.egg)
          =+  ease=!<(easy q.egg)
          (over ease)
        ?~  fix=(~(get by ritual.cargo) p.egg)
          =.  relics.cargo
            (~(put by relics.cargo) now.dish egg)
          go-abet
        =+  hard=`(unit easy)`(u.fix q.egg)
        ?~  hard  go-abet
        (over u.hard)
        ::
        ++  over
          |=  ease=easy
          ?~  turn=(~(get by clique.cargo) -.ease)
            go-abet
          =~
            :-  ease=`_ease`ease
            =~  go(flag [our.dish u.turn])
                go-dick
                go-form
            ==
            (go-diff +.ease)
            go-abet
          ==
        --
      ::
      ++  go-dick
        ^+  go
        =/  gups=groups:gup
          .^(groups:gup %gx /[our]/groups/[now]/groups/noun)
        ?~  gup=(~(get by gups) flag)
          go(real %.n, door ~)
        ~|  [%bad-group-state flag cordon.u.gup]
        ?>  ?=(%shut -.cordon.u.gup)
        %=    go
          real  %.y
          door  `cordon.u.gup
        ::
            team
          (~(del in ~(key by fleet.u.gup)) our.dish)
        ::
            cord
          [pend.cordon.u.gup ask.cordon.u.gup]
        ==
      ::
      ++  go-form
        ^+  go
        ?:  real  go
        =;  cag=cage
          %-  go-emit
          [%pass /gnosis/[now] %agent [our.dish %groups] %poke cag]
        :-  %group-create
        !>  ^-  create:gup
        :*  q.flag
            'a cult'
            'keep it secret, sorta'
            'https://freedom-club.sfo2.digitaloceanspaces.com/props/quartus/long-logo/ab_Quartus-05_only.png'
            ['#bb2649' [%shut ~ ~] ~ %|]
        ==
      ::
      ++  go-diff
        |=  d=diff
        ^+  go
        ?-    -.d
            %pak
          =;  punch=$-(action:gup card)
            =/  pip=(set ship)  (~(dif in team) +.d)    ::  ships to kick
            =/  pil=(set ship)                          ::  pends to cancel
              (~(dif in pend.cord) +.d)
            =/  pit=(set ship)                          ::  invites to send
              %.  (sy ~[our.dish])
              ~(dif in (~(dif in +.d) team))
            =|  caz=(list card)
            %-  go-emil
            =?    caz
                ?=(^ pit)
              :_  caz
              %-  punch
              ^-  action:gup
              :+  flag  now.dish
              [%cordon [%shut [%add-ships %pending pit]]]
            =?    caz
                ?=(^ pil)
              :_  caz
              %-  punch
              ^-  action:gup
              :+  flag  now.dish
              [%cordon [%shut [%del-ships %pending pil]]]
            =?    caz
                ?=(^ pip)
              :_  caz
              %-  punch
              ^-  action:gup
              [flag [now.dish [%fleet pip [%del ~]]]]
            caz
          |=  a=action:gup
          :^  %pass  /gnosis/[now]  %agent
          [[our.dish %groups] %poke %group-action !>(a)]
        ::
            %put
          =;  cag=cage
            %-  go-emit
            [%pass /gnosis/[now] %agent [our.dish %groups] %poke cag]
          =.  +.d  (~(del in +.d) our.dish)
          :-  %group-action
          !>  ^-  action:gup
          :+  flag  now.dish
          [%cordon [%shut [%add-ships %pending +.d]]]
        ::
            %pop
          =;  [cag=cage caz=cage]
            %-  go-emil
            :~  [%pass /gnosis/[now] %agent [our.dish %groups] %poke cag]
                [%pass /gnosis/[now] %agent [our.dish %groups] %poke caz]
            ==
          =.  +.d  (~(del in +.d) our.dish)
          :-
            :-  %group-action
            !>  ^-  action:gup
            [flag [now.dish [%fleet +.d [%del ~]]]]
          :-  %group-action
          !>  ^-  action:gup
          :+  flag  now.dish
          [%cordon [%shut [%del-ships %pending +.d]]]
        ==
      --
    --
  --
--