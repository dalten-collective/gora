::
::  %gora  goraui  %index

/-  *gora
/+  schooner
/~  errors  webpage  /app/gora/errors

|_  [=bowl:gall [=pita =request-log =offer-log =sent-log =blacklist]]
++  build
  |=  [requested-page=@tas args=(list [k=@t v=@t])]
  |^
  ^-  manx
  =*  errs    ~(. (~(got by errors) %index) bowl [pita request-log offer-log sent-log blacklist])
  ?+  requested-page  (build:errs %not-found ~)
      %gora-index
    (main-page args)
      %wuttar-gorae
    (wuttis-gora args)
  ==
  ++  main-page
    |=  url-params=(list [k=@t v=@t])
    ^-  manx
    ;html
      ;head
        ;title:"%gora - マイ ゴラ スイッチ"
        ;meta(name "viewport", content "width=device-width, initial-scale=1", charset "utf-8");
        ;style:"{(trip style)}"
      ==
      ;body
        ;script:"{(trip javascript)}"
        
        ;h2(class "gora-title gora-color", align "center"):"%gora - マイ ゴラ スイッチ"
        ;div(align "center")
          ;a(class "wuttarButton", href "../gora/wuttis", title "wuttis gora?"):"?=  %gora / ?*  %gorae"
        ==
        ;p
        ;span:"Welcome to"
        ;span(class "gora-color"):"%gora"
        ;span:". We hope to provide you with a feature rich experience, soon."
        ;span:"For now, we hope you enjoy seeing your"
        ;span(class "gora-color"):"%gora"
        ;span:"and accepting incoming offers."
        ==
        ;*  ?:  =(~(tap in offer-log) ~)
              ;=  ;div;
                  ;div;
              ==
            ;=  ;h3(align "center"):"Incoming %gora"
                ;h5(align "center"):"Click the preview image to expand. Click Claim to acquire. Reject coming soon (available as poke)."
                ;div(class "scroll-table")
                  ;table
                    ;*  (roll ~(tap in offer-log) offered-list)
                  ==
                ==
            ==
        ;*  ?.  (count-hodl ~(tap in ~(key by pita)))
              ;=  ;div;
                  ;div;
              ==
          ;=  ;h3(align "center"):"Owned %gora"
              ;h5(align "center"):"Click the preview image to see more details."
              ;div(class "scroll-owned")
                ;div
                    ;*  (roll ~(tap in ~(key by pita)) hedl-list)
                ==
              ==
          ==
            ;br;
            ;br;
            ;h4(align "center"):"Brought to you by ~dalten Collective"
      ==
    ==
  ++  wuttis-gora
    |=  url-params=(list [k=@t v=@t])
    ^-  manx
    ;html
      ;head
        ;title:"%gora - マイ ゴラ スイッチ"
        ;meta(name "viewport", content "width=device-width, initial-scale=1", charset "utf-8");
        ;style:"{(trip style)}"
      ==
      ;body
        ;script:"{(trip javascript)}"
        
        ;h2(class "gora-title gora-color", align "center"):"?=  %gora / ?*  %gorae - マイ ゴラ スイッチ"
        ;div(align "center")
          ;a(class "wuttarButton", href ".", title "zapzap"):"!!"
        ==
        ;div
          ;*  wuttar-gorae
        ==

            ;br;
            ;br;
            ;h4(align "center"):"Brought to you by ~dalten Collective"
      ==
    ==
    ::
  ++  frame-empty
    '''
    display: none;
    '''
  ++  frame-full
    '''
    display: block;
    '''
  ++  javascript
    '''
    var modalBtn

    function btnFunction(modalId) {
      modalBtn = document.getElementById(modalId);
      modalBtn.style.display = "block";
    }

    var modalAll = document.getElementsByClassName("modal")

    window.onclick = function(event) {
      for (var i = 0; i < modalAll.length; i++) {
        if (event.target == modalAll.item(i)) {
          modalAll.item(i).style.display = "none";
        }
      }

    } 
    '''
  ++  offered-list
    |=  [inc=gora-id out=(list manx)]
    ~?  !(~(has by pita) inc)
      [%unexpected-offers-when-rendering-webui inc %not-in-pita]
    :-
      ;tr
        ;td(class "gora-color", style "font-weight: bold;"):"{(trip name:(~(got by pita) inc))}"
        ;td
          ;a(href "{(trip gora-img:(~(got by pita) inc))}", target "_blank")
            ;img(src "{(trip gora-img:(~(got by pita) inc))}");
          ==
        ==
        ;td:"Host: {(scow %p host:(~(got by pita) inc))}"
        ;td
          ;form(method "POST")
            ;button(class "approve-button", type "submit", name "approve-give", value (scow %ud inc))
              Accept
            ==
            ;br;
            ;br;
            ;button(class "reject-button", type "submit", name "reject-give", value (scow %ud inc))
              Reject
            ==
            ;input(style "display: none;", type "text", name "host", value (scow %ud `@ud`host:(~(got by pita) inc)));
          ==
        ==
      ==
    out
  ++  hedl-list
    |=  [inc=gora-id out=(list manx)]
    ~?  !(~(has by pita) inc)
      [%unexpected-hedls-when-rendering-webui inc %not-in-pita]
    =+  (~(got by pita) inc)
    ?.  (~(has in hodl-list:-) our.bowl)
      out
    :-
      ;tr
        ;td
          ;img(class "container", src "{(trip gora-img:-)}", height "150", onclick "btnFunction({:(weld "\"pop-" (trip name:-) "\"")})");
        ==
        ;div(id (weld "pop-" (trip name:-)), class "modal")
          ;div(class "modal-content", align "center")
                  ;a(href "{(trip gora-img:-)}", target "_blank")
                    ;img(src "{(trip gora-img:-)}", height "75");
                  ==
                  ;p(class "gora-color", style "font-weight: bold;"):"{(trip name:-)}"
                  ;p(class "gora-color"):"Host: {(scow %p host:-)}"
                  ;p(class "gora-color"):"Origin Date: {:(weld (scow %ud m.issue-date:-) "/" (scow %ud d.issue-date:-) "/" (scow %ud y.issue-date:-))}"
                  ;+  =+  (lent ~(tap in hodl-list))
                      ?.  (gth - 1)
                        ;p(class "gora-color"):"Unique %gora"
                      ;p(class "gora-color"):"{:(weld "1 of " (scow %ud -) " %gora")}"
          ==
        ==
      ==
    out
  ++  count-hodl
    |=  [inc=(list gora-id)]
    =/  show=?  %.n
    |-
    ?~  inc
      show
    %=  $
      show  ?:((~(has in hodl-list:(~(got by pita) i.inc)) our.bowl) %.y show)
      inc   t.inc
    ==
  ++  style
    '''
    * { margin: 0.2em; padding: 0.2em; font-family: monospace; }
    body { background-color: #333230; color: white; }
    p { max-width: 75em; margin-left: auto; margin-right: auto; }
    form { margin: 0; padding: 0; max-width: 75em; margin-left: auto; margin-right: auto; }
    button { padding: 0.2em 0.5em; font-size: 8pt; }
    table { table-layout: fixed;max-width: 75em; margin-left: auto; margin-right: auto; }
    img { 
      border: 2px solid #997300;
      border-radius: 50%;
      width: 150px;
      height: 150px;
      object-fit: cover;
    }
    .gora-color { 
      color: #997300;
    }
    .gora-title {
      font-size: 24pt;
      align: center;
    }
    .gora-name {
      font-size: 16pt;
    }
    .reject-button {
      background-color: #c4aead;
    }
    .approve-button {
      background-color: #f0dc82;
    }
    .assembly-button { 
      max-width: 75em; 
      margin-left: auto; 
      margin-right: auto; 
      align: center;
      background-color: #997300;
      text-color: #FFFFFF;
    }
    .center-div {
      margin-left: auto;
      margin-right: auto;
    }
    .scroll-table {
      height: 190px;
      width: 450px;
      overflow: auto;
      max-width: 75em;
      margin-left: auto;
      margin-right: auto; 
    }
    .scroll-owned {
      height: 180px;
      width: 75%;
      overflow: auto;
      max-width: 75em;
      margin-left: auto;
      margin-right: auto; 
    }
    /* The Modal (background) */
    .modal {
      display: none; /* Hidden by default */
      position: fixed; /* Stay in place */
      z-index: 1; /* Sit on top */
      left: 0;
      top: 0;
      width: 100%; /* Full width */
      height: 100%; /* Full height */
      overflow: auto; /* Enable scroll if needed */
      background-color: rgb(0,0,0); /* Fallback color */
      background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }
    /* Modal Content/Box */
    .modal-content {
      background-color: #fefefe;
      margin: 15% auto; /* 15% from the top and centered */
      padding: 20px;
      border: 1px solid #888;
      width: 180px; /* Could be more or less, depending on screen size */
    }
    /* The Close Button */
    .close {
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
    }
    .close:hover,
    .close:focus {
      color: black;
      text-decoration: none;
      cursor: pointer;
    }
    .wuttarButton {
      box-shadow: 0px 1px 0px 0px #fff6af;
      background:linear-gradient(to bottom, #997300 5%, #b58e18 100%);
      background-color:#997300;
      border-radius:999999px;
      border:1px solid #ffaa22;
      display:inline-block;
      cursor:pointer;
      color:#FFFFFF;
      font-size:10px;
      padding:6px 6px;
      text-decoration:none;
    }
    .wuttarButton:hover {
      background:linear-gradient(to bottom, #b58e18 5%, #997300 100%);
      background-color:#ffab23;
    }
    .wuttarButton:active {
      position:relative;
      top:1px;
    }
    .container {
      transition: 0.9s;
    }
    .container:hover {
      transform: translate(5px, 10px);
    }
    '''
  ++  wuttar-gorae
    ;=
    ;p:"%gora by ~dalten Collective (vue edition) is a proof of presence protocol (POPP). %gora allows users to issue (and receive) lasting indicia of presence in a variety of contexts. This memorial tokens contain within their own data structure a name, issuer, image link, validation hash and list of other holders of the token."
    ;br;
    ;p:"%gora is distributed in two varieties - one that uses Vue.js and is reactive to user actions just like a modern Earth Web 2.0 application; the other uses Sail, an XML markdown language compatible with hoon that delivers a decidedly Earth Web 1.0 experience. They are available to install from the following moons:"
    ;br;
    ;p:"- %gora Vue.js Edition - |install ~laddys-dozzod-dalten %gora"
    ;p:"- %gora Sail Edition   - |install ~mister-dozzod-dalten %gora"
    ;br;
    ;p:"Feel free to build and distribute extensions to %gora that suite your particular need. The base features can (soon) be accessed through this interface, and can also be accessed through the dojo or by other %gall agents using pokes and scries. The scries are documented within the app file, and a successful poke will look something like this:"
    ;br;
    ;p:":gora &gora-man [%mkgora /'Your Gora's Name/' /'http://your-url.s3-phuket.com/your-jpg.gif/']"
    ;br;
    ;p:"The &gora-man structure includes other pokes like:"
    ;p:"[%mkgora /'title/' /'url/']                       -Make a new gora"
    ;p:"[%delgora 0vid.g032h.34300]                   -Delete an existing gora"
    ;p:"[%send-give 0vid.g032h.34300 ~sampel-palnet]  -Send a gora to a recipient"
    ;p:"[%send-request 0vid.g032h.34300 ~dalten]      -Request a gora from a host"
    ;p:"[%approve-give 0vid.g032h.34300]              -Approve an incoming gora gift"
    ;p:"[%approve-request 0vid.g032h.34300 ~dev]      -Approve an incoming gora request"
    ;p:"[%reject-give 0vid.g032h.34300]               -Decline an incoming gora gift"
    ;p:"[%reject-request 0vid.g032h.34300 ~dev]       -Deny an incoming gora request"
    ;br;
    ;p:"If you need support with %gora - join ~mister-hilper-dozzod-dalten/gora and we'll see what we can do!"
  ==
  --
--