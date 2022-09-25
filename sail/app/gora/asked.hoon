::
::  asked - gorae requested of you
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
    ?.  (~(has by args) 'who')
      (build ~(tap by args) `[| msg])
    ?.  %-  ~(has in ~(key by requests.logs.sat))
        (slav %p (~(got by args) 'who'))
      (build ~ `[| msg])
    (build ~(tap by args) `[| msg])
  ?.  (~(has by args) 'who')
    [%next 'asked' msg]
  ?.  %-  ~(has in ~(key by requests.logs.sat))
      (slav %p (~(got by args) 'who'))
    [%next 'asked' msg]
  [%next (crip "asked?who={(trip (~(got by args) 'who'))}") msg]
::
++  argue
  |=  [headers=header-list:http body=(unit octs)]
  ^-  $@(brief:rudder manage-gora-2)
  ?>  authenticated.odo
  =/  args=(map @t @t)
    ?~(body ~ (frisk:rudder q.u.body))
  ~&  >  "here"
  ?.  (~(has by args) 'act')
    'アクションの不許可'
  =/  act=@t
    (~(got by args) 'act')
  ?+    act  (cat 3 'アクションの不許可: ' act)
      %accept-request
    ?.  &((~(has by args) 'sip') (~(has by args) 'gor'))
      'ゴラと船が必要'
    :+  %accept-request
      (slav %uv (~(got by args) 'gor'))
    (slav %p (~(got by args) 'sip'))
  ::
      %ignore-request
    ?.  &((~(has by args) 'sip') (~(has by args) 'gor'))
      'ゴラと船が必要'
    :+  %ignore-request
      (slav %uv (~(got by args) 'gor'))
    (slav %p (~(got by args) 'sip'))
  ==
::
++  build
  |=  $:  args=(list [k=@t v=@t])
          msgs=(unit [gud=? txt=@])
      ==
  =/  sip=(unit @p)
    ?~  who=(~(get by (malt args)) 'who')  ~
    [~ (slav %p u.who)]
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
    ++  ple
      =;  rows=marl
        ;table
          ;thead
            ;tr
              ;th:"誰"      ::  ship
              ;th:"リンク"   ::  link
            ==
          ==
        ::
          ;tbody
            ;*  rows
          ==
        ==
      %+  turn  ~(tap in ~(key by requests.logs.sat))
      |=  s=ship
      ;tr
        ;td:"{(scow %p s)}"
        ;td
          ;a(href "./asked?who={(scow %p s)}")
            ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
              ;path(fill "#bb8c02", d "M10.625 17.85H7q-2.425 0-4.137-1.713Q1.15 14.425 1.15 12t1.713-4.138Q4.575 6.15 7 6.15h3.625V9.3H7q-1.125 0-1.912.787Q4.3 10.875 4.3 12t.788 1.912Q5.875 14.7 7 14.7h3.625Zm-3.2-4.65v-2.4h9.15v2.4Zm5.95 4.65V14.7H17q1.125 0 1.913-.788.787-.787.787-1.912t-.787-1.913Q18.125 9.3 17 9.3h-3.625V6.15H17q2.425 0 4.138 1.712Q22.85 9.575 22.85 12t-1.712 4.137Q19.425 17.85 17 17.85Z");
            ==
          ==
        ==
      ==
    ::
    ++  wat
      =;  rows=marl
        ;table
          ;thead
            ;tr
              ;th:"ゴラ"       ::  gora
              ;th:"受け入れる"  ::  accept
              ;th:"無視"       ::  ignore
            ==
          ==
        ::
          ;tbody
            ;*  rows
          ==
        ==
      %+  murn
        ~(tap in (~(got by requests.logs.sat) (need sip)))
      |=  i=id
      ?~  gor=(~(get by pita.sat) i)  ~
      ?.  =(our.bol host.u.gor)       ~
      :-  ~
      ;tr
        ;td
          ;a(href "./voyer?gora={(scow %uv id.u.gor)}")
            {(trip name.u.gor)}
          ==
        ==
      ::
        ;td
          ;form(method "post")
            ;input(name "gor", type "text", value "{(scow %uv id.u.gor)}", style "display: none;");
            ;input(name "sip", type "text", value "{(scow %p (need sip))}", style "display: none;");
            ;input(name "act", type "text", value "accept-request", style "display: none;");
            ;div(class "go-button")
              ;button
                ;svg(xmlns "http://www.w3.org/2000/svg", height "40", width "40")
                  ;path(fill "green", d "M18.708 28.333h2.75V21.5h6.875v-2.792h-6.875v-7.041h-2.75v7.041h-7.041V21.5h7.041ZM20 36.667q-3.458 0-6.479-1.313-3.021-1.312-5.292-3.583t-3.583-5.292Q3.333 23.458 3.333 20t1.313-6.5q1.312-3.042 3.583-5.292t5.292-3.562Q16.542 3.333 20 3.333t6.5 1.313q3.042 1.312 5.292 3.562t3.562 5.292q1.313 3.042 1.313 6.5t-1.313 6.479q-1.312 3.021-3.562 5.292T26.5 35.354q-3.042 1.313-6.5 1.313Zm0-2.792q5.792 0 9.833-4.042 4.042-4.041 4.042-9.833t-4.021-9.833Q25.833 6.125 20 6.125q-5.792 0-9.833 4.021Q6.125 14.167 6.125 20q0 5.792 4.042 9.833 4.041 4.042 9.833 4.042ZM20 20Z");
                ==
              ==
            ==
          ==
        ==
      ::
        ;td
          ;form(method "post")
            ;input(name "gor", type "text", value "{(scow %uv id.u.gor)}", style "display: none;");
            ;input(name "sip", type "text", value "{(scow %p (need sip))}", style "display: none;");
            ;input(name "act", type "text", value "ignore-request", style "display: none;");
            ;div(class "go-button")
              ;button
                ;svg(xmlns "http://www.w3.org/2000/svg", height "40", width "40")
                  ;path(fill "red", d "M11.667 21.292h16.666v-2.75H11.667ZM20 36.667q-3.417 0-6.458-1.313-3.042-1.312-5.313-3.583t-3.583-5.313Q3.333 23.417 3.333 20q0-3.458 1.313-6.5 1.312-3.042 3.583-5.292t5.313-3.562Q16.583 3.333 20 3.333q3.458 0 6.5 1.313 3.042 1.312 5.292 3.562t3.562 5.292q1.313 3.042 1.313 6.5 0 3.417-1.313 6.458-1.312 3.042-3.562 5.313T26.5 35.354q-3.042 1.313-6.5 1.313Zm0-2.792q5.792 0 9.833-4.042 4.042-4.041 4.042-9.833t-4.042-9.833Q25.792 6.125 20 6.125t-9.833 4.042Q6.125 14.208 6.125 20t4.042 9.833q4.041 4.042 9.833 4.042ZM20 20Z");
                ==
              ==
            ==
          ==
        ==
      ==
    ::
    ++  pick
      ^-  manx
      ;div(class "container")
        ;div(class "head")
          ;div(class "title-bar")
            ;div(class "title-pane")
              ;div(class "title"):"最も謙虚な兄弟の嘆願"
            ::
              ;div(class "title-glass");
            ==
          ==
        ==
      ::
        ;div(class "main")
          ;div(class "ships")
            ;div(class "icon-container")
              ;svg(xmlns "http://www.w3.org/2000/svg", version "1.1", width "60", height "60", viewBox "0 0 256 256")
                ;defs;
                ;g(style "stroke: none; stroke-width: 0; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: none; fill-rule: nonzero; opacity: 1;", transform "translate(1.4065934065934016 1.4065934065934016) scale(2.81 2.81)")
                  ;path(d "M 2.653 89.174 c -0.256 0 -0.512 -0.098 -0.707 -0.293 c -0.391 -0.391 -0.391 -1.023 0 -1.414 l 40.243 -40.243 c 0.391 -0.391 1.023 -0.391 1.414 0 s 0.391 1.023 0 1.414 L 3.36 88.881 C 3.164 89.076 2.908 89.174 2.653 89.174 z", style "stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: white; fill-rule: nonzero; opacity: 1;", transform " matrix(1 0 0 1 0 0) ", stroke-linecap "round");
                  ;path(d "M 79.421 42.886 c -0.42 0 -0.83 0.04 -1.234 0.098 c -0.471 -2.513 -2.028 -4.641 -4.165 -5.88 c -2.078 2.778 -4.36 5.624 -6.854 8.539 l 0.246 9.709 h 10.621 h 9.12 c 0.573 -1.155 0.903 -2.452 0.903 -3.828 C 88.058 46.753 84.191 42.886 79.421 42.886 z", style "stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(248,204,29); fill-rule: nonzero; opacity: 1;", transform " matrix(1 0 0 1 0 0) ", stroke-linecap "round");
                  ;path(d "M 23.801 25.879 c 1.726 -1.726 4.122 -2.689 6.557 -2.619 l 15.765 0.4 c 2.773 -2.373 5.481 -4.546 8.131 -6.543 c -2.083 -3.049 -5.585 -5.052 -9.557 -5.052 c -0.563 0 -1.111 0.054 -1.653 0.132 C 42.041 6.83 37.34 2.767 31.683 2.767 c -5.657 0 -10.358 4.063 -11.362 9.428 c -0.541 -0.078 -1.09 -0.132 -1.653 -0.132 c -6.389 0 -11.568 5.179 -11.568 11.568 c 0 1.844 0.443 3.581 1.21 5.128 h 12.611 L 23.801 25.879 z", style "stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(248,204,29); fill-rule: nonzero; opacity: 1;", transform " matrix(1 0 0 1 0 0) ", stroke-linecap "round");
                  ;path(d "M 66.501 30.498 c -1.764 0 -3.423 -0.687 -4.67 -1.935 c -1.248 -1.248 -1.936 -2.906 -1.936 -4.67 c 0 -1.765 0.688 -3.423 1.936 -4.671 c 1.247 -1.248 2.906 -1.935 4.67 -1.935 c 1.765 0 3.424 0.687 4.671 1.935 c 1.248 1.248 1.935 2.906 1.935 4.671 c 0 1.764 -0.687 3.423 -1.935 4.67 l 0 0 C 69.925 29.811 68.265 30.498 66.501 30.498 z M 66.501 19.287 c -1.229 0 -2.386 0.479 -3.256 1.349 c -0.87 0.87 -1.35 2.026 -1.35 3.257 c 0 1.23 0.479 2.386 1.35 3.256 c 0.87 0.87 2.026 1.349 3.256 1.349 c 1.23 0 2.387 -0.479 3.257 -1.349 l 0 0 c 0.87 -0.87 1.349 -2.026 1.349 -3.256 c 0 -1.23 -0.479 -2.387 -1.349 -3.257 C 68.887 19.766 67.731 19.287 66.501 19.287 z", style "stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: white; fill-rule: nonzero; opacity: 1;", transform " matrix(1 0 0 1 0 0) ", stroke-linecap "round");
                  ;path(d "M 89.987 4.147 c 0.084 -0.903 -0.235 -1.789 -0.877 -2.431 c -0.642 -0.642 -1.534 -0.961 -2.431 -0.877 C 75.05 1.928 61.171 9.362 45.271 22.986 L 29.41 22.584 c -2.377 -0.071 -4.688 0.867 -6.362 2.541 l -7.246 7.246 c -0.804 0.804 -1.11 1.941 -0.817 3.04 c 0.293 1.099 1.123 1.933 2.221 2.231 l 11.27 3.056 l 7.056 7.055 c 0.391 0.391 1.023 0.391 1.414 0 s 0.391 -1.023 0 -1.414 l -6.547 -6.547 C 52.91 16.665 71.904 4.232 86.866 2.831 c 0.309 -0.024 0.611 0.081 0.83 0.3 s 0.328 0.522 0.299 0.83 c -1.4 14.961 -13.835 33.956 -36.961 56.467 l -6.548 -6.548 c -0.391 -0.391 -1.023 -0.391 -1.414 0 s -0.391 1.023 0 1.414 l 7.057 7.056 l 3.056 11.269 c 0.297 1.099 1.132 1.929 2.231 2.222 c 0.274 0.073 0.551 0.109 0.825 0.109 c 0.82 -0.001 1.611 -0.323 2.214 -0.927 l 7.245 -7.245 c 1.676 -1.676 2.603 -3.994 2.542 -6.362 L 67.84 45.555 C 81.463 29.655 88.897 15.776 89.987 4.147 z M 28.69 38.684 l -10.96 -2.972 c -0.579 -0.157 -0.76 -0.623 -0.812 -0.815 c -0.051 -0.193 -0.125 -0.688 0.299 -1.111 l 7.246 -7.246 c 1.29 -1.289 3.08 -2 4.897 -1.956 l 13.674 0.346 C 38.417 29.005 33.633 33.593 28.69 38.684 z M 66.242 61.467 c 0.047 1.822 -0.666 3.607 -1.956 4.897 l -7.245 7.245 c -0.424 0.424 -0.917 0.35 -1.11 0.299 c -0.193 -0.052 -0.659 -0.233 -0.816 -0.813 l -2.972 -10.959 c 5.09 -4.943 9.679 -9.726 13.754 -14.343 L 66.242 61.467 z", style "stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: white; fill-rule: nonzero; opacity: 1;", transform " matrix(1 0 0 1 0 0) ", stroke-linecap "round");
                  ;path(d "M 25.031 78.36 c -0.256 0 -0.512 -0.098 -0.707 -0.293 c -0.391 -0.391 -0.391 -1.023 0 -1.414 L 40.67 60.306 c 0.391 -0.391 1.023 -0.391 1.414 0 s 0.391 1.023 0 1.414 L 25.738 78.067 C 25.542 78.262 25.286 78.36 25.031 78.36 z", style "stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(248,204,29); fill-rule: nonzero; opacity: 1;", transform " matrix(1 0 0 1 0 0) ", stroke-linecap "round");
                  ;path(d "M 8.92 70.356 c -0.256 0 -0.512 -0.098 -0.707 -0.293 c -0.391 -0.391 -0.391 -1.023 0 -1.414 l 19.811 -19.811 c 0.391 -0.391 1.023 -0.391 1.414 0 s 0.391 1.023 0 1.414 L 9.627 70.063 C 9.431 70.259 9.176 70.356 8.92 70.356 z", style "stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(248,204,29); fill-rule: nonzero; opacity: 1;", transform " matrix(1 0 0 1 0 0) ", stroke-linecap "round");
                  ;path(d "M 35.868 79.835 c -0.256 0 -0.512 -0.098 -0.707 -0.293 c -0.391 -0.391 -0.391 -1.023 0 -1.414 l 8.834 -8.835 c 0.391 -0.391 1.023 -0.391 1.414 0 s 0.391 1.023 0 1.414 l -8.834 8.835 C 36.38 79.737 36.124 79.835 35.868 79.835 z", style "stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(248,204,29); fill-rule: nonzero; opacity: 1;", transform " matrix(1 0 0 1 0 0) ", stroke-linecap "round");
                  ;path(d "M 13.346 53.618 c -0.256 0 -0.512 -0.098 -0.707 -0.293 c -0.391 -0.391 -0.391 -1.023 0 -1.414 l 7.224 -7.223 c 0.391 -0.391 1.023 -0.391 1.414 0 s 0.391 1.023 0 1.415 l -7.224 7.223 C 13.858 53.52 13.602 53.618 13.346 53.618 z", style "stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(248,204,29); fill-rule: nonzero; opacity: 1;", transform " matrix(1 0 0 1 0 0) ", stroke-linecap "round");
                  ;path(d "M 19.829 85.689 c -0.552 0 -1 -0.447 -1 -1 v -4.256 c 0 -0.553 0.448 -1 1 -1 s 1 0.447 1 1 v 4.256 C 20.829 85.242 20.382 85.689 19.829 85.689 z", style "stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(248,204,29); fill-rule: nonzero; opacity: 1;", transform " matrix(1 0 0 1 0 0) ", stroke-linecap "round");
                  ;path(d "M 21.957 83.561 h -4.255 c -0.552 0 -1 -0.447 -1 -1 s 0.448 -1 1 -1 h 4.255 c 0.552 0 1 0.447 1 1 S 22.509 83.561 21.957 83.561 z", style "stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(248,204,29); fill-rule: nonzero; opacity: 1;", transform " matrix(1 0 0 1 0 0) ", stroke-linecap "round");
                  ;path(d "M 8.137 60.955 c -0.552 0 -1 -0.447 -1 -1 v -4.256 c 0 -0.553 0.448 -1 1 -1 s 1 0.447 1 1 v 4.256 C 9.137 60.508 8.69 60.955 8.137 60.955 z", style "stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(248,204,29); fill-rule: nonzero; opacity: 1;", transform " matrix(1 0 0 1 0 0) ", stroke-linecap "round");
                  ;path(d "M 10.265 58.827 H 6.01 c -0.552 0 -1 -0.447 -1 -1 s 0.448 -1 1 -1 h 4.255 c 0.552 0 1 0.447 1 1 S 10.817 58.827 10.265 58.827 z", style "stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(248,204,29); fill-rule: nonzero; opacity: 1;", transform " matrix(1 0 0 1 0 0) ", stroke-linecap "round");
                  ;path(d "M 3.194 78.277 c -0.853 0 -1.655 -0.333 -2.259 -0.937 C 0.332 76.738 0 75.935 0 75.083 s 0.332 -1.655 0.935 -2.259 c 1.246 -1.244 3.272 -1.244 4.517 0 c 0.604 0.604 0.936 1.406 0.936 2.259 s -0.332 1.654 -0.935 2.258 l 0 0 C 4.849 77.944 4.047 78.277 3.194 78.277 z M 3.194 73.889 c -0.306 0 -0.611 0.116 -0.844 0.349 C 2.124 74.464 2 74.763 2 75.083 c 0 0.318 0.124 0.618 0.35 0.844 c 0.451 0.451 1.238 0.451 1.688 0 h 0 c 0.226 -0.226 0.35 -0.525 0.35 -0.844 c 0 -0.319 -0.124 -0.619 -0.35 -0.845 C 3.805 74.006 3.499 73.889 3.194 73.889 z", style "stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(248,204,29); fill-rule: nonzero; opacity: 1;", transform " matrix(1 0 0 1 0 0) ", stroke-linecap "round");
                  ;path(d "M 30.658 87.236 c -0.818 0 -1.636 -0.312 -2.258 -0.934 c -0.604 -0.603 -0.936 -1.405 -0.936 -2.259 c 0 -0.853 0.332 -1.655 0.936 -2.258 c 1.245 -1.244 3.271 -1.244 4.517 0 c 0.604 0.603 0.936 1.405 0.936 2.258 c 0 0.854 -0.332 1.656 -0.936 2.259 C 32.294 86.925 31.476 87.236 30.658 87.236 z M 30.658 82.851 c -0.306 0 -0.611 0.116 -0.844 0.349 c -0.226 0.226 -0.35 0.525 -0.35 0.844 c 0 0.319 0.124 0.619 0.35 0.845 c 0.466 0.465 1.223 0.465 1.688 0 c 0.226 -0.226 0.35 -0.525 0.35 -0.845 c 0 -0.318 -0.124 -0.618 -0.35 -0.844 C 31.27 82.968 30.964 82.851 30.658 82.851 z", style "stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(248,204,29); fill-rule: nonzero; opacity: 1;", transform " matrix(1 0 0 1 0 0) ", stroke-linecap "round");
                ==
              ==
            ==
          ==
        ::
          ;div(class "requests-container")
            ;div(class "reqTable")
              ;+  ple:make
            ==
          ==
        ::
          ;+  =-  (circle:make [- "." %.n])
              ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                ;path(fill "#bb8c02", d "M5.625 20.775q-.975 0-1.687-.713-.713-.712-.713-1.687 0-.975.713-1.675.712-.7 1.687-.7.975 0 1.675.7.7.7.7 1.675 0 .975-.7 1.687-.7.713-1.675.713Zm6.375 0q-.975 0-1.675-.713-.7-.712-.7-1.687 0-.975.7-1.675.7-.7 1.675-.7.975 0 1.675.7.7.7.7 1.675 0 .975-.7 1.687-.7.713-1.675.713Zm6.375 0q-.975 0-1.675-.713-.7-.712-.7-1.687 0-.975.7-1.675.7-.7 1.675-.7.975 0 1.687.7.713.7.713 1.675 0 .975-.713 1.687-.712.713-1.687.713Zm-12.75-6.4q-.975 0-1.687-.7-.713-.7-.713-1.675 0-.975.713-1.675.712-.7 1.687-.7.975 0 1.675.7.7.7.7 1.675 0 .975-.7 1.675-.7.7-1.675.7Zm6.375 0q-.975 0-1.675-.7-.7-.7-.7-1.675 0-.975.7-1.675.7-.7 1.675-.7.975 0 1.675.7.7.7.7 1.675 0 .975-.7 1.675-.7.7-1.675.7Zm6.375 0q-.975 0-1.675-.7-.7-.7-.7-1.675 0-.975.7-1.675.7-.7 1.675-.7.975 0 1.687.7.713.7.713 1.675 0 .975-.713 1.675-.712.7-1.687.7ZM5.625 8q-.975 0-1.687-.7-.713-.7-.713-1.675 0-.975.713-1.688.712-.712 1.687-.712.975 0 1.675.712.7.713.7 1.688T7.3 7.3q-.7.7-1.675.7ZM12 8q-.975 0-1.675-.7-.7-.7-.7-1.675 0-.975.7-1.688.7-.712 1.675-.712.975 0 1.675.712.7.713.7 1.688t-.7 1.675q-.7.7-1.675.7Zm6.375 0Q17.4 8 16.7 7.3q-.7-.7-.7-1.675 0-.975.7-1.688.7-.712 1.675-.712.975 0 1.687.712.713.713.713 1.688T20.062 7.3q-.712.7-1.687.7Z");
              ==
        ==
      ==
    ::
    ++  take
      ^-  manx
      ;div(class "container")
        ;div(class "head")
          ;div(class "title-bar")
            ;div(class "title-pane")
              ;div(class "title"):"{(scow %p (need sip))} ットのリクエスト"
            ::
              ;div(class "title-glass");
            ==
          ==
        ==
      ::
        ;div(class "main")
          ;div(class "requests-container")
            ;div(class "reqTable")
              ;+  wat:make
            ==
          ==
        ::
          ;div(class "buttons")
            ;+  =-  (circle:make [- "./asked" %.n])
                ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                  ;path(fill "#bb8c02", d "m12 20-8-8 8-8 1.425 1.4-5.6 5.6H20v2H7.825l5.6 5.6Z");
                ==
          ::
            ;+  =-  (circle:make [- "." %.y])
                ;svg(xmlns "http://www.w3.org/2000/svg", height "24", width "24")
                  ;path(fill "#bb8c02", d "M5.625 20.775q-.975 0-1.687-.713-.713-.712-.713-1.687 0-.975.713-1.675.712-.7 1.687-.7.975 0 1.675.7.7.7.7 1.675 0 .975-.7 1.687-.7.713-1.675.713Zm6.375 0q-.975 0-1.675-.713-.7-.712-.7-1.687 0-.975.7-1.675.7-.7 1.675-.7.975 0 1.675.7.7.7.7 1.675 0 .975-.7 1.687-.7.713-1.675.713Zm6.375 0q-.975 0-1.675-.713-.7-.712-.7-1.687 0-.975.7-1.675.7-.7 1.675-.7.975 0 1.687.7.713.7.713 1.675 0 .975-.713 1.687-.712.713-1.687.713Zm-12.75-6.4q-.975 0-1.687-.7-.713-.7-.713-1.675 0-.975.713-1.675.712-.7 1.687-.7.975 0 1.675.7.7.7.7 1.675 0 .975-.7 1.675-.7.7-1.675.7Zm6.375 0q-.975 0-1.675-.7-.7-.7-.7-1.675 0-.975.7-1.675.7-.7 1.675-.7.975 0 1.675.7.7.7.7 1.675 0 .975-.7 1.675-.7.7-1.675.7Zm6.375 0q-.975 0-1.675-.7-.7-.7-.7-1.675 0-.975.7-1.675.7-.7 1.675-.7.975 0 1.687.7.713.7.713 1.675 0 .975-.713 1.675-.712.7-1.687.7ZM5.625 8q-.975 0-1.687-.7-.713-.7-.713-1.675 0-.975.713-1.688.712-.712 1.687-.712.975 0 1.675.712.7.713.7 1.688T7.3 7.3q-.7.7-1.675.7ZM12 8q-.975 0-1.675-.7-.7-.7-.7-1.675 0-.975.7-1.688.7-.712 1.675-.712.975 0 1.675.712.7.713.7 1.688t-.7 1.675q-.7.7-1.675.7Zm6.375 0Q17.4 8 16.7 7.3q-.7-.7-.7-1.675 0-.975.7-1.688.7-.712 1.675-.712.975 0 1.687.712.713.713.713 1.688T20.062 7.3q-.712.7-1.687.7Z");
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
            ;div(class "modal-message")
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
            ;div(class "modal-message")
              ;div
                ;pre:"{(trip txt.u.msgs)}"
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
        ;title:"ゴラ - 最も謙虚な兄弟の嘆願"
        ;style:"{(trip style)}"
        ;meta(charset "utf-8");
        ;meta
          =name     "viewport"
          =content  "width=device-width, initial-scale=1";
      ==
    ::
      ;body
        ;div(class "modal-container")
          ;+  failure:make
          ;+  success:make
        ==
      ::
        ;+  ?~  sip
              pick:make
            ?.  (~(has in ~(key by requests.logs.sat)) u.sip)
              pick:make
            take:make
      ::
        ;script:"{(trip script)}"
      ==
    ==
  ::
  ++  script
    '''
    var fails = document.getElementById("fail-message");
    var succs = document.getElementById("succ-message");

    window.onclick = function(event) {
      if (event.target == fails) {
        fails.style.display = "none";
      } else if (event.target == succs) {
        succs.style.display = "none";
      }
    '''
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

    .offTable { overflow: auto; }
    .offTable thead th { position: sticky; top: 0; z-index: 1; }

    .reqTable { overflow: auto; }
    .reqTable thead th { position: sticky; top: 0; z-index: 1; }

    .outTable { overflow: auto; }
    .outTable thead th { position: sticky; top: 0; z-index: 1; }

    table { border-collapse: collapse; width: 100%; height: 100%}
    th, td { 
      padding: 8px 5px;
      text-align: center;
      color: white;
    }

    a { color: white; }

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

      /* go button */
      .go-button {
        cursor: pointer;
        border-radius: 50%;
        padding: 5px;
        margin: 5px;
      }

      .go-button > button {
        padding: 0px;
        background: none;
        border: none;
        cursor: pointer;
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

    /* phone - vertical */
    @media (max-aspect-ratio: 9/16) {

    /* page container */
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

      .main {
        width: 100%;
        height: 80%;

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

      .ships {
        height: 80px;
        width: 30vw;
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

      .icon-container {
        height: 70px;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;

        border: 3px outset rgba(248,204,27,.5);
        border-radius: 10px;

        -webkit-box-shadow: 0px 0px 0px 0px #fff,
                    inset 0px 0px 0px 0px #fff;

                box-shadow: 0px 0px 0px 0px #fff,
                    inset 0px 0px 0px 0px #fff;
        
      }

      /* requests */
      .requests-container {
        width: 90vw;
        height: 55vh;
        margin-bottom: 15px;

        border-radius: 10px;
        overflow: hidden;
        -webkit-box-shadow: 0px 2px 5px 2px #bb8c0282;
                box-shadow: 0px 2px 5px 2px #bb8c0282;
        -webkit-backdrop-filter: blur(2px) invert(.1);
                backdrop-filter: blur(2px) invert(.1);

      }

      .reqTable {
        width: 90vw;
        height: 55vh;
      }

      .reqTable > table > thead > tr > th {
        -webkit-box-shadow: 0px 0px 0px 1px #edcc6a,
            inset 0px 0px 30px 2px #edcc6a;
                box-shadow: 0px 0px 0px 1px #edcc6a,
            inset 0px 0px 30px 2px #edcc6a;
        border-radius: 2px;
      }

      .reqTable > table > tbody > tr:nth-child(even) {
        -webkit-box-shadow: 0px 0px 0px 1px #f2dda3,
                    inset 0px 0px 50px 2px #f2dda3;
                box-shadow: 0px 0px 0px 1px #f2dda3,
                    inset 0px 0px 50px 2px #f2dda3;
      }
      .reqTable > table > tbody > tr:nth-child(odd) {
        -webkit-box-shadow: 0px 0px 0px 1px #a58e4b,
            inset 0px 0px 50px 5px #a58e4b;
                box-shadow: 0px 0px 0px 1px #a58e4b,
            inset 0px 0px 50px 5px #a58e4b;
      }

      .buttons {
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

    /* computer square */
    @media (min-aspect-ratio: 9/16) and (max-aspect-ratio: 16/9) {
    
    
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

      .modal-message {
        text-align: left;
      }

    /* page container */
      .container {
        width: 99vw;
        height: 99vh;

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

      .head {
        width: 100%;
        height: 15vw;

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

      /* title format */
      .title-bar {
        width: 75vw;
        height: 15vw;
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
        width: 75vw;
        height: 10vw;
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
        width: 75vw;
        height: 10vw;
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

      .main {
        width: 100%;
        height: 80%;

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

      .ships {
        height: 80px;
        width: 30vw;
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

      .icon-container {
        height: 70px;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;

        border: 3px outset rgba(248,204,27,.5);
        border-radius: 10px;

        -webkit-box-shadow: 0px 0px 0px 0px #fff,
                    inset 0px 0px 0px 0px #fff;

                box-shadow: 0px 0px 0px 0px #fff,
                    inset 0px 0px 0px 0px #fff;
        
      }

      /* requests */
      .requests-container {
        width: 55vw;
        height: 55vh;
        margin-bottom: 15px;

        border-radius: 10px;
        overflow: hidden;
        -webkit-box-shadow: 0px 2px 5px 2px #bb8c0282;
                box-shadow: 0px 2px 5px 2px #bb8c0282;
        -webkit-backdrop-filter: blur(2px) invert(.1);
                backdrop-filter: blur(2px) invert(.1);

      }

      .reqTable {
        width: 55vw;
        height: 55vh;
      }

      .reqTable > table > thead > tr > th {
        -webkit-box-shadow: 0px 0px 0px 1px #edcc6a,
            inset 0px 0px 30px 2px #edcc6a;
                box-shadow: 0px 0px 0px 1px #edcc6a,
            inset 0px 0px 30px 2px #edcc6a;
        border-radius: 2px;
      }

      .reqTable > table > tbody > tr:nth-child(even) {
        -webkit-box-shadow: 0px 0px 0px 1px #f2dda3,
                    inset 0px 0px 50px 2px #f2dda3;
                box-shadow: 0px 0px 0px 1px #f2dda3,
                    inset 0px 0px 50px 2px #f2dda3;
      }
      .reqTable > table > tbody > tr:nth-child(odd) {
        -webkit-box-shadow: 0px 0px 0px 1px #a58e4b,
            inset 0px 0px 50px 5px #a58e4b;
                box-shadow: 0px 0px 0px 1px #a58e4b,
            inset 0px 0px 50px 5px #a58e4b;
      }

      .buttons {
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

        /* phone - horizontal */
    @media (min-aspect-ratio: 16/9) {

    /* page container */
      .container {
        width: 99vw;
        height: 98vh;

        display: -webkit-box;

        display: -ms-flexbox;

        display: flex;
        -webkit-box-orient: horizontal;
        -webkit-box-direction: normal;
            -ms-flex-direction: row;
                flex-direction: row;

        background-image: -o-radial-gradient(#9e7703 1px, transparent 1px), -o-radial-gradient(#9e7703 1px, transparent 1px);

        background-image: radial-gradient(#9e7703 1px, transparent 1px), radial-gradient(#9e7703 1px, transparent 1px);
        background-size: 59px 59px;
        background-position: 0 0, 29.5px 29.5px;

        -webkit-animation: pulse 12s infinite;

                animation: pulse 12s infinite;
      }

      .head {
        width: 15vw;
        height: 97vh;

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

      /* title format */
      .title-bar {
        width: 95vh;
        height: 10vw;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;
        -webkit-transform: rotate(90deg);
            -ms-transform: rotate(90deg);
                transform: rotate(90deg);
      }

      .title-pane {
        width: 90vh;
        height: 10vw;
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
        width: 90vh;
        height: 10vw;
        position: absolute;
        -webkit-backdrop-filter: grayscale(0%) blur(2px);
                backdrop-filter: grayscale(0%) blur(2px);
      }

      .title {
        z-index: 20;
        font-size: 4vw;
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

      .main {
        width: 80vw;
        height: 97vh;

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

      .ships {
        height: 95px;
        width: 15vw;
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

      .icon-container {
        height: 70px;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: center;
            -ms-flex-pack: center;
                justify-content: center;
        -webkit-box-align: center;
            -ms-flex-align: center;
                align-items: center;

        border: 3px outset rgba(248,204,27,.5);
        border-radius: 10px;

        -webkit-box-shadow: 0px 0px 0px 0px #fff,
                    inset 0px 0px 0px 0px #fff;

                box-shadow: 0px 0px 0px 0px #fff,
                    inset 0px 0px 0px 0px #fff;
        
      }

      /* requests */
      .requests-container {
        width: 55vw;
        height: 55vh;
        margin-bottom: 15px;

        border-radius: 10px;
        overflow: hidden;
        -webkit-box-shadow: 0px 2px 5px 2px #bb8c0282;
                box-shadow: 0px 2px 5px 2px #bb8c0282;
        -webkit-backdrop-filter: blur(2px) invert(.1);
                backdrop-filter: blur(2px) invert(.1);

      }

      .reqTable {
        width: 55vw;
        height: 55vh;
      }

      .reqTable > table {
        width: 55vw;
        height: 55vh;
      }

      .reqTable > table > thead > tr > th {
        -webkit-box-shadow: 0px 0px 0px 1px #edcc6a,
            inset 0px 0px 30px 2px #edcc6a;
                box-shadow: 0px 0px 0px 1px #edcc6a,
            inset 0px 0px 30px 2px #edcc6a;
        border-radius: 2px;
      }

      .reqTable > table > tbody > tr:nth-child(even) {
        -webkit-box-shadow: 0px 0px 0px 1px #f2dda3,
                    inset 0px 0px 50px 2px #f2dda3;
                box-shadow: 0px 0px 0px 1px #f2dda3,
                    inset 0px 0px 50px 2px #f2dda3;
      }
      .reqTable > table > tbody > tr:nth-child(odd) {
        -webkit-box-shadow: 0px 0px 0px 1px #a58e4b,
            inset 0px 0px 50px 5px #a58e4b;
                box-shadow: 0px 0px 0px 1px #a58e4b,
            inset 0px 0px 50px 5px #a58e4b;
      }

      .buttons {
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
    }
    '''
  --
--