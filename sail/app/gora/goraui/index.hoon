::
::  %gora  goraui  %index

/-  *gora
/+  schooner
/~  errors  webpage  /app/gora/errors

|_  [=bowl:gall [=usps-mode =pita =my-public =request-log =offer-log =sent-log =blacklist =tag-set =tag-store]]
++  build
  |=  [requested-page=@tas args=(list (pair @t @t))]
  |^
  ^-  manx
  =*  errs    ~(. (~(got by errors) %index) bowl [usps-mode pita my-public request-log offer-log sent-log blacklist tag-set tag-store])
  ?+  requested-page  (build:errs %not-found ~)
      %gora-index
    (main-page (my args))
      %wuttar-gorae
    (wuttis-gora (my args))
  ==
  ++  main-page
    |=  url-params=(map @t @t)
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
          ;br;
          ;button(class "wuttarButton", onclick "multiFunc('mkgora', '', '', '{(scow %p our.bowl)}', '')"):"Make %gora"
          ;button(class "wuttarButton", onclick "multiFunc('send-request', '', '', '', '')"):"Request %gora"
          ;button(class "wuttarButton", onclick "multiFunc('send-give', '', '', '{(scow %p our.bowl)}', '')"):"Send %gora"
        ==
        ;p
        ;span:"Welcome to"
        ;span(class "gora-color"):"%gora"
        ;span:". We hope to provide you with a feature rich experience, soon."
        ;span:"For now, we hope you enjoy seeing your"
        ;span(class "gora-color"):"%gora"
        ;span:"and accepting incoming offers."
        ==
        ;+  ?:  (~(has by url-params) 'approve-give-success')
              ;p(class "color-gora", align "center"):"{(trip (~(got by url-params) 'approve-give-success'))}"
            ?:  (~(has by url-params) 'reject-give-success')
              ;p(class "color-gora", align "center"):"{(trip (~(got by url-params) 'reject-give-success'))}"
            ?:  (~(has by url-params) 'transfer-success')
              ;p(class "gora-color", align "center"):"{(trip (~(got by url-params) 'transfer-success'))}"
            ?:  (~(has by url-params) 'transfer')
              ;p(class "warn-color", align "center"):"{(trip (~(got by url-params) 'transfer'))}"
            ?:  (~(has by url-params) 'mkgora-success')
              ;p(class "gora-color", align "center"):"{(trip (~(got by url-params) 'mkgora-success'))}"
            ?:  (~(has by url-params) 'mkgora')
              ;p(class "warn-color", align "center"):"{(trip (~(got by url-params) 'mkgora'))}"
            ?:  (~(has by url-params) 'send-request-success')
              ;p(class "gora-color", align "center"):"{(trip (~(got by url-params) 'send-request-success'))}"
            ?:  (~(has by url-params) 'send-request')
              ;p(class "warn-color", align "center"):"{(trip (~(got by url-params) 'send-request'))}"
            ?:  (~(has by url-params) 'send-give-success')
              ;p(class "gora-color", align "center"):"{(trip (~(got by url-params) 'send-give-success'))}"
            ?:  (~(has by url-params) 'send-give')
              ;p(class "warn-color", align "center"):"{(trip (~(got by url-params) 'send-give'))}"
            ;div;
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
        ;br;
        ;div(class "modal", id "multi-modal")
          ;div(class "mult-content", align "center")
            ;div(align "right", width "max-content")
              ;button(type "button", class "gora-color", align "right", onclick "multiClose()"):"!!"
              ;br;
            ==
            ;div(class "modal-header", id "multi-header", width "max-content", align "center")
              ;p:"head"
              :: function put stuff here
            ==
            ;div(class "modal-body", id "multi-body")
             ;p:"body"
              :: function put stuff here
            ==
            ;div(class "modal-footer", id "multi-footer")
            ;p:"foot"
              :: function put stuff here
            ==
          ==
        ==
      ==
    ==
  ++  wuttis-gora
    |=  url-params=(map @t @t)
    ^-  manx
    ;html
      ;head
        ;title:"%gora - マイ ゴラ スイッチ"
        ;meta(name "viewport", content "width=device-width, initial-scale=1", charset "utf-8");
        ;style:"{(trip style)}"
      ==
      ;body
        ;script(src "http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js", type "text/javascript"):(trip javascript)
        
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
    function multiFunc(behavior, goraId, goraName, host, remaining){
    var mult = document.getElementById("multi-modal");
    var head = document.getElementById("multi-header");
    var body = document.getElementById("multi-body");
    var foot = document.getElementById("multi-footer");
    let form = document.createElement("form");
      while (form.firstChild) {
        form.removeChild(form.firstChild);
      };
    head.innerHTML = "";
    body.innerHTML = "";
    foot.innerHTML = "";
    mult.style.display = "block";

    // Create title
      let title = document.createElement("p");
        title.className = "gora-color";
        
    if (behavior == "send-give") {
        title.innerText = `Send Give`
        
         
        // Create form
        var id = document.createElement("input");
          id.type = "text";
          id.name = "gora-id"
          id.placeholder = "0v01.pA7uV.nuM1334.H3r3";
          id.style.width = "65%";
          id.style.align = "center";

        var butn = document.createElement("button");
          butn.type = "submit";
          butn.name = "action";
          butn.value = "send-give"
          butn.className = "wuttarButton";
          butn.innerText = "Submit";

          form.className = "multi-form";
          form.method = "POST";
          form.appendChild(id);
          for (var i = 0; i < 5; i++) {
            form.appendChild(document.createElement("br"));
            var ship = document.createElement("input");
            ship.type="text";
            ship.placeholder = "~sampel-palnet";
            ship.id=`ship-${i}`;
            ship.name=`ship-${i}`;
            form.appendChild(ship);
          };
          form.appendChild(document.createElement("br"));
          form.appendChild(butn);
      } else if (behavior == "transfer") {
        title.innerText = `Forward ${goraName}`;
        
        // Create form
        var id = document.createElement("input");
          id.type = "text";
          id.name = "gora-id"
          id.value = goraId;
          id.style.display = "none";
          id.style.width = "65%";
          id.style.align = "center";

        var butn = document.createElement("button");
          butn.type = "submit";
          butn.name = "action";
          butn.value = "transfer"
          butn.className = "wuttarButton";
          butn.innerText = "Submit";

          form.className = "multi-form";
          form.method = "POST";
          form.appendChild(id);
          for (var i = 0; i < Math.min(parseInt(remaining), 5); i++) {
            form.appendChild(document.createElement("br"));
            var ship = document.createElement("input");
            ship.type="text";
            ship.placeholder = "~sampel-palnet";
            ship.id=`ship-${i}`;
            ship.name=`ship-${i}`;
            form.appendChild(ship);
          };
          form.appendChild(document.createElement("br"));
          form.appendChild(butn);
      } else if (behavior == "send-reissue") {
        title.innerText = `Reissue ${goraName}`

        // Create form
        var id = document.createElement("input");
          id.type = "text";
          id.name = "gora-id"
          id.value = goraId;
          id.style.display = "none";
          id.style.width = "65%";
          id.style.align = "center";

        var butn = document.createElement("button");
          butn.type = "submit";
          butn.name = "action";
          butn.value = "reissue";
          butn.className = "wuttarButton";
          butn.innerText = "Submit";

          form.className = "multi-form";
          form.method = "POST";
          form.appendChild(id);
          for (var i = 0; i < Math.min(parseInt(remaining), 5); i++) {
            form.appendChild(document.createElement("br"));
            var ship = document.createElement("input");
            ship.type="text";
            ship.placeholder = "~sampel-palnet";
            ship.id=`ship-${i}`;
            ship.name=`ship-${i}`;
            form.appendChild(ship);
          };
          form.appendChild(document.createElement("br"));
          form.appendChild(butn);
      } else if (behavior == "mkgora") {
        title.innerText = `Make a %gora`;

        var namLab = document.createElement("label");
          namLab.for = "nam";
          namLab.innerText = "Name: ";
          namLab.className = "gora-color";
        var nam = document.createElement("input");
          nam.type = "text";
          nam.name = "name";
          nam.id   = "nam";
          nam.style.width = "85%";
          nam.style.align = "center";
        
        var imagLab = document.createElement("label");
          imagLab.for = "img";
          imagLab.innerText = "Img. URL: ";
          imagLab.className = "gora-color";
        var imag = document.createElement("input");
          imag.type = "url";
          imag.name = "gora-img";
          imag.id   = "img";
          imag.style.width = "80%";
          imag.style.algin = "center";
        
        var pubLab = document.createElement("span")
          pubLab.className = "gora-color";
          pubLab.innerText = "Public:"
        var pYLab = document.createElement("label");
          pYLab.for = "pubYus";
          pYLab.innerText = "%.y";
          pYLab.className = "gora-color";
        var pubYus = document.createElement("input");
          pubYus.type = "radio";
          pubYus.name = "public";
          pubYus.id   = "pubYus"
          pubYus.value = "%.y";
        
        var pNLab = document.createElement("label");
          pNLab.for = "pubNo";
          pNLab.innerText = "%.n";
          pNLab.className = "gora-color";
        var pubNo = document.createElement("input");
          pubNo.type = "radio";
          pubNo.name = "public";
          pubNo.id   = "pubNo";
          pubNo.value = "%.n";

        var maxLab = document.createElement("label");
          maxLab.for = "maxUse";
          maxLab.innerText = "Max Hodlers (0 for Unlimited): ";
          maxLab.className = "gora-color";
        var maxUsers = document.createElement("input");
          maxUsers.type = "number";
          maxUsers.id = "maxUse";
          maxUsers.name = "maxUsers"
          maxUsers.min = "0";
          maxUsers.placeholder = "0";
          maxUsers.style.width = "40%";
        
        var reqLab = document.createElement("label");
          reqLab.for = "reqBehave";
          reqLab.innerText = "Request Behavior: ";
          reqLab.className = "gora-color";
        var reqBehave = document.createElement("select");
          reqBehave.id = "reqBehave";
          reqBehave.name = "requestBehavior";
          reqBehave.style.width = "40%"
          var behav1 = document.createElement("option");
            behav1.value = "approve";
            behav1.text = "%approve";
            reqBehave.appendChild(behav1);
          var behav2 = document.createElement("option");
            behav2.value = "reject";
            behav2.text = "%reject";
            reqBehave.appendChild(behav2);
          var behav3 = document.createElement("option");
            behav3.value = "none";
            behav3.text = "%none";
            behav3.selected = true;
            reqBehave.appendChild(behav3);
        
        var givLab = document.createElement("label");
          givLab.for = "givBehave";
          givLab.innerText = "Give Behavior: ";
          givLab.className = "gora-color";
        var givBehave = document.createElement("select");
          givBehave.id = "givBehave";
          givBehave.name = "giveBehavior";
          givBehave.style.width = "40%";
          var behav1 = document.createElement("option");
            behav1.value = "transfer";
            behav1.text = "%transfer";
            givBehave.appendChild(behav1);
          var behav2 = document.createElement("option");
            behav2.value = "reissue";
            behav2.text = "%reissue";
            givBehave.appendChild(behav2);
          var behav3 = document.createElement("option");
            behav3.value = "none";
            behav3.text = "%none";
            behav3.selected = true;
            givBehave.appendChild(behav3);
        
        var butn = document.createElement("button");
          butn.type = "submit";
          butn.name = "action";
          butn.value = "mkgora";
          butn.className = "wuttarButton";
          butn.innerText = "Submit";

        form.className = "multi-form";
        form.method = "POST";
        form.appendChild(namLab);
        form.appendChild(nam);
        form.appendChild(document.createElement("br"));
        form.appendChild(imagLab)
        form.appendChild(imag);
        form.appendChild(document.createElement("br"));
        form.appendChild(pubLab);
        form.appendChild(pYLab);
        form.appendChild(pubYus);
        form.appendChild(pNLab);
        form.appendChild(pubNo);
        form.appendChild(document.createElement("br"));
        form.appendChild(maxLab);
        form.appendChild(maxUsers);
        form.appendChild(document.createElement("br"));
        form.appendChild(reqLab);
        form.appendChild(reqBehave);
        form.appendChild(document.createElement("br"));
        form.appendChild(givLab);
        form.appendChild(givBehave);
        form.appendChild(document.createElement("br"));
        form.appendChild(butn);

      } else if (behavior == "send-request") {
        title.innerText = `Request %gora`;
        
        // Create form
        var id = document.createElement("input");
          id.type = "text";
          id.name = "gora-id"
          id.style.width = "40ch";
          id.style.align = "center";
        
        var host = document.createElement("input");
          host.type = "text";
          host.placeholder = "~sampel-palnet";
          host.id = "host"
          host.name = "host"

        var butn = document.createElement("button");
          butn.type = "submit";
          butn.name = "action";
          butn.value = "send-request"
          butn.className = "wuttarButton";
          butn.innerText = "Submit";

        form.className = "multi-form";
        form.method = "POST";
        form.appendChild(id);
        form.appendChild(document.createElement("br"));
        form.appendChild(host);
        form.appendChild(document.createElement("br"));
        form.appendChild(butn);

      } else if (behavior == "private") {
        title.innerText = "Make Private";

        // ID & label
        var idLab = document.createElement("label");
          idLab.for = "id";
          idLab.innerText = "%gora ID: ";
          idLab.className = "gora-color";
        var id = document.createElement("input");
          id.type = "text";
          id.value = goraId;
          id.id = "id";
          id.name = "gora-id";
          id.readOnly = true;
          id.style.width = "65%";
        
        // Name
        var gName = document.createElement("input");
          gName.type = "text";
          gName.value = goraName;
          gName.id = "goraName";
          gName.name = "name";
          gName.readOnly = true;
          gName.style.width = "80%";
        
        // Host
        var hosLab = document.createElement("label");
          hosLab.for = "hostName";
          hosLab.innerText = "Host: ";
          hosLab.className = "gora-color";
        var hosName = document.createElement("input");
          hosName.type = "text";
          hosName.value = host;
          hosName.id = "hostName";
          hosName.name = "host";
          hosName.readOnly = true;
          hosName.style.width = "80%"
        
        // Bool
        var bool = document.createElement("input");
          bool.name = "public";
          bool.value = "%.n";
          bool.id = "publ";
          bool.style.display = "none";
        
        // Make Private?
        var butn = document.createElement("button");
          butn.type = "submit";
          butn.name = "action";
          butn.value = "pubmod-hodl";
          butn.className = "wuttarButton";
          butn.innerText = "Submit";

        form.className = "multiForm";
        form.method = "POST";
        form.appendChild(idLab);
        form.appendChild(id);
        form.appendChild(document.createElement("br"));
        form.appendChild(gName);
        form.appendChild(document.createElement("br"));
        form.appendChild(hosLab);
        form.appendChild(hosName);
        form.appendChild(document.createElement("br"));
        form.appendChild(bool);
        form.appendChild(butn);
      } else if (behavior == "public") {
        title.innerText = "Make Public";

        // ID & label
        var idLab = document.createElement("label")
          idLab.for = "id";
          idLab.innerText = "%gora ID: "
          idLab.className = "gora-color";
        var id = document.createElement("input");
          id.type = "text";
          id.value = goraId;
          id.id = "id";
          id.name = "gora-id";
          id.readOnly = true;
          id.style.width = "65%";
        
        // Name
        var gName = document.createElement("input");
          gName.type = "text";
          gName.value = goraName;
          gName.id = "goraName";
          gName.name = "name";
          gName.readOnly = true;
          gName.style.width = "80%"
        
        // Host
        var hosLab = document.createElement("label");
          hosLab.for = "hostName";
          hosLab.innerText = "Host: "
          hosLab.className = "gora-color";
        var hosName = document.createElement("input");
          hosName.type = "text";
          hosName.value = host;
          hosName.id = "hostName";
          hosName.name = "host";
          hosName.readOnly = true;
          hosName.style.width = "80%"
        
        // Bool
        var bool = document.createElement("input");
          bool.name = "public";
          bool.value = "%.y";
          bool.id = "publ";
          bool.style.display = "none";
        
        // Make Public
        var butn = document.createElement("button");
          butn.type = "submit";
          butn.name = "action";
          butn.value = "pubmod-hodl";
          butn.className = "wuttarButton";
          butn.innerText = "Submit";

        form.className = "multiForm";
        form.method = "POST";
        form.appendChild(idLab);
        form.appendChild(id);
        form.appendChild(document.createElement("br"));
        form.appendChild(gName);
        form.appendChild(document.createElement("br"));
        form.appendChild(hosLab);
        form.appendChild(hosName);
        form.appendChild(document.createElement("br"));
        form.appendChild(bool);
        form.appendChild(butn);
      }
      head.appendChild(title);
      body.appendChild(form);
    };

    function multiClose() {
      var mult = document.getElementById("multi-modal");
      var head = document.getElementById("multi-header");
      var body = document.getElementById("multi-body");
      var foot = document.getElementById("multi-footer");
      mult.style.display = "none";
      head.innerHTML = "";
      body.innerHTML = "";
      foot.innerHTML = "";
    }

    function goraImgBtn(modalId) {
    var goraModal;
      goraModal = document.getElementById(modalId);
      goraModal.style.display = "block";
    };

    var modalAll = document.getElementsByClassName("modal");

    window.onclick = function(event) {
      for (var i = 0; i < modalAll.length; i++) {
        if (event.target == modalAll.item(i)) {
          modalAll.item(i).style.display = "none";
        };
      };
    };
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
          ;form(method "POST", class "accept-form")
            ;input(style "display: none", name "gora-id", type "text", value (scow %uv inc));
            ;button(class "approve-button", type "submit", name "action", value "approve-give")
              Accept
            ==
            ;br;
            ;br;
            ;input(style "display: none;", type "text", value (scow %uv inc));
            ;button(class "reject-button", type "submit", name "action", value "reject-give")
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
    =+  goz=(~(got by pita) inc)
    =+  [daz="{:(weld (scow %ud m.issue-date.goz) "/" (scow %ud d.issue-date.goz) "/" (scow %ud y.issue-date.goz))}" lon=(lent ~(tap in hodl-list.goz))]
    ?.  (~(has in hodl-list:goz) our.bowl)
      out
    :-
      ;tr
        ;td
          ;img(class "container", src "{(trip gora-img.goz)}", height "150", onclick "goraImgBtn({:(weld "\"pop-" daz (trip name.goz) (scow %ud inc) "\"")})");
        ==
        ;div(id :(weld "pop-" daz (trip name.goz) (scow %ud inc)), class "modal")
          ;div(class "modal-content", align "center")
                  ;a(href "{(trip gora-img:goz)}", target "_blank")
                    ;img(src "{(trip gora-img:goz)}", height "75");
                  ==
                  ;p(class "gora-color", style "font-weight: bold;"):"{(trip name.goz)}"
                  ;p(class "gora-color"):"Host: {(scow %p host.goz)}"
                  ;p(class "gora-color"):"{:(weld "Issued: " daz)}"
                  ;+  ?:  (~(has in my-public) gora-id.goz)
                    ;button(class "wuttarButton", id (weld (scow %ud inc) "-public-already"), onclick "multiFunc('private', '{(scow %uv inc)}', '{(trip name.goz)}', '{(scow %p host.goz)}', '{?~(max-hodl.goz "infinite" (scow %ud (sub u.max-hodl.goz lon)))}')"):"Make Private"
                  ;button(class "wuttarButton", id (weld (scow %ud inc) "-make-public"), onclick "multiFunc('public', '{(scow %uv inc)}', '{(trip name.goz)}', '{(scow %p host.goz)}', '{?~(max-hodl.goz "infinite" (scow %ud (sub u.max-hodl.goz lon)))}')"):"Make Public"
                  ;+  ?:  =(give-permissions.goz %transfer)
                        ?~  max-hodl.goz
                          ;p(class "gora-color"):"%strange-state"
                        ;p(class "gora-color"):"{(weld "# recipients remaining: " (scow %ud (sub u.max-hodl.goz lon)))}"
                      ?.  (gth lon 1)
                        ;p(class "gora-color"):"Unique %gora"
                      ;p(class "gora-color"):"{:(weld "Series of " (scow %ud lon) " %gora")}"
                  ;+  ?+    give-permissions.goz  ;div;
                          %reissue
                        ;button(class "wuttarButton", id (weld (scow %ud inc) "-reissue"), onclick "multiFunc('send-reissue', '{(scow %uv inc)}', '{(trip name.goz)}', '{(scow %p host.goz)}', '{?:(?=(~ max-hodl.goz) (scow %ud 6) (scow %ud (sub u.max-hodl.goz lon)))}')"):"Reissue"
                      ::
                          %transfer
                      ?~  max-hodl.goz
                        ;p(class "gora-color"):"%strange-state"
                      ?:  (lte u.max-hodl.goz lon)
                          ;br;
                        ;button(class "wuttarButton", id (weld (scow %ud inc) "-transfer"), onclick "multiFunc('transfer', '{(scow %uv inc)}', '{(trip name.goz)}', '{(scow %p host.goz)}', '{(scow %ud (sub u.max-hodl.goz lon))}')"):"Transfer"
                      ==
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
    button { padding: 0.2em 0.5em; font-size: 8pt; }
    table { table-layout: fixed;max-width: 75em; margin-left: auto; margin-right: auto; }
    img { 
      border: 2px solid #997300;
      border-radius: 50%;
      width: 150px;
      height: 150px;
      object-fit: cover;
    }
    .accept-form {
      margin: 0; 
      padding: 0; 
      max-width: 75em; 
      margin-left: auto; 
      margin-right: auto;
    }
    .multi-form {
      margin: 0;
      padding: 0;
      max-width: 100%;
      margin-left: auto;
      margin-right: auto;
    }
    .warn-color {
      color: #AA0000;
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
      height: 45%;
      width: 75%
      overflow: auto;
      max-width: 80%;
      margin-left: auto;
      margin-right: auto; 
    }
    .scroll-owned {
      height: 45%;
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
    /* MultiModal Content/Box */
    .mult-content {
      background-color: #fefefe;
      margin: 15% auto; /* 15% from the top and centered */
      padding: 20px;
      border: 1px solid #888;
      width: 40%; /* Could be more or less, depending on screen size */
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