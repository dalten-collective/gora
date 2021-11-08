::  gora Structures - ~dalten Collective
::
/-  *docket
|%
::
:: Block List:
::
+$  blacklist  (set gora-id)
::
:: Manage Your Goras:
::
+$  manage-gora
  $%  [%delgora =gora-id]
      [%reject-give =gora-id]
      [%approve-give =gora-id]
      [%mkgora name=@t =gora-img]
      [%send-give =gora-id =ship]
      [%send-request =gora-id =ship]
      [%reject-request =gora-id =ship]
      [%approve-request =gora-id =ship]
  ==
::
:: Manage Interstellar Activity
::
+$  transact
  $%  [%giv-ack =gora-id]
      [%receive-gora =gora]
      [%receive-request =gora-id]
      [%proxy-approve =gora-id =ship]
      [%update act=?(%upd %del) =gora]
  ==
::
:: Used Types:
:: Defining Gora
+$  gora-id      @uv
+$  gora-img     cord
+$  hodl-list    (set ship)
+$  pita         (map gora-id gora)
+$  issue-date   [y=@ud m=@ud d=@ud]
+$  gora         $:  =gora-id   name=@t      =gora-img
                     host=ship  =issue-date  =hodl-list
                 ==
::
:: Controlling Issuance
+$  request-log  (jug ship gora-id)
+$  offer-log    (set gora-id)
+$  sent-log     (jug gora-id [ship ?(%ask %giv)])
::
::
+$  webpage
  $_  ^|
  |_  [bowl:gall pita request-log offer-log sent-log blacklist]
  ++  build  |~([@tas (list [k=@t v=@t])] *manx)
  --
--