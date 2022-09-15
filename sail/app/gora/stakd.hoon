::
::  stakm - stak some gorae, on an old one, or not!
::
/-  *gora
/+  rudder, *mip
::
^-  (page:rudder tack manage-gora-2)
|_  [bol=bowl:gall odo=order:rudder sat=tack]
++  final  (alert:rudder 'stakd' build)
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
  =/  gor=(unit gora)
    ?~  g=(~(get by (malt args)) 'gora')  ~
    (~(get by pita.sat) (slav %uv u.g))
  ^-  reply:rudder
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
    ++  nul
      |^
      =;  rows=marl
        ;table
          ;thead
            ;tr
              ;th:"コイン"
              ;th:"古い名前"
              ;th:"鍛造の日"
              ;th:"あなたが持っている？"
            ==
          ==
        ::
          ;tbody
            ;*  rows
          ==
        ==
      ?~  gor
        ;+  empty
      ?:  ?=(%g -.u.gor)
        ;+  empty
      ?~  nul.u.gor
        ;+  empty
      ;*  (turn u.nul.u.gor glist)
      ++  glist
        |=  g=gora-standard
        ;tr
          ;td
            ;div(class "badge")
              ;div(class "plinth")
                ;div(class "glint");
                ;div(class "shadow");
                ;img(src "{(trip pic.g)}");
              ==
            ==
          ==
          ;td:"{(trip name.g)}"
          ;+  =+  yer=(yore made.g)
              ;td:"{(scow %ud y.yer)}年 {(scow %ud m.yer)}月 {(scow %ud d.t.yer)}日"
          ;+  ?.  (~(has in hodl.g) our.bol)
                ;td(class "red"):"X"
              ;td(class "green"):"Y"
        ==
      ::
      ++  empty
        ;tr
          ;td
            ;div(class "badge")
              ;div(class "plinth")
                ;div(class "glint");
                ;div(class "shadow");
                ;img(src "https://freedom-club.sfo2.digitaloceanspaces.com/props/gora/pattern.png");
              ==
            ==
          ==
          ;td:"いたずらゴラ"
          ;td:"1970年 1月 1日"
          ;td(class "red"):"X"
        ==
      --
    --
  ::
  ++  page
    ^-  manx
    ;html
      ;head
        ;title:"%gora -"
        ;style:"{(trip style)}"
        ;meta(charset "utf-8");
        ;meta
          =name     "viewport"
          =content  "width=device-width, initial-scale=1";
      ==
    ::
      ;body
        ;div(class "container")
          ;div(class "title-bar")
            ;div(class "title-pane")
              ;+  ?~  gor
                    ;div(class "title"):"???"
                  ;div(class "title"):"{(trip name.u.gor)}"
              ;div(class "title-glass");
            ==
          ==
        ::
          ;div(class "main")
            ;div(class "stak");
            ;div(class "nulTab")
              ;+  nul:make
            ==
          ==
        ::
          ;div(class "menu");
        ==
      ==
    ==
  ::
  ++  style
    '''
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

      .badge {
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
      }

      .plinth {
        width: 15vw;
        height: 15vw;

        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
      }

      .plinth>img {
        height: 100%;
        width: 100%;
        border-radius: 50%;
      }

      .glint {
        border-radius: 50%;
        z-index: 100%;
        width: 100%;
        height: 100%;
        position: absolute;
        background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
        transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
      }
    }
    '''
  --
--