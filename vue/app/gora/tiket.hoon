::
::  stakm - stak some gorae, on an old one, or not!
::
/-  *gora
/+  rudder, *mip
::
^-  (page:rudder tack manage-gora-2)
|_  [bol=bowl:gall odo=order:rudder sat=tack]
++  final  (alert:rudder 'tiket' build)
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
  |^  [%page page]
  ++  page
    ^-  manx
    ;html
      ;head
        ;title:"ゴラ - {(trip 'ログブック')}"
        ;style:"{(trip style)}"
        ;meta(charset "utf-8");
        ;meta
          =name     "viewport"
          =content  "width=device-width, initial-scale=1";
      ==
    ::
      ;body
        ;div(class "modal-container")
          ;+  failure:modals:make
          ;+  success:modals:make
        ==
        ;div(class "container")
          ;div(class "title-bar")
            ;div(class "title-pane")
              ;div(class "title"):"{(trip 'ログブック')}"
              ;div(class "title-glass");
            ==
          ==
        ::
          ;div(class "logs-pane")
            ;div(class "offers-container")
              ;div(class "offTable")
                ;+  off:make
              ==
            ==
          ::
            ;div(class "requests-container")
              ;div(class "reqTable")
                ;+  ple:make
              ==
            ==
          ::
            ;div(class "outgoing-container")
              ;div(class "outTable")
                ;+  out:make
              ==
            ==
          ==
        ::
          ;+  =-  (circle:make [- "." %.n])
              ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                ;path(fill "#bb8c02", d "M5.625 20.775q-.975 0-1.687-.713-.713-.712-.713-1.687 0-.975.713-1.675.712-.7 1.687-.7.975 0 1.675.7.7.7.7 1.675 0 .975-.7 1.687-.7.713-1.675.713Zm6.375 0q-.975 0-1.675-.713-.7-.712-.7-1.687 0-.975.7-1.675.7-.7 1.675-.7.975 0 1.675.7.7.7.7 1.675 0 .975-.7 1.687-.7.713-1.675.713Zm6.375 0q-.975 0-1.675-.713-.7-.712-.7-1.687 0-.975.7-1.675.7-.7 1.675-.7.975 0 1.687.7.713.7.713 1.675 0 .975-.713 1.687-.712.713-1.687.713Zm-12.75-6.4q-.975 0-1.687-.7-.713-.7-.713-1.675 0-.975.713-1.675.712-.7 1.687-.7.975 0 1.675.7.7.7.7 1.675 0 .975-.7 1.675-.7.7-1.675.7Zm6.375 0q-.975 0-1.675-.7-.7-.7-.7-1.675 0-.975.7-1.675.7-.7 1.675-.7.975 0 1.675.7.7.7.7 1.675 0 .975-.7 1.675-.7.7-1.675.7Zm6.375 0q-.975 0-1.675-.7-.7-.7-.7-1.675 0-.975.7-1.675.7-.7 1.675-.7.975 0 1.687.7.713.7.713 1.675 0 .975-.713 1.675-.712.7-1.687.7ZM5.625 8q-.975 0-1.687-.7-.713-.7-.713-1.675 0-.975.713-1.688.712-.712 1.687-.712.975 0 1.675.712.7.713.7 1.688T7.3 7.3q-.7.7-1.675.7ZM12 8q-.975 0-1.675-.7-.7-.7-.7-1.675 0-.975.7-1.688.7-.712 1.675-.712.975 0 1.675.712.7.713.7 1.688t-.7 1.675q-.7.7-1.675.7Zm6.375 0Q17.4 8 16.7 7.3q-.7-.7-.7-1.675 0-.975.7-1.688.7-.712 1.675-.712.975 0 1.687.712.713.713.713 1.688T20.062 7.3q-.712.7-1.687.7Z");
              ==
        ==
      ::
        ;script:"{(trip script)}"
      ==
    ==
  ++  make
    |%
    ++  modals
      |%
      ++  failure
        ^-  manx
        ?~  msgs  ;div;
        ?:  gud.u.msgs  ;div;
        ;div(id "fail-message", class "modal", style "display: block;")
          ;div(class "modal-center")
            ;div(class "modal-header-error")
              ;div(class "name")
                ;p:"ゴラ失敗"
              ==
            ==
          ::
            ;div(class "modal-body")
            ::
              ;div(class "delete-command")
                ;p:"{(trip txt.u.msgs)}"
              ==
            ==
          ==
        ==
      ::
      ++  success
        ^-  manx
        ?~  msgs  ;div;
        ?.  gud.u.msgs  ;div;
        ;div(id "succ-message", class "modal", style "display: block;")
          ;div(class "modal-center")
            ;div(class "modal-header-success")
              ;div(class "name")
                ;p:"ゴラ成功"
              ==
            ==
          ::
            ;div(class "modal-body")
            ::
              ;div(class "delete-command")
                ;div
                  ;pre:"{(trip txt.u.msgs)}"
                ==
              ==
            ==
          ==
        ==
      --
    ++  circle
      ::  use  fill "#bb8c02", in svg
      ::
      |=  [svg=manx loc=tape dir=?]
      ?:  dir
        ;div(class "right-layout")
          ;div(class "right-wrapper")
            ;a(class "round-button", href "{loc}")
              ;+  svg
            ==
          ==
        ==
        ::
      ;div(class "left-layout")
        ;div(class "left-wrapper")
          ;a(class "round-button", href "{loc}")
            ;+  svg
          ==
        ==
      ==
    ++  off
      =;  rows=marl
        ;table
          ;thead
            ;tr
              ;th:"名前"     ::  what
              ;th:"ホスト"   ::  host
              ;th:"リンク"   ::  link
            ==
          ==
        ::
          ;tbody
            ;*  rows
          ==
        ==
      %+  murn  ~(tap in offers.logs.sat)
      |=  i=id
      ?~  gor=(~(get by pita.sat) i)  ~
      :-  ~
      ;tr
        ;td:"{(trip name.u.gor)}"
        ;td:"{(scow %p host.u.gor)}"
        ;td
          ;a(href "./voyer?gora={(scow %uv i)}")
            ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
              ;path(fill "#bb8c02", d "M10.625 17.85H7q-2.425 0-4.137-1.713Q1.15 14.425 1.15 12t1.713-4.138Q4.575 6.15 7 6.15h3.625V9.3H7q-1.125 0-1.912.787Q4.3 10.875 4.3 12t.788 1.912Q5.875 14.7 7 14.7h3.625Zm-3.2-4.65v-2.4h9.15v2.4Zm5.95 4.65V14.7H17q1.125 0 1.913-.788.787-.787.787-1.912t-.787-1.913Q18.125 9.3 17 9.3h-3.625V6.15H17q2.425 0 4.138 1.712Q22.85 9.575 22.85 12t-1.712 4.137Q19.425 17.85 17 17.85Z");
            ==
          ==
        ==
      ==
    ++  ple
      =;  rows=marl
        ;table
          ;thead
            ;tr
              ;th:"誰"      ::  ship
              ;th:"リンク"   ::  link
            ==
          ==
        ::
          ;tbody
            ;*  rows
          ==
        ==
      %+  turn  ~(tap in ~(key by requests.logs.sat))
      |=  s=ship
      ;tr
        ;td:"{(scow %p s)}"
        ;td
          ;a(href "./asked?who={(scow %p s)}")
            ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
              ;path(fill "#bb8c02", d "M10.625 17.85H7q-2.425 0-4.137-1.713Q1.15 14.425 1.15 12t1.713-4.138Q4.575 6.15 7 6.15h3.625V9.3H7q-1.125 0-1.912.787Q4.3 10.875 4.3 12t.788 1.912Q5.875 14.7 7 14.7h3.625Zm-3.2-4.65v-2.4h9.15v2.4Zm5.95 4.65V14.7H17q1.125 0 1.913-.788.787-.787.787-1.912t-.787-1.913Q18.125 9.3 17 9.3h-3.625V6.15H17q2.425 0 4.138 1.712Q22.85 9.575 22.85 12t-1.712 4.137Q19.425 17.85 17 17.85Z");
            ==
          ==
        ==
      ==
    ++  out
      =;  rows=marl
        ;table
          ;thead
            ;tr
              ;th:"いつ"     ::  date
              ;th:"行為"     ::  what
              ;th:"ホスト"   ::  host
              ;th:"確認済み" ::  ackd
            ==
          ==
        ::
          ;tbody
            ;*  rows
          ==
        ==
      %+  turn
        %+  sort  ~(tap bi outgoing.logs.sat)
        |=([[@ [@ @] [a=@ *]] [@ [@ @] [b=@ *]]] (gth a b))
      |=  [i=id [s=ship g=?(%give %take %gack)] [w=@da a=(unit ?)]]
      ;tr
        ;td(class "date"):"{(scow %da (sub w (mod w ~d1)))}"
      ::
        ;td(class "action")
          ;p(class "act"):"{(scow %tas g)}"
          ;p(class "id"):"{(scow %uv i)}"
        ==
      ::
        ;td(class "ship"):"{(scow %p s)}"
      ::
        ;+  ?~  a
              ;td(class "status", style "color: white;"):"pend"
            ?:  u.a
              ;td(class "status", style "color: #72ff13;"):"ack"
            ;td(class "status", style "color: #c70000;"):"nack"
      ==
    --
  ::
  ++  script
    '''
    var fails = document.getElementById("fail-message");
    var succs = document.getElementById("succ-message");

    window.onclick = function(event) {
      if (event.target == fails) {
        fails.style.display = "none";
      } else if (event.target == succs) {
        succs.style.display = "none";
      }
    '''
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

    /* table basics */
    .offTable { overflow: auto; }
    .offTable thead th { position: sticky; top: 0; z-index: 1; }

    .reqTable { overflow: auto; }
    .reqTable thead th { position: sticky; top: 0; z-index: 1; }

    .outTable { overflow: auto; }
    .outTable thead th { position: sticky; top: 0; z-index: 1; }

    table { border-collapse: collapse; width: 100%; height: 100%}
    th, td { 
      padding: 8px 5px;
      text-align: center;
      color: white;
    }

    pre {
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
      text-align: center; 
    }

    /* left-round */
    .left-layout {
      cursor: pointer;
      border-radius: 50%;
      padding: 10px;
      margin: 10px;
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

    /* right-round */
    .right-layout {
      cursor: pointer;
      border-radius: 50%;
      padding: 10px;
      margin: 10px;
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

    /* animations */
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

    /* phone - vertical */
    @media (max-aspect-ratio: 9/16) {
      /* whole container */
      .container {
        width: 97vw;
        height: 98vh;
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

        background-image: -o-radial-gradient(#9e7703 1px, transparent 1px), -o-radial-gradient(#9e7703 1px, transparent 1px);

        background-image: radial-gradient(#9e7703 1px, transparent 1px), radial-gradient(#9e7703 1px, transparent 1px);
        background-size: 59px 59px;
        background-position: 0 0, 29.5px 29.5px;

        -webkit-animation: pulse 12s infinite;

                animation: pulse 12s infinite;
      }

      /* title format */
      .title-bar {
        width: 95vw;
        height: 25vw;
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

      .title-pane {
        width: 90vw;
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

        border: 3px outset rgba(194,166,90,.8);
        border-radius: 10px;

        background: -o-radial-gradient(circle, transparent 20%, #35383582 80%, #35383582 80%, transparent 80%, transparent),
                    -o-radial-gradient(circle, transparent 20%, #35383582 80%, #35383582 80%, transparent 80%, transparent) 20px 20px,
                    -o-linear-gradient(#ffd900 1.6px, transparent 1.6px) 0 -0.8px,
                    -o-linear-gradient(left, #ffd900 1.6px, #35383582 1.6px) -0.8px 0;

        background: radial-gradient(circle, transparent 20%, #35383582 80%, #35383582 80%, transparent 80%, transparent),
                    radial-gradient(circle, transparent 20%, #35383582 80%, #35383582 80%, transparent 80%, transparent) 20px 20px,
                    linear-gradient(#ffd900 1.6px, transparent 1.6px) 0 -0.8px,
                    linear-gradient(90deg, #ffd900 1.6px, #35383582 1.6px) -0.8px 0;
        background-size: 40px 40px,
                         40px 40px,
                         20px 20px,
                         20px 20px;
        -webkit-box-shadow: 0px 0px 0px 2px #000,
                    inset 0px 1px 20px 5px #000;
                box-shadow: 0px 0px 0px 2px #000,
                    inset 0px 1px 20px 5px #000;
      }

      .title-glass {
        z-index: 10;
        width: 90vw;
        height: 20vw;
        position: absolute;
        -webkit-backdrop-filter: grayscale(0%) blur(2px);
                backdrop-filter: grayscale(0%) blur(2px);
      }

      .title {
        z-index: 20;
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


      /* main format */
      
      .logs-pane {
        width: 95vw;
        height: 75vh;
        
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

      /* offers */
      .offers-container {
        width: 90vw;
        height: 20vh;
        margin-bottom: 15px;

        border-radius: 10px;
        -webkit-box-shadow: 0px 2px 5px 2px #bb8c0282;
                box-shadow: 0px 2px 5px 2px #bb8c0282;
        -webkit-backdrop-filter: blur(2px) invert(.1);
                backdrop-filter: blur(2px) invert(.1);

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

      .offTable {
        width: 90vw;
        height: 20vh;
      }
      
      .offTable > table > thead > tr > th {
        -webkit-box-shadow: 0px 0px 0px 1px #ffe7a1,
                    inset 0px 0px 30px 2px #ffe7a1;
                box-shadow: 0px 0px 0px 1px #ffe7a1,
                    inset 0px 0px 30px 2px #ffe7a1;
        border-radius: 5px;
      }

      .offTable > table > tbody > tr:nth-child(even) {
        -webkit-box-shadow: 0px 0px 0px 1px #eee5cc,
                    inset 0px 0px 50px 2px #eee5cc;
                box-shadow: 0px 0px 0px 1px #eee5cc,
                    inset 0px 0px 50px 2px #eee5cc;
      }
      .offTable > table > tbody > tr:nth-child(odd) {
        -webkit-box-shadow: 0px 0px 0px 1px #9a8f6f,
            inset 0px 0px 50px 5px #9a8f6f;
                box-shadow: 0px 0px 0px 1px #9a8f6f,
            inset 0px 0px 50px 5px #9a8f6f;
      }

      
      /* requests */
      .requests-container {
        width: 90vw;
        height: 20vh;
        margin-bottom: 15px;

        border-radius: 10px;
        -webkit-box-shadow: 0px 2px 5px 2px #bb8c0282;
                box-shadow: 0px 2px 5px 2px #bb8c0282;
        -webkit-backdrop-filter: blur(2px) invert(.1);
                backdrop-filter: blur(2px) invert(.1);

      }

      .reqTable {
        width: 90vw;
        height: 20vh;
      }

      .reqTable > table > thead > tr > th {
        -webkit-box-shadow: 0px 0px 0px 1px #edcc6a,
            inset 0px 0px 30px 2px #edcc6a;
                box-shadow: 0px 0px 0px 1px #edcc6a,
            inset 0px 0px 30px 2px #edcc6a;
        border-radius: 2px;
      }

      .reqTable > table > tbody > tr:nth-child(even) {
        -webkit-box-shadow: 0px 0px 0px 1px #f2dda3,
                    inset 0px 0px 50px 2px #f2dda3;
                box-shadow: 0px 0px 0px 1px #f2dda3,
                    inset 0px 0px 50px 2px #f2dda3;
      }
      .reqTable > table > tbody > tr:nth-child(odd) {
        -webkit-box-shadow: 0px 0px 0px 1px #a58e4b,
            inset 0px 0px 50px 5px #a58e4b;
                box-shadow: 0px 0px 0px 1px #a58e4b,
            inset 0px 0px 50px 5px #a58e4b;
      }

      /* outgoing logs */
      .outgoing-container {
        width: 90vw;
        height: 30vh;

        border-radius: 10px;
        -webkit-box-shadow: 0px 2px 5px 2px #bb8c0282;
                box-shadow: 0px 2px 5px 2px #bb8c0282;
        -webkit-backdrop-filter: blur(2px) invert(.1);
                backdrop-filter: blur(2px) invert(.1);

      }
      
      .outTable {
        width: 90vw;
        height: 30vh;
      }

      .date {
        font-size: 10px;
        color: white;
      }

      .act {
        font-size: 12px;
        color: #ffbe00;
        margin: 0px;
      }

      .id {
        font-size: 8px;
        color: white;
        margin: 0px;
      }

      .ship {
       font-size: 10px;
       color: white;
      }

      .status {
        font-size: 10px;
      }

      .outTable > table > thead > tr > th {
        -webkit-box-shadow: 0px 0px 0px 1px #edcc6a,
            inset 0px 0px 30px 2px #edcc6a;
                box-shadow: 0px 0px 0px 1px #edcc6a,
            inset 0px 0px 30px 2px #edcc6a;
        border-radius: 2px;
      }

      .outTable > table > tbody > tr:nth-child(even) {
        -webkit-box-shadow: 0px 0px 0px 1px #f2dda3,
                    inset 0px 0px 50px 2px #f2dda3;
                box-shadow: 0px 0px 0px 1px #f2dda3,
                    inset 0px 0px 50px 2px #f2dda3;
      }
      .outTable > table > tbody > tr:nth-child(odd) {
        -webkit-box-shadow: 0px 0px 0px 1px #a58e4b,
            inset 0px 0px 50px 5px #a58e4b;
                box-shadow: 0px 0px 0px 1px #a58e4b,
            inset 0px 0px 50px 5px #a58e4b;
      }

    }

    @media (min-aspect-ratio: 9/16) and (max-aspect-ratio: 16/9) {
      /* whole container */
      .container {
        width: 100%;
        height: 100%;
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

        background-image: -o-radial-gradient(#9e7703 1px, transparent 1px),
          -o-radial-gradient(#9e7703 1px, transparent 1px);

        background-image: radial-gradient(#9e7703 1px, transparent 1px),
          radial-gradient(#9e7703 1px, transparent 1px);
        background-size: 59px 59px;
        background-position: 0 0, 29.5px 29.5px;

        -webkit-animation: pulse 12s infinite;

                animation: pulse 12s infinite;
      }

      /* title format */
      .title-bar {
        width: 50vw;
        height: 12vw;
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

      .title-pane {
        width: 45vw;
        height: 10vw;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;

        border: 3px outset rgba(194, 166, 90, 0.8);
        border-radius: 10px;

        background: -o-radial-gradient(
            circle,
            transparent 20%,
            #35383582 80%,
            #35383582 80%,
            transparent 80%,
            transparent
          ),
          -o-radial-gradient(
              circle,
              transparent 20%,
              #35383582 80%,
              #35383582 80%,
              transparent 80%,
              transparent
            )
            20px 20px,
          -o-linear-gradient(#ffd900 1.6px, transparent 1.6px) 0 -0.8px,
          -o-linear-gradient(left, #ffd900 1.6px, #35383582 1.6px) -0.8px 0;

        background: radial-gradient(
            circle,
            transparent 20%,
            #35383582 80%,
            #35383582 80%,
            transparent 80%,
            transparent
          ),
          radial-gradient(
              circle,
              transparent 20%,
              #35383582 80%,
              #35383582 80%,
              transparent 80%,
              transparent
            )
            20px 20px,
          linear-gradient(#ffd900 1.6px, transparent 1.6px) 0 -0.8px,
          linear-gradient(90deg, #ffd900 1.6px, #35383582 1.6px) -0.8px 0;
        background-size: 40px 40px, 40px 40px, 20px 20px, 20px 20px;
        -webkit-box-shadow: 0px 0px 0px 2px #000, inset 0px 1px 20px 5px #000;
                box-shadow: 0px 0px 0px 2px #000, inset 0px 1px 20px 5px #000;
      }

      .title-glass {
        z-index: 10;
        width: 45vw;
        height: 10vw;
        position: absolute;
        -webkit-backdrop-filter: grayscale(0%) blur(2px);
                backdrop-filter: grayscale(0%) blur(2px);
      }

      .title {
        z-index: 20;
        font-size: 7vw;
        color: #ffc107;
        font-family: Lucida Console;
        font-weight: bold;
        text-shadow: 0px 0px 0 rgb(227, 165, 0), 0px 1px 0 rgb(199, 137, 0),
          0px 2px 0 rgb(171, 109, 0), 0px 3px 0 rgb(143, 81, 0),
          0px 4px 3px rgba(0, 0, 0, 0.6), 0px 4px 1px rgba(0, 0, 0, 0.5),
          0px 0px 3px rgba(0, 0, 0, 0.2);
      }

      /* main format */

      .logs-pane {
        width: 95vw;
        height: 75vh;

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

      /* offers */
      .offers-container {
        width: 90vw;
        height: 20vh;
        margin-bottom: 15px;

        border-radius: 10px;
        -webkit-box-shadow: 0px 2px 5px 2px #bb8c0282;
                box-shadow: 0px 2px 5px 2px #bb8c0282;
        -webkit-backdrop-filter: blur(2px) invert(0.1);
                backdrop-filter: blur(2px) invert(0.1);

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

      .offTable {
        width: 90vw;
        height: 20vh;
      }

      .offTable > table > thead > tr > th {
        -webkit-box-shadow: 0px 0px 0px 1px #ffe7a1, inset 0px 0px 30px 2px #ffe7a1;
                box-shadow: 0px 0px 0px 1px #ffe7a1, inset 0px 0px 30px 2px #ffe7a1;
        border-radius: 5px;
      }

      .offTable > table > tbody > tr:nth-child(even) {
        -webkit-box-shadow: 0px 0px 0px 1px #eee5cc, inset 0px 0px 50px 2px #eee5cc;
                box-shadow: 0px 0px 0px 1px #eee5cc, inset 0px 0px 50px 2px #eee5cc;
      }
      .offTable > table > tbody > tr:nth-child(odd) {
        -webkit-box-shadow: 0px 0px 0px 1px #9a8f6f, inset 0px 0px 50px 5px #9a8f6f;
                box-shadow: 0px 0px 0px 1px #9a8f6f, inset 0px 0px 50px 5px #9a8f6f;
      }

      /* requests */
      .requests-container {
        width: 90vw;
        height: 20vh;
        margin-bottom: 15px;

        border-radius: 10px;
        -webkit-box-shadow: 0px 2px 5px 2px #bb8c0282;
                box-shadow: 0px 2px 5px 2px #bb8c0282;
        -webkit-backdrop-filter: blur(2px) invert(0.1);
                backdrop-filter: blur(2px) invert(0.1);
      }

      .reqTable {
        width: 90vw;
        height: 20vh;
      }

      .reqTable > table > thead > tr > th {
        -webkit-box-shadow: 0px 0px 0px 1px #edcc6a, inset 0px 0px 30px 2px #edcc6a;
                box-shadow: 0px 0px 0px 1px #edcc6a, inset 0px 0px 30px 2px #edcc6a;
        border-radius: 2px;
      }

      .reqTable > table > tbody > tr:nth-child(even) {
        -webkit-box-shadow: 0px 0px 0px 1px #f2dda3, inset 0px 0px 50px 2px #f2dda3;
                box-shadow: 0px 0px 0px 1px #f2dda3, inset 0px 0px 50px 2px #f2dda3;
      }
      .reqTable > table > tbody > tr:nth-child(odd) {
        -webkit-box-shadow: 0px 0px 0px 1px #a58e4b, inset 0px 0px 50px 5px #a58e4b;
                box-shadow: 0px 0px 0px 1px #a58e4b, inset 0px 0px 50px 5px #a58e4b;
      }

      /* outgoing logs */
      .outgoing-container {
        width: 90vw;
        height: 30vh;

        border-radius: 10px;
        -webkit-box-shadow: 0px 2px 5px 2px #bb8c0282;
                box-shadow: 0px 2px 5px 2px #bb8c0282;
        -webkit-backdrop-filter: blur(2px) invert(0.1);
                backdrop-filter: blur(2px) invert(0.1);
      }

      .outTable {
        width: 90vw;
        height: 30vh;
      }

      .date {
        font-size: 14px;
        color: white;
      }

      .act {
        font-size: 14px;
        color: #ffbe00;
        margin: 0px;
      }

      .id {
        font-size: 12px;
        color: white;
        margin: 0px;
      }

      .ship {
        font-size: 14px;
        color: white;
      }

      .status {
        font-size: 14px;
      }

      .outTable > table > thead > tr > th {
        -webkit-box-shadow: 0px 0px 0px 1px #edcc6a, inset 0px 0px 30px 2px #edcc6a;
                box-shadow: 0px 0px 0px 1px #edcc6a, inset 0px 0px 30px 2px #edcc6a;
        border-radius: 2px;
      }

      .outTable > table > tbody > tr:nth-child(even) {
        -webkit-box-shadow: 0px 0px 0px 1px #f2dda3, inset 0px 0px 50px 2px #f2dda3;
                box-shadow: 0px 0px 0px 1px #f2dda3, inset 0px 0px 50px 2px #f2dda3;
      }
      .outTable > table > tbody > tr:nth-child(odd) {
        -webkit-box-shadow: 0px 0px 0px 1px #a58e4b, inset 0px 0px 50px 5px #a58e4b;
                box-shadow: 0px 0px 0px 1px #a58e4b, inset 0px 0px 50px 5px #a58e4b;
      }
    }


    @media (min-aspect-ratio: 16/9) {
      /* whole container */
      .container {
        width: 98vw;
        height: 97vh;
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

        background-image: -o-radial-gradient(#9e7703 1px, transparent 1px),
          -o-radial-gradient(#9e7703 1px, transparent 1px);

        background-image: radial-gradient(#9e7703 1px, transparent 1px),
          radial-gradient(#9e7703 1px, transparent 1px);
        background-size: 59px 59px;
        background-position: 0 0, 29.5px 29.5px;

        -webkit-animation: pulse 12s infinite;

                animation: pulse 12s infinite;
      }

      /* title format */
      .title-bar {
        width: 15vw;
        height: 95vw;
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

      .title-pane {
        position: absolute;
        -webkit-transform: rotate(270deg);
            -ms-transform: rotate(270deg);
                transform: rotate(270deg);
        width: 90vh;
        height: 10vw;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;

        border: 3px outset rgba(194, 166, 90, 0.8);
        border-radius: 10px;

        background: -o-radial-gradient(
            circle,
            transparent 20%,
            #35383582 80%,
            #35383582 80%,
            transparent 80%,
            transparent
          ),
          -o-radial-gradient(
              circle,
              transparent 20%,
              #35383582 80%,
              #35383582 80%,
              transparent 80%,
              transparent
            )
            20px 20px,
          -o-linear-gradient(#ffd900 1.6px, transparent 1.6px) 0 -0.8px,
          -o-linear-gradient(left, #ffd900 1.6px, #35383582 1.6px) -0.8px 0;

        background: radial-gradient(
            circle,
            transparent 20%,
            #35383582 80%,
            #35383582 80%,
            transparent 80%,
            transparent
          ),
          radial-gradient(
              circle,
              transparent 20%,
              #35383582 80%,
              #35383582 80%,
              transparent 80%,
              transparent
            )
            20px 20px,
          linear-gradient(#ffd900 1.6px, transparent 1.6px) 0 -0.8px,
          linear-gradient(90deg, #ffd900 1.6px, #35383582 1.6px) -0.8px 0;
        background-size: 40px 40px, 40px 40px, 20px 20px, 20px 20px;
        -webkit-box-shadow: 0px 0px 0px 2px #000, inset 0px 1px 20px 5px #000;
                box-shadow: 0px 0px 0px 2px #000, inset 0px 1px 20px 5px #000;
      }

      .title-glass {
        z-index: 10;
        width: 90vw;
        height: 20vw;
        position: absolute;
        -webkit-backdrop-filter: grayscale(0%) blur(2px);
                backdrop-filter: grayscale(0%) blur(2px);
      }

      .title {
        z-index: 20;
        font-size: 7vw;
        color: #ffc107;
        font-family: Lucida Console;
        font-weight: bold;
        text-shadow: 0px 0px 0 rgb(227, 165, 0), 0px 1px 0 rgb(199, 137, 0),
          0px 2px 0 rgb(171, 109, 0), 0px 3px 0 rgb(143, 81, 0),
          0px 4px 3px rgba(0, 0, 0, 0.6), 0px 4px 1px rgba(0, 0, 0, 0.5),
          0px 0px 3px rgba(0, 0, 0, 0.2);
      }

      /* main format */

      .logs-pane {
        -webkit-transform: rotate(270deg);
            -ms-transform: rotate(270deg);
                transform: rotate(270deg);
        width: 75vw;
        height: 95vh;

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

      /* offers */
      .offers-container {
        width: 90vh;
        height: 20vw;
        margin-bottom: 15px;

        border-radius: 10px;
        -webkit-box-shadow: 0px 2px 5px 2px #bb8c0282;
                box-shadow: 0px 2px 5px 2px #bb8c0282;
        -webkit-backdrop-filter: blur(2px) invert(0.1);
                backdrop-filter: blur(2px) invert(0.1);

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

      .offTable {
        width: 90vh;
        height: 20vw;
      }

      .offTable > table > thead > tr > th {
        -webkit-box-shadow: 0px 0px 0px 1px #ffe7a1, inset 0px 0px 30px 2px #ffe7a1;
                box-shadow: 0px 0px 0px 1px #ffe7a1, inset 0px 0px 30px 2px #ffe7a1;
        border-radius: 5px;
      }

      .offTable > table > tbody > tr:nth-child(even) {
        -webkit-box-shadow: 0px 0px 0px 1px #eee5cc, inset 0px 0px 50px 2px #eee5cc;
                box-shadow: 0px 0px 0px 1px #eee5cc, inset 0px 0px 50px 2px #eee5cc;
      }
      .offTable > table > tbody > tr:nth-child(odd) {
        -webkit-box-shadow: 0px 0px 0px 1px #9a8f6f, inset 0px 0px 50px 5px #9a8f6f;
                box-shadow: 0px 0px 0px 1px #9a8f6f, inset 0px 0px 50px 5px #9a8f6f;
      }

      /* requests */
      .requests-container {
        width: 90vh;
        height: 20vw;
        margin-bottom: 15px;

        border-radius: 10px;
        -webkit-box-shadow: 0px 2px 5px 2px #bb8c0282;
                box-shadow: 0px 2px 5px 2px #bb8c0282;
        -webkit-backdrop-filter: blur(2px) invert(0.1);
                backdrop-filter: blur(2px) invert(0.1);
      }

      .reqTable {
        width: 90vh;
        height: 20vw;
      }

      .reqTable > table > thead > tr > th {
        -webkit-box-shadow: 0px 0px 0px 1px #edcc6a, inset 0px 0px 30px 2px #edcc6a;
                box-shadow: 0px 0px 0px 1px #edcc6a, inset 0px 0px 30px 2px #edcc6a;
        border-radius: 2px;
      }

      .reqTable > table > tbody > tr:nth-child(even) {
        -webkit-box-shadow: 0px 0px 0px 1px #f2dda3, inset 0px 0px 50px 2px #f2dda3;
                box-shadow: 0px 0px 0px 1px #f2dda3, inset 0px 0px 50px 2px #f2dda3;
      }
      .reqTable > table > tbody > tr:nth-child(odd) {
        -webkit-box-shadow: 0px 0px 0px 1px #a58e4b, inset 0px 0px 50px 5px #a58e4b;
                box-shadow: 0px 0px 0px 1px #a58e4b, inset 0px 0px 50px 5px #a58e4b;
      }

      /* outgoing logs */
      .outgoing-container {
        width: 90vh;
        height: 30vw;

        border-radius: 10px;
        -webkit-box-shadow: 0px 2px 5px 2px #bb8c0282;
                box-shadow: 0px 2px 5px 2px #bb8c0282;
        -webkit-backdrop-filter: blur(2px) invert(0.1);
                backdrop-filter: blur(2px) invert(0.1);
      }

      .outTable {
        width: 90vh;
        height: 30vw;
      }

      .date {
        font-size: 10px;
        color: white;
      }

      .act {
        font-size: 12px;
        color: #ffbe00;
        margin: 0px;
      }

      .id {
        font-size: 8px;
        color: white;
        margin: 0px;
      }

      .ship {
        font-size: 10px;
        color: white;
      }

      .status {
        font-size: 10px;
      }

      .outTable > table > thead > tr > th {
        -webkit-box-shadow: 0px 0px 0px 1px #edcc6a, inset 0px 0px 30px 2px #edcc6a;
                box-shadow: 0px 0px 0px 1px #edcc6a, inset 0px 0px 30px 2px #edcc6a;
        border-radius: 2px;
      }

      .outTable > table > tbody > tr:nth-child(even) {
        -webkit-box-shadow: 0px 0px 0px 1px #f2dda3, inset 0px 0px 50px 2px #f2dda3;
                box-shadow: 0px 0px 0px 1px #f2dda3, inset 0px 0px 50px 2px #f2dda3;
      }
      .outTable > table > tbody > tr:nth-child(odd) {
        -webkit-box-shadow: 0px 0px 0px 1px #a58e4b, inset 0px 0px 50px 5px #a58e4b;
                box-shadow: 0px 0px 0px 1px #a58e4b, inset 0px 0px 50px 5px #a58e4b;
      }

      /* modal (background) */
      .modal {
        padding-top: 20vh;
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100vw;
        height: 100vh;
        overflow: auto;
        background-color: rgb(0,0,0); /* fallback color */
        background-color: rgba(0,0,0,0.4); /* black w/ opacity */
      }

      /* modal headers */
      .modal-header-error {
        width: 80vw;
        height: 4vh;

        border: 1px solid #888;
        background-color: rgba(255, 59, 59, 0.5);
        -webkit-backdrop-filter: blur(1.5px);
                backdrop-filter: blur(1.5px);
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        text-align: center;
      }

      .modal-header-success {
        width: 80vw;
        height: 4vh;

        border: 1px solid #888;
        background-color: rgba(59, 255, 59, 0.5);
        -webkit-backdrop-filter: blur(1.5px);
                backdrop-filter: blur(1.5px);
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        text-align: center;
      }

      /* modal content/box */
      .modal-body {
        width: 80vw;
        height: 10vh;

        border: 1px solid #888;
        background-color: rgba(255, 255, 255, 0.9);
        -webkit-backdrop-filter: blur(1.5px);
                backdrop-filter: blur(1.5px);
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        text-align: center;

        display: flex;
        overflow: auto;
        text-align: center;
        align-items: center;
        justify-content: center;
      }

      .modal-center {
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
      }
    }
    '''
  --
--