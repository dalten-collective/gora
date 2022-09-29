::
::  offers - gorae you've been offered
::
/-  *gora
/+  rudder, *mip
::
^-  (page:rudder tack manage-gora-2)
|_  [bol=bowl:gall odo=order:rudder sat=tack]
++  final  (alert:rudder 'plead' build)
::
++  argue
  |=  [headers=header-list:http body=(unit octs)]
  ^-  $@(brief:rudder manage-gora-2)
  ?>  authenticated.odo
  =/  args=(map @t @t)
    ?~(body ~ (frisk:rudder q.u.body))
  ?.  ?&  (~(has by args) 'act')
          (~(has by args) 'id')
          (~(has by args) 'who')
      ==
    'アクションの不許可'
  ?.  ?=(%send-plea (~(got by args) 'act'))
    (cat 3 'アクションの不許可: ' (~(got by args) 'act'))
  ?.  &((~(has by args) 'id') (~(has by args) 'who'))
    'ホストと ID が必要です'
  :+  %send-plea
    (slav %uv (~(got by args) 'id'))
  (slav %p (~(got by args) 'who'))
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
        ;title:"ゴラ - 嘆願書を送る"
        ;style:"{(trip style)}"
        ;meta(charset "utf-8");
        ;meta
          =name     "viewport"
          =content  "width=device-width, initial-scale=1";
      ==
    ::
      ;body
        ;div(class "modal-container")
          ;+  failure:make
          ;+  success:make
        ==
      ::
        ;div(class "container")
          ;div(class "head")
            ;div(class "title-bar")
              ;div(class "title-pane")
                ;div(class "title"):"嘆願書を送る"
              ::
                ;div(class "title-glass");
              ==
            ==
          ==
        ::
          ;div(class "main")
            ;div(class "request-container")
              ;form(method "post", class "requ-form")
                ;label:'ゴラ リクエスト'
                ;input(name "id", id "ident", type "text", placeholder "0v1.23456.78910", required "");
                ;label(for "ident"):"ゴラ ID"
                ;input(name "who", id "who", type "text", placeholder "~mister-dozzod-dalten", required "");
                ;label(for "who"):"ホスト"
                ;input(name "act", value "send-plea", style "display: none;");
                ;div(class "go-button")
                  ;button
                    ;svg(xmlns "http://www.w3.org/2000/svg", height "40", width "40")
                      ;path(fill "#12de12", d "M18.5 28.458h3.208v-6.75h6.75v-3.166h-6.75v-7H18.5v7h-6.958v3.166H18.5Zm1.5 9.084q-3.667 0-6.854-1.375-3.188-1.375-5.563-3.75-2.375-2.375-3.75-5.563Q2.458 23.667 2.458 20q0-3.667 1.375-6.875t3.75-5.583q2.375-2.375 5.563-3.75Q16.333 2.417 20 2.417q3.667 0 6.875 1.375t5.583 3.75q2.375 2.375 3.75 5.583T37.583 20q0 3.667-1.375 6.854-1.375 3.188-3.75 5.563-2.375 2.375-5.583 3.75T20 37.542Zm0-4.209q5.583 0 9.458-3.875T33.333 20q0-5.583-3.875-9.458T20 6.667q-5.583 0-9.458 3.875T6.667 20q0 5.583 3.875 9.458T20 33.333ZM20 20Z");
                    ==
                  ==
                ==
              ==
            ==
          ==
        ::
          ;div(class "buttons")
            ;+  =-  (circle:make [- "." %.y])
                ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                  ;path(fill "#bb8c02", d "M5.625 20.775q-.975 0-1.687-.713-.713-.712-.713-1.687 0-.975.713-1.675.712-.7 1.687-.7.975 0 1.675.7.7.7.7 1.675 0 .975-.7 1.687-.7.713-1.675.713Zm6.375 0q-.975 0-1.675-.713-.7-.712-.7-1.687 0-.975.7-1.675.7-.7 1.675-.7.975 0 1.675.7.7.7.7 1.675 0 .975-.7 1.687-.7.713-1.675.713Zm6.375 0q-.975 0-1.675-.713-.7-.712-.7-1.687 0-.975.7-1.675.7-.7 1.675-.7.975 0 1.687.7.713.7.713 1.675 0 .975-.713 1.687-.712.713-1.687.713Zm-12.75-6.4q-.975 0-1.687-.7-.713-.7-.713-1.675 0-.975.713-1.675.712-.7 1.687-.7.975 0 1.675.7.7.7.7 1.675 0 .975-.7 1.675-.7.7-1.675.7Zm6.375 0q-.975 0-1.675-.7-.7-.7-.7-1.675 0-.975.7-1.675.7-.7 1.675-.7.975 0 1.675.7.7.7.7 1.675 0 .975-.7 1.675-.7.7-1.675.7Zm6.375 0q-.975 0-1.675-.7-.7-.7-.7-1.675 0-.975.7-1.675.7-.7 1.675-.7.975 0 1.687.7.713.7.713 1.675 0 .975-.713 1.675-.712.7-1.687.7ZM5.625 8q-.975 0-1.687-.7-.713-.7-.713-1.675 0-.975.713-1.688.712-.712 1.687-.712.975 0 1.675.712.7.713.7 1.688T7.3 7.3q-.7.7-1.675.7ZM12 8q-.975 0-1.675-.7-.7-.7-.7-1.675 0-.975.7-1.688.7-.712 1.675-.712.975 0 1.675.712.7.713.7 1.688t-.7 1.675q-.7.7-1.675.7Zm6.375 0Q17.4 8 16.7 7.3q-.7-.7-.7-1.675 0-.975.7-1.688.7-.712 1.675-.712.975 0 1.687.712.713.713.713 1.688T20.062 7.3q-.712.7-1.687.7Z");
                ==
          ==
        ::
          ;script:"{(trip script)}"
        ==
      ==
    ==
  ++  make
    |%
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
    ::
    ++  failure
      ^-  manx
      ?~  msgs  ;div;
      ?:  gud.u.msgs  ;div;
      ;div(id "fail-message", class "modal", style "display: block;")
        ;div(class "modal-center")
          ;div(class "fail-modal-header")
            ;div(class "name")
              ;p:"ゴラ失敗"
            ==
          ==
        ::
          ;div(class "modal-body")
          ::
            ;div(class "results")
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
          ;div(class "succ-modal-header")
            ;div(class "name")
              ;p:"ゴラ成功"
            ==
          ==
        ::
          ;div(class "modal-body")
          ::
            ;div(class "results")
              ;div
                ;pre:"{(trip txt.u.msgs)}"
              ==
            ==
          ==
        ==
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
    };
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

      /* go button */
      .go-button {
        cursor: pointer;
        border-radius: 50%;
        padding: 5px;
        margin: 5px;
      }

      .go-button > button {
        padding: 0px;
        background: none;
        border: none;
        cursor: pointer;
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

    /* phone - vertical */
    @media (max-aspect-ratio: 9/16) {
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
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;

        background-image: -o-radial-gradient(#9e7703 1px, transparent 1px), -o-radial-gradient(#9e7703 1px, transparent 1px);

        background-image: radial-gradient(#9e7703 1px, transparent 1px), radial-gradient(#9e7703 1px, transparent 1px);
        background-size: 59px 59px;
        background-position: 0 0, 29.5px 29.5px;

        -webkit-animation: pulse 12s infinite;

                animation: pulse 12s infinite;
      }

      /* modal */
      .modal {
        padding-top: 20vh;
        display: none;
        position: fixed;
        z-index: 100;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgb(0,0,0); /* fallback color */
        background-color: rgba(0,0,0,0.4); /* black w/ opacity */
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
      .fail-modal-header {
        width: 60vw;
        height: 4vh;

        border: 1px solid #888;
        background-color: rgba(255, 59, 59, 0.5);
        -webkit-backdrop-filter: blur(0.5);
                backdrop-filter: blur(0.5);

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
      .succ-modal-header {
        width: 60vw;
        height: 4vh;

        border: 1px solid #888;
        background-color: rgba(59, 255, 59, 0.5);
        -webkit-backdrop-filter: blur(0.5);
                backdrop-filter: blur(0.5);

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
      .name-container {
        height: 10vh;

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
      .name {
        z-index: 100;

        position: absolute;

        font-size: 30px;
        color: #c49a1d;
        text-shadow: 0px 0px 0 rgb(165,123,0),
                    0px 1px 0 rgb(134,92,0),
                    0px 2px  0 rgb(103,61,0),
                    0px 3px 2px rgba(150,141,115,1),
                    0px 3px 1px rgba(150,141,115,0.5),
                    0px 0px 2px rgba(150,141,115,.2);

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

      .name > p {
        margin: 0;
      }
      .modal-body {
        width: 60vw;
        height: 10vh;

        border: 1px solid #888;
        background-color: rgba(255, 255, 255, 0.9);
        -webkit-backdrop-filter: blur(0.5);
                backdrop-filter: blur(0.5);

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        overflow: auto;
        text-align: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
      }
      .results {
        z-index: 100;

        position: absolute;

        font-size: 10px;
        color: #e7b21b;
        text-shadow: 0px 0px 0 rgb(155,148,128),
                    0px 1px 0 rgb(141,134,114),
                    0px 2px  0 rgb(128,121,101),
                    0px 3px 2px rgba(196,154,29,1),
                    0px 3px 1px rgba(196,154,29,0.5),
                    0px 0px 2px rgba(196,154,29,.2);

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

      .results > p {
        margin: 0;
      }
    }
    

      .head {
        width: 95vw;
        height: 25vh;

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

      .main {
        width: 95vw;
        height: 70vh;

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

      .request-container {
        width: 90vw;
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

        border-radius: 10px;
        -webkit-backdrop-filter: blur(1px);
                backdrop-filter: blur(1px);
        -webkit-box-shadow: 0px 0px 24px 4px #ffe500,
                    inset 0px 0px 500px 15px #ffe258,
                    inset 0px 0px 1000px 20px #fff;
                box-shadow: 0px 0px 24px 4px #ffe500,
                    inset 0px 0px 500px 15px #ffe258,
                    inset 0px 0px 1000px 20px #fff;
      }

      .requ-form {
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

      .requ-form > input {
        width: 75vw;
        padding: 2px;
        margin: 2px;
        background: none;
        -webkit-box-shadow: 1px 1px 10px 2px #bb8c02,
                    inset 0px 0px 15px 3px #ffffff90;
                box-shadow: 1px 1px 10px 2px #bb8c02,
                    inset 0px 0px 15px 3px #ffffff90;
        border: none;
        border-radius: 5px;
      }

      .requ-form > label {
        font-size: 20px;
        color: #c49a1d;
        text-shadow: 0px 0px 0 rgb(165,123,0),
                    0px 1px 0 rgb(134,92,0),
                    0px 2px  0 rgb(103,61,0),
                    0px 3px 2px rgba(150,141,115,1),
                    0px 3px 1px rgba(150,141,115,0.5),
                    0px 0px 2px rgba(150,141,115,.2);
      }

      .buttons {
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
    }

    /* phone - horizontal */
    @media (min-aspect-ratio: 16/9) {
      .container {
        width: 98vw;
        height: 96vh;

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -webkit-box-orient: horizontal;
        -webkit-box-direction: normal;
            -ms-flex-direction: row;
                flex-direction: row;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;

        background-image: -o-radial-gradient(#9e7703 1px, transparent 1px), -o-radial-gradient(#9e7703 1px, transparent 1px);

        background-image: radial-gradient(#9e7703 1px, transparent 1px), radial-gradient(#9e7703 1px, transparent 1px);
        background-size: 59px 59px;
        background-position: 0 0, 29.5px 29.5px;

        -webkit-animation: pulse 12s infinite;

                animation: pulse 12s infinite;
      }

      .head {
        width: 15vw;
        height: 95vh;

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

      .main {
        width: 70vw;
        height: 96vh;

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

      /* modal */
      .modal {
        padding-top: 20vh;
        display: none;
        position: fixed;
        z-index: 100;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgb(0,0,0); /* fallback color */
        background-color: rgba(0,0,0,0.4); /* black w/ opacity */
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
      .fail-modal-header {
        width: 60vw;
        height: 4vh;

        border: 1px solid #888;
        background-color: rgba(255, 59, 59, 0.5);
        -webkit-backdrop-filter: blur(0.5);
                backdrop-filter: blur(0.5);

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

      .succ-modal-header {
        width: 60vw;
        height: 4vh;

        border: 1px solid #888;
        background-color: rgba(59, 255, 59, 0.5);
        -webkit-backdrop-filter: blur(0.5);
                backdrop-filter: blur(0.5);

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

      .name-container {
        height: 10vh;

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
      .name {
        z-index: 100;

        position: absolute;

        font-size: 30px;
        color: #c49a1d;
        text-shadow: 0px 0px 0 rgb(165,123,0),
                    0px 1px 0 rgb(134,92,0),
                    0px 2px  0 rgb(103,61,0),
                    0px 3px 2px rgba(150,141,115,1),
                    0px 3px 1px rgba(150,141,115,0.5),
                    0px 0px 2px rgba(150,141,115,.2);

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

      .name > p {
        margin: 0;
      }
      .modal-body {
        width: 60vw;
        height: 10vh;

        border: 1px solid #888;
        background-color: rgba(255, 255, 255, 0.9);
        -webkit-backdrop-filter: blur(0.5);
                backdrop-filter: blur(0.5);

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        overflow: auto;
        text-align: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
      }
      .results {
        z-index: 100;

        position: absolute;

        font-size: 10px;
        color: #e7b21b;
        text-shadow: 0px 0px 0 rgb(155,148,128),
                    0px 1px 0 rgb(141,134,114),
                    0px 2px  0 rgb(128,121,101),
                    0px 3px 2px rgba(196,154,29,1),
                    0px 3px 1px rgba(196,154,29,0.5),
                    0px 0px 2px rgba(196,154,29,.2);

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

      .results > p {
        margin: 0;
      }

      /* title format */
      .title-bar {
        width: 15vw;
        height: 95vh;
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
        width: 7vw;
        height: 90vh;
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
        width: 7vw;
        height: 90vh;
        position: absolute;
        -webkit-backdrop-filter: grayscale(0%) blur(2px);
                backdrop-filter: grayscale(0%) blur(2px);
      }

      .title {
        z-index: 20;
        font-size: 4vw;
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

      .request-container {
        width: 70vw;
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

        border-radius: 10px;
        -webkit-backdrop-filter: blur(1px);
                backdrop-filter: blur(1px);
        -webkit-box-shadow: 0px 0px 24px 4px #ffe500,
                    inset 0px 0px 500px 15px #ffe258,
                    inset 0px 0px 1000px 20px #fff;
                box-shadow: 0px 0px 24px 4px #ffe500,
                    inset 0px 0px 500px 15px #ffe258,
                    inset 0px 0px 1000px 20px #fff;
      }

      .requ-form {
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

      .requ-form > input {
        width: 55vw;
        padding: 2px;
        margin: 2px;
        background: none;
        -webkit-box-shadow: 1px 1px 10px 2px #bb8c02,
                    inset 0px 0px 15px 3px #ffffff90;
                box-shadow: 1px 1px 10px 2px #bb8c02,
                    inset 0px 0px 15px 3px #ffffff90;
        border: none;
        border-radius: 5px;
      }

      .requ-form > label {
        font-size: 20px;
        color: #c49a1d;
        text-shadow: 0px 0px 0 rgb(165,123,0),
                    0px 1px 0 rgb(134,92,0),
                    0px 2px  0 rgb(103,61,0),
                    0px 3px 2px rgba(150,141,115,1),
                    0px 3px 1px rgba(150,141,115,0.5),
                    0px 0px 2px rgba(150,141,115,.2);
      }

      .buttons {
        margin-left: 20px;
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
    }

    /* computer square */
    @media (min-aspect-ratio: 9/16) and (max-aspect-ratio: 16/9) {
      .container {
        width: 100vw;
        height: 100vh;

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

        background-image: -o-radial-gradient(#9e7703 1px, transparent 1px), -o-radial-gradient(#9e7703 1px, transparent 1px);

        background-image: radial-gradient(#9e7703 1px, transparent 1px), radial-gradient(#9e7703 1px, transparent 1px);
        background-size: 59px 59px;
        background-position: 0 0, 29.5px 29.5px;

        -webkit-animation: pulse 12s infinite;

                animation: pulse 12s infinite;
      }

      .head {
        width: 50vw;
        height: 20vh;

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

      .main {
        width: 95vw;
        height: 70vh;

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

      /* modal */
      .modal {
        padding-top: 20vh;
        display: none;
        position: fixed;
        z-index: 100;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgb(0,0,0); /* fallback color */
        background-color: rgba(0,0,0,0.4); /* black w/ opacity */
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
      .fail-modal-header {
        width: 60vw;
        height: 4vh;

        border: 1px solid #888;
        background-color: rgba(255, 59, 59, 0.5);
        -webkit-backdrop-filter: blur(0.5);
                backdrop-filter: blur(0.5);

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

      .succ-modal-header {
        width: 60vw;
        height: 4vh;

        border: 1px solid #888;
        background-color: rgba(59, 255, 59, 0.5);
        -webkit-backdrop-filter: blur(0.5);
                backdrop-filter: blur(0.5);

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

      .name-container {
        height: 10vh;

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
      .name {
        z-index: 100;

        position: absolute;

        font-size: 30px;
        color: #c49a1d;
        text-shadow: 0px 0px 0 rgb(165,123,0),
                    0px 1px 0 rgb(134,92,0),
                    0px 2px  0 rgb(103,61,0),
                    0px 3px 2px rgba(150,141,115,1),
                    0px 3px 1px rgba(150,141,115,0.5),
                    0px 0px 2px rgba(150,141,115,.2);

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

      .name > p {
        margin: 0;
      }
      .modal-body {
        width: 60vw;
        height: 10vh;

        border: 1px solid #888;
        background-color: rgba(255, 255, 255, 0.9);
        -webkit-backdrop-filter: blur(0.5);
                backdrop-filter: blur(0.5);

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        overflow: auto;
        text-align: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
      }
      .results {
        z-index: 100;

        position: absolute;

        font-size: 10px;
        color: #e7b21b;
        text-shadow: 0px 0px 0 rgb(155,148,128),
                    0px 1px 0 rgb(141,134,114),
                    0px 2px  0 rgb(128,121,101),
                    0px 3px 2px rgba(196,154,29,1),
                    0px 3px 1px rgba(196,154,29,0.5),
                    0px 0px 2px rgba(196,154,29,.2);

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

      .results > p {
        margin: 0;
      }

      /* title format */
      .title-bar {
        width: 50vw;
        height: 10vh;
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
        width: 50vw;
        height: 10vh;
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
        width: 50vw;
        height: 10vh;
        position: absolute;
        -webkit-backdrop-filter: grayscale(0%) blur(2px);
                backdrop-filter: grayscale(0%) blur(2px);
      }
      
      .title {
        z-index: 20;
        font-size: 6vw;
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

      .request-container {
        width: 60vw;
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

        border-radius: 10px;
        -webkit-backdrop-filter: blur(1px);
                backdrop-filter: blur(1px);
        -webkit-box-shadow: 0px 0px 24px 4px #ffe500,
                    inset 0px 0px 500px 15px #ffe258,
                    inset 0px 0px 1000px 20px #fff;
                box-shadow: 0px 0px 24px 4px #ffe500,
                    inset 0px 0px 500px 15px #ffe258,
                    inset 0px 0px 1000px 20px #fff;
      }

      .requ-form {
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

      .requ-form > input {
        width: 55vw;
        padding: 2px;
        margin: 2px;
        background: none;
        -webkit-box-shadow: 1px 1px 10px 2px #bb8c02,
                    inset 0px 0px 15px 3px #ffffff90;
                box-shadow: 1px 1px 10px 2px #bb8c02,
                    inset 0px 0px 15px 3px #ffffff90;
        border: none;
        border-radius: 5px;
      }

      .requ-form > label {
        font-size: 20px;
        color: #c49a1d;
        text-shadow: 0px 0px 0 rgb(165,123,0),
                    0px 1px 0 rgb(134,92,0),
                    0px 2px  0 rgb(103,61,0),
                    0px 3px 2px rgba(150,141,115,1),
                    0px 3px 1px rgba(150,141,115,0.5),
                    0px 0px 2px rgba(150,141,115,.2);
      }

      .buttons {
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
    }
    '''
  --
--