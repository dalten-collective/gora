::
::  offers - gorae you've been offered
::
/-  *gora
/+  rudder, *mip
::
^-  (page:rudder tack manage-gora-2)
|_  [bol=bowl:gall odo=order:rudder sat=tack]
++  final  (alert:rudder 'plead' build)
::
++  argue
  |=  [headers=header-list:http body=(unit octs)]
  ^-  $@(brief:rudder manage-gora-2)
  ?>  authenticated.odo
  =/  args=(map @t @t)
    ?~(body ~ (frisk:rudder q.u.body))
  ?.  ?&  (~(has by args) 'gor')
          (~(has by args) 'hos')
          (~(has by args) 'act')
      ==
    'アクションの不許可'
  ?.  ?=(%send-plea (~(got by args) 'act'))
    (cat 3 'アクションの不許可: ' (~(got by args) 'act'))
  'REPLACE ME'
::
++  build
  |=  $:  args=(list [k=@t v=@t])
          msgs=(unit [gud=? txt=@])
      ==
  ^-  reply:rudder
  |^  [%page page]
  ++  page
    ^-  manx
    ;html
      ;head
        ;title:"%gora -"
        :: ;style:"{(trip style)}"
        ;meta(charset "utf-8");
        ;meta
          =name     "viewport"
          =content  "width=device-width, initial-scale=1";
      ==
    ::
      ;body
        ;p:"stand-in"
      ==
    ==
  --
--