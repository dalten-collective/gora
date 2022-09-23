::
::  voyer - see a gora up close
::
/-  *gora
/+  rudder, *mip
::
^-  (page:rudder tack manage-gora-2)
|_  [bol=bowl:gall odo=order:rudder sat=tack]
++  final
  |=  [suc=? msg=brief:rudder]
  =/  args=(map @t @t)
    (malt +:(purse:rudder url.request.odo))
  ?.  suc
    (build ~(tap by args) `[| msg])
  ?.  (~(has by args) 'gora')
    [%next 'voyer' msg]
  [%next (crip "voyer?gora={(trip (~(got by args) 'gora'))}") msg]
::
++  argue
  |=  [headers=header-list:http body=(unit octs)]
  ^-  $@(brief:rudder manage-gora-2)
  ?>  authenticated.odo
  =/  args=(map @t @t)
    ?~(body ~ (frisk:rudder q.u.body))
  ?.  (~(has by args) 'act')
    'アクションの不許可'
  =/  act=@t
    (~(got by args) 'act')
  ?+    act  (cat 3 'アクションの不許可: ' act)
      %pub-gor
    ?.  (~(has by args) 'pub')
      ?.  (~(has by args) 'gor')  'ゴラが必要'
      [%pub-gor (slav %uv (~(got by args) 'gor')) %.n]
    ?.  (~(has by args) 'gor')  'ゴラが必要'
    [%pub-gor (slav %uv (~(got by args) 'gor')) %.y]
  ::
      %add-tag
    ?.  (~(has by args) 'tag')  'タグが必要'
    ?.  ((sane %tas) (~(got by args) 'tag'))
      'いたずらタグ'
    ?.  (~(has by args) 'gor')  'ゴラが必要'
    =/  =id  (slav %uv (~(got by args) 'gor'))
    [%add-tag (~(got by args) 'tag') (sy ~[id])]
  ::
      %rem-tag
    ?.  (~(has by args) 'tag')  'タグが必要'
    ?.  ((sane %tas) (~(got by args) 'tag'))
      'いたずらタグ'
    ?.  (~(has by args) 'gor')  'ゴラが必要'
    =/  =id  (slav %uv (~(got by args) 'gor'))
    [%rem-tag (~(got by args) 'tag') (sy ~[id])]
  ::
      %send-gora
    ?.  (~(has by args) 'who')  '船が必要'
    ?.  (~(has by args) 'gor')  'ゴラが必要'
    ?~  who=(rush (~(got by args) 'who') (more ace ;~(pfix sig fed:ag)))
      '船が必要'
    [%send-gora (slav %uv (~(got by args) 'gor')) (sy u.who)]
  ::
      %send-plea
    ?.  (~(has by args) 'hos')  '船が必要'
    ?.  (~(has by args) 'gor')  'ゴラが必要'
    :+  %send-plea
      (slav %uv (~(got by args) 'gor'))
    (slav %p (~(got by args) 'hos'))
  ::
      %accept-give
    ?.  (~(has by args) 'gor')  'ゴラが必要'
    [%accept-give (slav %uv (~(got by args) 'gor'))]
  ::
      %ignore-give
    ?.  (~(has by args) 'gor')  'ゴラが必要'
    [%ignore-give (slav %uv (~(got by args) 'gor'))]
  ==
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
    ++  modals
      |%
      ++  delete
        ^-  manx
        ;div(id "delete-modal", class "modal")
          ;div(class "modal-center")
            ;div(class "modal-header-error")
              ;div(class "name")
                ;p:"大悪魔"
              ==
            ==
          ::
            ;div(class "modal-body")
            ::
              ;div(class "delete-command")
                ;+  ?~  gor
                      ;p:"エッチなゴラは消せない"
                    ;div
                      ;p:"自分の責任で道場:"
                      ;p:":gora &gora-man-1 [%rm-gora id]"
                      ;p:"{(scow %ud id.u.gor)}"
                    ==
              ==
            ==
          ==
        ==
      ::
      ++  failure
        ^-  manx
        ?~  msgs  ;div;
        ?:  gud.u.msgs  ;div;
        ;div(id "fail-message", class "modal", style "display: block;")
          ;div(class "modal-center")
            ;div(class "modal-header-error")
              ;div(class "name")
                ;p:"ゴラ失敗"
              ==
            ==
          ::
            ;div(class "modal-body")
            ::
              ;div(class "delete-command")
                ;p:"{(trip txt.u.msgs)}"
              ==
            ==
          ==
        ==
      ::
      ++  success
        ^-  manx
        ?~  msgs  ;div;
        ?.  gud.u.msgs  ;div;
        ;div(id "succ-message", class "modal", style "display: block;")
          ;div(class "modal-center")
            ;div(class "modal-header-success")
              ;div(class "name")
                ;p:"ゴラ成功"
              ==
            ==
          ::
            ;div(class "modal-body")
            ::
              ;div(class "delete-command")
                ;div
                  ;pre:"{(trip txt.u.msgs)}"
                ==
              ==
            ==
          ==
        ==
      ::
      ++  function
        |=  [form=manx form-id=tape]
        ^-  manx
        ;div(id "{form-id}", class "modal", style "display: none;")
          ;div(class "modal-center")
            ;div(class "modal-header-function")
              ;div(class "name")
                ;p:"ゴラオプション"
              ==
            ==
          ::
            ;div(class "modal-body-func")
            ::
              ;div(class "func-container")
                ;+  form
              ==
            ==
          ==
        ==

      ::
      ++  offer-modal
        ^-  manx
        ?~  gor  ;div;
        %-  function
        :_  "offr-message"
        ^-  manx
        ?.  =(our.bol host.u.gor)  ;div;
        ?.  ?.  ?=(%g -.u.gor)  %.y
            ?~  max.u.gor  %.y
            (gth u.max.u.gor ~(wyt in hodl.u.gor))
          ;div;
        ;div(class "offer-form")
          ;div(class "offer-head")
            ;p:"ゴラを送る"
          ::
            ;div(class "offer-image")
              ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                ;path(fill "#bb8c02", d "M6.7 23.775q-1.325 0-2.237-.913-.913-.912-.913-2.237v-8.85q0-1.325.913-2.238.912-.912 2.237-.912h1.725v3.15H6.7v8.85h10.6v-8.85h-1.725v-3.15H17.3q1.325 0 2.238.912.912.913.912 2.238v8.85q0 1.325-.912 2.237-.913.913-2.238.913Zm3.725-6.9V6.225l-1.6 1.6-2.2-2.2L12 .225l5.375 5.4-2.2 2.2-1.6-1.6v10.65Z");
              ==
            ==
          ==
        ::
          ;form(method "post", style "display: flex; justify-content: center; align-items: center;")
            ;input(name "gor", type "text", value "{(scow %uv id.u.gor)}", style "display: none;");
            ;input(name "act", type "text", value "send-gora", style "display: none;");
            ;textarea(name "who", placeholder "~rabsef-bicrym ~zod ~dalten", style "height: 20vh;");
            ;button(class "submit-button")
              ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                ;path(fill "#bb8c02", d "M11 14.15v-4.3L9.35 11.5l-1.4-1.4L12 6.05l4.05 4.05-1.4 1.4L13 9.85v4.3Zm-5.7 7.7q-1.325 0-2.238-.912-.912-.913-.912-2.238V5.3q0-1.325.912-2.238.913-.912 2.238-.912h13.4q1.325 0 2.238.912.912.913.912 2.238v13.4q0 1.325-.912 2.238-.913.912-2.238.912Zm6.7-6q.95 0 1.725-.55.775-.55 1.075-1.45h3.9V5.3H5.3v8.55h3.9q.3.9 1.075 1.45.775.55 1.725.55Z");
              ==
            ==
          ==
        ==
      ::
      ++  tag-modal
        ^-  manx
        ?~  gor  ;div;
        =/  tags=(list @tas)
          .^  (list @tas)
            %gx
            :^    (scot %p our.bol)
                %gora
              (scot %da now.bol)
            /tags/(scot %uv id.u.gor)/noun
          ==
        %-  function
        :_  "tags-message"
        ^-  manx
        ;div(class "tags-exist")
          ;*  %+  turn  tags
              |=  t=@tas
              ;div(class "tag-row")
                ;form(method "post", style "display: flex; justify-content: center; align-items: center;")
                  ;input(name "tag", type "text", value "{(trip t)}", readonly "", class "tag-text");
                  ;input(name "gor", type "text", value "{(scow %uv id.u.gor)}", style "display: none;");
                  ;input(name "act", value "rem-tag", type "text", style "display: none;");
                ::
                  ;button(class "submit-button")
                    ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                      ;path(fill "red", d "M19.25 15.875 7.55 4.15h7.3q.775 0 1.413.312.637.313 1.112.963L22.025 12Zm.6 7.3-3.675-3.65q-.2.15-.575.238-.375.087-.75.087H5.3q-1.325 0-2.238-.912-.912-.913-.912-2.238V7.3q0-.475.113-.862.112-.388.262-.588l-2.2-2.175L2 2l19.5 19.5Z");
                    ==
                  ==
                ==
              ==
        ::
          ;div(class "tag-row")
            ;form(method "post", style "display: flex; justify-content: center; align-items: center;")
              ;input(name "tag", type "text", value "", placeholder "a-tag", class "tag-text-input");
              ;input(name "gor", type "text", value "{(scow %uv id.u.gor)}", style "display: none;");
              ;input(name "act", value "add-tag", type "text", style "display: none;");
            ::
              ;button(class "submit-button")
                ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                  ;path(fill "green", d "M10.625 17.2h2.75v-3.825H17.2v-2.75h-3.825V6.8h-2.75v3.825H6.8v2.75h3.825ZM5.3 21.85q-1.325 0-2.238-.912-.912-.913-.912-2.238V5.3q0-1.325.912-2.238.913-.912 2.238-.912h13.4q1.325 0 2.238.912.912.913.912 2.238v13.4q0 1.325-.912 2.238-.913.912-2.238.912Z");
                ==
              ==
            ==
          ==
        ==
      --
    ::
    ++  button
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
      ++  square
        |=  [svg=manx loc=tape]
        ;div(class "button-wrapper")
          ;a(class "square-button", href "{loc}")
            ;+  svg
          ==
        ==
      --
        
    ++  light
      |%
      ++  red
        ;div(class "red-light");
      ++  grn
        ;div(class "grn-light");
      ++  sub
        =;  status=?
          ?:(status grn red)
        ?~  gor  %.n
        .^  ?
          %gx
          :^    (scot %p our.bol)
              %gora
            (scot %da now.bol)
          /subscribed/(scot %uv id.u.gor)/noun
        ==
      ++  own
        =;  status=?
          ?:(status grn red)
        ?~  gor  %.n
        ?-  -.u.gor
          %g  (~(has in hodl.u.gor) our.bol)
        ::
          %s  (~(has in ~(key by stak.u.gor)) our.bol)
        ==
      --
    ::
    ++  name
      ?~  gor  
        ;div(class "name")
          ;p:"わからない ゴラ"
        ==
      ;div(class "name")
        ;p:"{(trip name.u.gor)}"
      ==
    ::
    ++  iden
      ?~  gor  
        ;div(class "iden")
          ;p:"わからない ゴラ"
        ==
      ;div(class "iden")
        ;p:"{(scow %uv id.u.gor)}"
      ==
    ::
    ++  host
      ?~  gor  
        ;div(class "host")
          ;p:"いたずらゾッド"
        ==
      ;div(class "host")
        ;p:"{(scow %p host.u.gor)}"
      ==
    ::
    ++  made
      ?~  gor
        ;div(class "made")
          ;p:"1970年 1月 1日"
        ==
      =+  yer=(yore made.u.gor)
      ;div(class "made")
        ;p:"{(scow %ud y.yer)}年 {(scow %ud m.yer)}月 {(scow %ud d.t.yer)}日"
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
            ;p:"{(trip '私が所有')}: {(scow %ud mine)} / 残高の総額: {(scow %ud tots)}"
          ==
        :_  %-  ~(rep by stak.u.gor)
            |=([[k=ship v=@ud] t=@ud] (add v t))
        ?~(had=(~(get by stak.u.gor) our.bol) 0 u.had)
      ::
          %g
        ?~  max.u.gor
          ;div(class "tots")
            ;p:"{<~(wyt in hodl.u.gor)>} ホッドル"
          ==
          ::
        ;div(class "tots")
          ;p:"{<~(wyt in hodl.u.gor)>} ホッドル / {(scow %ud u.max.u.gor)} 最大"
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
    ::
    ++  owns
      ?~  gor
        ;div(class "tableFixHead")
          ;table
            ;thead
              ;tr
                ;th:"私は生きている"
              ::
                ;th:"あなたは私を構築します"
              ==
            ==
          ::
            ;tbody(class "table-contents")
              ;tr
                ;td:"パイロットなし"
              ==
            ::
              ;tr
                ;td:"ゴラなし"
              ==
            ==
          ==
        ==
      ?-    -.u.gor
          %s
        ;div(class "tableFixHead")
          ;table
            ;thead
              ;tr
                ;th:"ホドル"
              ::
                ;th:"カウント"
              ==
            ==
          ::
            ;tbody(class "table-contents")
              ;*  ^-  marl
                  %-  ~(rep by stak.u.gor)
                  |=  [[k=ship v=@ud] m=marl]
                  :_  m
                  ;tr
                    ;td:"{(scow %p k)}"
                  ::
                    ;td:"{(scow %ud v)}"
                  ==
            ==
          ==
        ==
      ::
          %g
        ;div(class "tableFixHead")
          ;table
            ;thead
              ;tr
                ;th:"所有者リスト"
              ==
            ==
        ::
            ;tbody(class "table-contents")
              ;*  ^-  marl
                  %-  ~(rep in hodl.u.gor)
                  |=  [s=ship m=marl]
                  :_  m
                  ;tr
                    ;td:"{(scow %p s)}"
                  ==
            ::
              ;tr
                ;td:"終わり"
              ==
            ==
          ==
        ==
      == 
    --
  ++  page
    ^-  manx
    ;html
      ;head
        ;title:"ゴラ - {?~(gor (trip 'いたずらゴラ') (trip name.u.gor))}"
        ;style:"{(trip style)}"
        ;meta(charset "utf-8");
        ;meta
          =name     "viewport"
          =content  "width=device-width, initial-scale=1";
      ==
    ::
      ;body
        ;div(class "modal-container")
          ;+  delete:modals:make
          ;+  failure:modals:make
          ;+  success:modals:make
          ;+  tag-modal:modals:make
          ;+  offer-modal:modals:make
        ==
      ::
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
            ;div(class "made-container")
              ;+  made:make
            ==
            ;div(class "iden-container")
              ;+  iden:make
            ==
            ;div(class "xtra-container")
              ;div(class "indicators-container")
                ;div(class "subscription-container")
                  ;+  sub:light:make
                ::
                  ;div(class "subbed-text")
                    ;p:"サブスクリプション"
                  ==
                ==
                ;div(class "ownership-container")
                  ;+  own:light:make
                ::
                  ;div(class "subbed-text")
                    ;p:"オーウェン"
                  ==
                ==
              ==
            ::
              ;div(class "owners-container")
                ;+  owns:make
              ==
            ==
          ==
        ::
          ;div(class "button-container")
            ;div(class "button-top-row")
              ;+  ?~  gor  ;div;
                  ?.  =(our.bol host.u.gor)
                    ?-    -.u.gor
                        %g
                      ?:  (~(has in hodl.u.gor) our.bol)
                        ;div;
                      :: check if existing offer,
                      ::   if so add accept button
                      :: if not, add request button
                      ?:  (~(has in offers.logs.sat) id.u.gor)
                        ;div(class "left-layout")
                          ;div(class "left-wrapper")
                            ;div(id "reqact")
                              ;form(method "post")
                                ;input(name "gor", type "text", value "{(scow %uv id.u.gor)}", style "display: none;");
                                ;input(name "act", value "accept-give", type "text", style "display: none;");
                              ::
                                ;button(class "submit-button")
                                  ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                                    ;path(fill "rgba(7, 207, 4, 0.89)", d "M5.3 21.85q-1.325 0-2.238-.912-.912-.913-.912-2.238V5.3q0-1.325.912-2.238.913-.912 2.238-.912h13.4q1.325 0 2.238.912.912.913.912 2.238v13.4q0 1.325-.912 2.238-.913.912-2.238.912Zm6.7-6q.95 0 1.725-.55.775-.55 1.075-1.45h3.9V5.3H5.3v8.55h3.9q.3.9 1.075 1.45.775.55 1.725.55Zm0-1.7L7.95 10.1l1.4-1.425L11 10.35v-4.3h2v4.3l1.65-1.675 1.4 1.425Z");
                                  ==
                                ==
                              ==
                            ==
                          ==
                        ==
                        ::
                      ?:  ?~  max.u.gor  %.n
                          (gte ~(wyt in hodl.u.gor) u.max.u.gor)
                        ;div;
                      ;div(class "left-layout")
                        ;div(class "left-wrapper")
                          ;div(id "reqact")
                            ;form(method "post")
                              ;input(name "hos", type "text", value "{(scow %p host.u.gor)}", style "display: none;");
                              ;input(name "gor", type "text", value "{(scow %uv id.u.gor)}", style "display: none;");
                              ;input(name "act", value "send-plea", type "text", style "display: none;");
                            ::
                              ;button(class "submit-button")
                                ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                                  ;path(fill "#bb8c02", d "M5.3 21.85q-1.325 0-2.238-.912-.912-.913-.912-2.238V5.3q0-1.325.912-2.238.913-.912 2.238-.912h13.4q1.325 0 2.238.912.912.913.912 2.238v13.4q0 1.325-.912 2.238-.913.912-2.238.912Zm6.7-6q.95 0 1.725-.55.775-.55 1.075-1.45h3.9V5.3H5.3v8.55h3.9q.3.9 1.075 1.45.775.55 1.725.55Zm0-1.7L7.95 10.1l1.4-1.425L11 10.35v-4.3h2v4.3l1.65-1.675 1.4 1.425Z");
                                ==
                              ==
                            ==
                          ==
                        ==
                      ==
                      
                    ::
                        %s
                      ?:  (~(has in ~(key by stak.u.gor)) our.bol)
                        ;div;
                      :: check if existing offer, if so add accept button
                      :: if not, add request button
                      ?:  (~(has in offers.logs.sat) id.u.gor)
                        ;div(class "left-layout")
                          ;div(class "left-wrapper")
                            ;div(id "reqact")
                              ;form(method "post")
                                ;input(name "gor", type "text", value "{(scow %uv id.u.gor)}", style "display: none;");
                                ;input(name "act", value "accept-give", type "text", style "display: none;");
                              ::
                                ;button(class "submit-button")
                                  ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                                    ;path(fill "rgba(7, 207, 4, 0.89)", d "M5.3 21.85q-1.325 0-2.238-.912-.912-.913-.912-2.238V5.3q0-1.325.912-2.238.913-.912 2.238-.912h13.4q1.325 0 2.238.912.912.913.912 2.238v13.4q0 1.325-.912 2.238-.913.912-2.238.912Zm6.7-6q.95 0 1.725-.55.775-.55 1.075-1.45h3.9V5.3H5.3v8.55h3.9q.3.9 1.075 1.45.775.55 1.725.55Zm0-1.7L7.95 10.1l1.4-1.425L11 10.35v-4.3h2v4.3l1.65-1.675 1.4 1.425Z");
                                  ==
                                ==
                              ==
                            ==
                          ==
                        ==
                        ::
                      ;div(class "left-layout")
                        ;div(class "left-wrapper")
                          ;div(id "reqact")
                            ;form(method "post")
                              ;input(name "hos", type "text", value "{(scow %p host.u.gor)}", style "display: none;");
                              ;input(name "gor", type "text", value "{(scow %uv id.u.gor)}", style "display: none;");
                              ;input(name "act", value "send-plea", type "text", style "display: none;");
                            ::
                              ;button(class "submit-button")
                                ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                                  ;path(fill "#bb8c02", d "M5.3 21.85q-1.325 0-2.238-.912-.912-.913-.912-2.238V5.3q0-1.325.912-2.238.913-.912 2.238-.912h13.4q1.325 0 2.238.912.912.913.912 2.238v13.4q0 1.325-.912 2.238-.913.912-2.238.912Zm6.7-6q.95 0 1.725-.55.775-.55 1.075-1.45h3.9V5.3H5.3v8.55h3.9q.3.9 1.075 1.45.775.55 1.725.55Zm0-1.7L7.95 10.1l1.4-1.425L11 10.35v-4.3h2v4.3l1.65-1.675 1.4 1.425Z");
                                ==
                              ==
                            ==
                          ==
                        ==
                      ==
                    ==
                  ?:  ?:  ?=(%s -.u.gor)  %.n
                      ?~  max.u.gor       %.n
                      (gte ~(wyt in hodl.u.gor) u.max.u.gor)
                    ;div;
                  ;div(class "left-layout")
                    ;div(class "left-wrapper")
                      ;div(id "givload")
                        ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                          ;path(fill "#bb8c02", d "M11 14.15v-4.3L9.35 11.5l-1.4-1.4L12 6.05l4.05 4.05-1.4 1.4L13 9.85v4.3Zm-5.7 7.7q-1.325 0-2.238-.912-.912-.913-.912-2.238V5.3q0-1.325.912-2.238.913-.912 2.238-.912h13.4q1.325 0 2.238.912.912.913.912 2.238v13.4q0 1.325-.912 2.238-.913.912-2.238.912Zm6.7-6q.95 0 1.725-.55.775-.55 1.075-1.45h3.9V5.3H5.3v8.55h3.9q.3.9 1.075 1.45.775.55 1.725.55Z");
                        ==
                      ==
                    ==
                  ==
            ::
              ;+  =-  (circle:button:make [- "." %.n])
                  ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                    ;path(fill "#bb8c02", d "M5.625 20.775q-.975 0-1.687-.713-.713-.712-.713-1.687 0-.975.713-1.675.712-.7 1.687-.7.975 0 1.675.7.7.7.7 1.675 0 .975-.7 1.687-.7.713-1.675.713Zm6.375 0q-.975 0-1.675-.713-.7-.712-.7-1.687 0-.975.7-1.675.7-.7 1.675-.7.975 0 1.675.7.7.7.7 1.675 0 .975-.7 1.687-.7.713-1.675.713Zm6.375 0q-.975 0-1.675-.713-.7-.712-.7-1.687 0-.975.7-1.675.7-.7 1.675-.7.975 0 1.687.7.713.7.713 1.675 0 .975-.713 1.687-.712.713-1.687.713Zm-12.75-6.4q-.975 0-1.687-.7-.713-.7-.713-1.675 0-.975.713-1.675.712-.7 1.687-.7.975 0 1.675.7.7.7.7 1.675 0 .975-.7 1.675-.7.7-1.675.7Zm6.375 0q-.975 0-1.675-.7-.7-.7-.7-1.675 0-.975.7-1.675.7-.7 1.675-.7.975 0 1.675.7.7.7.7 1.675 0 .975-.7 1.675-.7.7-1.675.7Zm6.375 0q-.975 0-1.675-.7-.7-.7-.7-1.675 0-.975.7-1.675.7-.7 1.675-.7.975 0 1.687.7.713.7.713 1.675 0 .975-.713 1.675-.712.7-1.687.7ZM5.625 8q-.975 0-1.687-.7-.713-.7-.713-1.675 0-.975.713-1.688.712-.712 1.687-.712.975 0 1.675.712.7.713.7 1.688T7.3 7.3q-.7.7-1.675.7ZM12 8q-.975 0-1.675-.7-.7-.7-.7-1.675 0-.975.7-1.688.7-.712 1.675-.712.975 0 1.675.712.7.713.7 1.688t-.7 1.675q-.7.7-1.675.7Zm6.375 0Q17.4 8 16.7 7.3q-.7-.7-.7-1.675 0-.975.7-1.688.7-.712 1.675-.712.975 0 1.687.712.713.713.713 1.688T20.062 7.3q-.712.7-1.687.7Z");
                  ==
            ::
              ;div(class "right-layout")
                ;div(class "right-wrapper")
                  ;div(id "tagload")
                    ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                      ;path(fill "#bb8c02", d "m21.95 12-4.675 6.575q-.425.625-1.1.95-.675.325-1.425.325H5.2q-1.3 0-2.225-.925T2.05 16.7V7.3q0-1.3.925-2.225T5.2 4.15h9.55q.75 0 1.425.337.675.338 1.1.938Z");
                    ==
                  ==
                ==
              ==
            ::
              ;+  ?~  gor  ;div;
                  ?.  ?=(%s -.u.gor)  ;div;
                  ?~  nul.u.gor  ;div;
                  =-  (circle:button:make [- "./stakd?gora={(scow %uv id.u.gor)}" %.n])
                  ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                    ;path(fill "#bb8c02", d "M15 20q-3.35 0-5.675-2.325Q7 15.35 7 12q0-3.35 2.325-5.675Q11.65 4 15 4q3.35 0 5.675 2.325Q23 8.65 23 12q0 3.35-2.325 5.675Q18.35 20 15 20Zm-8-.25q-2.65-.7-4.325-2.85Q1 14.75 1 12q0-2.75 1.675-4.9Q4.35 4.95 7 4.25v2.1q-1.8.625-2.9 2.175Q3 10.075 3 12t1.1 3.475q1.1 1.55 2.9 2.175ZM15 12Zm0 6q2.5 0 4.25-1.75T21 12q0-2.5-1.75-4.25T15 6q-2.5 0-4.25 1.75T9 12q0 2.5 1.75 4.25T15 18Z");
                  ==
            ==
          ::
            ;div(class "button-bottom-row")
              ;div(class "left-layout")
                ;div(class "left-wrapper")
                  ;div(id "delete")
                    ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                      ;path(fill "red", d "M9.475 16.85 12 14.325l2.525 2.525 1.825-1.825-2.525-2.525 2.525-2.525-1.825-1.825L12 10.675 9.475 8.15 7.65 9.975l2.525 2.525-2.525 2.525Zm-2.75 5q-1.325 0-2.237-.912-.913-.913-.913-2.238V6.275H2v-3.15h6.425V1.55h7.1v1.575H22v3.15h-1.575V18.7q0 1.325-.912 2.238-.913.912-2.238.912Z");
                    ==
                  ==
                ==
              ==
            ::
              ;+  ?~  gor
                    =-  (circle:button:make [- "" %.y])
                    ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                      ;path(fill "red", d "M12 16q1.875 0 3.188-1.312Q16.5 13.375 16.5 11.5q0-1.875-1.312-3.188Q13.875 7 12 7q-1.875 0-3.188 1.312Q7.5 9.625 7.5 11.5q0 1.875 1.312 3.188Q10.125 16 12 16Zm0-2.325q-.9 0-1.537-.638-.638-.637-.638-1.537 0-.9.638-1.538.637-.637 1.537-.637.9 0 1.538.637.637.638.637 1.538t-.637 1.537q-.638.638-1.538.638Zm0 6.1q-3.95 0-7.137-2.288Q1.675 15.2.225 11.5q1.45-3.7 4.638-5.988Q8.05 3.225 12 3.225q3.95 0 7.138 2.287Q22.325 7.8 23.775 11.5q-1.45 3.7-4.637 5.987Q15.95 19.775 12 19.775Z");
                    ==
                  ?.  (~(has in public.sat) id.u.gor)
                    ::  make a circle (circle:button:make [*manx "localhost" %.n])
                    ;div(class "right-layout")
                      ;div(class "right-wrapper")
                        ;form(method "post", style "margin: 0em;")
                          ;input(name "pub", type "checkbox", checked "", style "display: none;");
                          ;input(name "gor", type "text", value "{(scow %uv id.u.gor)}", style "display: none;");
                          ;input(name "act", value "pub-gor", type "text", style "display: none;");
                        ::
                          ;button(class "submit-button")
                            ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                              ;path(fill "#bb8c02", d "M12 16q1.875 0 3.188-1.312Q16.5 13.375 16.5 11.5q0-1.875-1.312-3.188Q13.875 7 12 7q-1.875 0-3.188 1.312Q7.5 9.625 7.5 11.5q0 1.875 1.312 3.188Q10.125 16 12 16Zm0-2.325q-.9 0-1.537-.638-.638-.637-.638-1.537 0-.9.638-1.538.637-.637 1.537-.637.9 0 1.538.637.637.638.637 1.538t-.637 1.537q-.638.638-1.538.638Zm0 6.1q-3.95 0-7.137-2.288Q1.675 15.2.225 11.5q1.45-3.7 4.638-5.988Q8.05 3.225 12 3.225q3.95 0 7.138 2.287Q22.325 7.8 23.775 11.5q-1.45 3.7-4.637 5.987Q15.95 19.775 12 19.775Z");
                            ==
                          ==
                        ==
                      ==
                    ==
                    ::
                  ;div(class "right-layout")
                    ;div(class "right-wrapper")
                      ;form(method "post")
                        ;input(name "pub", type "checkbox", style "display: none;");
                        ;input(name "gor", type "text", value "{(scow %uv id.u.gor)}", style "display: none;");
                        ;input(name "act", value "pub-gor", type "text", style "display: none;");
                      ::
                        ;button(class "submit-button")
                          ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                            ;path(fill "#bb8c02", d "m19.5 22.9-3.75-3.725q-.825.3-1.762.45-.938.15-1.988.15-3.95 0-7.112-2.238Q1.725 15.3.225 11.5q.5-1.275 1.325-2.5t1.8-2.225L.7 4.125 2.375 2.45l18.775 18.8ZM12 16q.15 0 .288-.012.137-.013.287-.063l-5.05-5q-.025.15-.025.3v.275q0 1.875 1.312 3.188Q10.125 16 12 16Zm8.1.725-3.85-3.85q.125-.3.188-.7.062-.4.062-.675 0-1.875-1.312-3.188Q13.875 7 12 7q-.325 0-.675.062-.35.063-.7.188L7.45 4.075q1.025-.425 2.2-.638 1.175-.212 2.35-.212 3.925 0 7.087 2.212Q22.25 7.65 23.775 11.5q-.575 1.525-1.562 2.887-.988 1.363-2.113 2.338Zm-6.4-6.4-.7-.7q.175-.025.3.012.125.038.225.163t.15.262q.05.138.025.263Z");
                          ==
                        ==
                      ==
                    ==
                  ==
            ::
              ;+  ?~  gor  ;div;
                  ?:  =(our.bol host.u.gor)  ;div;
                  ?-    -.u.gor
                      %g
                    ?:  (~(has in hodl.u.gor) our.bol)
                      ;div;
                    ?.  (~(has in offers.logs.sat) id.u.gor)
                      ;div;
                    ;div(class "right-layout")
                      ;div(class "right-wrapper")
                        ;div(id "reqign")
                          ;form(method "post")
                            ;input(name "gor", type "text", value "{(scow %uv id.u.gor)}", style "display: none;");
                            ;input(name "act", value "ignore-give", type "text", style "display: none;");
                          ::
                            ;button(class "submit-button")
                              ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                                ;path(fill "red", d "M5.3 21.85q-1.325 0-2.238-.912-.912-.913-.912-2.238V5.3q0-1.325.912-2.238.913-.912 2.238-.912h13.4q1.325 0 2.238.912.912.913.912 2.238v13.4q0 1.325-.912 2.238-.913.912-2.238.912Zm6.7-6q.95 0 1.725-.55.775-.55 1.075-1.45h3.9V5.3H5.3v8.55h3.9q.3.9 1.075 1.45.775.55 1.725.55Zm0-1.7L7.95 10.1l1.4-1.425L11 10.35v-4.3h2v4.3l1.65-1.675 1.4 1.425Z");
                              ==
                            ==
                          ==
                        ==
                      ==
                    ==
                  ::
                      %s
                    ?:  (~(has in ~(key by stak.u.gor)) our.bol)
                      ;div;
                    ;div(class "right-layout")
                      ;div(class "right-wrapper")
                        ;div(id "reqign")
                          ;form(method "post")
                            ;input(name "gor", type "text", value "{(scow %uv id.u.gor)}", style "display: none;");
                            ;input(name "act", value "ignore-give", type "text", style "display: none;");
                          ::
                            ;button(class "submit-button")
                              ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                                ;path(fill "red", d "M5.3 21.85q-1.325 0-2.238-.912-.912-.913-.912-2.238V5.3q0-1.325.912-2.238.913-.912 2.238-.912h13.4q1.325 0 2.238.912.912.913.912 2.238v13.4q0 1.325-.912 2.238-.913.912-2.238.912Zm6.7-6q.95 0 1.725-.55.775-.55 1.075-1.45h3.9V5.3H5.3v8.55h3.9q.3.9 1.075 1.45.775.55 1.725.55Zm0-1.7L7.95 10.1l1.4-1.425L11 10.35v-4.3h2v4.3l1.65-1.675 1.4 1.425Z");
                              ==
                            ==
                          ==
                        ==
                      ==
                    ==
                  ==
            ::
              ;+  ?~  gor  ;div;
                  ?.  ?=(%s -.u.gor)  ;div;
                  ?.  =(our.bol host.u.gor)  ;div;
                  =-  (circle:button:make [- "./stakm?gora={(scow %uv id.u.gor)}" %.n])
                  ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                    ;path(fill "red", d "M6 14q0 1.3.525 2.462.525 1.163 1.5 2.038Q8 18.375 8 18.275v-.225q0-.8.3-1.5t.875-1.275L12 12.5l2.825 2.775q.575.575.875 1.275.3.7.3 1.5v.225q0 .1-.025.225.975-.875 1.5-2.038Q18 15.3 18 14q0-1.25-.462-2.363-.463-1.112-1.338-1.987-.5.325-1.05.487-.55.163-1.125.163-1.55 0-2.687-1.025Q10.2 8.25 10.025 6.75 9.05 7.575 8.3 8.462q-.75.888-1.262 1.8-.513.913-.775 1.863Q6 13.075 6 14Zm6 1.3-1.425 1.4q-.275.275-.425.625-.15.35-.15.725 0 .8.588 1.375Q11.175 20 12 20t1.413-.575Q14 18.85 14 18.05q0-.4-.15-.738-.15-.337-.425-.612ZM12 3v3.3q0 .85.588 1.425.587.575 1.437.575.45 0 .838-.187.387-.188.687-.563L16 7q1.85 1.05 2.925 2.925Q20 11.8 20 14q0 3.35-2.325 5.675Q15.35 22 12 22q-3.35 0-5.675-2.325Q4 17.35 4 14q0-3.225 2.163-6.125Q8.325 4.975 12 3Z");
                  ==
            ==
          ==
        ==
      ::
        ;script:"{(trip script)}"
      ==
    ==
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
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
            -ms-flex-direction: column;
                flex-direction: column;

        background-image: -o-radial-gradient(#9e7703 1px, transparent 1px), -o-radial-gradient(#9e7703 1px, transparent 1px);

        background-image: radial-gradient(#9e7703 1px, transparent 1px), radial-gradient(#9e7703 1px, transparent 1px);
        background-size: 59px 59px;
        background-position: 0 0, 29.5px 29.5px;

        -webkit-animation: pulse 12s infinite;

                animation: pulse 12s infinite;
      }

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

      .name-container {
        height: 5vh;

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
        height: 4vh;
        
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

      .host-container {
        height: 3vh;

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

      .host {
        z-index: 100;
        height: 2vh;
        
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

      .host > p {
        margin: 0;
      }

      .tots-container {
        height: 3vh;

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

      .tots {
        z-index: 100;
        height: 2vh;
        
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

      .tots > p {
        margin: 0;
      }

      .made-container {
        height: 3vh;

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

      .made {
        z-index: 100;
        height: 2vh;
        
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

      .made > p {
        margin: 0;
      }

      .iden-container {
        height: 3vh;

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

      .iden {
        z-index: 100;
        height: 2vh;
        
        padding-top: 3px;

        position: absolute;

        font-size: 11px;
        color: #8a6f00;
        text-shadow: 0px 1px 1px rgba(195,154,29,.8);

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

      .iden > p {
        margin: 0;
      }

      .xtra-container {
        width: 90vw;
        height: 25vh;

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

      .button-top-row {
        width: 85vw;
        height: 15vw;

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
      .button-bottom-row {
        width: 85vw;
        height: 15vw;

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

      .button-container {
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

      /* container children */
      .closeup-container {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
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


        display: -webkit-box;


        display: -ms-flexbox;


        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        margin-inline: 2%;

        background-image: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 40 40' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M20 20.5V18H0v-2h20v-2H0v-2h20v-2H0V8h20V6H0V4h20V2H0V0h22v20h2V0h2v20h2V0h2v20h2V0h2v20h2V0h2v20h2v2H20v-1.5zM0 20h2v20H0V20zm4 0h2v20H4V20zm4 0h2v20H8V20zm4 0h2v20h-2V20zm4 0h2v20h-2V20zm4 4h20v2H20v-2zm0 4h20v2H20v-2zm0 4h20v2H20v-2zm0 4h20v2H20v-2z' fill='%236a6259' fill-opacity='0.095' fill-rule='evenodd'/%3E%3C/svg%3E");
        background-color: #151612;

        -webkit-box-shadow: 0px 0px 10px 2px #bb8c02, inset 0px 0px 20px 10px #000000, 5px 5px 15px 5px rgb(0 0 0 / 0%);
        box-shadow: 0px 0px 10px 2px #bb8c02, inset 0px 0px 20px 10px #000000, 5px 5px 15px 5px rgb(0 0 0 / 0%);
      }

      /*   badge - a badge inset in the box */
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

        -webkit-transition: -webkit-transform 0.7s ease-in-out;

        transition: -webkit-transform 0.7s ease-in-out;

        -o-transition: transform 0.7s ease-in-out;

        transition: transform 0.7s ease-in-out;

        transition: transform 0.7s ease-in-out, -webkit-transform 0.7s ease-in-out;
      }

      /*   in-set - holds a badge in the box */
      .in-set {
        z-index: 0;
        border-radius: 50%;
        -webkit-box-shadow: 0px 0px 7px 5px #000;
                box-shadow: 0px 0px 7px 5px #000;
        position: absolute;
        width: 82vw;
        padding-bottom: 82vw;
        background: -o-radial-gradient(circle, rgb(15 13 2) 0%, rgb(0 0 0) 33%);
        background: radial-gradient(circle, rgb(15 13 2) 0%, rgb(0 0 0) 33%);
      }

      .set-in {
        width: 80vw;
        height: 80vw;

        border-radius: 50%;
        background: -o-radial-gradient(50% 49%, circle, #fcfcfc, #cccfd0 36%, #bab8b3 91%);
        background: radial-gradient(circle at 50% 49%, #fcfcfc, #cccfd0 36%, #bab8b3 91%);

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        position: relative;
        -webkit-transition: all 1s ease-in-out;
        -o-transition: all 1s ease-in-out;
        transition: all 1s ease-in-out;
      }

      /*   set-in > img settings */
      .set-in>img {
        height: 100%;
        width: 100%;
        border-radius: 50%;
        /*  filter: grayscale(0.6);
        transition: all 0.5s ease-in-out; */

        -webkit-animation: inspect 6s infinite;

                animation: inspect 6s infinite;
      }

      @-webkit-keyframes inspect {

        /* filter: grayscale(0.4); */
        0% {
          -webkit-filter: grayscale(0.4);
                  filter: grayscale(0.4);
        }

        33% {
          -webkit-filter: grayscale(0.2);
                  filter: grayscale(0.2);
        }

        50% {
          -webkit-filter: grayscale(0);
                  filter: grayscale(0);
        }

        66% {
          -webkit-filter: grayscale(0.2);
                  filter: grayscale(0.2);
        }

        100% {
          -webkit-filter: grayscale(0.4);
                  filter: grayscale(0.4);
        }
      }

      @keyframes inspect {

        /* filter: grayscale(0.4); */
        0% {
          -webkit-filter: grayscale(0.4);
                  filter: grayscale(0.4);
        }

        33% {
          -webkit-filter: grayscale(0.2);
                  filter: grayscale(0.2);
        }

        50% {
          -webkit-filter: grayscale(0);
                  filter: grayscale(0);
        }

        66% {
          -webkit-filter: grayscale(0.2);
                  filter: grayscale(0.2);
        }

        100% {
          -webkit-filter: grayscale(0.4);
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
        -webkit-animation: inspectg 6s infinite;
                animation: inspectg 6s infinite;
      }

      @-webkit-keyframes inspectg {

        /* transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg); */
        0% {
          background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          -webkit-transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
                  transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
        }

        45% {
          background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          -webkit-transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
                  transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
        }
        
        55% {
          background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          -webkit-transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
                  transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
        }

        100% {
          background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          -webkit-transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
                  transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
        }
      }

      @keyframes inspectg {

        /* transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg); */
        0% {
          background: -o-radial-gradient(50% 50%, circle, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          -webkit-transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
                  transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
        }

        45% {
          background: -o-radial-gradient(50% 50%, circle, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          -webkit-transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
                  transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
        }
        
        55% {
          background: -o-radial-gradient(50% 50%, circle, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          -webkit-transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
                  transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
        }

        100% {
          background: -o-radial-gradient(50% 50%, circle, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          -webkit-transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
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
        -webkit-animation: inspects 6s infinite;
                animation: inspects 6s infinite;
      }

      @-webkit-keyframes inspects {

        /*  box-shadow: -15px -10px 25px 10px #151612 inset; */
        0% {
           -webkit-box-shadow: -15px -10px 25px 10px #151612 inset;
                   box-shadow: -15px -10px 25px 10px #151612 inset;
        }

        20% {
           -webkit-box-shadow: -8px -8px 18px 7px #212121 inset;
                   box-shadow: -8px -8px 18px 7px #212121 inset;
        }

        50% {
           -webkit-box-shadow: -3px -7px 13px 5px #000000 inset;
                   box-shadow: -3px -7px 13px 5px #000000 inset;
        }

        70% {
           -webkit-box-shadow: -8px -8px 18px 5px #212121 inset;
                   box-shadow: -8px -8px 18px 5px #212121 inset;
        }

        100% {
           -webkit-box-shadow: -15px -10px 25px 10px #151612 inset;
                   box-shadow: -15px -10px 25px 10px #151612 inset;
        }
      }

      @keyframes inspects {

        /*  box-shadow: -15px -10px 25px 10px #151612 inset; */
        0% {
           -webkit-box-shadow: -15px -10px 25px 10px #151612 inset;
                   box-shadow: -15px -10px 25px 10px #151612 inset;
        }

        20% {
           -webkit-box-shadow: -8px -8px 18px 7px #212121 inset;
                   box-shadow: -8px -8px 18px 7px #212121 inset;
        }

        50% {
           -webkit-box-shadow: -3px -7px 13px 5px #000000 inset;
                   box-shadow: -3px -7px 13px 5px #000000 inset;
        }

        70% {
           -webkit-box-shadow: -8px -8px 18px 5px #212121 inset;
                   box-shadow: -8px -8px 18px 5px #212121 inset;
        }

        100% {
           -webkit-box-shadow: -15px -10px 25px 10px #151612 inset;
                   box-shadow: -15px -10px 25px 10px #151612 inset;
        }
      }

      /*  set-in > animations */

      .set-in:hover>.shadow {
        -webkit-box-shadow: -1px -1px 10px 5px #000000 inset;
                box-shadow: -1px -1px 10px 5px #000000 inset;
      }

      /* details-container */
      .details-container {
        margin: 5px;
        -webkit-backdrop-filter: blur(1px) invert(0.15);
                backdrop-filter: blur(1px) invert(0.15);
        border-radius: 35px;

        -webkit-box-shadow: 5px 5px 5px 0px #000000, inset 4px 4px 15px 0px #000000, 5px 5px 15px 5px rgba(0,0,0,0); 
        box-shadow: 5px 5px 5px 0px #000000, inset 4px 4px 15px 0px #000000, 5px 5px 15px 5px rgba(0,0,0,0);
      }

      .details-container > p {
        margin: 0;
        padding: 0;
      }

      .subbed-text {
        font-size: 8px;
        color: #ffbd00;
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
        -webkit-transform: translate(2vh, -3vh);
            -ms-transform: translate(2vh, -3vh);
                transform: translate(2vh, -3vh)
      }

      /* .red-light power light */
      .red-light {
        width: 25px;
        height: 25px;
        background: #000;
        position: absolute;
        border-radius: 50%;
      }
      .red-light:after {
        content: '';
        display: block;
        width: 22px;
        height: 22px;
        background: -o-radial-gradient(white, yellow, orange, red);
        background: radial-gradient(white, yellow, orange, red);
        border-radius: 50%;
        margin-left: 1px;
        margin-top: 1px;
        -webkit-animation: flicker;
                animation: flicker;
        -webkit-animation-duration: 4s;
                animation-duration: 4s;
        -webkit-animation-iteration-count: infinite;
                animation-iteration-count: infinite;
      }
      .red-light:before {
        content: 'ナック';
        display: block;
        position: absolute;
        right: -30px;
        top: 0px;
        font-size: 8px;
        color: #a8a18d;
        text-shadow: 0px 0px 0 rgb(155,148,128),
                    0px 1px 0 rgb(141,134,114),
                    0px 2px  0 rgb(128,121,101),
                    0px 3px 2px rgba(196,154,29,1),
                    0px 3px 1px rgba(196,154,29,0.5),
                    0px 0px 2px rgba(196,154,29,.2);
      }
      @-webkit-keyframes flicker {
        0% {
          -webkit-box-shadow: -2px 0px 10px 2px red;
                  box-shadow: -2px 0px 10px 2px red;
        }
        10% {
          -webkit-box-shadow: -3px -1px 10px 2px red;
                  box-shadow: -3px -1px 10px 2px red;
        }
        20% {
          -webkit-box-shadow: -2px -2px 10px 2px red;
                  box-shadow: -2px -2px 10px 2px red;
        }
        30% {
          -webkit-box-shadow: -1px -3px 10px 2px red;
                  box-shadow: -1px -3px 10px 2px red;
        }
        40% {
          -webkit-box-shadow: 0px -2px 10px 2px red;
                  box-shadow: 0px -2px 10px 2px red;
        }
        50% {
          -webkit-box-shadow: 0px 0px 10px 2px red;
                  box-shadow: 0px 0px 10px 2px red;
        }
        60% {
          -webkit-box-shadow: 0px 1px 10px 2px red;
                  box-shadow: 0px 1px 10px 2px red;
        }
        70% {
          -webkit-box-shadow: 1px 2px 10px 2px red;
                  box-shadow: 1px 2px 10px 2px red;
        }
        80% {
          -webkit-box-shadow: 2px 1px 10px 2px red;
                  box-shadow: 2px 1px 10px 2px red;
        }
        90% {
          -webkit-box-shadow: -1px 0px 10px 2px red;
                  box-shadow: -1px 0px 10px 2px red;
        }
        100% {
          -webkit-box-shadow: -2px 0px 10px 2px red;
                  box-shadow: -2px 0px 10px 2px red;
        }
      }
      @keyframes flicker {
        0% {
          -webkit-box-shadow: -2px 0px 10px 2px red;
                  box-shadow: -2px 0px 10px 2px red;
        }
        10% {
          -webkit-box-shadow: -3px -1px 10px 2px red;
                  box-shadow: -3px -1px 10px 2px red;
        }
        20% {
          -webkit-box-shadow: -2px -2px 10px 2px red;
                  box-shadow: -2px -2px 10px 2px red;
        }
        30% {
          -webkit-box-shadow: -1px -3px 10px 2px red;
                  box-shadow: -1px -3px 10px 2px red;
        }
        40% {
          -webkit-box-shadow: 0px -2px 10px 2px red;
                  box-shadow: 0px -2px 10px 2px red;
        }
        50% {
          -webkit-box-shadow: 0px 0px 10px 2px red;
                  box-shadow: 0px 0px 10px 2px red;
        }
        60% {
          -webkit-box-shadow: 0px 1px 10px 2px red;
                  box-shadow: 0px 1px 10px 2px red;
        }
        70% {
          -webkit-box-shadow: 1px 2px 10px 2px red;
                  box-shadow: 1px 2px 10px 2px red;
        }
        80% {
          -webkit-box-shadow: 2px 1px 10px 2px red;
                  box-shadow: 2px 1px 10px 2px red;
        }
        90% {
          -webkit-box-shadow: -1px 0px 10px 2px red;
                  box-shadow: -1px 0px 10px 2px red;
        }
        100% {
          -webkit-box-shadow: -2px 0px 10px 2px red;
                  box-shadow: -2px 0px 10px 2px red;
        }
      }

      /* .grn-light power light */
      .grn-light {
        width: 25px;
        height: 25px;
        background: #000;
        position: absolute;
        border-radius: 50%;
      }
      .grn-light:after {
        content: '';
        display: block;
        width: 22px;
        height: 22px;
        background: -o-radial-gradient(#9cffde, #55f228, #28953b, green);
        background: radial-gradient(#9cffde, #55f228, #28953b, green);
        border-radius: 50%;
        margin-left: 1px;
        margin-top: 1px;
        -webkit-animation: flicker-grn;
                animation: flicker-grn;
        -webkit-animation-duration: 4s;
                animation-duration: 4s;
        -webkit-animation-iteration-count: infinite;
                animation-iteration-count: infinite;
      }
      .grn-light:before {
        content: 'パス';
        display: block;
        position: absolute;
        right: -30px;
        top: 0px;
        font-size: 8px;
        color: #a8a18d;
        text-shadow: 0px 0px 0 rgb(155,148,128),
                    0px 1px 0 rgb(141,134,114),
                    0px 2px  0 rgb(128,121,101),
                    0px 3px 2px rgba(196,154,29,1),
                    0px 3px 1px rgba(196,154,29,0.5),
                    0px 0px 2px rgba(196,154,29,.2);
      }
      @-webkit-keyframes flicker-grn {
        0% {
          -webkit-box-shadow: 0px 0px 10px 2px green;
                  box-shadow: 0px 0px 10px 2px green;
        }
        20% {
          -webkit-box-shadow: 0px 0px 10px 3px green;
                  box-shadow: 0px 0px 10px 3px green;
        }
        40% {
          -webkit-box-shadow: 0px 0px 10px 4px green;
                  box-shadow: 0px 0px 10px 4px green;
        }
        60% {
          -webkit-box-shadow: 0px 0px 10px 5px green;
                  box-shadow: 0px 0px 10px 5px green;
        }
        80% {
          -webkit-box-shadow: 0px 0px 10px 4px green;
                  box-shadow: 0px 0px 10px 4px green;
        }
        100% {
          -webkit-box-shadow: 0px 0px 10px 2px green;
                  box-shadow: 0px 0px 10px 2px green;
        }
      }
      @keyframes flicker-grn {
        0% {
          -webkit-box-shadow: 0px 0px 10px 2px green;
                  box-shadow: 0px 0px 10px 2px green;
        }
        20% {
          -webkit-box-shadow: 0px 0px 10px 3px green;
                  box-shadow: 0px 0px 10px 3px green;
        }
        40% {
          -webkit-box-shadow: 0px 0px 10px 4px green;
                  box-shadow: 0px 0px 10px 4px green;
        }
        60% {
          -webkit-box-shadow: 0px 0px 10px 5px green;
                  box-shadow: 0px 0px 10px 5px green;
        }
        80% {
          -webkit-box-shadow: 0px 0px 10px 4px green;
                  box-shadow: 0px 0px 10px 4px green;
        }
        100% {
          -webkit-box-shadow: 0px 0px 10px 2px green;
                  box-shadow: 0px 0px 10px 2px green;
        }
      }

      .indicators-container {
        width: 30vw;
        height: 20vh;
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

      .subscription-container {
        height: 50%;
        width: 25vw;

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
      .ownership-container {
        height: 50%;
        width: 25vw;

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

      .owners-container {
        height: 30vh;
        
        display: -webkit-box;
        
        display: -ms-flexbox;
        
        display: flex;
        -webkit-box-pack: right;
            -ms-flex-pack: right;
                justify-content: right;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
      }

      .tableFixHead {
        height: 20vh;
        width: 60vw;
        overflow: auto;
        border-radius: 15px;

        background: #695b46;
        -webkit-box-shadow: 5px 5px 5px 0px #000000, inset 4px 4px 15px 0px #000000, 5px 5px 15px 5px rgba(0,0,0,0); 
        box-shadow: 5px 5px 5px 0px #000000, inset 4px 4px 15px 0px #000000, 5px 5px 15px 5px rgba(0,0,0,0);

        margin: 2vh;
      }
      .tableFixHead thead th { position: sticky; top: 0; z-index: 1; }

      /* Just common table stuff. Really. */
      table  { border-collapse: collapse; width: 100%; }

      thead {
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
      
      th, td {
         padding: 4px;
      }
      
      th {
        font-size: 17px;
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

      tbody {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
            -ms-flex-direction: column;
                flex-direction: column;
        justify-contents: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
      }

      tr {
        font-size: 16px;
        color: #a8a18d;
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

      .table-contents > tr {
        width: 94%;
      }
      .table-contents > tr:nth-child(odd) {
        -webkit-backdrop-filter: grayscale(.7);
                backdrop-filter: grayscale(.7);
      }

      .table-contents > tr:nth-child(even) {
        -webkit-backdrop-filter: grayscale(.3);
                backdrop-filter: grayscale(.3)
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

      /* right button */
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

      /* modal (background) */
      .modal {
        padding-top: 20vh;
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100vw;
        height: 100vh;
        overflow: auto;
        background-color: rgb(0,0,0); /* fallback color */
        background-color: rgba(0,0,0,0.4); /* black w/ opacity */
      }

      /* modal headers */
      .modal-header-error {
        width: 80vw;
        height: 4vh;

        border: 1px solid #888;
        background-color: rgba(255, 59, 59, 0.5);
        -webkit-backdrop-filter: blur(1.5px);
                backdrop-filter: blur(1.5px);
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

      .modal-header-success {
        width: 80vw;
        height: 4vh;

        border: 1px solid #888;
        background-color: rgba(59, 255, 59, 0.5);
        -webkit-backdrop-filter: blur(1.5px);
                backdrop-filter: blur(1.5px);
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

      .modal-header-function {
        width: 80vw;
        height: 4vh;

        border: 1px solid #888;
        background-color: rgba(255, 255, 59, 0.3);
        -webkit-backdrop-filter: blur(1.5px);
                backdrop-filter: blur(1.5px);
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

      /* modal content/box */
      .modal-body {
        width: 80vw;
        height: 10vh;

        border: 1px solid #888;
        background-color: rgba(255, 255, 255, 0.9);
        -webkit-backdrop-filter: blur(1.5px);
                backdrop-filter: blur(1.5px);
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

        display: flex;
        overflow: auto;
        text-align: center;
        align-items: center;
        justify-content: center;
      }
      .modal-body-func {
        width: 80vw;
        height: 55vh;

        border: 1px solid #888;
        background-color: rgba(255, 255, 255, 0.9);
        -webkit-backdrop-filter: blur(1.5px);
                backdrop-filter: blur(1.5px);
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

        display: flex;
        overflow: auto;
        text-align: center;
        align-items: center;
        justify-content: center;
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

      .delete-command {
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

      .delete-command > p {
        margin: 0;
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

      /* form helpers */
      form {
        margin: 0;
      }
      .tags-exist {
        width: 70vw;
        height: 50vh;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        overflowY: auto;
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
      .tag-text {
        height: 30px;
        background: rgba(0,0,0,0);
        border: none;
        cursor: auto;
        font-size: 8px;
        color: #a8a18d;
        text-shadow: 0px 0px 0 rgb(155,148,128),
                    0px 1px 0 rgb(141,134,114),
                    0px 2px  0 rgb(128,121,101),
                    0px 3px 2px rgba(196,154,29,1),
                    0px 3px 1px rgba(196,154,29,0.5),
                    0px 0px 2px rgba(196,154,29,.2);
      }
      .tag-text-input {
        height: 30px;
      }

      .tag-row {
        width: 65vw;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
            -ms-flex-direction: column;
                flex-direction: column;
        -webkit-box-pack: left;
            -ms-flex-pack: left;
                justify-content: left;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
      }

      .offer-head {
        width: 50vw;
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
    }

    /* square computer or horizontal phone*/
    @media (min-aspect-ratio: 9/16) {
      /* page container */
      .container {
        width: 100vw;
        height: 100vh;
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

        background-image: -o-radial-gradient(#9e7703 1px, transparent 1px), -o-radial-gradient(#9e7703 1px, transparent 1px);

        background-image: radial-gradient(#9e7703 1px, transparent 1px), radial-gradient(#9e7703 1px, transparent 1px);
        background-size: 59px 59px;
        background-position: 0 0, 29.5px 29.5px;

        -webkit-animation: pulse 12s infinite;

                animation: pulse 12s infinite;
      }

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

      /* container children */
      .closeup-container {
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

      /* .badge-box - holds badges */
      .badge-box {
        z-index: 0;
        width: 30vw;
        height: 90vh;
        margin-left: 10px;

        border: 5px outset #c3a882;
        border-radius: 10px;


        display: -webkit-box;


        display: -ms-flexbox;


        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        margin-inline: 2%;

        background-image: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 40 40' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M20 20.5V18H0v-2h20v-2H0v-2h20v-2H0V8h20V6H0V4h20V2H0V0h22v20h2V0h2v20h2V0h2v20h2V0h2v20h2V0h2v20h2v2H20v-1.5zM0 20h2v20H0V20zm4 0h2v20H4V20zm4 0h2v20H8V20zm4 0h2v20h-2V20zm4 0h2v20h-2V20zm4 4h20v2H20v-2zm0 4h20v2H20v-2zm0 4h20v2H20v-2zm0 4h20v2H20v-2z' fill='%236a6259' fill-opacity='0.095' fill-rule='evenodd'/%3E%3C/svg%3E");
        background-color: #151612;

        -webkit-box-shadow: 0px 0px 10px 2px #bb8c02, inset 0px 0px 20px 10px #000000, 5px 5px 15px 5px rgb(0 0 0 / 0%);
        box-shadow: 0px 0px 10px 2px #bb8c02, inset 0px 0px 20px 10px #000000, 5px 5px 15px 5px rgb(0 0 0 / 0%);
      }

      /*   badge - a badge inset in the box */
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

        -webkit-transition: -webkit-transform 0.7s ease-in-out;

        transition: -webkit-transform 0.7s ease-in-out;

        -o-transition: transform 0.7s ease-in-out;

        transition: transform 0.7s ease-in-out;

        transition: transform 0.7s ease-in-out, -webkit-transform 0.7s ease-in-out;
      }

      /*   in-set - holds a badge in the box */
      .in-set {
        z-index: 0;
        border-radius: 50%;
        -webkit-box-shadow: 0px 0px 7px 5px #000;
                box-shadow: 0px 0px 7px 5px #000;
        position: absolute;
        width: 26vw;
        padding-bottom: 26vw;
        background: -o-radial-gradient(circle, rgb(15 13 2) 0%, rgb(0 0 0) 33%);
        background: radial-gradient(circle, rgb(15 13 2) 0%, rgb(0 0 0) 33%);
      }

      .set-in {
        width: 25vw;
        height: 25vw;

        border-radius: 50%;
        background: -o-radial-gradient(50% 49%, circle, #fcfcfc, #cccfd0 36%, #bab8b3 91%);
        background: radial-gradient(circle at 50% 49%, #fcfcfc, #cccfd0 36%, #bab8b3 91%);

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        position: relative;
        -webkit-transition: all 1s ease-in-out;
        -o-transition: all 1s ease-in-out;
        transition: all 1s ease-in-out;
      }

      /*   set-in > img settings */
      .set-in>img {
        height: 100%;
        width: 100%;
        border-radius: 50%;
        /*  filter: grayscale(0.6);
        transition: all 0.5s ease-in-out; */

        -webkit-animation: inspect 6s infinite;

                animation: inspect 6s infinite;
      }

      @-webkit-keyframes inspect {

        /* filter: grayscale(0.4); */
        0% {
          -webkit-filter: grayscale(0.4);
                  filter: grayscale(0.4);
        }

        33% {
          -webkit-filter: grayscale(0.2);
                  filter: grayscale(0.2);
        }

        50% {
          -webkit-filter: grayscale(0);
                  filter: grayscale(0);
        }

        66% {
          -webkit-filter: grayscale(0.2);
                  filter: grayscale(0.2);
        }

        100% {
          -webkit-filter: grayscale(0.4);
                  filter: grayscale(0.4);
        }
      }

      @keyframes inspect {

        /* filter: grayscale(0.4); */
        0% {
          -webkit-filter: grayscale(0.4);
                  filter: grayscale(0.4);
        }

        33% {
          -webkit-filter: grayscale(0.2);
                  filter: grayscale(0.2);
        }

        50% {
          -webkit-filter: grayscale(0);
                  filter: grayscale(0);
        }

        66% {
          -webkit-filter: grayscale(0.2);
                  filter: grayscale(0.2);
        }

        100% {
          -webkit-filter: grayscale(0.4);
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
        -webkit-animation: inspectg 6s infinite;
                animation: inspectg 6s infinite;
      }

      @-webkit-keyframes inspectg {

        /* transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg); */
        0% {
          background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          -webkit-transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
                  transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
        }

        45% {
          background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          -webkit-transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
                  transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
        }
        
        55% {
          background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          -webkit-transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
                  transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
        }

        100% {
          background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          -webkit-transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
                  transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
        }
      }

      @keyframes inspectg {

        /* transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg); */
        0% {
          background: -o-radial-gradient(50% 50%, circle, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          -webkit-transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
                  transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
        }

        45% {
          background: -o-radial-gradient(50% 50%, circle, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          -webkit-transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
                  transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
        }
        
        55% {
          background: -o-radial-gradient(50% 50%, circle, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          -webkit-transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
                  transform: translateX(-15%) translateY(-40%) skewX(325deg) skewY(10deg) rotateX(50deg) rotateY(0deg);
        }

        100% {
          background: -o-radial-gradient(50% 50%, circle, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4) 5%, rgba(255, 255, 255, 0) 15%);
          -webkit-transform: translateX(-30%) translateY(-30%) skewX(325deg) skewY(10deg) rotateX(0deg) rotateY(0deg);
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
        -webkit-animation: inspects 6s infinite;
                animation: inspects 6s infinite;
      }

      @-webkit-keyframes inspects {

        /*  box-shadow: -15px -10px 25px 10px #151612 inset; */
        0% {
           -webkit-box-shadow: -15px -10px 25px 10px #151612 inset;
                   box-shadow: -15px -10px 25px 10px #151612 inset;
        }

        20% {
           -webkit-box-shadow: -8px -8px 18px 7px #212121 inset;
                   box-shadow: -8px -8px 18px 7px #212121 inset;
        }

        50% {
           -webkit-box-shadow: -3px -7px 13px 5px #000000 inset;
                   box-shadow: -3px -7px 13px 5px #000000 inset;
        }

        70% {
           -webkit-box-shadow: -8px -8px 18px 5px #212121 inset;
                   box-shadow: -8px -8px 18px 5px #212121 inset;
        }

        100% {
           -webkit-box-shadow: -15px -10px 25px 10px #151612 inset;
                   box-shadow: -15px -10px 25px 10px #151612 inset;
        }
      }

      @keyframes inspects {

        /*  box-shadow: -15px -10px 25px 10px #151612 inset; */
        0% {
           -webkit-box-shadow: -15px -10px 25px 10px #151612 inset;
                   box-shadow: -15px -10px 25px 10px #151612 inset;
        }

        20% {
           -webkit-box-shadow: -8px -8px 18px 7px #212121 inset;
                   box-shadow: -8px -8px 18px 7px #212121 inset;
        }

        50% {
           -webkit-box-shadow: -3px -7px 13px 5px #000000 inset;
                   box-shadow: -3px -7px 13px 5px #000000 inset;
        }

        70% {
           -webkit-box-shadow: -8px -8px 18px 5px #212121 inset;
                   box-shadow: -8px -8px 18px 5px #212121 inset;
        }

        100% {
           -webkit-box-shadow: -15px -10px 25px 10px #151612 inset;
                   box-shadow: -15px -10px 25px 10px #151612 inset;
        }
      }

      /*  set-in > animations */

      .set-in:hover>.shadow {
        -webkit-box-shadow: -1px -1px 10px 5px #000000 inset;
                box-shadow: -1px -1px 10px 5px #000000 inset;
      }

      /* details-container */
      .details-container {
        height: 80vh;
        margin-top: 10px;
        margin-left: 10px;
        margin-right: 10px;
        -webkit-backdrop-filter: blur(1px) invert(0.15);
                backdrop-filter: blur(1px) invert(0.15);
        border-radius: 35px;

        -webkit-box-shadow: 5px 5px 5px 0px #000000, inset 4px 4px 15px 0px #000000, 5px 5px 15px 5px rgba(0,0,0,0); 
        box-shadow: 5px 5px 5px 0px #000000, inset 4px 4px 15px 0px #000000, 5px 5px 15px 5px rgba(0,0,0,0);
      }

      .details-container > p {
        margin: 0;
        padding: 0;
      }

      .subbed-text {
        font-size: 8px;
        color: #ffbd00;
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
        -webkit-transform: translate(2vh, -6vh);
            -ms-transform: translate(2vh, -6vh);
                transform: translate(2vh, -6vh)
      }

      /* .red-light power light */
      .red-light {
        width: 25px;
        height: 25px;
        background: #000;
        position: absolute;
        border-radius: 50%;
      }
      .red-light:after {
        content: '';
        display: block;
        width: 22px;
        height: 22px;
        background: -o-radial-gradient(white, yellow, orange, red);
        background: radial-gradient(white, yellow, orange, red);
        border-radius: 50%;
        margin-left: 1px;
        margin-top: 1px;
        -webkit-animation: flicker;
                animation: flicker;
        -webkit-animation-duration: 4s;
                animation-duration: 4s;
        -webkit-animation-iteration-count: infinite;
                animation-iteration-count: infinite;
      }
      .red-light:before {
        content: 'ナック';
        display: block;
        position: absolute;
        right: -30px;
        top: 0px;
        font-size: 8px;
        color: #a8a18d;
        text-shadow: 0px 0px 0 rgb(155,148,128),
                    0px 1px 0 rgb(141,134,114),
                    0px 2px  0 rgb(128,121,101),
                    0px 3px 2px rgba(196,154,29,1),
                    0px 3px 1px rgba(196,154,29,0.5),
                    0px 0px 2px rgba(196,154,29,.2);
      }
      @-webkit-keyframes flicker {
        0% {
          -webkit-box-shadow: -2px 0px 10px 2px red;
                  box-shadow: -2px 0px 10px 2px red;
        }
        10% {
          -webkit-box-shadow: -3px -1px 10px 2px red;
                  box-shadow: -3px -1px 10px 2px red;
        }
        20% {
          -webkit-box-shadow: -2px -2px 10px 2px red;
                  box-shadow: -2px -2px 10px 2px red;
        }
        30% {
          -webkit-box-shadow: -1px -3px 10px 2px red;
                  box-shadow: -1px -3px 10px 2px red;
        }
        40% {
          -webkit-box-shadow: 0px -2px 10px 2px red;
                  box-shadow: 0px -2px 10px 2px red;
        }
        50% {
          -webkit-box-shadow: 0px 0px 10px 2px red;
                  box-shadow: 0px 0px 10px 2px red;
        }
        60% {
          -webkit-box-shadow: 0px 1px 10px 2px red;
                  box-shadow: 0px 1px 10px 2px red;
        }
        70% {
          -webkit-box-shadow: 1px 2px 10px 2px red;
                  box-shadow: 1px 2px 10px 2px red;
        }
        80% {
          -webkit-box-shadow: 2px 1px 10px 2px red;
                  box-shadow: 2px 1px 10px 2px red;
        }
        90% {
          -webkit-box-shadow: -1px 0px 10px 2px red;
                  box-shadow: -1px 0px 10px 2px red;
        }
        100% {
          -webkit-box-shadow: -2px 0px 10px 2px red;
                  box-shadow: -2px 0px 10px 2px red;
        }
      }
      @keyframes flicker {
        0% {
          -webkit-box-shadow: -2px 0px 10px 2px red;
                  box-shadow: -2px 0px 10px 2px red;
        }
        10% {
          -webkit-box-shadow: -3px -1px 10px 2px red;
                  box-shadow: -3px -1px 10px 2px red;
        }
        20% {
          -webkit-box-shadow: -2px -2px 10px 2px red;
                  box-shadow: -2px -2px 10px 2px red;
        }
        30% {
          -webkit-box-shadow: -1px -3px 10px 2px red;
                  box-shadow: -1px -3px 10px 2px red;
        }
        40% {
          -webkit-box-shadow: 0px -2px 10px 2px red;
                  box-shadow: 0px -2px 10px 2px red;
        }
        50% {
          -webkit-box-shadow: 0px 0px 10px 2px red;
                  box-shadow: 0px 0px 10px 2px red;
        }
        60% {
          -webkit-box-shadow: 0px 1px 10px 2px red;
                  box-shadow: 0px 1px 10px 2px red;
        }
        70% {
          -webkit-box-shadow: 1px 2px 10px 2px red;
                  box-shadow: 1px 2px 10px 2px red;
        }
        80% {
          -webkit-box-shadow: 2px 1px 10px 2px red;
                  box-shadow: 2px 1px 10px 2px red;
        }
        90% {
          -webkit-box-shadow: -1px 0px 10px 2px red;
                  box-shadow: -1px 0px 10px 2px red;
        }
        100% {
          -webkit-box-shadow: -2px 0px 10px 2px red;
                  box-shadow: -2px 0px 10px 2px red;
        }
      }

      /* .grn-light power light */
      .grn-light {
        width: 25px;
        height: 25px;
        background: #000;
        position: absolute;
        border-radius: 50%;
      }
      .grn-light:after {
        content: '';
        display: block;
        width: 22px;
        height: 22px;
        background: -o-radial-gradient(#9cffde, #55f228, #28953b, green);
        background: radial-gradient(#9cffde, #55f228, #28953b, green);
        border-radius: 50%;
        margin-left: 1px;
        margin-top: 1px;
        -webkit-animation: flicker-grn;
                animation: flicker-grn;
        -webkit-animation-duration: 4s;
                animation-duration: 4s;
        -webkit-animation-iteration-count: infinite;
                animation-iteration-count: infinite;
      }
      .grn-light:before {
        content: 'パス';
        display: block;
        position: absolute;
        right: -30px;
        top: 0px;
        font-size: 8px;
        color: #a8a18d;
        text-shadow: 0px 0px 0 rgb(155,148,128),
                    0px 1px 0 rgb(141,134,114),
                    0px 2px  0 rgb(128,121,101),
                    0px 3px 2px rgba(196,154,29,1),
                    0px 3px 1px rgba(196,154,29,0.5),
                    0px 0px 2px rgba(196,154,29,.2);
      }
      @-webkit-keyframes flicker-grn {
        0% {
          -webkit-box-shadow: 0px 0px 10px 2px green;
                  box-shadow: 0px 0px 10px 2px green;
        }
        20% {
          -webkit-box-shadow: 0px 0px 10px 3px green;
                  box-shadow: 0px 0px 10px 3px green;
        }
        40% {
          -webkit-box-shadow: 0px 0px 10px 4px green;
                  box-shadow: 0px 0px 10px 4px green;
        }
        60% {
          -webkit-box-shadow: 0px 0px 10px 5px green;
                  box-shadow: 0px 0px 10px 5px green;
        }
        80% {
          -webkit-box-shadow: 0px 0px 10px 4px green;
                  box-shadow: 0px 0px 10px 4px green;
        }
        100% {
          -webkit-box-shadow: 0px 0px 10px 2px green;
                  box-shadow: 0px 0px 10px 2px green;
        }
      }
      @keyframes flicker-grn {
        0% {
          -webkit-box-shadow: 0px 0px 10px 2px green;
                  box-shadow: 0px 0px 10px 2px green;
        }
        20% {
          -webkit-box-shadow: 0px 0px 10px 3px green;
                  box-shadow: 0px 0px 10px 3px green;
        }
        40% {
          -webkit-box-shadow: 0px 0px 10px 4px green;
                  box-shadow: 0px 0px 10px 4px green;
        }
        60% {
          -webkit-box-shadow: 0px 0px 10px 5px green;
                  box-shadow: 0px 0px 10px 5px green;
        }
        80% {
          -webkit-box-shadow: 0px 0px 10px 4px green;
                  box-shadow: 0px 0px 10px 4px green;
        }
        100% {
          -webkit-box-shadow: 0px 0px 10px 2px green;
                  box-shadow: 0px 0px 10px 2px green;
        }
      }

      .indicators-container {
        width: 10vw;
        height: 25vh;
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

      .subscription-container {
        height: 50%;
        width: 25vw;

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
      .ownership-container {
        height: 50%;
        width: 25vw;

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

      .owners-container {
        height: 30vh;
        
        display: -webkit-box;
        
        display: -ms-flexbox;
        
        display: flex;
        -webkit-box-pack: right;
            -ms-flex-pack: right;
                justify-content: right;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
      }

      .tableFixHead {
        height: 45vh;
        width: 40vw;
        overflow: auto;
        border-radius: 15px;

        background: #695b46;
        -webkit-box-shadow: 5px 5px 5px 0px #000000, inset 4px 4px 15px 0px #000000, 5px 5px 15px 5px rgba(0,0,0,0); 
        box-shadow: 5px 5px 5px 0px #000000, inset 4px 4px 15px 0px #000000, 5px 5px 15px 5px rgba(0,0,0,0);

        margin: 2vh;
      }
      .tableFixHead thead th { position: sticky; top: 0; z-index: 1; }

      /* Just common table stuff. Really. */
      table  { border-collapse: collapse; width: 100%; }

      thead {
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
      
      th, td {
         padding: 4px;
      }
      
      th {
        font-size: 17px;
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

      tbody {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
            -ms-flex-direction: column;
                flex-direction: column;
        justify-contents: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
      }

      tr {
        font-size: 16px;
        color: #a8a18d;
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

      .table-contents > tr {
        width: 94%;
      }
      .table-contents > tr:nth-child(odd) {
        -webkit-backdrop-filter: grayscale(.7);
                backdrop-filter: grayscale(.7);
      }

      .table-contents > tr:nth-child(even) {
        -webkit-backdrop-filter: grayscale(.3);
                backdrop-filter: grayscale(.3)
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
        width: 60vw;

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

      .host-container {
        height: 5vh;

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

      .host {
        z-index: 100;

        position: absolute;

        font-size: 18px;
        color: #a8a18d;
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

      .host > p {
        margin: 0;
      }

      .tots-container {
        height: 5vh;

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

      .tots {
        z-index: 100;

        position: absolute;

        font-size: 18px;
        color: #a8a18d;
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

      .tots > p {
        margin: 0;
      }

      .made-container {
        height: 5vh;

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

      .made {
        z-index: 100;

        position: absolute;

        font-size: 18px;
        color: #a8a18d;
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

      .made > p {
        margin: 0;
      }

      .iden-container {
        height: 5vh;

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

      .iden {
        z-index: 100;

        position: absolute;

        font-size: 11px;
        color: #8a6f00;
        text-shadow: 0px 1px 1px rgba(195,154,29,.8);

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

      .iden > p {
        margin: 0;
      }

      .xtra-container {
        height: 50vh;

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


      .button-top-row {
        height: 15vw;

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
      .button-bottom-row {
        height: 15vw;

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

      .button-container {
        height: 15vh;

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

      /* right button */
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

      /* modal (background) */
      .modal {
        padding-top: 20vh;
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100vw;
        height: 100vh;
        overflow: auto;
        background-color: rgb(0,0,0); /* fallback color */
        background-color: rgba(0,0,0,0.4); /* black w/ opacity */
      }

      /* modal headers */
      .modal-header-error {
        width: 60vw;
        height: 10vh;

        border: 1px solid #888;
        background-color: rgba(255, 59, 59, 0.5);
        -webkit-backdrop-filter: blur(1.5px);
                backdrop-filter: blur(1.5px);
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

        display: flex;
        justify-content: center;
        align-items: center;
      }

      .modal-header-success {
        width: 60vw;
        height: 10vh;

        border: 1px solid #888;
        background-color: rgba(59, 255, 59, 0.5);
        -webkit-backdrop-filter: blur(1.5px);
                backdrop-filter: blur(1.5px);
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

        display: flex;
        justify-content: center;
        align-items: center;
      }

      .modal-header-function {
        width: 60vw;
        height: 10vh;

        border: 1px solid #888;
        background-color: rgba(255, 255, 59, 0.3);
        -webkit-backdrop-filter: blur(1.5px);
                backdrop-filter: blur(1.5px);
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

        display: flex;
        justify-content: center;
        align-items: center;
      }

      .modal-header-function > div {
        width: 60vw;
      }

      /* modal content/box */
      .modal-body {
        width: 60vw;
        height: 40vh;

        border: 1px solid #888;
        background-color: rgba(255, 255, 255, 0.9);
        -webkit-backdrop-filter: blur(1.5px);
                backdrop-filter: blur(1.5px);
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

        display: flex;
        overflow: auto;
        text-align: center;
        align-items: center;
        justify-content: center;
      }
      .modal-body-func {
        width: 60vw;
        height: 55vh;

        border: 1px solid #888;
        background-color: rgba(255, 255, 255, 0.9);
        -webkit-backdrop-filter: blur(1.5px);
                backdrop-filter: blur(1.5px);
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

        display: flex;
        overflow: auto;
        text-align: center;
        align-items: center;
        justify-content: center;
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

      .delete-command {
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

      .delete-command > p {
        margin: 0;
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

      /* form helpers */
      form {
        margin: 0;
      }
      .tags-exist {
        width: 70vw;
        height: 50vh;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        overflowY: auto;
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
      .tag-text {
        height: 30px;
        background: rgba(0,0,0,0);
        border: none;
        cursor: auto;
        font-size: 8px;
        color: #a8a18d;
        text-shadow: 0px 0px 0 rgb(155,148,128),
                    0px 1px 0 rgb(141,134,114),
                    0px 2px  0 rgb(128,121,101),
                    0px 3px 2px rgba(196,154,29,1),
                    0px 3px 1px rgba(196,154,29,0.5),
                    0px 0px 2px rgba(196,154,29,.2);
      }
      .tag-text-input {
        height: 30px;
      }

      .tag-row {
        width: 65vw;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
            -ms-flex-direction: column;
                flex-direction: column;
        -webkit-box-pack: left;
            -ms-flex-pack: left;
                justify-content: left;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
      }

      .offer-head {
        width: 50vw;
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

    }

    .submit-button {
      padding: 0px;
      background: none;
      border: none;
      cursor: pointer;
    }

    tr {
      width: 100%;
    }

    th {
      width: 50%;
    }

    td {
      width: 50%;
    }
    '''
  ::
  ++  script
    '''
    // Get the modal
    var modal = document.getElementById("delete-modal");
    var fails = document.getElementById("fail-message");
    var succs = document.getElementById("succ-message");
    var taggs = document.getElementById("tags-message");
    var offer = document.getElementById("offr-message");

    // Get the button that opens the modal
    var deleteButton = document.getElementById("delete");
    var tagButton = document.getElementById("tagload");
    var offerButton = document.getElementById("givload")

    // When the user clicks the button, open the modal 
    if (deleteButton) {
        deleteButton.onclick = function() {
        modal.style.display = "block";
      }
    }

    if (tagButton) {
        tagButton.onclick = function() {
        taggs.style.display = "block";
      }
    }

    if (offerButton) {
        offerButton.onclick = function() {
        offer.style.display = "block"
      }
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = "none";
      } else if (event.target == fails) {
        fails.style.display = "none";
      } else if (event.target == succs) {
        succs.style.display = "none";
      } else if (event.target == taggs) {
        taggs.style.display = "none";
      } else if (event.target == offer) {
        offer.style.display = "none";
      }
    }
    '''
  --
--