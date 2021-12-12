::  gora Structures - ~dalten Collective
::
/-  *docket
::
/+  *pal
::
|%

::
:: Block List:
::
+$  blacklist  (set gora-id)
::
:: Manage Your Goras:
::
+$  manage-gora-1
  $%  [%set-max-hodl =gora-id max=@ud]
      [%pubmod-host =gora-id public=?]
      [%pubmod-hodl =gora-id public=?]
      [%add-tag =tag gorae=(set gora-id)]
      [%del-tag =tag gorae=(set gora-id)]
      ::
      [%reject-give =gora-id]
      [%approve-give =gora-id]
      [%send-give =gora-id new=(set ship)]
      ::
      [%send-request =gora-id =ship]
      [%reject-request =gora-id =ship]
      [%approve-request =gora-id =ship]
      ::
      [%send-reissue =gora-id new=(set ship)]
      [%send-transfer =gora-id new=(set ship)]
      ::
      [%delgora =gora-id]
      :: change these names to be more lined up
      $:  %mkgora
          name=@t
          =gora-img
          public=?
          max=(unit @ud)
          req=?(%approve %reject %none)
          giv=?(%transfer %reissue %none)
      ==
      ::
      [%clean-log =log]
      [%usps-mode mode=?]
      [%resubscribe-all ~]
  ==
::
:: Manage Interstellar Activity
::
+$  transact-1
  $%  [%giv-ack =gora-id]
      [%receive-transfer =gora]
      [%receive-request =gora-id]
      [%receive-gora =gora-id giv=?(%transfer %reissue %none)]
      [%proxy-approve =gora-id =ship]
      [%update act=?(%upd %del) jot=(unit update)]
  ==
::
:: Update Types
::
+$  update
  $%  [%update-image ~]
      [%host-public pub=?]
      [%new-hodlr =ship]
      [%initialize =gora]
      [%reissue id=gora-id new=(set ship)]
  ==


:: Used Types:
::
:: Log Names
::
+$  log
  $%  [%offer-log =gora-id]
      [%blacklist =gora-id]
      [%request-log =ship =gora-id]
  ==
::
:: Defining Gora
::
+$  gora-id      @uv
+$  gora-img     cord
+$  hodl-list    (set ship)
+$  my-public    (set gora-id)
+$  pita         (map gora-id gora)
+$  issue-date   [y=@ud m=@ud d=@ud]
::
:: State 1 Format
::
+$  gora
  $:  =gora-id
      name=@t
      =gora-img
      host=ship
      =issue-date
      =hodl-list
      host-public=?
      max-hodl=(unit @ud)
      request-behavior=?(%approve %reject %none)
      give-permissions=?(%transfer %reissue %none)
  ==
::
:: Controlling Issuance
::
+$  offer-log    (set gora-id)
+$  request-log  (jug ship gora-id)
+$  sent-log     (jug gora-id [ship ?(%ask %giv)])
+$  usps-mode    ?
::
:: Tagging Functionality
::
+$  tag        @tas
+$  tag-set    (set tag)
+$  tag-store  (jug tag gora-id)
::
:: Outstanding Transactions
::
+$  gib
  ?(%send-ask %send-giv %give-ack %chain-it %proxy-it)
+$  pend  (mip gora-id (map [ship gib] [wen=@da dun=?]))
::
:: Last-Version Structures/Marks
::
++  zero
  |%
  ::+$  manage-gora
  ::  $%  [%clean-log =log]
  ::      [%delgora =gora-id]
  ::      [%reject-give =gora-id]
  ::      [%approve-give =gora-id]
  ::      [%mkgora name=@t =gora-img]
  ::      [%send-give =gora-id =ship]
  ::      [%send-request =gora-id =ship]
  ::      [%reject-request =gora-id =ship]
  ::      [%approve-request =gora-id =ship]
  ::  ==
  ::
  +$  transact
    $%  [%giv-ack =gora-id]
        [%receive-gora =gora]
        [%receive-request =gora-id]
        [%proxy-approve =gora-id =ship]
        [%update act=?(%upd %del) =gora]
    ==
  :: State 0 Format - applied in agent separately
  +$  gora  
    $:  =gora-id     name=@t
        =gora-img    host=ship
        =issue-date  =hodl-list
    ==
  --
:: Related to Sail
::
+$  webpage
  $_  ^|
  |_  [bowl:gall usps-mode pita my-public request-log offer-log blacklist tag-set tag-store pend]
  ++  build  |~([@tas (list [k=@t v=@t])] *manx)
  --
--