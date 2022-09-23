::
::  maker - make a standard gora
::
/-  *gora
/+  rudder, *mip
::
^-  (page:rudder tack manage-gora-2)
|_  [bol=bowl:gall odo=order:rudder sat=tack]
++  final
  |=  [suc=? msg=brief:rudder]
  ?.  suc
    (build ~ `[| msg])
  [%next (crip "voyer?gora={(trip msg)}") ~]
::
++  argue
  |=  [headers=header-list:http body=(unit octs)]
  ?>  authenticated.odo
  ^-  $@(brief:rudder manage-gora-2)
  =/  args=(map @t @t)
    ?~(body ~ (frisk:rudder q.u.body))
  ?.  ?&  (~(has by args) 'pic')
          (~(has by args) 'nam')
          (~(has by args) 'who')
          (~(has by args) 'typ')
          (~(has by args) 'act')
      ==
    'アクションの不許可'
  ?.  ?=(%mk-gora (~(got by args) 'act'))
    (cat 3 'アクションの不許可: ' (~(got by args) 'act'))
  =/  who=(list ship)
    ?~  dem=(rush (~(got by args) 'who') (more ace ;~(pfix sig fed:ag)))
    ~  u.dem
  ?.  ?=(%stakable (~(got by args) 'typ'))
    :^    %mk-gora
        (~(got by args) 'nam')
      (~(got by args) 'pic')
    :+  %.y
      (sy who)
    %+  rash
      (~(got by args) 'max')
    (cook |=(u=@ud ?:(=(0 u) ~ [~ u])) dem)
  :^    %mk-gora
      (~(got by args) 'nam')
    (~(got by args) 'pic')
  [%.n (malt `(list [@p @ud])`(turn who |=(hu=@p [hu 1])))]
::
++  build
  |=  $:  args=(list [k=@t v=@t])
          msgs=(unit [gud=? txt=@])
      ==
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
    ++  succ
      ^-  manx
      ?~  msgs  ;div;
      ?.  gud.u.msgs  ;div;
      ;div(id "succ-modal", class "modal", style "display: block;")
        ;div(class "modal-center")
          ;div(class "succ-modal-header")
            ;div(class "name")
              ;p:"ゴラ成功"
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
    --
  ::
  ++  page
    ^-  manx
    ;html
      ;head
        ;title:"{(trip 'ゴラ - 想像力')}"
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
          ;+  succ:make
        ==
        ;div(class "container")
          ;div(class "preview")
            ;div(class "new-gora")
              ;div(class "gora-img")
                ;img(id "gora", src "https://freedom-club.sfo2.digitaloceanspaces.com/props/gora/pattern.png");
                ;div(class "gora-shadow");
                ;div(class "gora-shine");
              ==
            ==
            ;div(class "forge-glass");
            ;div(class "forge");
          ==
          ;div(class "main")
            ;div(class "type-select")
              ;div(class "types")
                ;div(class "standard")
                  ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                    ;path(fill "#dcbe66", d "M12 22.85q-2.275 0-4.25-.85t-3.438-2.312Q2.85 18.225 2 16.25q-.85-1.975-.85-4.25T2 7.75q.85-1.975 2.312-3.438Q5.775 2.85 7.75 2q1.975-.85 4.25-.85t4.25.85q1.975.85 3.438 2.312Q21.15 5.775 22 7.75q.85 1.975.85 4.25T22 16.25q-.85 1.975-2.312 3.438Q18.225 21.15 16.25 22q-1.975.85-4.25.85Z");
                  ==
                ==
              ::
                ;label(class "switch")
                  ;input(type "checkbox", name "type-select-check");
                  ;span(class "slider");
                ==
              ::
                ;div(class "stakable")
                  ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                    ;path(fill "#bb8c02", d "M12 10.625q-3.9 0-6.638-1.3-2.737-1.3-2.737-3.1t2.737-3.088Q8.1 1.85 12 1.85t6.637 1.287q2.738 1.288 2.738 3.088t-2.738 3.1q-2.737 1.3-6.637 1.3Zm0 5.75q-3.9 0-6.638-1.288Q2.625 13.8 2.625 12V8.725q0 1 .825 1.812.825.813 2.163 1.388 1.337.575 3.012.887 1.675.313 3.375.313t3.375-.313q1.675-.312 3.013-.887 1.337-.575 2.162-1.388.825-.812.825-1.812V12q0 1.8-2.738 3.087Q15.9 16.375 12 16.375Zm0 5.775q-3.9 0-6.638-1.288-2.737-1.287-2.737-3.087V14.5q0 1 .825 1.8t2.163 1.375q1.337.575 3.012.887 1.675.313 3.375.313t3.375-.313q1.675-.312 3.013-.874 1.337-.563 2.162-1.376.825-.812.825-1.812v3.275q0 1.8-2.738 3.087Q15.9 22.15 12 22.15Z");
                  ==
                ==
              ==
            ==
            ;div(class "form-inside")
              ;div(class "form-standard", id "form-standard", style "display: block;")
                ;form(method "post", class "make-form")
                  ;label:'ゴラ-stan'
                  ;input(name "pic", id "pic-g", type "text", placeholder "http://クワルタス.コム/assets/pic/new-logo.jpg", required "");
                  ;label(for "pic-g"):"トロフィー テンプレート"
                  ;input(name "nam", id "nam-g", type "text", placeholder "クワルタスという名のタコ", required "");
                  ;label(for "nam-g"):"ゴラの名前"
                  ;textarea(name "who", id "who-g", placeholder "~rabsef-bicrym ~zod ~dalten");
                  ;label(for "who-g"):"発送する船"
                  ;input(name "max", id "max-g", type "text", placeholder "0 / >0", required "");
                  ;label(for "max-g"):"無制限の場合は 0"
                  ;input(name "act", value "mk-gora", style "display: none;");
                  ;input(name "typ", value "standard", style "display: none;");
                  ;div(class "go-button")
                    ;button
                      ;svg(xmlns "http://www.w3.org/2000/svg", height "40", width "40")
                        ;path(fill "#12de12", d "M18.5 28.458h3.208v-6.75h6.75v-3.166h-6.75v-7H18.5v7h-6.958v3.166H18.5Zm1.5 9.084q-3.667 0-6.854-1.375-3.188-1.375-5.563-3.75-2.375-2.375-3.75-5.563Q2.458 23.667 2.458 20q0-3.667 1.375-6.875t3.75-5.583q2.375-2.375 5.563-3.75Q16.333 2.417 20 2.417q3.667 0 6.875 1.375t5.583 3.75q2.375 2.375 3.75 5.583T37.583 20q0 3.667-1.375 6.854-1.375 3.188-3.75 5.563-2.375 2.375-5.583 3.75T20 37.542Zm0-4.209q5.583 0 9.458-3.875T33.333 20q0-5.583-3.875-9.458T20 6.667q-5.583 0-9.458 3.875T6.667 20q0 5.583 3.875 9.458T20 33.333ZM20 20Z");
                      ==
                    ==
                  ==
                ==
              ==
              ;div(class "form-stakable", id "form-stakable", style "display: none;")
                ;form(method "post", class "make-form")
                  ;label:'ゴラ-stak'
                  ;input(name "pic", id "pic-s", type "text", placeholder "http://クワルタス.コム/assets/pic/new-logo.jpg", required "");
                  ;label(for "pic-s"):"トロフィー テンプレート"
                  ;input(name "nam", id "nam-s", type "text", placeholder "クワルタスという名のタコ", required "");
                  ;label(for "nam-s"):"ゴラの名前"
                  ;textarea(name "who", id "who-s", placeholder "~rabsef-bicrym ~zod ~dalten");
                  ;label(for "who-s"):"発送する船"
                  ;input(name "act", value "mk-gora", style "display: none;");
                  ;input(name "typ", value "stakable", style "display: none;");
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
            ;+  =-  (circle:make [- "./stakm" %.y])
              ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                ;path(fill "red", d "M6 14q0 1.3.525 2.462.525 1.163 1.5 2.038Q8 18.375 8 18.275v-.225q0-.8.3-1.5t.875-1.275L12 12.5l2.825 2.775q.575.575.875 1.275.3.7.3 1.5v.225q0 .1-.025.225.975-.875 1.5-2.038Q18 15.3 18 14q0-1.25-.462-2.363-.463-1.112-1.338-1.987-.5.325-1.05.487-.55.163-1.125.163-1.55 0-2.687-1.025Q10.2 8.25 10.025 6.75 9.05 7.575 8.3 8.462q-.75.888-1.262 1.8-.513.913-.775 1.863Q6 13.075 6 14Zm6 1.3-1.425 1.4q-.275.275-.425.625-.15.35-.15.725 0 .8.588 1.375Q11.175 20 12 20t1.413-.575Q14 18.85 14 18.05q0-.4-.15-.738-.15-.337-.425-.612ZM12 3v3.3q0 .85.588 1.425.587.575 1.437.575.45 0 .838-.187.387-.188.687-.563L16 7q1.85 1.05 2.925 2.925Q20 11.8 20 14q0 3.35-2.325 5.675Q15.35 22 12 22q-3.35 0-5.675-2.325Q4 17.35 4 14q0-3.225 2.163-6.125Q8.325 4.975 12 3Z");
              ==
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
    var cbox = document.querySelector("input[name=type-select-check]");
    var stan = document.getElementById("form-standard");
    var stak = document.getElementById("form-stakable");
    var gora = document.getElementById("gora");

    if (cbox) {
      cbox.addEventListener('change', function() {
        if (this.checked) {
          stan.style.display = "none";
          stak.style.display = "block";
          gora.src = "https://freedom-club.sfo2.digitaloceanspaces.com/props/gora/pattern.png";
        } else {
          stak.style.display = "none";
          stan.style.display = "block";
          gora.src = "https://freedom-club.sfo2.digitaloceanspaces.com/props/gora/pattern.png";
        }
      });
    };

    var pox = document.querySelector("input[id=pic-g]");
    var flu = document.querySelector("input[id=pic-s]");
    
    if (pox) {
      pox.addEventListener('blur', function() {
        var vir = document.querySelector("input[id=pic-g]");
        if (vir.value == '') {
          return;
        } else {
          gora.src = vir.value;
        };
      });
    };

    if (flu) {
      flu.addEventListener('blur', function() {
        var vir = document.querySelector("input[id=pic-s]");
        if (vir.value == '') {
          return;
        } else {
          gora.src = vir.value;
        };
      });
    }



    var succ = document.getElementById("succ-modal");
    var fail = document.getElementById("fail-modal");

    window.onclick = function(event) {
      if (event.target == succ) {
        succ.style.display = "none";
      } else if (event.target == fail) {
        fail.style.display = "none";
      };
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
    /* phone - vertical */
    @media (max-aspect-ratio: 9/16) {
      /* page container */
      .container {
        width: 97vw;
        height: 97vh;
        padding-top: 5px;

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

        background-image: -o-radial-gradient(#9e7703 1px, transparent 1px), -o-radial-gradient(#9e7703 1px, transparent 1px);

        background-image: radial-gradient(#9e7703 1px, transparent 1px), radial-gradient(#9e7703 1px, transparent 1px);
        background-size: 59px 59px;
        background-position: 0 0, 29.5px 29.5px;

        -webkit-animation: pulse 12s infinite;

                animation: pulse 12s infinite;
      }

      .head {
        width: 100%;
        height: 20%;

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

      .preview {
        width: 70%;
        margin: 10px;

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

      .forge {
        z-index: 0;
        width: 90%;
        padding-bottom: 90%;


        display: -webkit-box;


        display: -ms-flexbox;


        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;

        background-color: #515149;
        opacity: 1;
        background-image: -o-radial-gradient(center center, circle, #ffe500, #515149), -o-repeating-radial-gradient(center center, circle, #ffe500, #ffe500, 4px, transparent 8px, transparent 4px);
        background-image: radial-gradient(circle at center center, #ffe500, #515149), repeating-radial-gradient(circle at center center, #ffe500, #ffe500, 4px, transparent 8px, transparent 4px);
        background-blend-mode: multiply;

        border: 5px outset #c3a882;
        border-radius: 10px;

        -webkit-box-shadow: 5px 5px 5px 0px #000000, inset 4px 4px 15px 0px #000000, 5px 5px 15px 5px rgba(0,0,0,0); 
        box-shadow: 5px 5px 5px 0px #000000, inset 4px 4px 15px 0px #000000, 5px 5px 15px 5px rgba(0,0,0,0);
      }

      .forge-glass {
        z-index: 10;
        width: 60%;
        padding-bottom: 60%;
        position: absolute;

        -webkit-backdrop-filter: blur(5px);

                backdrop-filter: blur(5px);
      }

      .new-gora {
        z-index: 20;
        width: 60%;
        padding-bottom: 60%;
        position: absolute;
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

      .gora-img {
        width: 100%;
        height: 100%;
        border-radius: 50%;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex
      }

      .gora-img > img {
        width: 100%;
        height: 100%;
        
        border-radius: 50%;
        position: absolute;

        -webkit-animation: rotate 12s infinite linear;

                animation: rotate 12s infinite linear;
      }

      .gora-shadow {
        border-radius: 50%;
        width: 100%;
        height: 100%;

        z-index: 100;
        position: absolute;

        -webkit-animation: flicker 12s infinite;

                animation: flicker 12s infinite;
      }

      .gora-shine {
        border-radius: 50%;
        z-index: 100;
        background: -o-radial-gradient(50% 50%, circle, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
        background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
        width: 100%;
        height: 100%;
        -webkit-transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
                transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
        position: absolute;
      }

      .main {
        width: 100%;
        height: 80%;
        margin: 2%;
        padding: 1%;

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

      /* select gora type stakable, standard */
      .type-select {
        width: 45%;
        height: 8%;
        margin: 2%;
        padding: 1%;

        background-color: rgba(255,219,0,15%);
        border-radius: 20px;
        -webkit-box-shadow: 1px 1px 5px .5px #bb8c02,
                    inset 0px 0px 25px 3px #000000;
                box-shadow: 1px 1px 5px .5px #bb8c02,
                    inset 0px 0px 25px 3px #000000;
        -webkit-backdrop-filter: blur(5px);
                backdrop-filter: blur(5px);

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

      .types {
        width: 90%;
        height: 100%;
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

      .standard {
        width: 20%;
      }

      .stakable {
        width: 20%;
      }

      /* witch, witch, witch */
      .switch {
        position: relative;
        display: inline-block;
        width: 100%;
        height: 3vh;
      }

      /* Hide default HTML checkbox */
      .switch input {
        opacity: 0;
        width: 0;
        height: 0;
      }

      .switch input:checked + .slider {
        background-color: #bb8c02;
      }

      .switch input:focus + .slider {
        -webkit-box-shadow: 0 0 1px #bb8c02;
                box-shadow: 0 0 1px #bb8c02;
      }

      .switch input:checked + .slider:before {
        -webkit-transform: translateX(5.5vh);
        -ms-transform: translateX(5.5vh);
        transform: translateX(5.5vh);
      }

      /* The slider */
      .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #dcbe66;
        -webkit-transition: .4s;
        -o-transition: .4s;
        transition: .4s;
        border-radius: 50px;
      }

      .slider:before {
        position: absolute;
        content: "";
        left: 1vw;
        height: 3vh;
        width: 3vh;
        background-color: white;
        -webkit-transition: .4s;
        -o-transition: .4s;
        transition: .4s;
        border-radius: 50px;
      }


      /* general form helpers */
      .form-inside {
        width: 80%;
        height: 80%;

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

      .form-standard {
        width: 95%;
        height: 95%;
        border-radius: 50px;
        display: block;
        background-color: rgba(220,190,102,.6);
        -webkit-box-shadow: 1px 1px 10px 2px #bb8c02,
                    inset 0px 0px 25px 3px #ffffff90;
                box-shadow: 1px 1px 10px 2px #bb8c02,
                    inset 0px 0px 25px 3px #ffffff90;
      }

      .form-stakable {
        width: 95%;
        height: 95%;
        border-radius: 50px;
        display: none;
        background-color: rgba(188,140,3,.9);
        -webkit-box-shadow: 1px 1px 10px 2px #bb8c02,
                    inset 0px 0px 25px 3px #ffffff90;
                box-shadow: 1px 1px 10px 2px #bb8c02,
                    inset 0px 0px 25px 3px #ffffff90;
      }

      .make-form {
        width: 100%;
        height: 100%;
        
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

      .make-form > input {
        width: 80%;
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

      .make-form > textarea {
        width: 80%;
        height: 20%;
        padding: 2px;
        margin: 2px;
        background: none;
        -webkit-box-shadow: 1px 1px 10px 2px #bb8c02,
                    inset 0px 0px 50px 3px #ffffff90;
                box-shadow: 1px 1px 10px 2px #bb8c02,
                    inset 0px 0px 50px 3px #ffffff90;
        border: none;
        border-radius: 5px;
      }

      .make-form > label {
                font-size: 20px;
        color: #c49a1d;
        text-shadow: 0px 0px 0 rgb(165,123,0),
                    0px 1px 0 rgb(134,92,0),
                    0px 2px  0 rgb(103,61,0),
                    0px 3px 2px rgba(150,141,115,1),
                    0px 3px 1px rgba(150,141,115,0.5),
                    0px 0px 2px rgba(150,141,115,.2);
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
      .succ-modal-header {
        width: 80vw;
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
      .fail-modal-header {
        width: 80vw;
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
    @media (min-aspect-ratio: 9/16) and (max-aspect-ratio: 16/9) {
      .container {
        width: 97vw;
        height: 97vh;
        padding-top: 5px;

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
        text-align: center;

        background-image: -o-radial-gradient(#9e7703 1px, transparent 1px),
          -o-radial-gradient(#9e7703 1px, transparent 1px);

        background-image: radial-gradient(#9e7703 1px, transparent 1px),
          radial-gradient(#9e7703 1px, transparent 1px);
        background-size: 59px 59px;
        background-position: 0 0, 29.5px 29.5px;

        -webkit-animation: pulse 12s infinite;

                animation: pulse 12s infinite;
      }

      .head {
        width: 50;
        height: 100%;

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

      .preview {
        width: 35vw;
        margin: 10px;

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

      .forge {
        z-index: 0;
        width: 35vw;
        padding-bottom: 35vw;

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;

        background-color: #515149;
        opacity: 1;
        background-image: -o-radial-gradient(center center, circle, #ffe500, #515149),
          -o-repeating-radial-gradient(
            center center,
            circle,
            #ffe500,
            #ffe500,
            4px,
            transparent 8px,
            transparent 4px
          );
        background-image: radial-gradient(circle at center center, #ffe500, #515149),
          repeating-radial-gradient(
            circle at center center,
            #ffe500,
            #ffe500,
            4px,
            transparent 8px,
            transparent 4px
          );
        background-blend-mode: multiply;

        border: 5px outset #c3a882;
        border-radius: 10px;

        -webkit-box-shadow: 5px 5px 5px 0px #000000, inset 4px 4px 15px 0px #000000,
          5px 5px 15px 5px rgba(0, 0, 0, 0);
        box-shadow: 5px 5px 5px 0px #000000, inset 4px 4px 15px 0px #000000,
          5px 5px 15px 5px rgba(0, 0, 0, 0);
      }

      .forge-glass {
        z-index: 10;
        width: 34vw;
        padding-bottom: 35vw;
        position: absolute;

        -webkit-backdrop-filter: blur(5px);

                backdrop-filter: blur(5px);
      }

      .new-gora {
        z-index: 20;
        width: 33vw;
        padding-bottom: 33vw;
        position: absolute;
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

      .gora-img {
        width: 33vw;
        border-radius: 50%;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
      }

      .gora-img > img {
        width: 100%;
        height: 100%;

        border-radius: 50%;
        position: absolute;

        -webkit-animation: rotate 12s infinite linear;

                animation: rotate 12s infinite linear;
      }

      .gora-shadow {
        border-radius: 50%;
        width: 100%;
        height: 100%;

        z-index: 100;
        position: absolute;

        -webkit-animation: flicker 12s infinite;

                animation: flicker 12s infinite;
      }

      .gora-shine {
        border-radius: 50%;
        z-index: 100;
        background: -o-radial-gradient(
          50% 50%,
          circle,
          rgba(255, 255, 255, 0.4),
          rgba(255, 255, 255, 0.4) 5%,
          rgba(255, 255, 255, 0) 15%
        );
        background: radial-gradient(
          circle at 50% 50%,
          rgba(255, 255, 255, 0.4),
          rgba(255, 255, 255, 0.4) 5%,
          rgba(255, 255, 255, 0) 15%
        );
        width: 100%;
        height: 100%;
        -webkit-transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg)
          rotateX(0deg) rotateY(0deg);
                transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg)
          rotateX(0deg) rotateY(0deg);
        position: absolute;
      }

      .main {
        width: 50vw;
        height: 70vh;
        margin: 2%;
        padding: 1%;

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

      /* select gora type stakable, standard */
      .type-select {
        width: 17vw;
        height: 4vw;
        margin: 2%;
        padding: 1%;

        background-color: rgba(255, 219, 0, 15%);
        border-radius: 20px;
        -webkit-box-shadow: 1px 1px 5px 0.5px #bb8c02, inset 0px 0px 25px 3px #000000;
                box-shadow: 1px 1px 5px 0.5px #bb8c02, inset 0px 0px 25px 3px #000000;
        -webkit-backdrop-filter: blur(5px);
                backdrop-filter: blur(5px);

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

      .types {
        width: 90%;
        height: 100%;
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

      .standard {
        
      }

      .stakable {
        
      }

      /* witch, witch, witch */
      .switch {
        position: relative;
        display: inline-block;
        width: 10vw;
        height: 3vh;
      }

      /* Hide default HTML checkbox */
      .switch input {
        opacity: 0;
        width: 0;
        height: 0;
      }

      .switch input:checked + .slider {
        background-color: #bb8c02;
      }

      .switch input:focus + .slider {
        -webkit-box-shadow: 0 0 1px #bb8c02;
                box-shadow: 0 0 1px #bb8c02;
      }

      .switch input:checked + .slider:before {
        -webkit-transform: translateX(5.3vw);
        -ms-transform: translateX(5.3vw);
        transform: translateX(5.3vw);
      }

      /* The slider */
      .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #dcbe66;
        -webkit-transition: 0.4s;
        -o-transition: 0.4s;
        transition: 0.4s;
        border-radius: 50px;
      }

      .slider:before {
        position: absolute;
        content: '';
        left: 0vw;
        height: 3vh;
        width: 3vh;
        background-color: white;
        -webkit-transition: 0.4s;
        -o-transition: 0.4s;
        transition: 0.4s;
        border-radius: 50px;
      }

      /* general form helpers */
      .form-inside {
        width: 80%;
        height: 80%;

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

      .form-standard {
        width: 95%;
        height: 95%;
        border-radius: 50px;
        display: block;
        background-color: rgba(220, 190, 102, 0.6);
        -webkit-box-shadow: 1px 1px 10px 2px #bb8c02, inset 0px 0px 25px 3px #ffffff90;
                box-shadow: 1px 1px 10px 2px #bb8c02, inset 0px 0px 25px 3px #ffffff90;
      }

      .form-stakable {
        width: 95%;
        height: 95%;
        border-radius: 50px;
        display: none;
        background-color: rgba(188, 140, 3, 0.9);
        -webkit-box-shadow: 1px 1px 10px 2px #bb8c02, inset 0px 0px 25px 3px #ffffff90;
                box-shadow: 1px 1px 10px 2px #bb8c02, inset 0px 0px 25px 3px #ffffff90;
      }

      .make-form {
        width: 100%;
        height: 100%;

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

      .make-form > input {
        width: 80%;
        padding: 2px;
        margin: 2px;
        background: none;
        -webkit-box-shadow: 1px 1px 10px 2px #bb8c02, inset 0px 0px 15px 3px #ffffff90;
                box-shadow: 1px 1px 10px 2px #bb8c02, inset 0px 0px 15px 3px #ffffff90;
        border: none;
        border-radius: 5px;
      }

      .make-form > textarea {
        width: 80%;
        height: 20%;
        padding: 2px;
        margin: 2px;
        background: none;
        -webkit-box-shadow: 1px 1px 10px 2px #bb8c02, inset 0px 0px 50px 3px #ffffff90;
                box-shadow: 1px 1px 10px 2px #bb8c02, inset 0px 0px 50px 3px #ffffff90;
        border: none;
        border-radius: 5px;
      }

      .make-form > label {
        font-size: 20px;
        color: #c49a1d;
        text-shadow: 0px 0px 0 rgb(165, 123, 0), 0px 1px 0 rgb(134, 92, 0),
          0px 2px 0 rgb(103, 61, 0), 0px 3px 2px rgba(150, 141, 115, 1),
          0px 3px 1px rgba(150, 141, 115, 0.5), 0px 0px 2px rgba(150, 141, 115, 0.2);
      }

      /* go button */
      .go-button {
        cursor: pointer;
        border-radius: 50%;
        padding: 5px;
        margin: 5px;

        -webkit-box-shadow: inset 4px 4px 10px 2px rgb(83 255 0 / 50%),
          inset -3px -4px 10px 2px rgb(61 242 0 / 60%),
          0px 0px 0px 1px rgb(29 87 0 / 80%), 0px 2px 3px 2px rgb(0 0 0 / 80%);

                box-shadow: inset 4px 4px 10px 2px rgb(83 255 0 / 50%),
          inset -3px -4px 10px 2px rgb(61 242 0 / 60%),
          0px 0px 0px 1px rgb(29 87 0 / 80%), 0px 2px 3px 2px rgb(0 0 0 / 80%);
      }

      .go-button > button {
        padding: 0px;
        background: none;
        border: none;
        cursor: pointer;
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
        background-color: rgb(0, 0, 0); /* fallback color */
        background-color: rgba(0, 0, 0, 0.4); /* black w/ opacity */
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
      .succ-modal-header {
        width: 80vw;
        height: 10vh;

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
      .fail-modal-header {
        width: 80vw;
        height: 10vh;

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
        text-shadow: 0px 0px 0 rgb(165, 123, 0), 0px 1px 0 rgb(134, 92, 0),
          0px 2px 0 rgb(103, 61, 0), 0px 3px 2px rgba(150, 141, 115, 1),
          0px 3px 1px rgba(150, 141, 115, 0.5), 0px 0px 2px rgba(150, 141, 115, 0.2);

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
        height: 30vh;

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
        text-shadow: 0px 0px 0 rgb(155, 148, 128), 0px 1px 0 rgb(141, 134, 114),
          0px 2px 0 rgb(128, 121, 101), 0px 3px 2px rgba(196, 154, 29, 1),
          0px 3px 1px rgba(196, 154, 29, 0.5), 0px 0px 2px rgba(196, 154, 29, 0.2);

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


    /* phone - horizontal */
    @media (min-aspect-ratio: 16/9) {
      .container {
        width: 97vw;
        height: 97vh;
        padding-top: 5px;

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
        text-align: center;

        background-image: -o-radial-gradient(#9e7703 1px, transparent 1px),
          -o-radial-gradient(#9e7703 1px, transparent 1px);

        background-image: radial-gradient(#9e7703 1px, transparent 1px),
          radial-gradient(#9e7703 1px, transparent 1px);
        background-size: 59px 59px;
        background-position: 0 0, 29.5px 29.5px;

        -webkit-animation: pulse 12s infinite;

                animation: pulse 12s infinite;
      }

      .head {
        width: 50;
        height: 100%;

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

      .preview {
        width: 35vw;
        margin: 10px;

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

      .forge {
        z-index: 0;
        width: 35vw;
        padding-bottom: 35vw;

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;

        background-color: #515149;
        opacity: 1;
        background-image: -o-radial-gradient(center center, circle, #ffe500, #515149),
          -o-repeating-radial-gradient(
            center center,
            circle,
            #ffe500,
            #ffe500,
            4px,
            transparent 8px,
            transparent 4px
          );
        background-image: radial-gradient(circle at center center, #ffe500, #515149),
          repeating-radial-gradient(
            circle at center center,
            #ffe500,
            #ffe500,
            4px,
            transparent 8px,
            transparent 4px
          );
        background-blend-mode: multiply;

        border: 5px outset #c3a882;
        border-radius: 10px;

        -webkit-box-shadow: 5px 5px 5px 0px #000000, inset 4px 4px 15px 0px #000000,
          5px 5px 15px 5px rgba(0, 0, 0, 0);
        box-shadow: 5px 5px 5px 0px #000000, inset 4px 4px 15px 0px #000000,
          5px 5px 15px 5px rgba(0, 0, 0, 0);
      }

      .forge-glass {
        z-index: 10;
        width: 34vw;
        padding-bottom: 35vw;
        position: absolute;

        -webkit-backdrop-filter: blur(5px);

                backdrop-filter: blur(5px);
      }

      .new-gora {
        z-index: 20;
        width: 33vw;
        padding-bottom: 33vw;
        position: absolute;
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

      .gora-img {
        width: 33vw;
        border-radius: 50%;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
      }

      .gora-img > img {
        width: 100%;
        height: 100%;

        border-radius: 50%;
        position: absolute;

        -webkit-animation: rotate 12s infinite linear;

                animation: rotate 12s infinite linear;
      }

      .gora-shadow {
        border-radius: 50%;
        width: 100%;
        height: 100%;

        z-index: 100;
        position: absolute;

        -webkit-animation: flicker 12s infinite;

                animation: flicker 12s infinite;
      }

      .gora-shine {
        border-radius: 50%;
        z-index: 100;
        background: -o-radial-gradient(
          50% 50%,
          circle,
          rgba(255, 255, 255, 0.4),
          rgba(255, 255, 255, 0.4) 5%,
          rgba(255, 255, 255, 0) 15%
        );
        background: radial-gradient(
          circle at 50% 50%,
          rgba(255, 255, 255, 0.4),
          rgba(255, 255, 255, 0.4) 5%,
          rgba(255, 255, 255, 0) 15%
        );
        width: 100%;
        height: 100%;
        -webkit-transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg)
          rotateX(0deg) rotateY(0deg);
                transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg)
          rotateX(0deg) rotateY(0deg);
        position: absolute;
      }

      .main {
        width: 50vw;
        height: 70vh;
        margin: 2%;
        padding: 1%;

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

      /* select gora type stakable, standard */
      .type-select {
        width: 15vw;
        height: 4vw;
        margin: -7%;
        padding: 1%;

        background-color: rgba(255, 219, 0, 15%);
        border-radius: 20px;
        -webkit-box-shadow: 1px 1px 5px 0.5px #bb8c02, inset 0px 0px 25px 3px #000000;
                box-shadow: 1px 1px 5px 0.5px #bb8c02, inset 0px 0px 25px 3px #000000;
        -webkit-backdrop-filter: blur(5px);
                backdrop-filter: blur(5px);

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
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

      .types {
        width: 90%;
        height: 100%;
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

      .standard {
        
      }

      .stakable {
        
      }

      /* witch, witch, witch */
      .switch {
        position: relative;
        display: inline-block;
        width: 10vw;
        height: 3vh;
      }

      /* Hide default HTML checkbox */
      .switch input {
        opacity: 0;
        width: 0;
        height: 0;
      }

      .switch input:checked + .slider {
        background-color: #bb8c02;
      }

      .switch input:focus + .slider {
        -webkit-box-shadow: 0 0 1px #bb8c02;
                box-shadow: 0 0 1px #bb8c02;
      }

      .switch input:checked + .slider:before {
        -webkit-transform: translateX(5.3vw);
        -ms-transform: translateX(5.3vw);
        transform: translateX(5.3vw);
      }

      /* The slider */
      .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #dcbe66;
        -webkit-transition: 0.4s;
        -o-transition: 0.4s;
        transition: 0.4s;
        border-radius: 50px;
      }

      .slider:before {
        position: absolute;
        content: '';
        left: 0vw;
        height: 3vh;
        width: 3vh;
        background-color: white;
        -webkit-transition: 0.4s;
        -o-transition: 0.4s;
        transition: 0.4s;
        border-radius: 50px;
      }

      /* general form helpers */
      .form-inside {
        width: 100%;
        height: 100%;

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

      .form-standard {
        width: 100%;
        height: 130%;
        border-radius: 50px;
        display: block;
        background-color: rgba(220, 190, 102, 0.6);
        -webkit-box-shadow: 1px 1px 10px 2px #bb8c02, inset 0px 0px 25px 3px #ffffff90;
                box-shadow: 1px 1px 10px 2px #bb8c02, inset 0px 0px 25px 3px #ffffff90;
      }

      .form-stakable {
        width: 100%;
        height: 130%;
        border-radius: 50px;
        display: none;
        background-color: rgba(188, 140, 3, 0.9);
        -webkit-box-shadow: 1px 1px 10px 2px #bb8c02, inset 0px 0px 25px 3px #ffffff90;
                box-shadow: 1px 1px 10px 2px #bb8c02, inset 0px 0px 25px 3px #ffffff90;
      }

      .make-form {
        width: 100%;
        height: 100%;

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

      .make-form > input {
        width: 80%;
        padding: 2px;
        margin: 2px;
        background: none;
        -webkit-box-shadow: 1px 1px 10px 2px #bb8c02, inset 0px 0px 15px 3px #ffffff90;
                box-shadow: 1px 1px 10px 2px #bb8c02, inset 0px 0px 15px 3px #ffffff90;
        border: none;
        border-radius: 5px;
      }

      .make-form > textarea {
        width: 80%;
        height: 20%;
        padding: 2px;
        margin: 2px;
        background: none;
        -webkit-box-shadow: 1px 1px 10px 2px #bb8c02, inset 0px 0px 50px 3px #ffffff90;
                box-shadow: 1px 1px 10px 2px #bb8c02, inset 0px 0px 50px 3px #ffffff90;
        border: none;
        border-radius: 5px;
      }

      .make-form > label {
        font-size: 20px;
        color: #c49a1d;
        text-shadow: 0px 0px 0 rgb(165, 123, 0), 0px 1px 0 rgb(134, 92, 0),
          0px 2px 0 rgb(103, 61, 0), 0px 3px 2px rgba(150, 141, 115, 1),
          0px 3px 1px rgba(150, 141, 115, 0.5), 0px 0px 2px rgba(150, 141, 115, 0.2);
      }

      /* go button */
      .go-button {
        cursor: pointer;
        border-radius: 50%;
        padding: 5px;
        margin: 5px;

        -webkit-box-shadow: inset 4px 4px 10px 2px rgb(83 255 0 / 50%),
          inset -3px -4px 10px 2px rgb(61 242 0 / 60%),
          0px 0px 0px 1px rgb(29 87 0 / 80%), 0px 2px 3px 2px rgb(0 0 0 / 80%);

                box-shadow: inset 4px 4px 10px 2px rgb(83 255 0 / 50%),
          inset -3px -4px 10px 2px rgb(61 242 0 / 60%),
          0px 0px 0px 1px rgb(29 87 0 / 80%), 0px 2px 3px 2px rgb(0 0 0 / 80%);
      }

      .go-button > button {
        padding: 0px;
        background: none;
        border: none;
        cursor: pointer;
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
        background-color: rgb(0, 0, 0); /* fallback color */
        background-color: rgba(0, 0, 0, 0.4); /* black w/ opacity */
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
      .succ-modal-header {
        width: 80vw;
        height: 10vh;

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
      .fail-modal-header {
        width: 80vw;
        height: 10vh;

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
        text-shadow: 0px 0px 0 rgb(165, 123, 0), 0px 1px 0 rgb(134, 92, 0),
          0px 2px 0 rgb(103, 61, 0), 0px 3px 2px rgba(150, 141, 115, 1),
          0px 3px 1px rgba(150, 141, 115, 0.5), 0px 0px 2px rgba(150, 141, 115, 0.2);

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
        height: 30vh;

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
        text-shadow: 0px 0px 0 rgb(155, 148, 128), 0px 1px 0 rgb(141, 134, 114),
          0px 2px 0 rgb(128, 121, 101), 0px 3px 2px rgba(196, 154, 29, 1),
          0px 3px 1px rgba(196, 154, 29, 0.5), 0px 0px 2px rgba(196, 154, 29, 0.2);

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

    @-webkit-keyframes rotate {
      0% {
        -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
      }

      33% {
        -webkit-transform: rotate(-5deg);
                transform: rotate(-5deg);
      }

      66% {
        -webkit-transform: rotate(5deg);
                transform: rotate(5deg);
      }

      100% {
        -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
      }
    }

    @keyframes rotate {
      0% {
        -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
      }

      33% {
        -webkit-transform: rotate(-5deg);
                transform: rotate(-5deg);
      }

      66% {
        -webkit-transform: rotate(5deg);
                transform: rotate(5deg);
      }

      100% {
        -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
      }
    }

    @-webkit-keyframes flicker {
      0% {
        -webkit-box-shadow: 0px 1px 5px 2px #bb8c02,
            inset -3px -2px 15px 3px #000000,
            0px 0px 40px 18px rgb(186 100 29 / 80%);
                box-shadow: 0px 1px 5px 2px #bb8c02,
            inset -3px -2px 15px 3px #000000,
            0px 0px 40px 18px rgb(186 100 29 / 80%);
      }

      25% {
        -webkit-box-shadow: -5px -4px 5px 2px #bb8c02,
            inset -5px -4px 15px 3px #000000,
            0px 0px 40px 18px rgb(186 100 29 / 80%);
                box-shadow: -5px -4px 5px 2px #bb8c02,
            inset -5px -4px 15px 3px #000000,
            0px 0px 40px 18px rgb(186 100 29 / 80%);
      }

      75% {
        -webkit-box-shadow: 5px 4px 5px 2px #bb8c02,
            inset 5px 4px 15px 3px #000000,
            0px 0px 40px 18px rgb(186 100 29 / 80%);
                box-shadow: 5px 4px 5px 2px #bb8c02,
            inset 5px 4px 15px 3px #000000,
            0px 0px 40px 18px rgb(186 100 29 / 80%);
      }

      100% {
        -webkit-box-shadow: 0px 1px 5px 2px #bb8c02,
            inset -3px -2px 15px 3px #000000,
            0px 0px 40px 18px rgb(186 100 29 / 80%);
                box-shadow: 0px 1px 5px 2px #bb8c02,
            inset -3px -2px 15px 3px #000000,
            0px 0px 40px 18px rgb(186 100 29 / 80%);
      }
    }

    @keyframes flicker {
      0% {
        -webkit-box-shadow: 0px 1px 5px 2px #bb8c02,
            inset -3px -2px 15px 3px #000000,
            0px 0px 40px 18px rgb(186 100 29 / 80%);
                box-shadow: 0px 1px 5px 2px #bb8c02,
            inset -3px -2px 15px 3px #000000,
            0px 0px 40px 18px rgb(186 100 29 / 80%);
      }

      25% {
        -webkit-box-shadow: -5px -4px 5px 2px #bb8c02,
            inset -5px -4px 15px 3px #000000,
            0px 0px 40px 18px rgb(186 100 29 / 80%);
                box-shadow: -5px -4px 5px 2px #bb8c02,
            inset -5px -4px 15px 3px #000000,
            0px 0px 40px 18px rgb(186 100 29 / 80%);
      }

      75% {
        -webkit-box-shadow: 5px 4px 5px 2px #bb8c02,
            inset 5px 4px 15px 3px #000000,
            0px 0px 40px 18px rgb(186 100 29 / 80%);
                box-shadow: 5px 4px 5px 2px #bb8c02,
            inset 5px 4px 15px 3px #000000,
            0px 0px 40px 18px rgb(186 100 29 / 80%);
      }

      100% {
        -webkit-box-shadow: 0px 1px 5px 2px #bb8c02,
            inset -3px -2px 15px 3px #000000,
            0px 0px 40px 18px rgb(186 100 29 / 80%);
                box-shadow: 0px 1px 5px 2px #bb8c02,
            inset -3px -2px 15px 3px #000000,
            0px 0px 40px 18px rgb(186 100 29 / 80%);
      }
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
    '''
  --
--