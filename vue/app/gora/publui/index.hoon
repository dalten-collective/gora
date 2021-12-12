::
::  %gora  publui  %index
::
/-  *gora
::
/+  schooner
::
/~  errors  webpage  /app/gora/errors
::
|_  $:  =bowl:gall
        =usps-mode  =pita
        =my-public  =request-log
        =offer-log  =blacklist
        =tag-set    =tag-store
        =pend
    ==
::
++  build
  |=  [requested-page=@tas args=(list (pair @t @t))]
  |^
  ^-  manx
  =*  errs  
    %~  .
      (~(got by errors) %index)
    :-  bowl
    :*  
      usps-mode  pita
      my-public  request-log
      offer-log  blacklist
      tag-set    tag-store
      pend
    ==
  ?+    requested-page  (build:errs %not-found ~)
      %publ-index
    (publ-page (my args))
  ==
::
  ++  publ-page
    |=  url-params=(map @t @t)
    ^-  manx
    ;html
      ;head(class "header")
        ;title: "{(scow %p our.bowl)}'s %gorae"
        ;meta(name "viewport", content "width=device-width, initial-scale=1", charset "utf-8");
        ;style:"{(trip style)}"
        ;div(align "right")
          ;form(class "multi-form", method "POST", id "tag-select", name "tag-select")
            ;select(name "tag", id "tag")
              ;option(value "all", selected "true"):"%all"
              ;*  ^-  marl
                  =+  :-  maz=*marl
                      taz=public-tags
                  |-
                  ?~  taz
                    maz
                  %=    $
                      taz
                    t.taz
                  ::
                      maz
                    :_  maz
                    ;option(value "{(scow %tas i.taz)}"):"{(scow %tas i.taz)}"
                  ==
            ==
            ;button(type "submit", name "action", class "wuttarButton", value "show-tag"):"Submit"
          ==
        ==
      ==
          ;h3(align "center", class "gora-color gora-title"):"Owned %gora"
          ;h5(align "center", class "gora-color"):"Click the preview image to see more details."
      ;body
        ;*  (hedl-list url-params)
        ;script:"{(trip script)}"
      ==
    ==
  ++  public-tags
    ^-  (list tag)
    =+  [som=*(set tag) all=~(tap in ~(key by tag-store))]
    |-
    ?~  all
      ~(tap in som)
    =+  dim=~(tap in (~(got by tag-store) i.all))
    %=    $
        all
      t.all
    ::
        som
      |-
      ?~  dim
        som
      ?:  (~(has in my-public) i.dim)
        (~(put in som) i.all)
      som
    ==
  ++  hedl-list
    |=  url-params=(map @t @t)
    |^
    ^-  marl
    =-  ;=  ;div(id "contentwrapper")
              ;div(id "inner-wrapper")
                ;*  liz
              ==
            ==
            ;div(id "collector", class "collector")
              ;*  luz
            ==
        ==
    :-  liz=(roll ~(tap in ~(key by pita)) make-imgs)
    luz=(roll ~(tap in ~(key by pita)) make-containers)
    ++  make-imgs
      |=  [inc=gora-id out=marl]
      =+  
        ^-  tag=(unit @t)
        ?.  (~(has by url-params) 'tag')
          ~
        ?:  =((~(got by url-params) 'tag') 'all')
          ~
        (~(get by url-params) 'tag')
      ::
      ~?  !(~(has by pita) inc)
        [%error-rendering-webui inc %not-in-pita]
      ::
      =+  goz=(~(got by pita) inc)
      =+  lon=(lent ~(tap in hodl-list.goz))
      =/  daz=tape  ;:  weld
                       (scow %ud m.issue-date.goz)  "/"
                       (scow %ud d.issue-date.goz)  "/"
                       (scow %ud y.issue-date.goz)
                    ==
      =/  buz=tape  ;:  weld
                      "\"pop-"  daz
                      (trip name.goz)
                      (scow %ud inc)  
                      "\""
                    ==
      ?.  ?&  (~(has in hodl-list.goz) our.bowl)
              (~(has in my-public) inc)
              =(%.y host-public.goz)
          ==
        out
      ?~  tag
        :_  out
        ;p
          ;img(class "grasp", src "{(trip gora-img.goz)}", onclick "goraImgBtn({buz})");
        ==
      ?.  (~(has ju tag-store) u.tag gora-id.goz)
        out
      :_  out
      ;p
        ;img(class "grasp", src "{(trip gora-img.goz)}", height "150", onclick "goraImgBtn({buz})");
      ==
    ++  make-containers
      |=  [inc=gora-id out=marl]
      =+  
        ^-  tag=(unit @t)
        ?.  (~(has by (my args)) 'tag')
          ~
        ?:  =((~(got by (my args)) 'tag') 'all')
          ~
        (~(get by (my args)) 'tag')
      ::
      ~?  !(~(has by pita) inc)
        [%error-rendering-webui inc %not-in-pita]
      ::
      =+  goz=(~(got by pita) inc)
      =+  lon=(lent ~(tap in hodl-list.goz))
      =/  daz=tape
        ;:  weld
          (scow %ud m.issue-date.goz)  "/"
          (scow %ud d.issue-date.goz)  "/"
          (scow %ud y.issue-date.goz)
        ==
      =/  buz=tape
        ;:  weld
          "\"pop-"  daz
          (trip name.goz)
          (scow %ud inc)  "\""
        ==
      ?.  ?&  (~(has in hodl-list.goz) our.bowl)
              (~(has in my-public) gora-id.goz)
          ==
        out
      :_  out
      ;div(id :(weld "pop-" daz (trip name.goz) (scow %ud inc)), class "modal")
        ;div(class "modal-content", align "center")
          ;a(href "{(trip gora-img:goz)}", target "_blank")
            ;img(src "{(trip gora-img:goz)}", height "75");
          ==
          ;p(class "gora-color", style "font-weight: bold;"):"{(trip name.goz)}"
          ;p(class "gora-color"):"Host: {(scow %p host.goz)}"
          ;p(class "gora-color"):"{:(weld "Issued: " daz)}"
          ;+  ?:  =(give-permissions.goz %transfer)
                ?~  max-hodl.goz
                  ;p(class "gora-color"):"%strange-state"
                ;p(class "gora-color"):"{(weld "# recipients remaining: " (scow %ud (sub u.max-hodl.goz lon)))}"
                ?.  (gth lon 1)
                  ;p(class "gora-color"):"Unique %gora"
                ;p(class "gora-color"):"{:(weld "Series of " (scow %ud lon) " %gora")}"
          ;+  ?+    give-permissions.goz  ;div;
                  %reissue
                ;p(class "gora-color"):"%reissue-able"
              ::
                  %transfer
                ?~  max-hodl.goz
                  ;p(class "gora-color"):"%strange-state"
                ?:  (lte u.max-hodl.goz lon)
                  ;br;
                ;p(class "gora-color"):"%chain-letter"
                  ==
          ;+  =+  :-  out=*tape
              ^-  tag=(list @t)  ~(tap in ~(key by tag-store))
              |-
              ?~  tag
                ;input(name "tags", readonly "true"):"{out}"
              %=    $
                  tag
                t.tag
              ::
                  out
                ?.  (~(has ju tag-store) i.tag gora-id.goz)
                  out
                ;:  weld  out
                  " "  (scow %tas i.tag)
                ==
              ==
        ==
      ==
  --
::
  ++  style
    '''
    * { 
      margin: 0.2em;
      padding: 0.2em;
      font-family: monospace;
    }

    #contentwrapper {
      height: 80vh;
      width:  200px;
      margin-left: auto;
      margin-right: auto;
      align: center;
      overflow-x: hidden;
      overflow-y: hidden;
            &:hover {
        animation-play-state: paused;
      }
      display: flex;
      justify-content: center;
    }
    #inner-wrapper {
      width:  200px;
      margin-left: auto;
      margin-right: auto;
      align: center;
      

      animation: autoscroll 300s linear infinite;
    }

    @keyframes autoscroll {
      from { 
        transform: translate3d(0,0,0);
      }
      to {
        transform: translate3d(0,-90%,0);
      }
    }

    img { 
      border: 2px solid #997300;
      border-radius: 50%;
      margin-left: 50%;
      transform: translateX(-50%);
      display: block;
      height: 150px;
      object-fit: cover;
    }

    .grasp {
      transition: 0.9s;
      width: 150px;
      height: 150px;
    }
    .grasp:hover {
      transform: translate(-40%, 5%);
    }

    .paused {
      animation-play-state: paused;
    }
    
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

    .modal-content {
      background-color: #fefefe;
      margin: 15% auto; /* 15% from the top and centered */
      padding: 20px;
      border: 1px solid #888;
      width: 180px; /* Could be more or less, depending on screen size */
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
    '''
  ++  script
    '''
    var inner = document.getElementById("inner-wrapper");
    var outer = document.getElementById("contentwrapper");

    outer.onmouseover = function(e) {
      inner.style.animationPlayState = 'paused';
    };

    outer.onmouseout = function(e) {
      inner.style.animationPlayState = 'running';
    };

    function goraImgBtn(modalId) {
      var goraModal = document.getElementById(modalId);
      goraModal.style.display = "block";
    };

    function addCollector(id, name, img, tags, public, reissue, transfer) {
      var collector = document.getElementById("collector");
      appendChild(elem)
    }

    window.onclick = function(event) {
      var modalAll = document.getElementsByClassName("modal");
      for (var i = 0; i < modalAll.length; i++) {
        if (event.target == modalAll.item(i)) {
          modalAll.item(i).style.display = "none";
        };
      };
    };
    '''
  --
--