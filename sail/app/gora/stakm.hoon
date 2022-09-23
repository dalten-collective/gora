::
::  stakm - stak some gorae, on an old one, or not!
::
/-  *gora
/+  rudder, *mip
::
^-  (page:rudder tack manage-gora-2)
|_  [bol=bowl:gall odo=order:rudder sat=tack]
++  final
  |=  [suc=? msg=brief:rudder]
  ?:  suc
    [%next (cat 3 'voyer?gora=' msg) ~]
  (build +:(purse:rudder url.request.odo) `[| msg])
  
::
++  argue
  |=  [headers=header-list:http body=(unit octs)]
  ^-  $@(brief:rudder manage-gora-2)
  ?>  authenticated.odo
  =/  args=(map @t @t)
    ?~(body ~ (frisk:rudder q.u.body))
  =/  burn=(set @uv)
    %-  sy
    %+  murn
      (fall (rush ?~(body ~ q.u.body) yquy:de-purl:html) ~)
    |=  [p=@t q=@t]
    ?.  ?=(%burn p)  ~
    `(slav %uv q)
  ?.  ?|  (~(has by args) 'id')
          &((~(has by args) 'pic') (~(has by args) 'nam'))
      ==
    'アクションの不許可'
  ?:  =(~ burn)
    'アクションの不許可'
  ?:  (~(has by args) 'id')
    [%stak-em burn [%.y (slav %uv (~(got by args) 'id'))]]
  [%stak-em burn [%.n (~(got by args) 'nam') (~(got by args) 'pic')]]
::
++  build
  |=  $:  args=(list [k=@t v=@t])
          msgs=(unit [gud=? txt=@])
      ==
  ^-  reply:rudder
  =/  gor=(unit gora)
    ?~  g=(~(get by (malt args)) 'gora')  ~
    =+  ger=(~(get by pita.sat) (slav %uv u.g))
    ?~  ger  ~
    ?.  =(%s -.u.ger)  ~
    ?.(=(our.bol host.u.ger) ~ ger)
  |^  [%page page]
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
    ++  fail
      ^-  manx
      ?~  msgs  ;div;
      ?:  gud.u.msgs  ;div;
      ;div(id "fail-modal", class "modal", style "display: block;")
        ;div(class "modal-center")
          ;div(class "fail-modal-header")
            ;div(class "name")
              ;p:"ゴラ失敗"
            ==
          ==
        ::
          ;div(class "modal-body")
            ;div(class "results")
              ;div
                ;pre:"{(trip txt.u.msgs)}"
              ==
            ==
          ==
        ==
      ==
    ::
    ++  select
      =;  rows=marl
        ;table
          ;thead
            ;tr
              ;th:"コイン"
              ;th:"古い名前"
              ;th:"鍛造の日"
              ;th:"リンク"
              ;th:"やけど"
            ==
          ==
        ::
          ;tbody
            ;*  ?~  rows
                  ;=  ;tr
                        ;td(colspan "5"):"ゴラを作って進み続ける"
                      ==
                  ==
                rows
          ==
        ==
      %+  murn  ~(val by pita.sat)
      |=  g=gora
      ?.  ?=(%g -.g)  ~
      ?.  =(our.bol host.g)  ~
      :-  ~
      ;tr
        ;td
          ;div(class "badge2")
            ;div(class "plinth2")
              ;img(src "{(trip pic.g)}");
            ==
          ==
        ==
        ;td:"{(trip name.g)}"
      ::
        ;+  =+  yer=(yore made.g)
            ;td:"{(scow %ud y.yer)}年 {(scow %ud m.yer)}月 {(scow %ud d.t.yer)}日"
      ::
        ;td
          ;a(href "./voyer?gora={(scow %uv id.g)}")
            ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
              ;path(fill "#bb8c02", d "M10.625 17.85H7q-2.425 0-4.137-1.713Q1.15 14.425 1.15 12t1.713-4.138Q4.575 6.15 7 6.15h3.625V9.3H7q-1.125 0-1.912.787Q4.3 10.875 4.3 12t.788 1.912Q5.875 14.7 7 14.7h3.625Zm-3.2-4.65v-2.4h9.15v2.4Zm5.95 4.65V14.7H17q1.125 0 1.913-.788.787-.787.787-1.912t-.787-1.913Q18.125 9.3 17 9.3h-3.625V6.15H17q2.425 0 4.138 1.712Q22.85 9.575 22.85 12t-1.712 4.137Q19.425 17.85 17 17.85Z");
            ==
          ==
        ==
      ::
        ;td
          ;input
            =name   "burn"
            =value  "{(scow %uv id.g)}"
            =type   "checkbox";
        ==
      ==
    --
  ::
  ++  page
    ^-  manx
    ;html
      ;head
        ;title:"ゴラ - スタックエム"
        ;style:"{(trip style)}"
        ;meta(charset "utf-8");
        ;meta
          =name     "viewport"
          =content  "width=device-width, initial-scale=1";
      ==
    ::
      ;body
        ;div(class "modal-container")
          ;+  fail:make
        ==
      ::
        ;div(class "container")
          ;div(class "title-bar")
            ;div(class "title-pane")
              ;+  ?~  gor
                    ;div(class "title", id "tit-s"):"???"
                  ;div(class "title"):"{(trip name.u.gor)}"
              ;div(class "title-glass");
            ==
          ==
        ::
          ;div(class "main")
            ;form(method "post", class "form-stak")
              ;div(class "badge")
                ;div(class "plinth")
                  ;div(class "shadow");
                  ;+  ?~  gor
                        ;img(src "https://freedom-club.sfo2.digitaloceanspaces.com/props/gora/pattern.png", id "preview");
                      ;img(src "{(trip pic.u.gor)}");
                ==
              ==
            ::
              ;div(class "into")

                ;+  ?~  gor
                      ;div(class "form-new")
                        ;label:'ゴラ-make'
                        ;input(name "pic", id "pic-s", type "text", placeholder "http://クワルタス.コム/assets/pic/new-logo.jpg", required "");
                        ;label(for "pic-s"):"トロフィー テンプレート"
                        ;input(name "nam", id "nam-s", type "text", placeholder "クワルタスという名のタコ", required "");
                        ;label(for "nam-s"):"ゴラの名前"
                      ==
                    ;div(class "form-old")
                      ;label:'ゴラ-burn'
                      ;input(name "id", id "id", type "text", value "{(scow %uv id.u.gor)}", style "display: none;");
                      ;label:"{(trip name.u.gor)}"
                      ;+  =+  yer=(yore made.u.gor)
                          ;label:"{(scow %ud y.yer)}年 {(scow %ud m.yer)}月 {(scow %ud d.t.yer)}日"
                    ==
              ==
            ::
              ;div(class "nulTab")
                ;+  select:make
              ==
            ::
              ;div(class "go-button")
                ;button
                  ;svg(xmlns "http://www.w3.org/2000/svg", height "40", width "40")
                    ;path(fill "#12de12", d "M18.5 28.458h3.208v-6.75h6.75v-3.166h-6.75v-7H18.5v7h-6.958v3.166H18.5Zm1.5 9.084q-3.667 0-6.854-1.375-3.188-1.375-5.563-3.75-2.375-2.375-3.75-5.563Q2.458 23.667 2.458 20q0-3.667 1.375-6.875t3.75-5.583q2.375-2.375 5.563-3.75Q16.333 2.417 20 2.417q3.667 0 6.875 1.375t5.583 3.75q2.375 2.375 3.75 5.583T37.583 20q0 3.667-1.375 6.854-1.375 3.188-3.75 5.563-2.375 2.375-5.583 3.75T20 37.542Zm0-4.209q5.583 0 9.458-3.875T33.333 20q0-5.583-3.875-9.458T20 6.667q-5.583 0-9.458 3.875T6.667 20q0 5.583 3.875 9.458T20 33.333ZM20 20Z");
                  ==
                ==
              ==
            ==
          ==
        ::
          ;div(class "menu")
            ;+  =-  (circle:make [- "." %.n])
                ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                  ;path(fill "#bb8c02", d "M5.625 20.775q-.975 0-1.687-.713-.713-.712-.713-1.687 0-.975.713-1.675.712-.7 1.687-.7.975 0 1.675.7.7.7.7 1.675 0 .975-.7 1.687-.7.713-1.675.713Zm6.375 0q-.975 0-1.675-.713-.7-.712-.7-1.687 0-.975.7-1.675.7-.7 1.675-.7.975 0 1.675.7.7.7.7 1.675 0 .975-.7 1.687-.7.713-1.675.713Zm6.375 0q-.975 0-1.675-.713-.7-.712-.7-1.687 0-.975.7-1.675.7-.7 1.675-.7.975 0 1.687.7.713.7.713 1.675 0 .975-.713 1.687-.712.713-1.687.713Zm-12.75-6.4q-.975 0-1.687-.7-.713-.7-.713-1.675 0-.975.713-1.675.712-.7 1.687-.7.975 0 1.675.7.7.7.7 1.675 0 .975-.7 1.675-.7.7-1.675.7Zm6.375 0q-.975 0-1.675-.7-.7-.7-.7-1.675 0-.975.7-1.675.7-.7 1.675-.7.975 0 1.675.7.7.7.7 1.675 0 .975-.7 1.675-.7.7-1.675.7Zm6.375 0q-.975 0-1.675-.7-.7-.7-.7-1.675 0-.975.7-1.675.7-.7 1.675-.7.975 0 1.687.7.713.7.713 1.675 0 .975-.713 1.675-.712.7-1.687.7ZM5.625 8q-.975 0-1.687-.7-.713-.7-.713-1.675 0-.975.713-1.688.712-.712 1.687-.712.975 0 1.675.712.7.713.7 1.688T7.3 7.3q-.7.7-1.675.7ZM12 8q-.975 0-1.675-.7-.7-.7-.7-1.675 0-.975.7-1.688.7-.712 1.675-.712.975 0 1.675.712.7.713.7 1.688t-.7 1.675q-.7.7-1.675.7Zm6.375 0Q17.4 8 16.7 7.3q-.7-.7-.7-1.675 0-.975.7-1.688.7-.712 1.675-.712.975 0 1.687.712.713.713.713 1.688T20.062 7.3q-.712.7-1.687.7Z");
                ==
          ==
        ==
      ::
        ;script:"{(trip script)}"
      ==
    ==
  ::
  ++  script
    '''
    var fails = document.getElementById("fail-modal");

    window.onclick = function(event) {
      if (event.target == fails) {
        fails.style.display = "none";
      }
    };

    var pox = document.querySelector("input[id=pic-s]");
    var flu = document.querySelector("input[id=nam-s]");
    var img = document.getElementById("preview");
    var tit = document.getElementById("tit-s")

    if (pox) {
      pox.addEventListener('blur', function() {
        var vir = document.querySelector("input[id=pic-s]");
        if (vir.value == '') {
          return;
        } else {
          img.src = vir.value;
        };
      });
    };

    if (flu) {
      flu.addEventListener('blur', function() {
        var vir = document.querySelector("input[id=nam-s]");
        if (vir.value == '') {
          return ;
        } else {
          tit.textContent = vir.value;
        }
      })
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
    table { border-collapse: collapse; width: 100%; height: 100%; overflow: auto; }
    thead th { position: sticky; top: 0; z-index: 1; }
    th, td { 
      padding: 8px 5px;
      text-align: center;
      color: white;
    }

    .nulTab {
      width: 90vw;
      height: 25vh;
      overflow: auto;
    }

    .nulTab > table > thead > tr > th {
        -webkit-box-shadow: 0px 0px 0px 1px #ffe7a1,
                    inset 0px 0px 30px 2px #ffe7a1;
                box-shadow: 0px 0px 0px 1px #ffe7a1,
                    inset 0px 0px 30px 2px #ffe7a1;
        border-radius: 5px;
    }
    .nulTab > table > tbody > tr:nth-child(even) {
      -webkit-box-shadow: 0px 0px 0px 1px #eee5cc,
                  inset 0px 0px 50px 2px #eee5cc;
              box-shadow: 0px 0px 0px 1px #eee5cc,
                  inset 0px 0px 50px 2px #eee5cc;
    }
    .nulTab > table > tbody > tr:nth-child(odd) {
      -webkit-box-shadow: 0px 0px 0px 1px #9a8f6f,
          inset 0px 0px 50px 5px #9a8f6f;
              box-shadow: 0px 0px 0px 1px #9a8f6f,
          inset 0px 0px 50px 5px #9a8f6f;
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

      -webkit-box-shadow:
        inset 4px 4px 10px 2px rgb(83 255 0 / 50%),
        inset -3px -4px 10px 2px rgb(61 242 0 / 60%),
        0px 0px 0px 1px rgb(29 87 0 / 80%),
        0px 2px 3px 2px rgb(0 0 0 / 80%);

              box-shadow:
        inset 4px 4px 10px 2px rgb(83 255 0 / 50%),
        inset -3px -4px 10px 2px rgb(61 242 0 / 60%),
        0px 0px 0px 1px rgb(29 87 0 / 80%),
        0px 2px 3px 2px rgb(0 0 0 / 80%)
    }
    
    .go-button > button {
      padding: 0px;
      background: none;
      border: none;
      cursor: pointer;
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

      .main {
        width: 96vw;
        height: 77vh;

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

      .badge {
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
      }

      .plinth {
        width: 30vw;
        height: 30vw;

        border-radius: 50%;
        -webkit-box-shadow: 0px 0px 5px 5px rgb(227 165 0),
                    0px 0px 5px 8px rgb(194 60 60);
                box-shadow: 0px 0px 5px 5px rgb(227 165 0),
                    0px 0px 5px 8px rgb(194 60 60);
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

      .plinth>img {
        height: 100%;
        width: 100%;
        border-radius: 50%;
      }

      .shadow {
        border-radius: 50%;
        width: 30vw;
        height: 30vw;
        z-index: 20;
        position: absolute;
        -webkit-box-shadow: 0px 0px 5px 4px #151612 inset;
                box-shadow: 0px 0px 5px 4px #151612 inset;
      }

      .into {
        width: 85vw;
        height: 15vh;

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
      .form-stak {
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

      .form-new {
        width: 80vw;
        height: 12vh;

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

        -webkit-box-shadow: 0px 0px 10px 3px #ffe7a1,
                    inset 0px 0px 150px 6px #ffe7a1;

                box-shadow: 0px 0px 10px 3px #ffe7a1,
                    inset 0px 0px 150px 6px #ffe7a1;
      }
      .form-new > label {
        color: white;
      }
      .form-new > input {
        width: 80vw;
      }

      .form-old {
        width: 80vw;
        height: 12vh;

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

        -webkit-box-shadow: 0px 0px 10px 3px #ffe7a1,
                    inset 0px 0px 150px 6px #ffe7a1;

                box-shadow: 0px 0px 10px 3px #ffe7a1,
                    inset 0px 0px 150px 6px #ffe7a1;
      }
      .form-old > label {
        color: white;
      }
      .form-old > input {
        width: 80vw;
      }

      .badge2 {
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
      }

      .plinth2 {
        width: 20vw;
        height: 20vw;

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
      }

      .plinth2>img {
        height: 100%;
        width: 100%;
        border-radius: 50%;
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
    
    /* computer square */
    @media (min-aspect-ratio: 9/16) and (max-aspect-ratio: 14/9) {
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

        background-image: -o-radial-gradient(#9e7703 1px, transparent 1px), -o-radial-gradient(#9e7703 1px, transparent 1px);

        background-image: radial-gradient(#9e7703 1px, transparent 1px), radial-gradient(#9e7703 1px, transparent 1px);
        background-size: 59px 59px;
        background-position: 0 0, 29.5px 29.5px;

        -webkit-animation: pulse 12s infinite;

                animation: pulse 12s infinite;
      }

      /* title format */
      .title-bar {
        width: 65vw;
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

      .title-pane {
        width: 60vw;
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
        width: 60vw;
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
        text-shadow: 0px 0px 0 rgb(227, 165, 0),
          0px 1px 0 rgb(199, 137, 0),
          0px 2px 0 rgb(171, 109, 0),
          0px 3px 0 rgb(143, 81, 0),
          0px 4px 3px rgba(0, 0, 0, 0.6),
          0px 4px 1px rgba(0, 0, 0, 0.5),
          0px 0px 3px rgba(0, 0, 0, .2);
      }

      .main {
        width: 96vw;
        height: 70vh;

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

      .badge {
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
      }

      .plinth {
        width: 20vw;
        height: 20vw;

        border-radius: 50%;
        -webkit-box-shadow: 0px 0px 5px 5px rgb(227 165 0),
                    0px 0px 5px 8px rgb(194 60 60);
                box-shadow: 0px 0px 5px 5px rgb(227 165 0),
                    0px 0px 5px 8px rgb(194 60 60);
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

      .plinth>img {
        height: 100%;
        width: 100%;
        border-radius: 50%;
      }

      .shadow {
        border-radius: 50%;
        width: 20vw;
        height: 20vw;
        z-index: 20;
        position: absolute;
        -webkit-box-shadow: 0px 0px 5px 4px #151612 inset;
                box-shadow: 0px 0px 5px 4px #151612 inset;
      }

      .into {
        width: 85vw;
        height: 15vh;

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
      .form-stak {
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

      .form-new {
        width: 60vw;
        height: 12vh;

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

        -webkit-box-shadow: 0px 0px 10px 3px #ffe7a1,
                    inset 0px 0px 150px 6px #ffe7a1;

                box-shadow: 0px 0px 10px 3px #ffe7a1,
                    inset 0px 0px 150px 6px #ffe7a1;
      }
      .form-new > label {
        color: white;
      }
      .form-new > input {
        width: 60vw;
      }

      .form-old {
        width: 60vw;
        height: 12vh;

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

        -webkit-box-shadow: 0px 0px 10px 3px #ffe7a1,
                    inset 0px 0px 150px 6px #ffe7a1;

                box-shadow: 0px 0px 10px 3px #ffe7a1,
                    inset 0px 0px 150px 6px #ffe7a1;
      }
      .form-old > label {
        color: white;
      }
      .form-old > input {
        width: 60vw;
      }

      .badge2 {
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
      }

      .plinth2 {
        width: 10vw;
        height: 10vw;

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
      }

      .plinth2>img {
        height: 100%;
        width: 100%;
        border-radius: 50%;
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

      /* special for square */
      .nulTab {
        height: 25vh;
      }
      table {
        height: 24vh;
      }
    }

    /* phone horizontal */
    @media (min-aspect-ratio: 14/9) {
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

        background-image: -o-radial-gradient(#9e7703 1px, transparent 1px), -o-radial-gradient(#9e7703 1px, transparent 1px);

        background-image: radial-gradient(#9e7703 1px, transparent 1px), radial-gradient(#9e7703 1px, transparent 1px);
        background-size: 59px 59px;
        background-position: 0 0, 29.5px 29.5px;

        -webkit-animation: pulse 12s infinite;

                animation: pulse 12s infinite;
      }

      /* title format */
      .title-bar {
        width: 15vw;
        height: 98vh;
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
        width: 6vw;
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
        width: 6vw;
        height: 90vh;
        position: absolute;
        -webkit-backdrop-filter: grayscale(0%) blur(2px);
                backdrop-filter: grayscale(0%) blur(2px);
      }

      .title {
        width: 1vw;
        z-index: 20;
        font-size: 3vw;
        overflow-wrap: anywhere;
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

      .main {
        width: 80vw;
        height: 97vh;

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

      .badge {
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
      }

      .plinth {
        width: 15vw;
        height: 15vw;

        border-radius: 50%;
        -webkit-box-shadow: 0px 0px 5px 5px rgb(227 165 0),
                    0px 0px 5px 8px rgb(194 60 60);
                box-shadow: 0px 0px 5px 5px rgb(227 165 0),
                    0px 0px 5px 8px rgb(194 60 60);
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

      .plinth>img {
        height: 100%;
        width: 100%;
        border-radius: 50%;
      }

      .shadow {
        border-radius: 50%;
        width: 15vw;
        height: 15vw;
        z-index: 20;
        position: absolute;
        -webkit-box-shadow: 0px 0px 5px 4px #151612 inset;
                box-shadow: 0px 0px 5px 4px #151612 inset;
      }

      .into {

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

        -webkit-transform: rotate(270deg);

            -ms-transform: rotate(270deg);

                transform: rotate(270deg);
      }
      .form-stak {
        width: 70vw;
        height: 97vh;
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
      }

      .form-new {
        width: 20vw;
        height: 17vh;

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

        -webkit-box-shadow: 0px 0px 10px 3px #ffe7a1,
                    inset 0px 0px 150px 6px #ffe7a1;

                box-shadow: 0px 0px 10px 3px #ffe7a1,
                    inset 0px 0px 150px 6px #ffe7a1;
      }
      .form-new > label {
        color: white;
      }
      .form-new > input {
        width: 20vw;
      }

      .form-old {
        width: 20vw;
        height: 17vh;

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

        -webkit-box-shadow: 0px 0px 10px 3px #ffe7a1,
                    inset 0px 0px 150px 6px #ffe7a1;

                box-shadow: 0px 0px 10px 3px #ffe7a1,
                    inset 0px 0px 150px 6px #ffe7a1;
      }
      .form-old > label {
        color: white;
      }
      .form-old > input {
        width: 20vw;
      }

      .badge2 {
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
      }

      .plinth2 {
        width: 10vw;
        height: 10vw;

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
      }

      .plinth2>img {
        height: 100%;
        width: 100%;
        border-radius: 50%;
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

      /* special for horizontal */
      .nulTab {
        height: 75vh;
        margin-right: 10px;
      }
      table {
        height: 24vh;
      }
      .menu {
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
    }
    '''
  --
--