::  gora Structures - ~dalten Collective
::
/-  *docket
::
|%
:: defining gora
::
+$  id    @uv
+$  pic   cord
+$  max   (unit @ud)
+$  name  cord
+$  host  ship
+$  hodl  (set ship)
+$  stak  (map ship @ud)
+$  made  [y=@ud m=@ud d=@ud]
::
+$  gora
  $%  [%g =id =name =pic =host =made =hodl =max]
      [%s =id =name =pic =host =made =stak]
  ==



:: old state actions, objects
::
  :: clean-log actions
  ::
  +$  log
  $%  [%offer-log =id]
      [%blacklist =id]
      [%request-log =ship =id]
  ==
++  one
  |%
  :: user actions
  ::
  +$  manage-gora-1
    $%  [%set-max-hodl =id max=@ud]
        [%pubmod-host =id public=?]
        [%pubmod-hodl =id public=?]
        [%add-tag tag=@tas gorae=(set id)]
        [%del-tag tag=@tas gorae=(set id)]
        ::
        [%reject-give =id]
        [%approve-give =id]
        [%send-give =id new=(set ship)]
        ::
        [%send-request =id =ship]
        [%reject-request =id =ship]
        [%approve-request =id =ship]
        ::
        [%send-reissue =id new=(set ship)]
        [%send-transfer =id new=(set ship)]
        ::
        [%delgora =id]
        :: change these names to be more lined up
        $:  %mkgora
            name=@t
            =pic
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
  :: ship actions
  ::
  +$  transact-1
    $%  [%giv-ack =id]
        [%receive-transfer =gora]
        [%receive-request =id]
        [%receive-gora =id giv=?(%transfer %reissue %none)]
        [%proxy-approve =id =ship]
        [%update act=?(%upd %del) jot=(unit update)]
    ==
  ::
  +$  update
    $%  [%update-image ~]
        [%host-public pub=?]
        [%new-hodlr =ship]
        [%initialize =gora]
        [%reissue =id new=(set ship)]
    ==
  +$  gora
    $:  =id
        =name
        =pic
        =host
        =made
        =hodl
        host-public=?
        =max
        request-behavior=?(%approve %reject %none)
        give-permissions=?(%transfer %reissue %none)
    ==
  --
++  zero
  |%
  +$  manage-gora
   $%  [%clean-log =log]
       [%delgora =id]
       [%reject-give =id]
       [%approve-give =id]
       [%mkgora name=@t =pic]
       [%send-give =id =ship]
       [%send-request =id =ship]
       [%reject-request =id =ship]
       [%approve-request =id =ship]
   ==
  ::
  +$  transact
    $%  [%giv-ack =id]
        [%receive-gora =gora]
        [%receive-request =id]
        [%proxy-approve =id =ship]
        [%update act=?(%upd %del) =gora]
    ==
  :: state 0 format - applied in agent separately
  +$  gora
    $:  =id    =name
        =pic   =host
        =made  =hodl
    ==
  --
:: Related to Sail
::
:: +$  webpage
::   $_  ^|
::   |_  [bowl:gall usps-mode pita my-public request-log offer-log blacklist tag-set tag-store pend]
::   ++  build  |~([@tas (list [k=@t v=@t])] *manx)
::   --
--