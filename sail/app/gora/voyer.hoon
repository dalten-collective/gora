::
::  voyer - see a gora up close
::
/-  *gora
/+  rudder, *mip
::
^-  (page:rudder tack manage-gora-2)
|_  [bol=bowl:gall odo=order:rudder sat=tack]
++  final  (alert:rudder 'asked' build)
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
  =/  gor=(unit gora)
    ?~  g=(~(get by (malt args)) 'gora')  ~
    (~(get by pita.sat) (slav %uv u.g))
    ::
  |^  [%page page]
  ++  make
    |%
    ++  name
      ?~  gor  
        ;div(class "name")
          ;p:"わからない ゴラ"
        ==
      ;div(class "name")
        ;p:"{(trip name.u.gor)}"
      ==
    ++  host
      ?~  gor  
        ;div(class "host")
          ;p:"いたずらゾッド"
        ==
      ;div(class "host")
        ;p:"{(scow %p host.u.gor)}"
      ==
    ::
    ++  hedl
      ^-  manx
      ?~  gor
        ;div(class "tots")
          ;p:"わからない ホッドル"
        ==
      ?-    -.u.gor
          %s
        =;  [mine=@ud tots=@ud]
          ;div(class "tots")
            ;p:"mine: {(scow %ud mine)} / total: {(scow %ud tots)}"
          ==
        :_  %-  ~(rep by stak.u.gor)
            |=([[k=ship v=@ud] t=@ud] (add v t))
        ?~(had=(~(get by stak.u.gor) our.bol) 0 u.had)
      ::
          %g
        ?~  max.u.gor
          ;div(class "tots")
            ;p:"{<~(wyt in hodl.u.gor)>} hodl"
          ==
          ::
        ;div(class "tots")
          ;p:"{<~(wyt in hodl.u.gor)>} hodl / {(scow %ud u.max.u.gor)} max"
        ==
      ==
    ::
    ++  gora
      ^-  manx
      ?~  gor
        ;div(class "badge")
          ;div(class "in-set");
        ::
          ;div(class "set-in")
            ;div(class "glint");
          ::
            ;div(class "shadow");
          ::
            :: ;img(src "https://minderimages.nyc3.digitaloceanspaces.com/minder-folden/2021.12.28..21.13.26-Team%20Red%20Gem.png");
            ;img(src "https://freedom-club.sfo2.digitaloceanspaces.com/props/gora/pattern.png");
          ==
        ==
        ::
      ;div(class "badge")
        ;div(class "in-set");
      ::
        ;div(class "set-in")
          ;div(class "glint");
        ::
          ;div(class "shadow");
        ::
          ;img(src "{(trip pic.u.gor)}");
        ==
      ==
    --
  ++  page
    ^-  manx
    ;html
      ;head
        ;title:"%gora - {?~(gor (trip 'わからない ゴラ') (trip name.u.gor))}"
        ;style:"{(trip style)}"
        ;meta(charset "utf-8");
        ;meta
          =name     "viewport"
          =content  "width=device-width, initial-scale=1";
      ==
    ::
      ;body
        ;div(class "container")
          ;div(class "closeup-container")
            ;div(class "badge-box")
              ;+  gora:make
            ==
          ==
        ::
          ;div(class "details-container")
            ;div(class "name-container")
              ;+  name:make
            ==
            ;div(class "host-container")
              ;+  host:make
            ==
            ;div(class "tots-container")
              ;+  hedl:make
            ==
            ;div(class "xtra-container");
          ==
        ==
      ==
    ==
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

      .name-container {
        height: 5vh;

        display: flex;
        justify-content: center;
        align-item: center;
      }
      .name {
        z-index: 100;
        height: 4vh;
        width: 85%;
        padding-top: 3px;

        position: absolute;

        font-size: 20px;
        color: #c49a1d;
        text-shadow: 0px 0px 0 rgb(165,123,0),
                    0px 1px 0 rgb(134,92,0),
                    0px 2px  0 rgb(103,61,0),
                    0px 3px 2px rgba(150,141,115,1),
                    0px 3px 1px rgba(150,141,115,0.5),
                    0px 0px 2px rgba(150,141,115,.2);

        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
      }

      .name > p {
        margin: 0;
      }

      .host-container {
        height: 3vh;

        display: flex;
        justify-content: center;
        align-item: center;
      }

      .host {
        z-index: 100;
        height: 2vh;
        width: 85%;
        padding-top: 3px;

        position: absolute;

        font-size: 16px;
        color: #a8a18d;
        text-shadow: 0px 0px 0 rgb(155,148,128),
                    0px 1px 0 rgb(141,134,114),
                    0px 2px  0 rgb(128,121,101),
                    0px 3px 2px rgba(196,154,29,1),
                    0px 3px 1px rgba(196,154,29,0.5),
                    0px 0px 2px rgba(196,154,29,.2);

        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
      }

      .host > p {
        margin: 0;
      }

      .tots-container {
        height: 3vh;

        display: flex;
        justify-content: center;
        align-item: center;
      }

      .tots {
        z-index: 100;
        height: 2vh;
        width: 85%;
        padding-top: 3px;

        position: absolute;

        font-size: 16px;
        color: #a8a18d;
        text-shadow: 0px 0px 0 rgb(155,148,128),
                    0px 1px 0 rgb(141,134,114),
                    0px 2px  0 rgb(128,121,101),
                    0px 3px 2px rgba(196,154,29,1),
                    0px 3px 1px rgba(196,154,29,0.5),
                    0px 0px 2px rgba(196,154,29,.2);

        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
      }

      .tots > p {
        margin: 0;
      }

      /* container children */
      .closeup-container {
        display: flex;
        justify-content: center;
        align-items: center;
        padding-top: 5px;
      }

      /* .badge-box - holds badges */
      .badge-box {
        z-index: 0;
        width: 90vw;
        height: 90vw;

        border: 5px outset #c3a882;
        border-radius: 10px;
        box-shadow: 0px 0px 15px -2px #444444;

        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        margin-inline: 2%;

        background-image: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 40 40' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M20 20.5V18H0v-2h20v-2H0v-2h20v-2H0V8h20V6H0V4h20V2H0V0h22v20h2V0h2v20h2V0h2v20h2V0h2v20h2V0h2v20h2v2H20v-1.5zM0 20h2v20H0V20zm4 0h2v20H4V20zm4 0h2v20H8V20zm4 0h2v20h-2V20zm4 0h2v20h-2V20zm4 4h20v2H20v-2zm0 4h20v2H20v-2zm0 4h20v2H20v-2zm0 4h20v2H20v-2z' fill='%236a6259' fill-opacity='0.095' fill-rule='evenodd'/%3E%3C/svg%3E");
        background-color: #151612;
      }

      /*   badge - a badge inset in the box */
      .badge {
        border-radius: 50%;

        display: flex;
        justify-content: center;
        align-items: center;

        transition: transform 0.7s ease-in-out;
      }

      /*   in-set - holds a badge in the box */
      .in-set {
        z-index: 0;
        border-radius: 50%;
        box-shadow: 0px 0px 7px 5px #000;
        position: absolute;
        width: 85%;
        padding-bottom: 85%;
        background: radial-gradient(circle, rgb(15 13 2) 0%, rgb(0 0 0) 33%);
      }

      .set-in {
        width: 80vw;
        height: 80vw;

        border-radius: 50%;
        background: radial-gradient(circle at 50% 49%, #fcfcfc, #cccfd0 36%, #bab8b3 91%);

        display: flex;
        justify-content: center;
        position: relative;
        transition: all 1s ease-in-out;
      }

      /*   set-in > img settings */
      .set-in>img {
        height: 100%;
        width: 100%;
        border-radius: 50%;
        /*  filter: grayscale(0.6);
        transition: all 0.5s ease-in-out; */

        animation: inspect 6s infinite;
      }

      @keyframes inspect {

        /* filter: grayscale(0.4); */
        0% {
          filter: grayscale(0.4);
        }

        33% {
          filter: grayscale(0.2);
        }

        50% {
          filter: grayscale(0);
        }

        66% {
          filter: grayscale(0.2);
        }

        100% {
          filter: grayscale(0.4);
        }
      }

      /*   .glint - a moving glint */
      .glint {
        border-radius: 50%;
        z-index: 100;

        width: 100%;
        height: 100%;
        position: absolute;
        animation: inspectg 6s infinite;
      }

      @keyframes inspectg {

        /* transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg); */
        0% {
          background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
        }

        45% {
          background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 18%);
          transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
        }

        55% {
          background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 18%);
          transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
        }

        100% {
          background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
        }
      }

      /*   .shadow - a giggly shadow */
      .shadow {
        border-radius: 50%;
        width: 100%;
        height: 100%;
        z-index: 100;
        position: absolute;
        animation: inspects 6s infinite;
      }

      @keyframes inspects {

        /*  box-shadow: -15px -10px 25px 10px #151612 inset; */
        0% {
           box-shadow: -15px -10px 25px 10px #151612 inset;
        }

        20% {
           box-shadow: -8px -8px 18px 7px #212121 inset;
        }

        50% {
           box-shadow: -3px -7px 13px 5px #000000 inset;
        }

        70% {
           box-shadow: -8px -8px 18px 5px #212121 inset;
        }

        100% {
           box-shadow: -15px -10px 25px 10px #151612 inset;
        }
      }

      /*  set-in > animations */

      .set-in:hover>.shadow {
        box-shadow: -1px -1px 10px 5px #000000 inset;
      }

      /* details-container */
    .details-container {

    }

    .details-container > p {
      margin: 0;
      padding: 0;
    }


    }
    '''
  --
--