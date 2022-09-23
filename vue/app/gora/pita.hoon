::
::  pita - your whole pita
::
/-  *gora
/+  rudder, *mip
::
^-  (page:rudder tack manage-gora-2)
|_  [bol=bowl:gall odo=order:rudder sat=tack]
++  final  (alert:rudder 'pita' build)
::
++  argue
  |=  [headers=header-list:http body=(unit octs)]
  ^-  $@(brief:rudder manage-gora-2)
  =/  args=(map @t @t)
    ?~(body ~ (frisk:rudder q.u.body))
  ?.  (~(has by args) 'REPLACE ME')
    'unsatisfactory post action'
  ?>  authenticated.odo
  'REPLACE ME'
::
++  build
  |=  $:  args=(list [k=@t v=@t])
          msgs=(unit [gud=? txt=@])
      ==
  ^-  reply:rudder
  =/  pag=@ud
    ?~(p=(~(get by (malt args)) 'page') 0 (slav %ud u.p))
    ::
  =/  hos=(unit @p)
    ?~  h=(~(get by (malt args)) 'host')  ~
    ?:(?=(%$ (~(got by (malt args)) 'host')) ~ `(slav %p u.h))
    ::
  =/  tog=(unit @tas)
    ?~  p=(~(get by (malt args)) 'tags')  ~
    ?:(?=(%$ (~(got by (malt args)) 'tags')) ~ p)
    ::
  =/  own=(unit ?)
    ?~  o=(~(get by (malt args)) 'ownd')
      ?~(args `%.y ~)
    `=(0 (slav %ud u.o))
    ::
  |^  
  [%page page]
  ++  make
    |%
    ++  last
      =;  neu
        ;a(id "last", class "page-button", href "./gora{(trip neu)}")
          ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
            ;path(fill "#bb8c02", d "m12.2 17.1 2.125-2.125L12.85 13.5h3.875v-3.025H12.85l1.475-1.45-2.125-2.15L7.1 12Zm-.2 5.5q-2.225 0-4.15-.837-1.925-.838-3.35-2.263-1.425-1.425-2.262-3.35Q1.4 14.225 1.4 12q0-2.225.838-4.15Q3.075 5.925 4.5 4.5t3.35-2.263Q9.775 1.4 12 1.4q2.225 0 4.15.837 1.925.838 3.35 2.263 1.425 1.425 2.263 3.35.837 1.925.837 4.15 0 2.225-.837 4.15-.838 1.925-2.263 3.35-1.425 1.425-3.35 2.263-1.925.837-4.15.837Zm0-3.025q3.2 0 5.388-2.2 2.187-2.2 2.187-5.375 0-3.2-2.187-5.388Q15.2 4.425 12 4.425q-3.175 0-5.375 2.187Q4.425 8.8 4.425 12q0 3.175 2.2 5.375t5.375 2.2ZM12 12Z");
          ==
        ==
      %+  rap  3
      :~  (cat 3 '?page=' (scot %ud ?:(=(0 pag) 0 (sub pag 1))))
          ?~(hos '' (cat 3 '&host=' (scot %p u.hos)))
          ?~(tog '' (cat 3 '&tags=' u.tog))
          ?~(own '&ownd=0' ?:(u.own '&ownd=0' '&ownd=1'))
      ==
    ++  next
      =?    pita.sat
          !?=(~ tog)
        ?.  (~(has in ~(key by tags.sat)) (need tog))
          ~
        ^-  _pita.sat
        %-  malt
        %+  murn  ~(tap by pita.sat)
        |=  [k=id v=^gora]
        ?.  (~(has in (~(got by tags.sat) (need tog))) k)
          ~
        `[k v]
      =?    pita.sat
          !?=(~ hos)
        ^-  _pita.sat
        %-  malt
        %+  murn  ~(tap by pita.sat)
        |=  [k=id v=^gora]
        ?.(=((need hos) host.v) ~ `[k v])
      =?    pita.sat
          !?=(~ own)
        ?.  (need own)
          %-  malt
          %+  murn  ~(tap by pita.sat)
          |=  [k=id v=^gora]
          ?-    -.v
            %g  ?:((~(has in hodl.v) our.bol) ~ `[k v])
          ::
              %s
            ?:((~(has in ~(key by stak.v)) our.bol) ~ `[k v])
          ==
        %-  malt
        %+  murn  ~(tap by pita.sat)
        |=  [k=id v=^gora]
        ?-    -.v
          %g  ?.((~(has in hodl.v) our.bol) ~ `[k v])
        ::
            %s
          ?.((~(has in ~(key by stak.v)) our.bol) ~ `[k v])
        ==
      ?.  (gte (div ~(wyt by pita.sat) 8) +(pag))
        ;a(id "next", class "page-button", href "#")
          ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
            ;path(fill "black", d "m11.8 17.1 5.125-5.1L11.8 6.875l-2.1 2.15 1.45 1.45H7.3V13.5h3.85L9.7 14.975Zm.2 5.5q-2.225 0-4.15-.837-1.925-.838-3.35-2.263-1.425-1.425-2.262-3.35Q1.4 14.225 1.4 12q0-2.225.838-4.15Q3.075 5.925 4.5 4.5t3.35-2.263Q9.775 1.4 12 1.4q2.225 0 4.15.837 1.925.838 3.35 2.263 1.425 1.425 2.263 3.35.837 1.925.837 4.15 0 2.225-.837 4.15-.838 1.925-2.263 3.35-1.425 1.425-3.35 2.263-1.925.837-4.15.837Zm0-3.025q3.2 0 5.388-2.2 2.187-2.2 2.187-5.375 0-3.2-2.187-5.388Q15.2 4.425 12 4.425q-3.175 0-5.375 2.187Q4.425 8.8 4.425 12q0 3.175 2.2 5.375t5.375 2.2ZM12 12Z");
          ==
        ==
      =;  neu
        ;a(id "next", class "page-button", href "./gora{(trip neu)}")
          ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
            ;path(fill "#bb8c02", d "m11.8 17.1 5.125-5.1L11.8 6.875l-2.1 2.15 1.45 1.45H7.3V13.5h3.85L9.7 14.975Zm.2 5.5q-2.225 0-4.15-.837-1.925-.838-3.35-2.263-1.425-1.425-2.262-3.35Q1.4 14.225 1.4 12q0-2.225.838-4.15Q3.075 5.925 4.5 4.5t3.35-2.263Q9.775 1.4 12 1.4q2.225 0 4.15.837 1.925.838 3.35 2.263 1.425 1.425 2.263 3.35.837 1.925.837 4.15 0 2.225-.837 4.15-.838 1.925-2.263 3.35-1.425 1.425-3.35 2.263-1.925.837-4.15.837Zm0-3.025q3.2 0 5.388-2.2 2.187-2.2 2.187-5.375 0-3.2-2.187-5.388Q15.2 4.425 12 4.425q-3.175 0-5.375 2.187Q4.425 8.8 4.425 12q0 3.175 2.2 5.375t5.375 2.2ZM12 12Z");
          ==
        ==
      %+  rap  3
      :~  (cat 3 '?page=' (scot %ud +(pag)))
          ?~(hos '' (cat 3 '&host=' (scot %p u.hos)))
          ?~(tog '' (cat 3 '&tags=' u.tog))
          ?~(own '&ownd=0' ?:(u.own '&ownd=0' '&ownd=1'))
      ==

    ::
    ++  pads
      |=  m=marl
      ^-  marl
      |-
      ?:  (gte (lent m) 8)  (flop m)
      $(m `marl`[m-te m])
    ++  m-te
      ^-  manx
      ;div(class "badge")
        ;div(class "in-set");
      ::
        ;div(class "set-in")
          ;div(class "glint");
        ::
          ;div(class "shadow");
        ==
      ==
  ++  gora
      ^-  marl
      =;  lora=(list ^gora)
        =.  lora  
          (scag 8 (slag (mul pag 8) lora))
        %-  ~(rep in (silt lora))
        |=  [g=^gora m=marl]
        :_  m
        ;a(href "./gora/voyer?gora={(scow %uv id.g)}")
          ;div(class "badge")
            ;div(class "in-set");
          ::
            ;div(class "set-in")
              ;div(class "glint");
            ::
              ;div(class "shadow");
            ::
              ;img(src "{(trip pic.g)}");
            ::
              ;+  ?:  ?-  -.g
                        %s  (~(has in ~(key by stak.g)) our.bol)
                        %g  (~(has in hodl.g) our.bol)
                      ==
                    ;div;
                  ;div(class "unowned");
            ==
          ==
        ==
      =-  %+  sort  -
          |=  [a=^gora b=^gora]
          ?:  =(made.a made.b)
            (gth id.a id.b)
          (gth made.a made.b)
      %~  val  by
      =?    pita.sat
          !?=(~ tog)
        ?.  (~(has in ~(key by tags.sat)) (need tog))
          ~
        ^-  _pita.sat
        %-  malt
        %+  murn  ~(tap by pita.sat)
        |=  [k=id v=^gora]
        ?.  (~(has in (~(got by tags.sat) (need tog))) k)
          ~
        `[k v]
      =?    pita.sat
          !?=(~ hos)
        ^-  _pita.sat
        %-  malt
        %+  murn  ~(tap by pita.sat)
        |=  [k=id v=^gora]
        ?.(=((need hos) host.v) ~ `[k v])
      =?    pita.sat
          !?=(~ own)
        ?.  (need own)
          %-  malt
          %+  murn  ~(tap by pita.sat)
          |=  [k=id v=^gora]
          ?-    -.v
            %g  ?:((~(has in hodl.v) our.bol) ~ `[k v])
          ::
              %s
            ?:((~(has in ~(key by stak.v)) our.bol) ~ `[k v])
          ==
        %-  malt
        %+  murn  ~(tap by pita.sat)
        |=  [k=id v=^gora]
        ?-    -.v
          %g  ?.((~(has in hodl.v) our.bol) ~ `[k v])
        ::
            %s
          ?.((~(has in ~(key by stak.v)) our.bol) ~ `[k v])
        ==
      pita.sat
    --
  ++  page
    ^-  manx
    ;html
      ;head
        ;title:"ゴラ - {(trip 'ゴラデックス')}"
        ;style:"{(trip style)}"
        ;meta(charset "utf-8");
        ;meta
          =name     "viewport"
          =content  "width=device-width, initial-scale=1";
      ==
    ::
      ;body(class "disable-select")
        ;div(class "container")
          ;div(class "head")
            ;div(class "header")
              ;div(class "title")
                ;div(class "title-glass");
              ::
                ;div(class "pitagora")
                  マイ ゴラ スイッチ
                ==
              ::
              ==
            ==
          ==
        ::
          ;div(class "main")
            ;div(class "badge-box")
            ::
            ;*  (pads gora):make
            ==
          ==
        ::
          ;div(class "menu")
            ;div(class "toggles")
              ;div(class "tog-ownd")
                ;+  =;  neu
                      ?~  own
                        ;a(href (trip (cat 3 './gora?ownd=0' neu)))
                          ;div(class "tog-off");
                        ==
                      ?:  u.own
                        ;a(href (trip (cat 3 './gora?ownd=1' neu)))
                          ;div(class "tog-on");
                        ==
                      ;a(href (trip (cat 3 './gora?ownd=0' neu)))
                        ;div(class "tog-off");
                      ==

                    %+  rap  3
                    :~  (cat 3 '&page=' (scot %ud pag))
                        ?~(hos '' (cat 3 '&host=' (scot %p u.hos)))
                        ?~(tog '' (cat 3 '&tags=' u.tog))
                    ==
                  ::
                ;div(class "tog-text"):"owned"
              ==
            ::
              ;div(class "tog-tags")
                ;form(action "./gora", method "get", target "_self")
                  ;select(class "tog-drop", name "tags", id "tags")
                    ;*  ?~  tog
                          ;=  ;option(value ""):"select tag"
                              ;*  ^-  marl
                                  %~  tap  in
                                  ^-  (set manx)
                                  %-  ~(run in ~(key by tags.sat))
                                  |=  t=@tas
                                  ;option
                                    =value  "{(scow %tas t)}"
                                    {(scow %tas t)}
                                  ==
                          ==
                        ;=  ;option(value "{(trip u.tog)}"):"{(trip u.tog)}"
                            ;option(value ""):"none"
                            ;*  ^-  marl
                                %+  murn
                                  ~(tap in ~(key by tags.sat))
                                |=  t=@tas
                                ?:  =(u.tog t)  ~
                                :-  ~
                                ;option
                                  =value  "{(scow %tas t)}"
                                  {(scow %tas t)}
                                ==
                        ==
                  ==
                ::
                  ;button(class "submit-button")
                    ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                      ;path(fill "#bb8c02", d "m19.6 21-6.3-6.3q-.75.6-1.725.95Q10.6 16 9.5 16q-2.725 0-4.612-1.887Q3 12.225 3 9.5q0-2.725 1.888-4.613Q6.775 3 9.5 3t4.613 1.887Q16 6.775 16 9.5q0 1.1-.35 2.075-.35.975-.95 1.725l6.3 6.3ZM9.5 14q1.875 0 3.188-1.312Q14 11.375 14 9.5q0-1.875-1.312-3.188Q11.375 5 9.5 5 7.625 5 6.312 6.312 5 7.625 5 9.5q0 1.875 1.312 3.188Q7.625 14 9.5 14Z");
                    ==
                  ==
                ==
              ==
            ::
              ;div(class "tog-host")
                ;form(action "./gora", method "get", target "_self")
                  ;select(class "tog-drop", name "host", id "host")
                    ;*  ?~  hos
                          ;=  ;option(value ""):"select host"
                              ;*  ^-  marl
                                  %+  turn
                                    ^-  (list ship)
                                    %~  tap  in  %-  sy
                                    %+  turn  ~(val by pita.sat)
                                    |=  g=gora
                                    host.g
                                  |=  host=ship
                                  ;option
                                    =value  "{(scow %p host)}"
                                    {(scow %p host)}
                                  ==
                          ==
                        ;=  ;option(value "{(trip u.hos)}"):"{(scow %p u.hos)}"
                            ;option(value ""):"none"
                            ;*  ^-  marl
                                %+  murn
                                  %~  tap  in  %-  sy
                                  %+  turn  ~(val by pita.sat)
                                  |=  g=gora
                                  host.g
                                |=  host=ship
                                ?:  =(u.hos host)  ~
                                :-  ~
                                ;option
                                  =value  "{(scow %p host)}"
                                  {(scow %p host)}
                                ==
                        ==
                  ==
                ::
                  ;button(class "submit-button")
                    ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                      ;path(fill "#bb8c02", d "m19.6 21-6.3-6.3q-.75.6-1.725.95Q10.6 16 9.5 16q-2.725 0-4.612-1.887Q3 12.225 3 9.5q0-2.725 1.888-4.613Q6.775 3 9.5 3t4.613 1.887Q16 6.775 16 9.5q0 1.1-.35 2.075-.35.975-.95 1.725l6.3 6.3ZM9.5 14q1.875 0 3.188-1.312Q14 11.375 14 9.5q0-1.875-1.312-3.188Q11.375 5 9.5 5 7.625 5 6.312 6.312 5 7.625 5 9.5q0 1.875 1.312 3.188Q7.625 14 9.5 14Z");
                    ==
                  ==
                ==
              ==
            ==
          ::
            ;div(class "buttons")
              ;div(class "last")
                ;div(class "last-layout")
                  ;div(class "last-wrapper")
                    ;+  last:make
                  ==
                ==
              ==
            ::
              ;div(class "menu-buttons")
                ;div(class "button-layout")
                  ;div(class "button-wrapper")
                    ;a(id "give", class "button", href "./gora?host={(scow %p our.bol)}")
                      ;span(class "tooltip-text"):"give gorae you host"
                    ::
                      ;svg(xmlns "http://www.w3.org/2000/svg", height "40", width "40")
                        ;path(d "M20 33.333q-3.417 0-5.875-2.458T11.667 25q0-3.292 2.041-5.479 2.042-2.188 4.917-2.771V8.625l-3.375 3.333-1.958-1.916L20 3.333l6.708 6.709L24.75 12l-3.375-3.375v8.125q2.875.583 4.917 2.771 2.041 2.187 2.041 5.479 0 3.417-2.416 5.875Q23.5 33.333 20 33.333Z");
                      ==
                    ==
                  ==
                ::
                  ;div(class "button-wrapper")
                    ;a(id "take", class "button", href "./gora?ownd=1")
                      ;span(class "tooltip-text"):"accept offers"
                    ::
                      ;svg(xmlns "http://www.w3.org/2000/svg", height "40", width "40")
                        ;path(d "m20 36.667-6.708-6.709L15.25 28l3.375 3.375V23.25q-2.875-.583-4.917-2.771-2.041-2.187-2.041-5.479 0-3.458 2.437-5.896Q16.542 6.667 20 6.667q3.458 0 5.896 2.437 2.437 2.438 2.437 5.896 0 3.292-2.041 5.479-2.042 2.188-4.917 2.771v8.125l3.375-3.333 1.958 1.916Z");
                      ==
                    ==
                  ==
                ::
                  ;div(class "button-wrapper")
                    ;a(id "plea", class "button", href "./gora/plead")
                      ;span(class "tooltip-text"):"request gorae"
                    ::
                      ;svg(xmlns "http://www.w3.org/2000/svg", height "40", width "40")
                        ;path(d "M33 34.958 22.208 24.167q-1.25 1.041-2.916 1.645-1.667.605-3.5.605-4.542 0-7.667-3.125T5 15.708q0-4.458 3.125-7.604t7.625-3.146q4.458 0 7.583 3.146t3.125 7.604q0 1.792-.583 3.438-.583 1.646-1.708 3.062L35 32.958ZM15.75 23.625q3.292 0 5.604-2.313 2.313-2.312 2.313-5.604 0-3.291-2.313-5.625Q19.042 7.75 15.75 7.75q-3.333 0-5.646 2.333-2.312 2.334-2.312 5.625 0 3.292 2.312 5.604 2.313 2.313 5.646 2.313Z");
                      ==
                    ==
                  ==
                ::
                  ;div(class "button-wrapper")
                    ;a(id "ansr", class "button", href "./gora/asked")
                      ;span(class "tooltip-text"):"respond to requests"
                    ::
                      ;+  ?~  requests.logs.sat
                            ;svg(xmlns "http://www.w3.org/2000/svg", height "40", width "40")
                              ;path(d "M20 36.667q-3.417 0-6.458-1.313-3.042-1.312-5.313-3.583t-3.583-5.313Q3.333 23.417 3.333 20q0-3.458 1.313-6.5 1.312-3.042 3.583-5.292t5.313-3.562Q16.583 3.333 20 3.333q3.458 0 6.5 1.313 3.042 1.312 5.292 3.562t3.562 5.292q1.313 3.042 1.313 6.5 0 3.417-1.313 6.458-1.312 3.042-3.562 5.313T26.5 35.354q-3.042 1.313-6.5 1.313Zm0-2.792q5.792 0 9.833-4.042 4.042-4.041 4.042-9.833t-4.042-9.833Q25.792 6.125 20 6.125t-9.833 4.042Q6.125 14.208 6.125 20t4.042 9.833q4.041 4.042 9.833 4.042ZM20 20Z");
                            ==
                          ;svg(xmlns "http://www.w3.org/2000/svg", height "40", width "40")
                            ;path(d "M20 28.333q.625 0 1.042-.416.416-.417.416-1.042t-.416-1.063q-.417-.437-1.042-.437t-1.042.437q-.416.438-.416 1.063t.416 1.042q.417.416 1.042.416Zm-1.292-6.458h2.75V11.5h-2.75ZM20 36.667q-3.458 0-6.479-1.313-3.021-1.312-5.292-3.583t-3.583-5.292Q3.333 23.458 3.333 20t1.313-6.5q1.312-3.042 3.583-5.292t5.292-3.562Q16.542 3.333 20 3.333t6.5 1.313q3.042 1.312 5.292 3.562t3.562 5.292q1.313 3.042 1.313 6.5t-1.313 6.479q-1.312 3.021-3.562 5.292T26.5 35.354q-3.042 1.313-6.5 1.313Zm0-2.792q5.792 0 9.833-4.042 4.042-4.041 4.042-9.833t-4.021-9.833Q25.833 6.125 20 6.125q-5.792 0-9.833 4.021Q6.125 14.167 6.125 20q0 5.792 4.042 9.833 4.041 4.042 9.833 4.042ZM20 20Z");
                          ==
                    ==
                  ==
                ::
                  ;div(class "button-wrapper")
                    ;a(id "make", class "button", href "./gora/maker")
                      ;span(class "tooltip-text"):"make gorae"
                    ::
                      ;svg(xmlns "http://www.w3.org/2000/svg", height "40", width "40")
                        ;path(d "M9.625 33.333q-1.25 0-2.104-.854-.854-.854-.854-2.104 0-1.208.854-2.063.854-.854 2.104-.854 1.208 0 2.063.854.854.855.854 2.063 0 1.25-.854 2.104-.855.854-2.063.854Zm0-10.375q-1.25 0-2.104-.854-.854-.854-.854-2.104t.854-2.104q.854-.854 2.104-.854 1.208 0 2.063.854.854.854.854 2.104t-.854 2.104q-.855.854-2.063.854Zm0-10.416q-1.25 0-2.104-.854-.854-.855-.854-2.063 0-1.25.854-2.104.854-.854 2.104-.854 1.208 0 2.063.854.854.854.854 2.104 0 1.208-.854 2.063-.855.854-2.063.854ZM20 22.958q-1.25 0-2.104-.854-.854-.854-.854-2.104t.854-2.104q.854-.854 2.104-.854t2.104.854q.854.854.854 2.104Zm0-10.416q-1.25 0-2.104-.854-.854-.855-.854-2.063 0-1.25.854-2.104.854-.854 2.104-.854t2.104.854q.854.854.854 2.104 0 1.208-.854 2.063-.854.854-2.104.854Zm-1.667 20.791v-3l9.709-9.666L31 23.625l-9.667 9.708Zm12.042-20.791q-1.208 0-2.063-.854-.854-.855-.854-2.063 0-1.25.854-2.104.855-.854 2.063-.854 1.25 0 2.104.854.854.854.854 2.104 0 1.208-.854 2.063-.854.854-2.104.854Zm1.75 10-3-3 1.125-1.084q.375-.416.938-.416.562 0 .937.375l1.125 1.125q.375.375.375.937 0 .563-.417.938Z");
                      ==
                    ==
                  ==
                ::
                  ;div(class "button-wrapper")
                    ;a(id "logs", class "button", href "./gora/tiket")
                      ;span(class "tooltip-text"):"see logs"
                    ::
                      ;svg(xmlns "http://www.w3.org/2000/svg", height "40", width "40")
                        ;path(d "M9.5 36.667q-1.917 0-3.25-1.334Q4.917 34 4.917 32.083v-5.125h5.208V3.333l2.5 2.5 2.458-2.5 2.5 2.5 2.5-2.5 2.5 2.5 2.5-2.5 2.5 2.5 2.5-2.5 2.5 2.5 2.5-2.5v28.75q0 1.917-1.333 3.25-1.333 1.334-3.25 1.334Zm21-2.792q.792 0 1.292-.5t.5-1.292V7.792H12.875v19.166h15.833v5.125q0 .792.5 1.292t1.292.5Zm-15.583-19.5v-2.75h10v2.75Zm0 5.417V17h10v2.792Zm13.708-5.417q-.583 0-1-.396-.417-.396-.417-.979t.417-.979q.417-.396 1-.396.542 0 .958.396.417.396.417.979t-.417.979q-.416.396-.958.396Zm0 5.25q-.583 0-1-.396-.417-.396-.417-.979t.417-.979q.417-.396 1-.396.542 0 .958.396.417.396.417.979t-.417.979q-.416.396-.958.396ZM9.458 33.875h16.459v-4.167H7.708v2.375q0 .792.5 1.292t1.25.5Zm-1.75 0v-4.167 4.167Z");
                      ==
                    ==
                  ==
                ==
              ==
            ::
              ;div(class "next")
                ;div(class "next-layout")
                  ;div(class "next-wrapper")
                    ;+  next:make
                  ==
                ==
              ==
            ==
          ==
        ==
      ==
    ==
  ::
  ++  style
    '''
    /*
    * Prefixed by https://autoprefixer.github.io
    * PostCSS: v8.4.14,
    * Autoprefixer: v10.4.7
    * Browsers: last 4 version
    */

    * {
      font-family: monospace;
    }

    .disable-select {
        user-select: none; /* supported by Chrome and Opera */
      -webkit-user-select: none; /* Safari */
      -khtml-user-select: none; /* Konqueror HTML */
      -moz-user-select: none; /* Firefox */
      -ms-user-select: none; /* Internet Explorer/Edge */
    }

    .tooltip-text {
      top: -4vh;
      right: -3vw;
      visibility: hidden;
      width: 120px;
      background-color: #bb8c02;
      color: #fff;
      text-align: center;
      border-radius: 6px;
      padding: 5px 0;

      /* Position the tooltip */
      position: absolute;
      z-index: 1;
    }

    .button:hover > .tooltip-text {
      visibility: visible;
    }

    /* phone - vertical */
    @media (max-aspect-ratio: 9/16) {

      /* page container */
      .container {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
            -ms-flex-direction: column;
                flex-direction: column;

        background-image: -o-radial-gradient(#9e7703 1px, transparent 1px), -o-radial-gradient(#9e7703 1px, transparent 1px);

        background-image: radial-gradient(#9e7703 1px, transparent 1px), radial-gradient(#9e7703 1px, transparent 1px);
        background-size: 59px 59px;
        background-position: 0 0, 29.5px 29.5px;

        -webkit-animation: pulse 12s infinite;

                animation: pulse 12s infinite;
      }

      @-webkit-keyframes pulse {

        /* background-color: #333230; */
        0% {
          background-color: #333230;
        }

        33% {
          background-color: #353835;
        }

        50% {
          background-color: #404144;
        }

        66% {
          background-color: #353835;
        }

        100% {
          background-color: #333230;
        }
      }

      @keyframes pulse {

        /* background-color: #333230; */
        0% {
          background-color: #333230;
        }

        33% {
          background-color: #353835;
        }

        50% {
          background-color: #404144;
        }

        66% {
          background-color: #353835;
        }

        100% {
          background-color: #333230;
        }
      }

      /*   container children */
      .head {
        height: 18vh;

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
      }

      .main {
        height: 60vh;

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
      }

      .menu {
        height: 20vh;

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
            -ms-flex-direction: column;
                flex-direction: column;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
      }

      .menu-buttons {
        -webkit-transform: scale(0.7);
            -ms-transform: scale(0.7);
                transform: scale(0.7);
      }

      .last, .next {
        -webkit-transform: scale(0.8);
            -ms-transform: scale(0.8);
                transform: scale(0.8);
      }

      .toggles {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: horizontal;
        -webkit-box-direction: normal;
            -ms-flex-direction: row;
                flex-direction: row;
        width: 90vw;
        height: 30%;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
      }

      .tog-ownd {
        -webkit-transform: scale(0.8);
            -ms-transform: scale(0.8);
                transform: scale(0.8);
        width: 15%;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
      }

      .tog-tags {
        width: 40%;
        height: 100%;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
      }

      .tog-tags > form {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        margin: 0;
        height: 100%;
        width: 100%;
      }

      .tog-tags > form > select {
        width: 80%;
      }

      .tog-host {
        width: 40%;
        height: 100%;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
      }

      .tog-host > form {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        margin: 0;
        height: 100%;
        width: 100%;
      }

      .tog-host > form > select {
        width: 80%;
      }

      .buttons {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;

      }

      .tog-text {
        font-size: 11px;
        color: #d8bb00;
        text-shadow: 0px 0px 0px rgb(155,148,128),
                    0px 1px 0px rgb(141,134,114),
                    0px 2px 0px rgb(128,121,101),
                    0px 2px 1px rgba(196,154,29,1),
                    0px 2px 1px rgba(196,154,29,0.5),
                    0px 0px 2px rgba(196,154,29,.2);

        position: absolute;

        -webkit-transform: translate(-7vw, 0vh) rotate(270deg);

            -ms-transform: translate(-7vw, 0vh) rotate(270deg);

                transform: translate(-7vw, 0vh) rotate(270deg);
      }


      /* header formatting */
      .header {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
      }

      /*   title */
      .title {
        z-index: 97;
        width: 75vw;
        height: 20vw;

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;

        border: 4px outset #cecbbd;
        border-radius: 10px;

        background-image: -o-linear-gradient(60deg, #eaea9d 12%, transparent 12.5%, transparent 87%, #eaea9d 87.5%, #eaea9d), -o-linear-gradient(300deg, #eaea9d 12%, transparent 12.5%, transparent 87%, #eaea9d 87.5%, #eaea9d), -o-linear-gradient(60deg, #eaea9d 12%, transparent 12.5%, transparent 87%, #eaea9d 87.5%, #eaea9d), -o-linear-gradient(300deg, #eaea9d 12%, transparent 12.5%, transparent 87%, #eaea9d 87.5%, #eaea9d), -o-linear-gradient(30deg, rgba(234, 234, 157, 0.5) 25%, transparent 25.5%, transparent 75%, rgba(234, 234, 157, 0.5) 75%, rgba(234, 234, 157, 0.5)), -o-linear-gradient(30deg, rgba(234, 234, 157, 0.5) 25%, transparent 25.5%, transparent 75%, rgba(234, 234, 157, 0.5) 75%, rgba(234, 234, 157, 0.5));

        background-image: linear-gradient(30deg, #eaea9d 12%, transparent 12.5%, transparent 87%, #eaea9d 87.5%, #eaea9d), linear-gradient(150deg, #eaea9d 12%, transparent 12.5%, transparent 87%, #eaea9d 87.5%, #eaea9d), linear-gradient(30deg, #eaea9d 12%, transparent 12.5%, transparent 87%, #eaea9d 87.5%, #eaea9d), linear-gradient(150deg, #eaea9d 12%, transparent 12.5%, transparent 87%, #eaea9d 87.5%, #eaea9d), linear-gradient(60deg, rgba(234, 234, 157, 0.5) 25%, transparent 25.5%, transparent 75%, rgba(234, 234, 157, 0.5) 75%, rgba(234, 234, 157, 0.5)), linear-gradient(60deg, rgba(234, 234, 157, 0.5) 25%, transparent 25.5%, transparent 75%, rgba(234, 234, 157, 0.5) 75%, rgba(234, 234, 157, 0.5));
        background-size: 20px 35px;
        background-position: 0 0, 0 0, 10px 17.5px, 10px 17.5px, 0 0, 10px 17.5px;
        background-color: #fff;

        -webkit-box-shadow: 5px 5px 5px 0px #000000, inset 0px 0px 75px 5px #000000, 5px 5px 15px 5px rgba(0,0,0,0); 
        box-shadow: 5px 5px 5px 0px #000000, inset 0px 0px 75px 5px #000000, 5px 5px 15px 5px rgba(0,0,0,0);
      }

      /*   stained-glass look - title-glass */
      .title-glass {
        z-index: 98;
        position: absolute;
        width: 75vw;
        height: 20vw;

        -webkit-backdrop-filter: brightness(0.6) grayscale(1) blur(1.5px);

                backdrop-filter: brightness(0.6) grayscale(1) blur(1.5px);
      }

      /*   actual title - pitagora */
      .pitagora {
        z-index: 100;

        position: absolute;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
            -ms-flex-direction: column;
                flex-direction: column;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;

        font-size: 7vw;
        color: #ffc107;
        font-family: Lucida Console;
        font-weight: bold;
        text-shadow: 0px 0px 0 rgb(227, 165, 0),
          0px 1px 0 rgb(199, 137, 0),
          0px 2px 0 rgb(171, 109, 0),
          0px 3px 0 rgb(143, 81, 0),
          0px 4px 3px rgba(0, 0, 0, 0.6),
          0px 4px 1px rgba(0, 0, 0, 0.5),
          0px 0px 3px rgba(0, 0, 0, .2);
      }

      /*   font over everything */
      .pitagora>p {
        z-index: 100;
        margin: 0;
      }

      /* .badge-box - holds badges */
      .badge-box {
        z-index: 0;
        width: 90vw;
        height: 58vh;
        padding-top: 5vw;

        border: 5px outset #c3a882;
        border-radius: 10px;

        -webkit-box-shadow: 2px 2px 3px 1px #796b56, inset 0px 8px 20px 5px #000000, 6px 6px 27px 9px rgb(0 0 0);
        box-shadow: 2px 2px 3px 1px #796b56, inset 0px 8px 20px 5px #000000, 6px 6px 27px 9px rgb(0 0 0);

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -ms-flex-wrap: wrap;
            flex-wrap: wrap;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        margin-inline: 2%;

        background-image: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 40 40' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M20 20.5V18H0v-2h20v-2H0v-2h20v-2H0V8h20V6H0V4h20V2H0V0h22v20h2V0h2v20h2V0h2v20h2V0h2v20h2V0h2v20h2v2H20v-1.5zM0 20h2v20H0V20zm4 0h2v20H4V20zm4 0h2v20H8V20zm4 0h2v20h-2V20zm4 0h2v20h-2V20zm4 4h20v2H20v-2zm0 4h20v2H20v-2zm0 4h20v2H20v-2zm0 4h20v2H20v-2z' fill='%236a6259' fill-opacity='0.095' fill-rule='evenodd'/%3E%3C/svg%3E");
        background-color: #171717;
      }

      .badge-box > a {
        margin-inline: 2%;
      }

      /*   badge - a badge inset in the box */
      .badge {
        width: 23vw;

        border-radius: 50%;

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        margin-inline: 2%;

        -webkit-transition: -webkit-transform 0.7s ease-in-out;

        transition: -webkit-transform 0.7s ease-in-out;

        -o-transition: transform 0.7s ease-in-out;

        transition: transform 0.7s ease-in-out;

        transition: transform 0.7s ease-in-out, -webkit-transform 0.7s ease-in-out;
      }

      /*   .badge - children */
      .badge:nth-child(1) {
        -webkit-transform: rotate(2deg);
            -ms-transform: rotate(2deg);
                transform: rotate(2deg);
      }

      .badge:nth-child(2n) {
        -webkit-transform: rotate(-5deg);
            -ms-transform: rotate(-5deg);
                transform: rotate(-5deg);
      }

      .badge:nth-child(3n) {
        -webkit-transform: rotate(-2deg);
            -ms-transform: rotate(-2deg);
                transform: rotate(-2deg);
      }

      .badge:nth-child(4n) {
        -webkit-transform: rotate(5deg);
            -ms-transform: rotate(5deg);
                transform: rotate(5deg);
      }

      .badge:nth-child(5n) {
        -webkit-transform: rotate(-7deg);
            -ms-transform: rotate(-7deg);
                transform: rotate(-7deg);
      }

      .badge:nth-child(6n) {
        -webkit-transform: rotate(10deg);
            -ms-transform: rotate(10deg);
                transform: rotate(10deg);
      }

      .badge:nth-child(7n) {
        -webkit-transform: rotate(5deg);
            -ms-transform: rotate(5deg);
                transform: rotate(5deg);
      }

      .badge:nth-child(8n) {
        -webkit-transform: rotate(0deg);
            -ms-transform: rotate(0deg);
                transform: rotate(0deg);
      }

      /* .badge - hover */
      .badge:hover {
        -webkit-transform: rotate(0deg);
            -ms-transform: rotate(0deg);
                transform: rotate(0deg);
      }

      /*   in-set - holds a badge in the box */
      .in-set {
        z-index: 0;
        border-radius: 50%;
        -webkit-box-shadow: 0px 0px 7px 5px #000;
                box-shadow: 0px 0px 7px 5px #000;
        position: absolute;
        width: 95%;
        padding-bottom: 95%;
        background: -o-radial-gradient(circle, rgb(15 13 2) 0%, rgb(0 0 0) 33%);
        background: radial-gradient(circle, rgb(15 13 2) 0%, rgb(0 0 0) 33%);
      }

      .set-in {
        width: 20vw;
        height: 20vw;

        border-radius: 50%;
        background: -o-radial-gradient(50% 49%, circle, #fcfcfc, #cccfd0 36%, #bab8b3 91%);
        background: radial-gradient(circle at 50% 49%, #fcfcfc, #cccfd0 36%, #bab8b3 91%);

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        position: relative;
        -webkit-transition: all 1s ease-in-out;
        -o-transition: all 1s ease-in-out;
        transition: all 1s ease-in-out;
      }

      /*   set-in > img settings */
      .set-in>img {
        width: 20vw;
        height: 20vw;
        border-radius: 50%;
        -webkit-filter: grayscale(0.6);
                filter: grayscale(0.6);
        -webkit-transition: all 0.5s ease-in-out;
        -o-transition: all 0.5s ease-in-out;
        transition: all 0.5s ease-in-out;
      }

      /*  set-in > animations */
      .set-in:hover {
        -webkit-transform: scale(1.25);
            -ms-transform: scale(1.25);
                transform: scale(1.25);
      }

      .set-in:hover>img {
        -webkit-filter: none;
                filter: none;
      }

      .set-in:hover>.glint {
        -webkit-transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
                transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
      }

      .set-in:hover>.shadow {
        -webkit-box-shadow: -1px -1px 10px 5px #000000 inset;
                box-shadow: -1px -1px 10px 5px #000000 inset;
      }

      /*   .shadow - a still shadow */
      .shadow {
        border-radius: 50%;
        width: 100%;
        height: 100%;
        -webkit-box-shadow: -15px -10px 25px 10px #151612 inset;
                box-shadow: -15px -10px 25px 10px #151612 inset;
        z-index: 100;
        position: absolute;
        -webkit-transition: all 1s ease-out;
        -o-transition: all 1s ease-out;
        transition: all 1s ease-out
      }

      /*   .glint - a moving glint */
      .glint {
        border-radius: 50%;
        z-index: 100;
        background: -o-radial-gradient(50% 50%, circle, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
        background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
        width: 100%;
        height: 100%;
        -webkit-transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
                transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
        position: absolute;
        -webkit-transition: all 1s ease-out;
        -o-transition: all 1s ease-out;
        transition: all 1s ease-out;
      }

      /* last button */
      .last-layout {
        /* width: 10vw; */
      }

      .last-wrapper {
        border-radius: 50%;
        padding: 10px;
        background-color: black;

        -webkit-box-shadow:
          inset 3px 5px 5px -1px rgb(255 255 255 / 50%),
          inset -3px -3px 5px -1px rgb(0 0 0 / 99%),
          1px 1px 1px 2px rgb(0 0 0 / 80%),
          2.5px 5px 5px 1px rgb(0 0 0 / 90%);

                box-shadow:
          inset 3px 5px 5px -1px rgb(255 255 255 / 50%),
          inset -3px -3px 5px -1px rgb(0 0 0 / 99%),
          1px 1px 1px 2px rgb(0 0 0 / 80%),
          2.5px 5px 5px 1px rgb(0 0 0 / 90%)
      }

      /* next button */
      .next-layout {
        /* width: 10vw; */
      }

      .next-wrapper {
        border-radius: 50%;
        padding: 10px;
        background-color: black;

        -webkit-box-shadow:
          inset 3px 3px 3px -1px rgb(255 255 255 / 50%),
          inset -7px -1px 8px 1px rgb(0 0 0 / 99%),
          -1px 1px 1px 2px rgb(0 0 0 / 80%),
          2.5px 5px 5px 1px rgb(0 0 0 / 90%);

                box-shadow:
          inset 3px 3px 3px -1px rgb(255 255 255 / 50%),
          inset -7px -1px 8px 1px rgb(0 0 0 / 99%),
          -1px 1px 1px 2px rgb(0 0 0 / 80%),
          2.5px 5px 5px 1px rgb(0 0 0 / 90%)
      }


      /* main menu */
      .button-layout {
        width: 65vw;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
      }

      .button-layout>div {
        margin: 6px;
      }

      .button-wrapper {
        width: 15vw;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -ms-flex-line-pack: center;
            align-content: center;
      }

      .button {
        padding: 5%;

        -webkit-filter: grayscale(0.2);

                filter: grayscale(0.2);
        background: #E0B533;
        background-image: -o-linear-gradient(top, #E0B533, #E4AB05);
        background-image: -webkit-gradient(to bottom, #E0B533, #E4AB05);
        -webkit-box-shadow: inset 0 0 10px 5px #1C1C1C;
        box-shadow: inset 0 0 10px 5px #1C1C1C;
        border: ridge #BBAC8B 5px;
        border-radius: 11px;
        color: #FFFFFF;

        -webkit-border-radius: 11px;
        -moz-border-radius: 11px;

        display: inline-block;
        cursor: pointer;
      }

      .button:hover {
        -webkit-filter: grayscale(0);
                filter: grayscale(0);
        padding: 5%;

        background: #e3d4a8;
        background-image: -o-linear-gradient(top, #e3d4a8, #e2bb1c);
        background-image: -webkit-gradient(to bottom, #e3d4a8, #e2bb1c);
        -webkit-box-shadow: inset 0 0 10px 5px #1C1C1C;
        box-shadow: inset 0 0 10px 5px #1C1C1C;
        border: ridge #BBAC8B 5px;
        border-radius: 11px;
        color: #FFFFFF;

        -webkit-border-radius: 11px;
        -moz-border-radius: 11px;

        display: inline-block;
        cursor: pointer;
      }
    }

    /* phone - horizontal */
    @media (min-aspect-ratio: 16/9) {

      /* page container */
      .container {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: horizontal;
        -webkit-box-direction: normal;
            -ms-flex-direction: row;
                flex-direction: row;
        padding-left: 20px;

        background-image: -o-radial-gradient(#9e7703 1px, transparent 1px), -o-radial-gradient(#9e7703 1px, transparent 1px);

        background-image: radial-gradient(#9e7703 1px, transparent 1px), radial-gradient(#9e7703 1px, transparent 1px);
        background-size: 59px 59px;
        background-position: 0 0, 29.5px 29.5px;

        -webkit-animation: pulse 12s infinite;

                animation: pulse 12s infinite;

        -webkit-box-pack: center;

            -ms-flex-pack: center;

                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
      }

      @-webkit-keyframes pulse {

        /* background-color: #333230; */
        0% {
          background-color: #333230;
        }

        33% {
          background-color: #353835;
        }

        50% {
          background-color: #404144;
        }

        66% {
          background-color: #353835;
        }

        100% {
          background-color: #333230;
        }
      }

      @keyframes pulse {

        /* background-color: #333230; */
        0% {
          background-color: #333230;
        }

        33% {
          background-color: #353835;
        }

        50% {
          background-color: #404144;
        }

        66% {
          background-color: #353835;
        }

        100% {
          background-color: #333230;
        }
      }

      /*   container children */
      .head {
        width: 8vw;

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
      }

      .main {
        width: 65vw;
    

        display: -webkit-box;
    

        display: -ms-flexbox;
    

        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
      }

      .menu {
        width: 12vw;
        height: 95vh;

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -webkit-box-orient: horizontal;
        -webkit-box-direction: normal;
            -ms-flex-direction: row;
                flex-direction: row;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
      }

      .menu-buttons {
        -webkit-transform: scale(0.7);
            -ms-transform: scale(0.7);
                transform: scale(0.7);
      }

      .last, .next {
        -webkit-transform: scale(0.8);
            -ms-transform: scale(0.8);
                transform: scale(0.8);
      }

      .toggles {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
            -ms-flex-direction: column;
                flex-direction: column;
        width: 5vw;
        height: 85vh;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
      }

      .tog-ownd {
        width: 15%;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
      }

      .tog-tags {
        width: 35vh;
        height: 35vh;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-transform: rotate(270deg);
            -ms-transform: rotate(270deg);
                transform: rotate(270deg);
      }

      .tog-tags > form {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        margin: 0;
        height: 100%;
        width: 100%;
      }

      .tog-tags > form > select {
        width: 80%;
      }

      .tog-host {
        width: 35vh;
        height: 35vh;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-transform: rotate(270deg);
            -ms-transform: rotate(270deg);
                transform: rotate(270deg);
      }

      .tog-host > form {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        margin: 0;
        height: 100%;
        width: 100%;
      }

      .tog-host > form > select {
        width: 80%;
      }

      .buttons {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
            -ms-flex-direction: column;
                flex-direction: column;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;

      }

      .tog-text {
        font-size: 11px;
        color: #d8bb00;
        text-shadow: 0px 0px 0px rgb(155,148,128),
                    0px 1px 0px rgb(141,134,114),
                    0px 2px 0px rgb(128,121,101),
                    0px 2px 1px rgba(196,154,29,1),
                    0px 2px 1px rgba(196,154,29,0.5),
                    0px 0px 2px rgba(196,154,29,.2);

        position: absolute;

        -webkit-transform: translate(0vw, -5vh);

            -ms-transform: translate(0vw, -5vh);

                transform: translate(0vw, -5vh);
      }

      /* header formatting */
      .header {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
      }

      /*   title */
      .title {
        z-index: 97;
        width: 6vw;
        height: 75vh;

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;

        border: 4px outset #cecbbd;
        -webkit-box-shadow: 0 0 15px -2px #444444;
                box-shadow: 0 0 15px -2px #444444;
        border-radius: 10px;

        background-image: -o-linear-gradient(60deg, #eaea9d 12%, transparent 12.5%, transparent 87%, #eaea9d 87.5%, #eaea9d), -o-linear-gradient(300deg, #eaea9d 12%, transparent 12.5%, transparent 87%, #eaea9d 87.5%, #eaea9d), -o-linear-gradient(60deg, #eaea9d 12%, transparent 12.5%, transparent 87%, #eaea9d 87.5%, #eaea9d), -o-linear-gradient(300deg, #eaea9d 12%, transparent 12.5%, transparent 87%, #eaea9d 87.5%, #eaea9d), -o-linear-gradient(30deg, rgba(234, 234, 157, 0.5) 25%, transparent 25.5%, transparent 75%, rgba(234, 234, 157, 0.5) 75%, rgba(234, 234, 157, 0.5)), -o-linear-gradient(30deg, rgba(234, 234, 157, 0.5) 25%, transparent 25.5%, transparent 75%, rgba(234, 234, 157, 0.5) 75%, rgba(234, 234, 157, 0.5));

        background-image: linear-gradient(30deg, #eaea9d 12%, transparent 12.5%, transparent 87%, #eaea9d 87.5%, #eaea9d), linear-gradient(150deg, #eaea9d 12%, transparent 12.5%, transparent 87%, #eaea9d 87.5%, #eaea9d), linear-gradient(30deg, #eaea9d 12%, transparent 12.5%, transparent 87%, #eaea9d 87.5%, #eaea9d), linear-gradient(150deg, #eaea9d 12%, transparent 12.5%, transparent 87%, #eaea9d 87.5%, #eaea9d), linear-gradient(60deg, rgba(234, 234, 157, 0.5) 25%, transparent 25.5%, transparent 75%, rgba(234, 234, 157, 0.5) 75%, rgba(234, 234, 157, 0.5)), linear-gradient(60deg, rgba(234, 234, 157, 0.5) 25%, transparent 25.5%, transparent 75%, rgba(234, 234, 157, 0.5) 75%, rgba(234, 234, 157, 0.5));
        background-size: 20px 35px;
        background-position: 0 0, 0 0, 10px 17.5px, 10px 17.5px, 0 0, 10px 17.5px;
        background-color: #fff;

        -webkit-box-shadow: 5px 5px 5px 0px #000000, inset 0px 0px 75px 5px #000000, 5px 5px 15px 5px rgba(0,0,0,0); 
        box-shadow: 5px 5px 5px 0px #000000, inset 0px 0px 75px 5px #000000, 5px 5px 15px 5px rgba(0,0,0,0);
      }

      /*   stained-glass look - title-glass */
      .title-glass {
        z-index: 98;
        position: absolute;
        width: 6vw;
        height: 75vh;

        -webkit-backdrop-filter: brightness(0.6) grayscale(1) blur(1.5px);

                backdrop-filter: brightness(0.6) grayscale(1) blur(1.5px);
      }

      /*   actual title - pitagora */
      .pitagora {
        z-index: 100;
        width: 6vh;
        height: 75vh;

        position: absolute;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
            -ms-flex-direction: column;
                flex-direction: column;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;

        font-size: 6vh;
        color: #ffc107;
        font-family: Lucida Console;
        font-weight: bold;
        text-shadow: 0px 0px 0 rgb(227, 165, 0),
          0px 1px 0 rgb(199, 137, 0),
          0px 2px 0 rgb(171, 109, 0),
          0px 3px 0 rgb(143, 81, 0),
          0px 4px 3px rgba(0, 0, 0, 0.6),
          0px 4px 1px rgba(0, 0, 0, 0.5),
          0px 0px 3px rgba(0, 0, 0, .2);
      }

      /*   font over everything */
      .pitagora>p {
        z-index: 100;
        margin: 0;
      }

      /* .badge-box - holds badges */
      .badge-box {
        z-index: 0;
        width: 60vw;
        height: 75vh;

        border: 5px outset #c3a882;
        border-radius: 10px;

        -webkit-box-shadow: 2px 2px 3px 5px #796b56, inset 0px 8px 20px 5px #000000, 6px 6px 27px 9px rgb(0 0 0);
        box-shadow: 2px 2px 3px 5px #796b56, inset 0px 8px 20px 5px #000000, 6px 6px 27px 9px rgb(0 0 0);

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -ms-flex-wrap: wrap;
            flex-wrap: wrap;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;

        background-image: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 40 40' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M20 20.5V18H0v-2h20v-2H0v-2h20v-2H0V8h20V6H0V4h20V2H0V0h22v20h2V0h2v20h2V0h2v20h2V0h2v20h2V0h2v20h2v2H20v-1.5zM0 20h2v20H0V20zm4 0h2v20H4V20zm4 0h2v20H8V20zm4 0h2v20h-2V20zm4 0h2v20h-2V20zm4 4h20v2H20v-2zm0 4h20v2H20v-2zm0 4h20v2H20v-2zm0 4h20v2H20v-2z' fill='%236a6259' fill-opacity='0.095' fill-rule='evenodd'/%3E%3C/svg%3E");
        background-color: #171717;
      }

      .badge-box > a {

      }

      /*   badge - a badge inset in the box */
      .badge {
        width: 14vw;
        border-radius: 50%;

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;

        -webkit-transition: -webkit-transform 0.7s ease-in-out;

        transition: -webkit-transform 0.7s ease-in-out;

        -o-transition: transform 0.7s ease-in-out;

        transition: transform 0.7s ease-in-out;

        transition: transform 0.7s ease-in-out, -webkit-transform 0.7s ease-in-out;
      }

      /*   .badge - children */
      .badge:nth-child(1) {
        -webkit-transform: rotate(2deg);
            -ms-transform: rotate(2deg);
                transform: rotate(2deg);
      }

      .badge:nth-child(2n) {
        -webkit-transform: rotate(-5deg);
            -ms-transform: rotate(-5deg);
                transform: rotate(-5deg);
      }

      .badge:nth-child(3n) {
        -webkit-transform: rotate(-2deg);
            -ms-transform: rotate(-2deg);
                transform: rotate(-2deg);
      }

      .badge:nth-child(4n) {
        -webkit-transform: rotate(5deg);
            -ms-transform: rotate(5deg);
                transform: rotate(5deg);
      }

      .badge:nth-child(5n) {
        -webkit-transform: rotate(-7deg);
            -ms-transform: rotate(-7deg);
                transform: rotate(-7deg);
      }

      .badge:nth-child(6n) {
        -webkit-transform: rotate(10deg);
            -ms-transform: rotate(10deg);
                transform: rotate(10deg);
      }

      .badge:nth-child(7n) {
        -webkit-transform: rotate(5deg);
            -ms-transform: rotate(5deg);
                transform: rotate(5deg);
      }

      .badge:nth-child(8n) {
        -webkit-transform: rotate(0deg);
            -ms-transform: rotate(0deg);
                transform: rotate(0deg);
      }

      /* .badge - hover */
      .badge:hover {
        -webkit-transform: rotate(0deg);
            -ms-transform: rotate(0deg);
                transform: rotate(0deg);
      }

      /*   in-set - holds a badge in the box */
      .in-set {
        z-index: 0;
        border-radius: 50%;
        -webkit-box-shadow: 0px 0px 7px 5px #000;
                box-shadow: 0px 0px 7px 5px #000;
        position: absolute;
        width: 95%;
        padding-bottom: 95%;
        background: -o-radial-gradient(circle, rgb(15 13 2) 0%, rgb(0 0 0) 33%);
        background: radial-gradient(circle, rgb(15 13 2) 0%, rgb(0 0 0) 33%);
      }

      .set-in {
        width: 12vw;
        height: 12vw;

        border-radius: 50%;
        background: -o-radial-gradient(50% 49%, circle, #fcfcfc, #cccfd0 36%, #bab8b3 91%);
        background: radial-gradient(circle at 50% 49%, #fcfcfc, #cccfd0 36%, #bab8b3 91%);

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        position: relative;
        -webkit-transition: all 1s ease-in-out;
        -o-transition: all 1s ease-in-out;
        transition: all 1s ease-in-out;
      }

      /*   set-in > img settings */
      .set-in>img {
        width: 12vw;
        height: 12vw;
        border-radius: 50%;
        -webkit-filter: grayscale(0.6);
                filter: grayscale(0.6);
        -webkit-transition: all 0.5s ease-in-out;
        -o-transition: all 0.5s ease-in-out;
        transition: all 0.5s ease-in-out;
      }

      /*  set-in > animations */
      .set-in:hover {
        -webkit-transform: scale(1.25);
            -ms-transform: scale(1.25);
                transform: scale(1.25);
      }

      .set-in:hover>img {
        -webkit-filter: none;
                filter: none;
      }

      .set-in:hover>.glint {
        -webkit-transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
                transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
      }

      .set-in:hover>.shadow {
        -webkit-box-shadow: -1px -1px 10px 5px #000000 inset;
                box-shadow: -1px -1px 10px 5px #000000 inset;
      }

      /*   .shadow - a still shadow */
      .shadow {
        border-radius: 50%;
        width: 100%;
        height: 100%;
        -webkit-box-shadow: -15px -10px 25px 10px #151612 inset;
                box-shadow: -15px -10px 25px 10px #151612 inset;
        z-index: 100;
        position: absolute;
        -webkit-transition: all 1s ease-out;
        -o-transition: all 1s ease-out;
        transition: all 1s ease-out
      }

      /*   .glint - a moving glint */
      .glint {
        border-radius: 50%;
        z-index: 100;
        background: -o-radial-gradient(50% 50%, circle, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
        background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
        width: 100%;
        height: 100%;
        -webkit-transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
                transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
        position: absolute;
        -webkit-transition: all 1s ease-out;
        -o-transition: all 1s ease-out;
        transition: all 1s ease-out;
      }



      * last button */
      .last-layout {
        /* width: 10vw; */
      }

      .last-wrapper {
        border-radius: 50%;
        padding: 10px;
        background-color: black;

        -webkit-box-shadow:
          inset 3px 5px 5px -1px rgb(255 255 255 / 50%),
          inset -3px -3px 5px -1px rgb(0 0 0 / 99%),
          1px 1px 1px 2px rgb(0 0 0 / 80%),
          2.5px 5px 5px 1px rgb(0 0 0 / 90%);

                box-shadow:
          inset 3px 5px 5px -1px rgb(255 255 255 / 50%),
          inset -3px -3px 5px -1px rgb(0 0 0 / 99%),
          1px 1px 1px 2px rgb(0 0 0 / 80%),
          2.5px 5px 5px 1px rgb(0 0 0 / 90%)
      }

      /* next button */
      .next-layout {
        /* width: 10vw; */
      }

      .next-wrapper {
        border-radius: 50%;
        padding: 10px;
        background-color: black;

        -webkit-box-shadow:
          inset 3px 3px 3px -1px rgb(255 255 255 / 50%),
          inset -7px -1px 8px 1px rgb(0 0 0 / 99%),
          -1px 1px 1px 2px rgb(0 0 0 / 80%),
          2.5px 5px 5px 1px rgb(0 0 0 / 90%);

                box-shadow:
          inset 3px 3px 3px -1px rgb(255 255 255 / 50%),
          inset -7px -1px 8px 1px rgb(0 0 0 / 99%),
          -1px 1px 1px 2px rgb(0 0 0 / 80%),
          2.5px 5px 5px 1px rgb(0 0 0 / 90%)
      }


      /* main menu */
      .button-layout {
        height: 33vw;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
            -ms-flex-direction: column;
                flex-direction: column;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
      }

      .button-layout>div {
        margin: 6px;
      }

      .button-wrapper {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -ms-flex-line-pack: center;
            align-content: center;
      }

      .buttons {
        height: 95vh;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
            -ms-flex-direction: column;
                flex-direction: column;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        width: 10vw;
      }

      .menu-buttons {
        -webkit-transform: scale(0.7);
            -ms-transform: scale(0.7);
                transform: scale(0.7);
      }

      .last, .next {
        -webkit-transform: scale (0.8);
            -ms-transform: scale (0.8);
                transform: scale (0.8);
      }


      .button {
        padding: 5%;

        -webkit-filter: grayscale(0.2);

                filter: grayscale(0.2);
        background: #E0B533;
        background-image: -o-linear-gradient(top, #E0B533, #E4AB05);
        background-image: -webkit-gradient(to bottom, #E0B533, #E4AB05);
        -webkit-box-shadow: inset 0 0 10px 5px #1C1C1C;
        box-shadow: inset 0 0 10px 5px #1C1C1C;
        border: ridge #BBAC8B 5px;
        border-radius: 11px;
        color: #FFFFFF;

        -webkit-border-radius: 11px;
        -moz-border-radius: 11px;

        display: inline-block;
        cursor: pointer;
      }

      .button:hover {
        -webkit-filter: grayscale(0);
                filter: grayscale(0);
        padding: 5%;

        background: #e3d4a8;
        background-image: -o-linear-gradient(top, #e3d4a8, #e2bb1c);
        background-image: -webkit-gradient(to bottom, #e3d4a8, #e2bb1c);
        -webkit-box-shadow: inset 0 0 10px 5px #1C1C1C;
        box-shadow: inset 0 0 10px 5px #1C1C1C;
        border: ridge #BBAC8B 5px;
        border-radius: 11px;
        color: #FFFFFF;

        -webkit-border-radius: 11px;
        -moz-border-radius: 11px;

        display: inline-block;
        cursor: pointer;
      }
    }

    /* square computer */
    @media (min-aspect-ratio: 9/16) and (max-aspect-ratio: 16/9) {
      .container {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
            -ms-flex-direction: column;
                flex-direction: column;

        background-image: -o-radial-gradient(#9e7703 1px, transparent 1px), -o-radial-gradient(#9e7703 1px, transparent 1px);

        background-image: radial-gradient(#9e7703 1px, transparent 1px), radial-gradient(#9e7703 1px, transparent 1px);
        background-size: 59px 59px;
        background-position: 0 0, 29.5px 29.5px;

        -webkit-animation: pulse 12s infinite;

                animation: pulse 12s infinite;
      }

      @-webkit-keyframes pulse {

        /* background-color: #333230; */
        0% {
          background-color: #333230;
        }

        33% {
          background-color: #353835;
        }

        50% {
          background-color: #404144;
        }

        66% {
          background-color: #353835;
        }

        100% {
          background-color: #333230;
        }
      }

      @keyframes pulse {

        /* background-color: #333230; */
        0% {
          background-color: #333230;
        }

        33% {
          background-color: #353835;
        }

        50% {
          background-color: #404144;
        }

        66% {
          background-color: #353835;
        }

        100% {
          background-color: #333230;
        }
      }

    /*   container children */
      .head {
        height: 15vh;

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
      }

      .main {
        height: 58vh;

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
      }

      .menu {
        height: 25vh;

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
            -ms-flex-direction: column;
                flex-direction: column;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
      }

      .toggles {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: horizontal;
        -webkit-box-direction: normal;
            -ms-flex-direction: row;
                flex-direction: row;
        width: 90vw;
        height: 30%;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
      }

      .tog-ownd {
        width: 15%;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
      }

      .tog-tags {
        width: 40%;
        height: 100%;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
      }

      .tog-tags > form {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        margin: 0;
        height: 100%;
        width: 100%;
      }

      .tog-tags > form > select {
        width: 80%;
      }

      .tog-host {
        width: 40%;
        height: 100%;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
      }

      .tog-host > form {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        margin: 0;
        height: 100%;
        width: 100%;
      }

      .tog-host > form > select {
        width: 80%;
      }

      .buttons {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;

      }

      .tog-text {
        font-size: 11px;
        color: #d8bb00;
        text-shadow: 0px 0px 0px rgb(155,148,128),
                    0px 1px 0px rgb(141,134,114),
                    0px 2px 0px rgb(128,121,101),
                    0px 2px 1px rgba(196,154,29,1),
                    0px 2px 1px rgba(196,154,29,0.5),
                    0px 0px 2px rgba(196,154,29,.2);

        position: absolute;

        -webkit-transform: translate(-4vw, 0vh) rotate(270deg);

            -ms-transform: translate(-4vw, 0vh) rotate(270deg);

                transform: translate(-4vw, 0vh) rotate(270deg);
      }

      /* header formatting */
      .header {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
      }

      /*   title */
      .title {
        z-index: 97;
        width: 75vw;
        height: 12vh;

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;

        border: 4px outset #cecbbd;
        -webkit-box-shadow: 0 0 15px -2px #444444;
                box-shadow: 0 0 15px -2px #444444;
        border-radius: 10px;

        background-image: -o-linear-gradient(60deg, #eaea9d 12%, transparent 12.5%, transparent 87%, #eaea9d 87.5%, #eaea9d), -o-linear-gradient(300deg, #eaea9d 12%, transparent 12.5%, transparent 87%, #eaea9d 87.5%, #eaea9d), -o-linear-gradient(60deg, #eaea9d 12%, transparent 12.5%, transparent 87%, #eaea9d 87.5%, #eaea9d), -o-linear-gradient(300deg, #eaea9d 12%, transparent 12.5%, transparent 87%, #eaea9d 87.5%, #eaea9d), -o-linear-gradient(30deg, rgba(234, 234, 157, 0.5) 25%, transparent 25.5%, transparent 75%, rgba(234, 234, 157, 0.5) 75%, rgba(234, 234, 157, 0.5)), -o-linear-gradient(30deg, rgba(234, 234, 157, 0.5) 25%, transparent 25.5%, transparent 75%, rgba(234, 234, 157, 0.5) 75%, rgba(234, 234, 157, 0.5));

        background-image: linear-gradient(30deg, #eaea9d 12%, transparent 12.5%, transparent 87%, #eaea9d 87.5%, #eaea9d), linear-gradient(150deg, #eaea9d 12%, transparent 12.5%, transparent 87%, #eaea9d 87.5%, #eaea9d), linear-gradient(30deg, #eaea9d 12%, transparent 12.5%, transparent 87%, #eaea9d 87.5%, #eaea9d), linear-gradient(150deg, #eaea9d 12%, transparent 12.5%, transparent 87%, #eaea9d 87.5%, #eaea9d), linear-gradient(60deg, rgba(234, 234, 157, 0.5) 25%, transparent 25.5%, transparent 75%, rgba(234, 234, 157, 0.5) 75%, rgba(234, 234, 157, 0.5)), linear-gradient(60deg, rgba(234, 234, 157, 0.5) 25%, transparent 25.5%, transparent 75%, rgba(234, 234, 157, 0.5) 75%, rgba(234, 234, 157, 0.5));
        background-size: 20px 35px;
        background-position: 0 0, 0 0, 10px 17.5px, 10px 17.5px, 0 0, 10px 17.5px;
        background-color: #fff;

        -webkit-box-shadow: 5px 5px 5px 0px #000000, inset 0px 0px 75px 5px #000000, 5px 5px 15px 5px rgba(0,0,0,0); 
        box-shadow: 5px 5px 5px 0px #000000, inset 0px 0px 75px 5px #000000, 5px 5px 15px 5px rgba(0,0,0,0);
      }

      /*   stained-glass look - title-glass */
      .title-glass {
        z-index: 98;
        position: absolute;
        width: 75vw;
        height: 12vh;

        -webkit-backdrop-filter: brightness(0.6) grayscale(1) blur(1.5px);

                backdrop-filter: brightness(0.6) grayscale(1) blur(1.5px);
      }

      /*   actual title - pitagora */
      .pitagora {
        z-index: 100;

        position: absolute;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
            -ms-flex-direction: column;
                flex-direction: column;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;

        font-size: 7vw;
        color: #ffc107;
        font-family: Lucida Console;
        font-weight: bold;
        text-shadow: 0px 0px 0 rgb(227, 165, 0),
          0px 1px 0 rgb(199, 137, 0),
          0px 2px 0 rgb(171, 109, 0),
          0px 3px 0 rgb(143, 81, 0),
          0px 4px 3px rgba(0, 0, 0, 0.6),
          0px 4px 1px rgba(0, 0, 0, 0.5),
          0px 0px 3px rgba(0, 0, 0, .2);

      }

      /*   font over everything */
      .pitagora>p {
        z-index: 100;
        margin: 0;
      }

      /* .badge-box - holds badges */
      .badge-box {
        z-index: 0;
        width: 90vw;
        height: 50vh;
        padding-top: 2vw;
        padding-bottom: 2vw;

        border: 5px outset #c3a882;
        border-radius: 10px;
        
        -webkit-box-shadow: 2px 2px 3px 5px #796b56, inset 0px 8px 20px 5px #000000, 6px 6px 27px 9px rgb(0 0 0);
        box-shadow: 2px 2px 3px 5px #796b56, inset 0px 8px 20px 5px #000000, 6px 6px 27px 9px rgb(0 0 0);

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -ms-flex-wrap: wrap;
            flex-wrap: wrap;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        margin-inline: 2%;

        background-image: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 40 40' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M20 20.5V18H0v-2h20v-2H0v-2h20v-2H0V8h20V6H0V4h20V2H0V0h22v20h2V0h2v20h2V0h2v20h2V0h2v20h2V0h2v20h2v2H20v-1.5zM0 20h2v20H0V20zm4 0h2v20H4V20zm4 0h2v20H8V20zm4 0h2v20h-2V20zm4 0h2v20h-2V20zm4 4h20v2H20v-2zm0 4h20v2H20v-2zm0 4h20v2H20v-2zm0 4h20v2H20v-2z' fill='%236a6259' fill-opacity='0.095' fill-rule='evenodd'/%3E%3C/svg%3E");
        background-color: #171717;
      }

      .badge-box > a {
        margin-inline: 2%;
      }

      /*   badge - a badge inset in the box */
      .badge {
        width: 17vw;

        border-radius: 50%;

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        margin-inline: 2%;

        -webkit-transition: -webkit-transform 0.7s ease-in-out;

        transition: -webkit-transform 0.7s ease-in-out;

        -o-transition: transform 0.7s ease-in-out;

        transition: transform 0.7s ease-in-out;

        transition: transform 0.7s ease-in-out, -webkit-transform 0.7s ease-in-out;
      }

      /*   .badge - children */
      .badge:nth-child(1n) {
        -webkit-transform: rotate(2deg);
            -ms-transform: rotate(2deg);
                transform: rotate(2deg);
      }

      .badge:nth-child(2n) {
        -webkit-transform: rotate(-5deg);
            -ms-transform: rotate(-5deg);
                transform: rotate(-5deg);
      }

      .badge:nth-child(3n) {
        -webkit-transform: rotate(-2deg);
            -ms-transform: rotate(-2deg);
                transform: rotate(-2deg);
      }

      .badge:nth-child(4n) {
        -webkit-transform: rotate(5deg);
            -ms-transform: rotate(5deg);
                transform: rotate(5deg);
      }

      .badge:nth-child(5n) {
        -webkit-transform: rotate(-7deg);
            -ms-transform: rotate(-7deg);
                transform: rotate(-7deg);
      }

      .badge:nth-child(6n) {
        -webkit-transform: rotate(10deg);
            -ms-transform: rotate(10deg);
                transform: rotate(10deg);
      }

      .badge:nth-child(7n) {
        -webkit-transform: rotate(5deg);
            -ms-transform: rotate(5deg);
                transform: rotate(5deg);
      }

      .badge:nth-child(8n) {
        -webkit-transform: rotate(0deg);
            -ms-transform: rotate(0deg);
                transform: rotate(0deg);
      }

      /* .badge - hover */
      .badge:hover {
        -webkit-transform: rotate(0deg);
            -ms-transform: rotate(0deg);
                transform: rotate(0deg);
      }

      /*   in-set - holds a badge in the box */
      .in-set {
        z-index: 0;
        border-radius: 50%;
        -webkit-box-shadow: 0px 0px 7px 5px #000;
                box-shadow: 0px 0px 7px 5px #000;
        position: absolute;
        width: 15vw;
        padding-bottom: 15vw;
        background: -o-radial-gradient(circle, rgb(15 13 2) 0%, rgb(0 0 0) 33%);
        background: radial-gradient(circle, rgb(15 13 2) 0%, rgb(0 0 0) 33%);
      }

      .set-in {
        width: 15vw;
        height: 15vw;

        border-radius: 50%;
        background: -o-radial-gradient(50% 49%, circle, #fcfcfc, #cccfd0 36%, #bab8b3 91%);
        background: radial-gradient(circle at 50% 49%, #fcfcfc, #cccfd0 36%, #bab8b3 91%);

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        position: relative;
        -webkit-transition: all 1s ease-in-out;
        -o-transition: all 1s ease-in-out;
        transition: all 1s ease-in-out;
      }

      /*   set-in > img settings */
      .set-in>img {
        width: 15vw;
        height: 15vw;
        border-radius: 50%;
        -webkit-filter: grayscale(0.6);
                filter: grayscale(0.6);
        -webkit-transition: all 0.5s ease-in-out;
        -o-transition: all 0.5s ease-in-out;
        transition: all 0.5s ease-in-out;
      }

      /*  set-in > animations */
      .set-in:hover {
        -webkit-transform: scale(1.25);
            -ms-transform: scale(1.25);
                transform: scale(1.25);
      }

      .set-in:hover>img {
        -webkit-filter: none;
                filter: none;
      }

      .set-in:hover>.glint {
        -webkit-transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
                transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
      }

      .set-in:hover>.shadow {
        -webkit-box-shadow: -1px -1px 10px 5px #000000 inset;
                box-shadow: -1px -1px 10px 5px #000000 inset;
      }

      /*   .shadow - a still shadow */
      .shadow {
        border-radius: 50%;
        width: 100%;
        height: 100%;
        -webkit-box-shadow: -15px -10px 25px 10px #151612 inset;
                box-shadow: -15px -10px 25px 10px #151612 inset;
        z-index: 100;
        position: absolute;
        -webkit-transition: all 1s ease-out;
        -o-transition: all 1s ease-out;
        transition: all 1s ease-out
      }

      /*   .glint - a moving glint */
      .glint {
        border-radius: 50%;
        z-index: 100;
        background: -o-radial-gradient(50% 50%, circle, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
        background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
        width: 100%;
        height: 100%;
        -webkit-transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
                transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
        position: absolute;
        -webkit-transition: all 1s ease-out;
        -o-transition: all 1s ease-out;
        transition: all 1s ease-out;
      }

      /* last button */
      .last-layout {
        /* width: 10vw; */
      }

      .last-wrapper {
        border-radius: 50%;
        padding: 10px;
        background-color: black;

        -webkit-box-shadow:
          inset 3px 5px 5px -1px rgb(255 255 255 / 50%),
          inset -3px -3px 5px -1px rgb(0 0 0 / 99%),
          1px 1px 1px 2px rgb(0 0 0 / 80%),
          2.5px 5px 5px 1px rgb(0 0 0 / 90%);

                box-shadow:
          inset 3px 5px 5px -1px rgb(255 255 255 / 50%),
          inset -3px -3px 5px -1px rgb(0 0 0 / 99%),
          1px 1px 1px 2px rgb(0 0 0 / 80%),
          2.5px 5px 5px 1px rgb(0 0 0 / 90%)
      }

      /* next button */
      .next-layout {
        /* width: 10vw; */
      }

      .next-wrapper {
        border-radius: 50%;
        padding: 10px;
        background-color: black;

        -webkit-box-shadow:
          inset 3px 3px 3px -1px rgb(255 255 255 / 50%),
          inset -7px -1px 8px 1px rgb(0 0 0 / 99%),
          -1px 1px 1px 2px rgb(0 0 0 / 80%),
          2.5px 5px 5px 1px rgb(0 0 0 / 90%);

                box-shadow:
          inset 3px 3px 3px -1px rgb(255 255 255 / 50%),
          inset -7px -1px 8px 1px rgb(0 0 0 / 99%),
          -1px 1px 1px 2px rgb(0 0 0 / 80%),
          2.5px 5px 5px 1px rgb(0 0 0 / 90%)
      }


      /* main menu */
      .button-layout {
        width: 60vw;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
      }

      .button-layout>div {
        margin: 6px;
      }

      .last, .next { -webkit-transform: scale(1.5); -ms-transform: scale(1.5); transform: scale(1.5); }

      .button-wrapper {
        width: 15vw;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -ms-flex-line-pack: center;
            align-content: center;
      }

      .button {
        padding: 5%;

        -webkit-filter: grayscale(0.2);

                filter: grayscale(0.2);
        background: #E0B533;
        background-image: -o-linear-gradient(top, #E0B533, #E4AB05);
        background-image: -webkit-gradient(to bottom, #E0B533, #E4AB05);
        -webkit-box-shadow: inset 0 0 10px 5px #1C1C1C;
        box-shadow: inset 0 0 10px 5px #1C1C1C;
        border: ridge #BBAC8B 5px;
        border-radius: 11px;
        color: #FFFFFF;

        -webkit-border-radius: 11px;
        -moz-border-radius: 11px;

        display: inline-block;
        cursor: pointer;
      }

      .button:hover {
        -webkit-filter: grayscale(0);
                filter: grayscale(0);
        padding: 5%;

        background: #e3d4a8;
        background-image: -o-linear-gradient(top, #e3d4a8, #e2bb1c);
        background-image: -webkit-gradient(to bottom, #e3d4a8, #e2bb1c);
        -webkit-box-shadow: inset 0 0 10px 5px #1C1C1C;
        box-shadow: inset 0 0 10px 5px #1C1C1C;
        border: ridge #BBAC8B 5px;
        border-radius: 11px;
        color: #FFFFFF;

        -webkit-border-radius: 11px;
        -moz-border-radius: 11px;

        display: inline-block;
        cursor: pointer;
      }
    }

    .unowned {
      width: 100%;
      height: 100%;
      position: absolute;
      border-radius: 50%;
      z-index: 20;

      -webkit-backdrop-filter: blur(1px) grayscale(.7);

              backdrop-filter: blur(1px) grayscale(.7);
      -webkit-box-shadow: 0px 0px 15px 2px #bb8c02ee,
                  inset 5px 5px 20px 5px #bb8c02a1;
              box-shadow: 0px 0px 15px 2px #bb8c02ee,
                  inset 5px 5px 20px 5px #bb8c02a1;
      -webkit-transition: all 0.5s ease-in-out;
      -o-transition: all 0.5s ease-in-out;
      transition: all 0.5s ease-in-out;
    }

    .set-in:hover>.unowned {
      -webkit-backdrop-filter: blur(0px) grayscale(.2);
              backdrop-filter: blur(0px) grayscale(.2);
    }

    .tog-on {
      width: 5vh;
      height: 5vh;
      border-radius: 50%;

      -webkit-box-shadow: 0px 2px 3px 1px #fff30080,
                  0px 2px 1px 3px #5f5000;

              box-shadow: 0px 2px 3px 1px #fff30080,
                  0px 2px 1px 3px #5f5000;
      background: -o-radial-gradient(circle, rgb(246 236 74) 0%, rgb(214 192 0 / 90%) 33%, rgb(168 138 8) 65%, rgb(255 222 1) 100%);
      background: radial-gradient(circle, rgb(246 236 74) 0%, rgb(214 192 0 / 90%) 33%, rgb(168 138 8) 65%, rgb(255 222 1) 100%);
    }
    .tog-off {
      width: 5vh;
      height: 5vh;
      border-radius: 50%;

      -webkit-box-shadow: 0px 2px 3px 1px #948e1180,
                  0px 2px 1px 3px #1f1a01;

              box-shadow: 0px 2px 3px 1px #948e1180,
                  0px 2px 1px 3px #1f1a01;
      background: -o-radial-gradient(circle, rgb(80 79 67) 0%, rgb(112 101 15 / 90%) 33%, rgb(84 71 14) 65%, rgb(255 222 1) 100%);
      background: radial-gradient(circle, rgb(80 79 67) 0%, rgb(112 101 15 / 90%) 33%, rgb(84 71 14) 65%, rgb(255 222 1) 100%);
    }


    .tog-drop {
      background: none;
      -webkit-box-shadow: 1px 1px 10px 2px #bb8c02,
                  inset 0px 0px 15px 3px #ffffff90;
              box-shadow: 1px 1px 10px 2px #bb8c02,
                  inset 0px 0px 15px 3px #ffffff90;
      border: none;
      border-radius: 5px;
      margin-inline: 2px;
    }

    .submit-button {
      padding: 0px;
      background: none;
      border: none;
      cursor: pointer;
    }
    '''
  --
--