::
::  gora web interface
::
/-  *gora
|_  [=bowl:gall [=pita =request-log =offer-log =sent-log =blacklist]]
++  build
  |=  inc=*
  ^-  manx
  |^  page
  ::
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
    .assembly-button { max-width: 75em; margin-left: auto; margin-right: auto; align: center }

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
    '''
  ::
  ++  page
    ^-  manx
    ;html
      ;head
        ;title:"%gora"
        ;meta(name "viewport", content "width=device-width, initial-scale=1", charset "utf-8");
        ;style:"{(trip style)}"
      ==
      ;body
        ;script:"{(trip javascript)}"
        
        ;h2(class "gora-title gora-color", align "center"):"%gora - マイ ゴラ スイッチ"
        
        ;p
        ;span:"Welcome to"
        ;span(class "gora-color"):"%gora"
        ;span:". We hope to provide you with a feature rich experience, soon."
        ;span:"For now, we hope you enjoy seeing your"
        ;span(class "gora-color"):"%gora"
        ;span:"and accepting incoming offers."
        ==

        ;p
        ;span:"Feeling bold? Try poking your ship to issue your own"
        ;span(class "gora-color"):"%gora."
        ==
        ;p
        ;span:"The /sur file from this app has some documentation of what a poke should look like."
        ==
        
        ;div(class "assembly-button", align "center")
          ;+  =/  assembly-token=@uv  0v2.ppshp.ckfjl.j8r5l.49vjk.n6c1u
              ^-  manx
              ?:  (~(has ju sent-log) assembly-token [~wet %ask])
                ;form(method "POST")
                  ;button(type "submit", name "skip", value "", disabled "", class "assembly-button"):"Already Requested"
                ==
              ;form(method "POST")
                ;button(type "submit", name "send-request", value (scow %uv assembly-token), class "assembly-button"):"Request the Assembly Token"
                ;input(style "display: none;", type "text", name "host", value (scow %ud `@ud`~dalten));
              ==
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
          ;img(src "{(trip gora-img:-)}", height "150", onclick "btnFunction({:(weld "\"pop-" (trip name:-) "\"")})");
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
  --
--