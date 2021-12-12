::
::  %gora  errors  %index
::
::
/-  *gora
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
  |=  [requested-page=@tas args=(list [@t @t])]
  |^
  ^-  manx
  =+
  ?~  args
    `(map @t @t)`~
  (my `(list (pair @t @t))`args)
  ?+  requested-page  (code-404 -)
      %not-found
    (code-404 -)
    ::
      %bad-method
    (code-405 -)
    ::
  ==
  ::
  ++  code-404
    |=  args=(map @t @t)
    ^-  manx
    ;html
      ;head
        ;title:"%gora - マイ ゴラ スイッチ // page not found"
        ;meta(name "viewport", content "width=device-width, initial-scale=1", charset "utf-8");
        ;style:"{(trip style)}"
      ==
      ;body
        ;h2(class "gora-title gora-color", align "center"):"%gora - マイ ゴラ スイッチ"
        ;p(align "center"):"You have reached an invalid page. Please try again."
      ==
    ==
::
  ++  code-405
    |=  args=(map @t @t)
    ^-  manx
    ;html
        ;head
          ;title:"%gora - マイ ゴラ スイッチ // page not found"
          ;meta(name "viewport", content "width=device-width, initial-scale=1", charset "utf-8");
          ;style:"{(trip style)}"
        ==
        ;body
          ;h2(class "gora-title gora-color", align "center"):"%gora - マイ ゴラ スイッチ"
          ;*  ?.  (~(has by args) 'method')
                ;=  ;p:"Invalid HTTP-Method or Arguments"
                    ;a:"Return Home"
                ==
              ;=  
                ;p:"Invalid HTTP-Method {(trip (~(got by args) 'method'))}"
                ;+  ?+  (~(got by args) 'failed-action')  ;p:"Unknown Action."
                        %approve-give
                      ;p:"%approve-give failed for {(trip (~(got by args) 'id'))}"
                        %reject-give
                      ;p:"%reject-give failed for {(trip (~(got by args) 'id'))}"
                    ==
              ==
        ==
    ==
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
  --
--