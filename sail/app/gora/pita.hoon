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
  ~&  >  [%page pag %host hos %tags tog %owned own]
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
      ;body
        ;div(class "container")
          ;div(class "head")
            ;div(class "header")
              ;div(class "title")
                ;div(class "title-glass");
              ::
                ;div(class "pitagora")
                  マイ ゴラ スイッチ
                ==
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
                                  %~  tap  in
                                  ^-  (set manx)
                                  %-  ~(run in (sy ~(val by pita.sat)))
                                  |=  g=gora
                                  ;option
                                    =value  "{(scow %p host.g)}"
                                    {(scow %p host.g)}
                                  ==
                          ==
                        ;=  ;option(value "{(trip u.hos)}"):"{(scow %p u.hos)}"
                            ;option(value ""):"none"
                            ;*  ^-  marl
                                %+  murn
                                  ~(val by pita.sat)
                                |=  g=gora
                                ?:  =(u.hos host.g)  ~
                                :-  ~
                                ;option
                                  =value  "{(scow %p host.g)}"
                                  {(scow %p host.g)}
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
                      ;svg(xmlns "http://www.w3.org/2000/svg", height "48", width "48")
                        ;path(d "M24 40q-4.1 0-7.05-2.95T14 30q0-4.1 2.525-6.675T22.5 20.05V9.7l-4.45 4.45-2.1-2.1L24 4l8.05 8.05-2.1 2.1L25.5 9.7v10.35q3.45.7 5.975 3.275Q34 25.9 34 30t-2.9 7.05Q28.2 40 24 40Z");
                      ==
                    ==
                  ==
                ::
                  ;div(class "button-wrapper")
                    ;a(id "take", class "button", href "./gora?ownd=1")
                      ;svg(xmlns "http://www.w3.org/2000/svg", height "48", width "48")
                        ;path(d "M21.8 43.9q-3.8-.4-7.05-2.1-3.25-1.7-5.625-4.4T5.4 31.25q-1.35-3.45-1.35-7.3 0-7.75 5.075-13.45Q14.2 4.8 21.85 4v3q-6.4.95-10.6 5.75-4.2 4.8-4.2 11.2 0 6.4 4.175 11.2Q15.4 39.95 21.8 40.9ZM24 34 14 24l2.15-2.15 6.35 6.35V14h3v14.2l6.35-6.35L34 24Zm2.2 9.9v-3q2.3-.3 4.425-1.175T34.55 37.4l2.2 2.2q-2.3 1.75-4.975 2.9T26.2 43.9Zm8.4-33.35q-1.9-1.35-4-2.275Q28.5 7.35 26.2 7V4q2.9.35 5.55 1.475t5 2.875Zm5 25.95-2.15-2.1q1.45-1.85 2.3-3.975Q40.6 28.3 40.9 26h3.05q-.35 2.9-1.45 5.575-1.1 2.675-2.9 4.925Zm1.3-14.6q-.3-2.3-1.15-4.45-.85-2.15-2.3-3.95l2.35-2.05q1.75 2.3 2.8 4.95 1.05 2.65 1.35 5.5Z");
                      ==
                    ==
                  ==
                ::
                  ;div(class "button-wrapper")
                    ;a(id "take", class "button", href "./gora/plead")
                      ;svg(xmlns "http://www.w3.org/2000/svg", height "48", width "48")
                        ;path(d "M21.8 43.9q-3.8-.4-7.05-2.1-3.25-1.7-5.625-4.4T5.4 31.25q-1.35-3.45-1.35-7.3 0-7.75 5.075-13.45Q14.2 4.8 21.85 4v3q-6.4.95-10.6 5.75-4.2 4.8-4.2 11.2 0 6.4 4.175 11.2Q15.4 39.95 21.8 40.9ZM24 34 14 24l2.15-2.15 6.35 6.35V14h3v14.2l6.35-6.35L34 24Zm2.2 9.9v-3q2.3-.3 4.425-1.175T34.55 37.4l2.2 2.2q-2.3 1.75-4.975 2.9T26.2 43.9Zm8.4-33.35q-1.9-1.35-4-2.275Q28.5 7.35 26.2 7V4q2.9.35 5.55 1.475t5 2.875Zm5 25.95-2.15-2.1q1.45-1.85 2.3-3.975Q40.6 28.3 40.9 26h3.05q-.35 2.9-1.45 5.575-1.1 2.675-2.9 4.925Zm1.3-14.6q-.3-2.3-1.15-4.45-.85-2.15-2.3-3.95l2.35-2.05q1.75 2.3 2.8 4.95 1.05 2.65 1.35 5.5Z");
                      ==
                    ==
                  ==
                ::
                  ;div(class "button-wrapper")
                    ;a(id "make", class "button", href "./gora/maker")
                      ;svg(xmlns "http://www.w3.org/2000/svg", height "48", width "48")
                        ;path(d "M11.3 40q-1.4 0-2.35-.95Q8 38.1 8 36.7q0-1.4.95-2.35.95-.95 2.35-.95 1.4 0 2.35.95.95.95.95 2.35 0 1.4-.95 2.35-.95.95-2.35.95Zm0-12.7q-1.4 0-2.35-.95Q8 25.4 8 24q0-1.4.95-2.35.95-.95 2.35-.95 1.4 0 2.35.95.95.95.95 2.35 0 1.4-.95 2.35-.95.95-2.35.95Zm0-12.7q-1.4 0-2.35-.95Q8 12.7 8 11.3q0-1.4.95-2.35Q9.9 8 11.3 8q1.4 0 2.35.95.95.95.95 2.35 0 1.4-.95 2.35-.95.95-2.35.95ZM24 27.3q-1.4 0-2.35-.95-.95-.95-.95-2.35 0-1.4.95-2.35.95-.95 2.35-.95 1.4 0 2.35.95.95.95.95 2.35Zm0-12.7q-1.4 0-2.35-.95-.95-.95-.95-2.35 0-1.4.95-2.35Q22.6 8 24 8q1.4 0 2.35.95.95.95.95 2.35 0 1.4-.95 2.35-.95.95-2.35.95ZM22 40v-3.25L34.15 24.6l3.25 3.25L25.25 40Zm14.7-25.4q-1.4 0-2.35-.95-.95-.95-.95-2.35 0-1.4.95-2.35Q35.3 8 36.7 8q1.4 0 2.35.95.95.95.95 2.35 0 1.4-.95 2.35-.95.95-2.35.95Zm2 11.95-3.25-3.25 1.25-1.25q.4-.4 1-.425.6-.025 1 .375l1.3 1.3q.4.4.375 1-.025.6-.425 1Z");
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
    * {
      font-family: monospace;
    }

    /* phone - vertical */
    @media (max-aspect-ratio: 9/16) {

      /* page container */
      .container {
        display: flex;
        flex-direction: column;

        background-image: radial-gradient(#9e7703 1px, transparent 1px), radial-gradient(#9e7703 1px, transparent 1px);
        background-size: 59px 59px;
        background-position: 0 0, 29.5px 29.5px;

        animation: pulse 12s infinite;
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

        display: flex;
        justify-content: center;
        align-items: center;
      }

      .main {
        height: 60vh;

        display: flex;
        justify-content: center;
        align-items: center;
      }

      .menu {
        height: 20vh;

        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
      }

      .toggles {
        display: flex;
        flex-direction: row;
        width: 90vw;
        height: 30%;
        align-items: center;
        justify-content: center;
      }

      .tog-ownd {
        width: 15%;
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .tog-tags {
        width: 40%;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .tog-tags > form {
        display: flex;
        align-items: center;
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
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .tog-host > form {
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0;
        height: 100%;
        width: 100%;
      }

      .tog-host > form > select {
        width: 80%;
      }

      .buttons {
        display: flex;
        align-items: center;
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

        transform: translate(-7vw, 0vh) rotate(270deg);
      }


      /* header formatting */
      .header {
        display: flex;
        justify-content: center;
        align-items: center;
      }

      /*   title */
      .title {
        z-index: 97;
        width: 75vw;
        height: 20vw;

        display: flex;
        justify-content: center;
        align-items: center;

        border: 4px outset #cecbbd;
        border-radius: 10px;

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

        backdrop-filter: brightness(0.6) grayscale(1) blur(1.5px);
      }

      /*   actual title - pitagora */
      .pitagora {
        z-index: 100;

        position: absolute;
        display: flex;
        flex-direction: column;
        justify-content: center;
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

      }

      /* .badge-box - holds badges */
      .badge-box {
        z-index: 0;
        width: 90vw;
        height: 58vh;
        padding-top: 5vw;

        border: 5px outset #c3a882;
        border-radius: 10px;

        -webkit-box-shadow: 0px 0px 10px 2px #bb8c02, inset 0px 0px 20px 10px #000000, 5px 5px 15px 5px rgb(0 0 0 / 0%);
        box-shadow: 0px 0px 10px 2px #bb8c02, inset 0px 0px 20px 10px #000000, 5px 5px 15px 5px rgb(0 0 0 / 0%);

        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        margin-inline: 2%;

        background-image: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 40 40' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M20 20.5V18H0v-2h20v-2H0v-2h20v-2H0V8h20V6H0V4h20V2H0V0h22v20h2V0h2v20h2V0h2v20h2V0h2v20h2V0h2v20h2v2H20v-1.5zM0 20h2v20H0V20zm4 0h2v20H4V20zm4 0h2v20H8V20zm4 0h2v20h-2V20zm4 0h2v20h-2V20zm4 4h20v2H20v-2zm0 4h20v2H20v-2zm0 4h20v2H20v-2zm0 4h20v2H20v-2z' fill='%236a6259' fill-opacity='0.095' fill-rule='evenodd'/%3E%3C/svg%3E");
        background-color: #151612;
      }

      .badge-box > a {
        margin-inline: 2%
      }

      /*   badge - a badge inset in the box */
      .badge {
        width: 23vw;

        border-radius: 50%;

        display: flex;
        justify-content: center;
        align-items: center;
        margin-inline: 2%;

        transition: transform 0.7s ease-in-out;
      }

      /*   .badge - children */
      .badge:nth-child(1) {
        transform: rotate(2deg);
      }

      .badge:nth-child(2n) {
        transform: rotate(-5deg);
      }

      .badge:nth-child(3n) {
        transform: rotate(-2deg);
      }

      .badge:nth-child(4n) {
        transform: rotate(5deg);
      }

      .badge:nth-child(5n) {
        transform: rotate(-7deg);
      }

      .badge:nth-child(6n) {
        transform: rotate(10deg);
      }

      .badge:nth-child(7n) {
        transform: rotate(5deg);
      }

      .badge:nth-child(8n) {
        transform: rotate(0deg);
      }

      /* .badge - hover */
      .badge:hover {
        transform: rotate(0deg);
      }

      /*   in-set - holds a badge in the box */
      .in-set {
        z-index: 0;
        border-radius: 50%;
        box-shadow: 0px 0px 7px 5px #000;
        position: absolute;
        width: 95%;
        padding-bottom: 95%;
        background: radial-gradient(circle, rgb(15 13 2) 0%, rgb(0 0 0) 33%);
      }

      .set-in {
        width: 20vw;
        height: 20vw;

        border-radius: 50%;
        background: radial-gradient(circle at 50% 49%, #fcfcfc, #cccfd0 36%, #bab8b3 91%);

        display: flex;
        justify-content: center;
        position: relative;
        transition: all 1s ease-in-out;
      }

      /*   set-in > img settings */
      .set-in>img {
        width: 20vw;
        height: 20vw;
        border-radius: 50%;
        filter: grayscale(0.6);
        transition: all 0.5s ease-in-out;
      }

      /*  set-in > animations */
      .set-in:hover {
        transform: scale(1.25);
      }

      .set-in:hover>img {
        filter: none;
      }

      .set-in:hover>.glint {
        transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
      }

      .set-in:hover>.shadow {
        box-shadow: -1px -1px 10px 5px #000000 inset;
      }

      /*   .shadow - a still shadow */
      .shadow {
        border-radius: 50%;
        width: 100%;
        height: 100%;
        box-shadow: -15px -10px 25px 10px #151612 inset;
        z-index: 100;
        position: absolute;
        transition: all 1s ease-out
      }

      /*   .glint - a moving glint */
      .glint {
        border-radius: 50%;
        z-index: 100;
        background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
        width: 100%;
        height: 100%;
        transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
        position: absolute;
        transition: all 1s ease-out;
      }

      /* last button */
      .last-layout {
        width 10vw;
      }

      .last-wrapper {
        border-radius: 50%;
        padding: 10px;

        box-shadow:
          inset 3px 5px 5px -1px rgb(255 255 255 / 50%),
          inset -3px -3px 5px -1px rgb(0 0 0 / 99%),
          1px 1px 1px 2px rgb(0 0 0 / 80%),
          2.5px 5px 5px 1px rgb(0 0 0 / 90%)
      }

      /* next button */
      .next-layout {
        width 10vw;
      }

      .next-wrapper {
        border-radius: 50%;
        padding: 10px;

        box-shadow:
          inset 3px 3px 3px -1px rgb(255 255 255 / 50%),
          inset -7px -1px 8px 1px rgb(0 0 0 / 99%),
          -1px 1px 1px 2px rgb(0 0 0 / 80%),
          2.5px 5px 5px 1px rgb(0 0 0 / 90%)
      }


      /* main menu */
      .button-layout {
        width: 65vw;
        display: flex;
        justify-content: center;
      }

      .button-layout>div {
        margin: 6px;
      }

      .button-wrapper {
        width: 15vw;
        display: flex;
        justify-content: center;
        align-content: center;
      }

      .button {
        padding: 5%;

        filter: grayscale(0.2);
        background: #E0B533;
        background-image: -webkit-linear-gradient(top, #E0B533, #E4AB05);
        background-image: -moz-linear-gradient(top, #E0B533, #E4AB05);
        background-image: -ms-linear-gradient(top, #E0B533, #E4AB05);
        background-image: -o-linear-gradient(top, #E0B533, #E4AB05);
        background-image: -webkit-gradient(to bottom, #E0B533, #E4AB05);
        -webkit-box-shadow: inset 0 0 10px 5px #1C1C1C;
        -moz-box-shadow: inset 0 0 10px 5px #1C1C1C;
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
        filter: grayscale(0);
        padding: 5%;

        background: #e3d4a8;
        background-image: -webkit-linear-gradient(top, #e3d4a8, #e2bb1c);
        background-image: -moz-linear-gradient(top, #e3d4a8, #e2bb1c);
        background-image: -ms-linear-gradient(top, #e3d4a8, #e2bb1c);
        background-image: -o-linear-gradient(top, #e3d4a8, #e2bb1c);
        background-image: -webkit-gradient(to bottom, #e3d4a8, #e2bb1c);
        -webkit-box-shadow: inset 0 0 10px 5px #1C1C1C;
        -moz-box-shadow: inset 0 0 10px 5px #1C1C1C;
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
        display: flex;
        flex-direction: row;
        padding-left: 20px;

        background-image: radial-gradient(#9e7703 1px, transparent 1px), radial-gradient(#9e7703 1px, transparent 1px);
        background-size: 59px 59px;
        background-position: 0 0, 29.5px 29.5px;

        animation: pulse 12s infinite;

        justify-content: center;
        align-items: center;
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
        width: 13vw;

        display: flex;
        justify-content: center;
        align-items: center;
      }

      .main {
        width: 70vw;
    

        display: flex;
        justify-content: center;
        align-items: center;
      }

      .menu {
        width: 5vw;
        height: 95vh;

        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
      }

      .toggles {
        display: flex;
        flex-direction: column;
        width: 5vw;
        height: 85vh;
        align-items: center;
        justify-content: center;
      }

      .tog-ownd {
        width: 15%;
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .tog-tags {
        width: 35vh;
        height: 35vh;
        display: flex;
        align-items: center;
        justify-content: center;
        transform: rotate(270deg);
      }

      .tog-tags > form {
        display: flex;
        align-items: center;
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
        display: flex;
        align-items: center;
        justify-content: center;
        transform: rotate(270deg);
      }

      .tog-host > form {
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0;
        height: 100%;
        width: 100%;
      }

      .tog-host > form > select {
        width: 80%;
      }

      .buttons {
        display: flex;
        flex-direction: column;
        align-items: center;
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

        transform: translate(0vw, -5vh);
      }

      /* header formatting */
      .header {
        display: flex;
        justify-content: center;
        align-items: center;
      }

      /*   title */
      .title {
        z-index: 97;
        width: 12vw;
        height: 75vh;

        display: flex;
        justify-content: center;
        align-items: center;

        border: 4px outset #cecbbd;
        box-shadow: 0 0 15px -2px #444444;
        border-radius: 10px;

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
        width: 12vw;
        height: 75vh;

        backdrop-filter: brightness(0.6) grayscale(1) blur(1.5px);
      }

      /*   actual title - pitagora */
      .pitagora {
        z-index: 100;
        width: 75vh;

        position: absolute;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;

        font-size: 7vh;
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
        rotate: 270deg;
      }

      /*   font over everything */
      .pitagora>p {
        z-index: 100;
      }

      /* .badge-box - holds badges */
      .badge-box {
        z-index: 0;
        width: 60vw;
        height: 75vh;

        border: 5px outset #c3a882;
        border-radius: 10px;

        -webkit-box-shadow: 0px 0px 10px 2px #bb8c02, inset 0px 0px 20px 10px #000000, 5px 5px 15px 5px rgb(0 0 0 / 0%);
        box-shadow: 0px 0px 10px 2px #bb8c02, inset 0px 0px 20px 10px #000000, 5px 5px 15px 5px rgb(0 0 0 / 0%);

        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;

        background-image: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 40 40' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M20 20.5V18H0v-2h20v-2H0v-2h20v-2H0V8h20V6H0V4h20V2H0V0h22v20h2V0h2v20h2V0h2v20h2V0h2v20h2V0h2v20h2v2H20v-1.5zM0 20h2v20H0V20zm4 0h2v20H4V20zm4 0h2v20H8V20zm4 0h2v20h-2V20zm4 0h2v20h-2V20zm4 4h20v2H20v-2zm0 4h20v2H20v-2zm0 4h20v2H20v-2zm0 4h20v2H20v-2z' fill='%236a6259' fill-opacity='0.095' fill-rule='evenodd'/%3E%3C/svg%3E");
        background-color: #151612;
      }

      .badge-box > a {

      }

      /*   badge - a badge inset in the box */
      .badge {
        width: 14vw;
        margin-inline 2%
        border-radius: 50%;

        display: flex;
        justify-content: center;
        align-items: center;

        transition: transform 0.7s ease-in-out;
      }

      /*   .badge - children */
      .badge:nth-child(1) {
        transform: rotate(2deg);
      }

      .badge:nth-child(2n) {
        transform: rotate(-5deg);
      }

      .badge:nth-child(3n) {
        transform: rotate(-2deg);
      }

      .badge:nth-child(4n) {
        transform: rotate(5deg);
      }

      .badge:nth-child(5n) {
        transform: rotate(-7deg);
      }

      .badge:nth-child(6n) {
        transform: rotate(10deg);
      }

      .badge:nth-child(7n) {
        transform: rotate(5deg);
      }

      .badge:nth-child(8n) {
        transform: rotate(0deg);
      }

      /* .badge - hover */
      .badge:hover {
        transform: rotate(0deg);
      }

      /*   in-set - holds a badge in the box */
      .in-set {
        z-index: 0;
        border-radius: 50%;
        box-shadow: 0px 0px 7px 5px #000;
        position: absolute;
        width: 95%;
        padding-bottom: 95%;
        background: radial-gradient(circle, rgb(15 13 2) 0%, rgb(0 0 0) 33%);
      }

      .set-in {
        width: 12vw;
        height: 12vw;

        border-radius: 50%;
        background: radial-gradient(circle at 50% 49%, #fcfcfc, #cccfd0 36%, #bab8b3 91%);

        display: flex;
        justify-content: center;
        position: relative;
        transition: all 1s ease-in-out;
      }

      /*   set-in > img settings */
      .set-in>img {
        width: 12vw;
        height: 12vw;
        border-radius: 50%;
        filter: grayscale(0.6);
        transition: all 0.5s ease-in-out;
      }

      /*  set-in > animations */
      .set-in:hover {
        transform: scale(1.25);
      }

      .set-in:hover>img {
        filter: none;
      }

      .set-in:hover>.glint {
        transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
      }

      .set-in:hover>.shadow {
        box-shadow: -1px -1px 10px 5px #000000 inset;
      }

      /*   .shadow - a still shadow */
      .shadow {
        border-radius: 50%;
        width: 100%;
        height: 100%;
        box-shadow: -15px -10px 25px 10px #151612 inset;
        z-index: 100;
        position: absolute;
        transition: all 1s ease-out
      }

      /*   .glint - a moving glint */
      .glint {
        border-radius: 50%;
        z-index: 100;
        background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
        width: 100%;
        height: 100%;
        transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
        position: absolute;
        transition: all 1s ease-out;
      }



      * last button */ .last-layout {
        width 10vw;
      }

      .last-wrapper {
        border-radius: 50%;
        padding: 10px;

        box-shadow:
          inset 3px 5px 5px -1px rgb(255 255 255 / 50%),
          inset -3px -3px 5px -1px rgb(0 0 0 / 99%),
          1px 1px 1px 2px rgb(0 0 0 / 80%),
          2.5px 5px 5px 1px rgb(0 0 0 / 90%)
      }

      /* next button */
      .next-layout {
        width 10vw;
      }

      .next-wrapper {
        border-radius: 50%;
        padding: 10px;

        box-shadow:
          inset 3px 3px 3px -1px rgb(255 255 255 / 50%),
          inset -7px -1px 8px 1px rgb(0 0 0 / 99%),
          -1px 1px 1px 2px rgb(0 0 0 / 80%),
          2.5px 5px 5px 1px rgb(0 0 0 / 90%)
      }


      /* main menu */
      .button-layout {
        display: flex;
        flex-direction: column;
        justify-content: center;
      }

      .button-layout>div {
        margin: 6px;
      }

      .button-wrapper {
        display: flex;
        justify-content: center;
        align-content: center;
      }

      .button {
        padding: 5%;

        filter: grayscale(0.2);
        background: #E0B533;
        background-image: -webkit-linear-gradient(top, #E0B533, #E4AB05);
        background-image: -moz-linear-gradient(top, #E0B533, #E4AB05);
        background-image: -ms-linear-gradient(top, #E0B533, #E4AB05);
        background-image: -o-linear-gradient(top, #E0B533, #E4AB05);
        background-image: -webkit-gradient(to bottom, #E0B533, #E4AB05);
        -webkit-box-shadow: inset 0 0 10px 5px #1C1C1C;
        -moz-box-shadow: inset 0 0 10px 5px #1C1C1C;
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
        filter: grayscale(0);
        padding: 5%;

        background: #e3d4a8;
        background-image: -webkit-linear-gradient(top, #e3d4a8, #e2bb1c);
        background-image: -moz-linear-gradient(top, #e3d4a8, #e2bb1c);
        background-image: -ms-linear-gradient(top, #e3d4a8, #e2bb1c);
        background-image: -o-linear-gradient(top, #e3d4a8, #e2bb1c);
        background-image: -webkit-gradient(to bottom, #e3d4a8, #e2bb1c);
        -webkit-box-shadow: inset 0 0 10px 5px #1C1C1C;
        -moz-box-shadow: inset 0 0 10px 5px #1C1C1C;
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
        display: flex;
        flex-direction: column;

        background-image: radial-gradient(#9e7703 1px, transparent 1px), radial-gradient(#9e7703 1px, transparent 1px);
        background-size: 59px 59px;
        background-position: 0 0, 29.5px 29.5px;

        animation: pulse 12s infinite;
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

        display: flex;
        justify-content: center;
        align-items: center;
      }

      .main {
        height: 58vh;

        display: flex;
        justify-content: center;
        align-items: center;
      }

      .menu {
        height: 25vh;

        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
      }

      .toggles {
        display: flex;
        flex-direction: row;
        width: 90vw;
        height: 30%;
        align-items: center;
        justify-content: center;
      }

      .tog-ownd {
        width: 15%;
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .tog-tags {
        width: 40%;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .tog-tags > form {
        display: flex;
        align-items: center;
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
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .tog-host > form {
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0;
        height: 100%;
        width: 100%;
      }

      .tog-host > form > select {
        width: 80%;
      }

      .buttons {
        display: flex;
        align-items: center;
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

        transform: translate(-4vw, 0vh) rotate(270deg);
      }

      /* header formatting */
      .header {
        display: flex;
        justify-content: center;
        align-items: center;
      }

      /*   title */
      .title {
        z-index: 97;
        width: 75vw;
        height: 12vh;

        display: flex;
        justify-content: center;
        align-items: center;

        border: 4px outset #cecbbd;
        box-shadow: 0 0 15px -2px #444444;
        border-radius: 10px;

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

        backdrop-filter: brightness(0.6) grayscale(1) blur(1.5px);
      }

      /*   actual title - pitagora */
      .pitagora {
        z-index: 100;

        position: absolute;
        display: flex;
        flex-direction: column;
        justify-content: center;
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
        
        -webkit-box-shadow: 0px 0px 10px 2px #bb8c02, inset 0px 0px 20px 10px #000000, 5px 5px 15px 5px rgb(0 0 0 / 0%);
        box-shadow: 0px 0px 10px 2px #bb8c02, inset 0px 0px 20px 10px #000000, 5px 5px 15px 5px rgb(0 0 0 / 0%);

        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        margin-inline: 2%;

        background-image: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 40 40' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M20 20.5V18H0v-2h20v-2H0v-2h20v-2H0V8h20V6H0V4h20V2H0V0h22v20h2V0h2v20h2V0h2v20h2V0h2v20h2V0h2v20h2v2H20v-1.5zM0 20h2v20H0V20zm4 0h2v20H4V20zm4 0h2v20H8V20zm4 0h2v20h-2V20zm4 0h2v20h-2V20zm4 4h20v2H20v-2zm0 4h20v2H20v-2zm0 4h20v2H20v-2zm0 4h20v2H20v-2z' fill='%236a6259' fill-opacity='0.095' fill-rule='evenodd'/%3E%3C/svg%3E");
        background-color: #151612;
      }

      .badge-box > a {
        margin-inline: 2%
      }

      /*   badge - a badge inset in the box */
      .badge {
        width: 17vw;

        border-radius: 50%;

        display: flex;
        justify-content: center;
        align-items: center;
        margin-inline: 2%;

        transition: transform 0.7s ease-in-out;
      }

      /*   .badge - children */
      .badge:nth-child(1n) {
        transform: rotate(2deg);
      }

      .badge:nth-child(2n) {
        transform: rotate(-5deg);
      }

      .badge:nth-child(3n) {
        transform: rotate(-2deg);
      }

      .badge:nth-child(4n) {
        transform: rotate(5deg);
      }

      .badge:nth-child(5n) {
        transform: rotate(-7deg);
      }

      .badge:nth-child(6n) {
        transform: rotate(10deg);
      }

      .badge:nth-child(7n) {
        transform: rotate(5deg);
      }

      .badge:nth-child(8n) {
        transform: rotate(0deg);
      }

      /* .badge - hover */
      .badge:hover {
        transform: rotate(0deg);
      }

      /*   in-set - holds a badge in the box */
      .in-set {
        z-index: 0;
        border-radius: 50%;
        box-shadow: 0px 0px 7px 5px #000;
        position: absolute;
        width: 15vw;
        padding-bottom: 15vw;
        background: radial-gradient(circle, rgb(15 13 2) 0%, rgb(0 0 0) 33%);
      }

      .set-in {
        width: 15vw;
        height: 15vw;

        border-radius: 50%;
        background: radial-gradient(circle at 50% 49%, #fcfcfc, #cccfd0 36%, #bab8b3 91%);

        display: flex;
        justify-content: center;
        position: relative;
        transition: all 1s ease-in-out;
      }

      /*   set-in > img settings */
      .set-in>img {
        width: 15vw;
        height: 15vw;
        border-radius: 50%;
        filter: grayscale(0.6);
        transition: all 0.5s ease-in-out;
      }

      /*  set-in > animations */
      .set-in:hover {
        transform: scale(1.25);
      }

      .set-in:hover>img {
        filter: none;
      }

      .set-in:hover>.glint {
        transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
      }

      .set-in:hover>.shadow {
        box-shadow: -1px -1px 10px 5px #000000 inset;
      }

      /*   .shadow - a still shadow */
      .shadow {
        border-radius: 50%;
        width: 100%;
        height: 100%;
        box-shadow: -15px -10px 25px 10px #151612 inset;
        z-index: 100;
        position: absolute;
        transition: all 1s ease-out
      }

      /*   .glint - a moving glint */
      .glint {
        border-radius: 50%;
        z-index: 100;
        background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
        width: 100%;
        height: 100%;
        transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
        position: absolute;
        transition: all 1s ease-out;
      }

      /* last button */
      .last-layout {
        width 10vw;
      }

      .last-wrapper {
        border-radius: 50%;
        padding: 10px;

        box-shadow:
          inset 3px 5px 5px -1px rgb(255 255 255 / 50%),
          inset -3px -3px 5px -1px rgb(0 0 0 / 99%),
          1px 1px 1px 2px rgb(0 0 0 / 80%),
          2.5px 5px 5px 1px rgb(0 0 0 / 90%)
      }

      /* next button */
      .next-layout {
        width 10vw;
      }

      .next-wrapper {
        border-radius: 50%;
        padding: 10px;

        box-shadow:
          inset 3px 3px 3px -1px rgb(255 255 255 / 50%),
          inset -7px -1px 8px 1px rgb(0 0 0 / 99%),
          -1px 1px 1px 2px rgb(0 0 0 / 80%),
          2.5px 5px 5px 1px rgb(0 0 0 / 90%)
      }


      /* main menu */
      .button-layout {
        width: 65vw;
        display: flex;
        justify-content: center;
      }

      .button-layout>div {
        margin: 6px;
      }

      .button-wrapper {
        width: 15vw;
        display: flex;
        justify-content: center;
        align-content: center;
      }

      .button {
        padding: 5%;

        filter: grayscale(0.2);
        background: #E0B533;
        background-image: -webkit-linear-gradient(top, #E0B533, #E4AB05);
        background-image: -moz-linear-gradient(top, #E0B533, #E4AB05);
        background-image: -ms-linear-gradient(top, #E0B533, #E4AB05);
        background-image: -o-linear-gradient(top, #E0B533, #E4AB05);
        background-image: -webkit-gradient(to bottom, #E0B533, #E4AB05);
        -webkit-box-shadow: inset 0 0 10px 5px #1C1C1C;
        -moz-box-shadow: inset 0 0 10px 5px #1C1C1C;
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
        filter: grayscale(0);
        padding: 5%;

        background: #e3d4a8;
        background-image: -webkit-linear-gradient(top, #e3d4a8, #e2bb1c);
        background-image: -moz-linear-gradient(top, #e3d4a8, #e2bb1c);
        background-image: -ms-linear-gradient(top, #e3d4a8, #e2bb1c);
        background-image: -o-linear-gradient(top, #e3d4a8, #e2bb1c);
        background-image: -webkit-gradient(to bottom, #e3d4a8, #e2bb1c);
        -webkit-box-shadow: inset 0 0 10px 5px #1C1C1C;
        -moz-box-shadow: inset 0 0 10px 5px #1C1C1C;
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

      backdrop-filter: blur(1px) grayscale(.7);
      box-shadow: 0px 0px 15px 2px #bb8c02ee,
                  inset 5px 5px 20px 5px #bb8c02a1;
      transition: all 0.5s ease-in-out;
    }

    .set-in:hover>.unowned {
      backdrop-filter: blur(0px) grayscale(.2);
    }

    .tog-on {
      width: 5vh;
      height: 5vh;
      border-radius: 50%;

      box-shadow: 0px 2px 3px 1px #fff30080,
                  0px 2px 1px 3px #5f5000;
      background: radial-gradient(circle, rgb(246 236 74) 0%, rgb(214 192 0 / 90%) 33%, rgb(168 138 8) 65%, rgb(255 222 1) 100%);
    }
    .tog-off {
      width: 5vh;
      height: 5vh;
      border-radius: 50%;

      box-shadow: 0px 2px 3px 1px #948e1180,
                  0px 2px 1px 3px #1f1a01;
      background: radial-gradient(circle, rgb(80 79 67) 0%, rgb(112 101 15 / 90%) 33%, rgb(84 71 14) 65%, rgb(255 222 1) 100%);
    }


    .tog-drop {
      background: none;
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