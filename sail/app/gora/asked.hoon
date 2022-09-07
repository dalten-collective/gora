::
::  asked - gorae requested of you
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
  =/  sip=(unit @p)
    ?~  who=(~(get by (malt args)) 'who')  ~
    [~ (slav %p u.who)]
  ^-  reply:rudder
  |^  [%page page]
  ++  make
    |%
    ++  pick
      ^-  manx
      ;div(class "container")
        ;div(class "head")
          ;div(class "title")
            ;p:"最も謙虚な兄弟の嘆願"
          ==
        ==
      ::
        ;div(class "main");
      ==
    ++  take
      ^-  manx
      ;div(class "container")
        ;p:"take"
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
        ;+  ?~  sip
              pick:make
            take:make
      ==
    ==
  ++  style
    '''
    * {
      font-family: monospace;
    }

    /* page container */
    .container {
      width: 97vw;
      height: 98vh;

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

    .head {
      width: 100%;
      height: 20%;
      background-color: red;

      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
    }

    .title {
      width: 70%;
      height: 70%;
      background-color: white;
    }

    .main {
      width: 100%;
      height: 80%;
      background-color: olive;
    }
    '''
  --
--