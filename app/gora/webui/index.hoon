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
    '''
  ::
  ++  page
    ^-  manx
    ;html
      ;head
        ;title:"%gora"
        ;meta(charset "utf-8");
        ;meta(name "viewport", content "width=device-width, initial-scale=1");
        ;style:"{(trip style)}"
      ==
      ;body
        ;h2(class "gora-title gora-color", align "center"):"%gora - マイ ゴラ スイッチ"
        
        ;p
        ;span:"Welcome to"
        ;span(class "gora-color"):"%gora"
        ;span:". We hope to provide you with a feature rich experience, soon."
        ==

        ;p
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
        
        ;div(class "assembly-button")
        ;+  =/  assembly-token=@uv  0v5.jqnd5.oifil.703am.trbh6.219hm
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
       

        ;table
          ;tr
            ;td(colspan "4")
              ;h3(align "center"):"Incoming %gora"
            ==
          ==
          ;tr
            ;td(colspan "4", align "center"):"Click the preview image to expand. Click Claim to acquire. Reject coming soon (available as poke)."
          ==
          ;*  (roll ~(tap in offer-log) offered-list)
        ==

        ;table(display ?.((count-hodl ~(tap in ~(key by pita))) "none" "block"))
          ;tr
            ;td(colspan "4")
              ;h3(align "center"):"Owned %gora"
            ==
          ==
          ;tr
            ;td(colspan "4", align "center"):"Click the preview image to expand."
          ==
          ;*  (roll ~(tap in ~(key by pita)) hedl-list)
        ==

        ;h4(align "center"):"Brought to you by ~dalten Collective"
      ==
    ==
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
            ;input(style "display: none;", type "text", name "host", value (scow %ud `@ud`host:(~(got by pita) inc)));
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
        ;td(class "gora-color", style "font-weight: bold;"):"{(trip name:-)}"
        ;td
          ;a(href "{(trip gora-img:-)}", target "_blank")
            ;img(src "{(trip gora-img:-)}", height "150");
          ==
        ==
        ;td:"Host: {(scow %p host:-)}"
        ;td
          ;p:"Origin Date: {:(weld (scow %ud m.issue-date:-) "/" (scow %ud d.issue-date:-) "/" (scow %ud y.issue-date:-))}"
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