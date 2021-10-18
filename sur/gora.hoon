::  gora Structures - ~dalten Collective
::
::  Nice to Haves
::  - "open for requests" and "public" (as in visible to others)
::  - Store dates of acquisition w/o making logic worse when changing things
::  - Allow for delete of Holder from list
::  - Create Sent Request list, Sent Gift List to further secure endpoints
::  - Split all of this to a push pull store model
:: 
::  Technical Debt
::    - Create unique hash from imgfile-data + host-@p + name of gora + date of creation
::        This needs to be displayed on the ownership page too to show that even identical img have diff hash
::    - Figure out secret that is private to host that can be used by requester to auto-receive
::    - ?Use Globulator tie-in to allow for each user of gora to host globs of their gora images
::
/-  *docket
|%
::
:: Block List:
::
+$  blacklist  (set ship)
::
:: Used Pokes:
:: Manage Your Goras
::
+$  manage-gora
      :: e.g. :gora &gora-man [%mkgora 'name' '/test/path/to/img']
  $%  [%mkgora name=@t =gora-img]
      [%delgora =gora-id]
      [%send-give =gora-id =ship]
      :: :gora &gora-man [%send-request 1.701.667.182 ~dev]
      [%send-request =gora-id =ship]
      :: :gora &gora-man [%approve-give 1.701.667.182]
      [%approve-give =gora-id]
      [%approve-request =gora-id =ship]
  ==
::
:: Manage Inter-cosmic Activity
::
+$  transact
  $%  [%receive-request =gora-id]
      [%receive-gora =gora]
      [%update act=?(%upd %del) =gora]
      [%giv-ack =gora-id]
  ==
::
:: Used Types:
:: Defining Gora
+$  pita       (map gora-id gora)
+$  gora       [=gora-id name=@t =gora-img host=ship =issue-date =hodl-list]
+$  gora-id    @uv
+$  gora-img   cord
+$  issue-date  [y=@ud m=@ud d=@ud]
+$  hodl-list  (set ship)
::
:: Controlling Issuance
+$  request-log  (jug ship gora-id)
+$  offer-log    (set gora-id)
+$  sent-log     (jug gora-id [ship ?(%ask %giv)])
--