/-  *qr

:: QR code generator for urbit. Fully written in hoon.
:: See the README for more information.
:: Every step, including Reed-Solomon encoding, is outlined 
:: in this link: https://www.thonky.com/qr-code-tutorial/
|%
++  qr
  |%
  ++  main 
    :: Generate a QR code from a string of text.
    :: Produces a list of lists of 0s and 1s.
    |=  [in=tape =lvl]
    =/  version=@ud                (determine-version in lvl)
    =/  data                       (data-stream:qr in lvl) 
    =/  matrix=(list (list @ud))   (run:matrix-placement lvl version data)
    (convert-svg matrix)
  ++  data-stream
    :: Generate the data stream for a QR code,
    :: including the mode indicator, character count indicator,
    :: the actual data, error correction codewords, and padding.
    |=  [in=tape =lvl]
    ^-  (list @ub)
    =/  res                     (encode-msg in lvl)      
    =/  msg                     -:res
    =/  version                 +:res
    (structure-result msg lvl version)
  ++  structure-result
    :: Interleaves the QR code according to the rules of the QR code standard.
    :: Adds padding and error correction codewords.
    |=  [in=(list @ub) =lvl version=@ud]
    ^-  (list @ub)
    =/  subdivided              (subdivide in (dimensions version lvl))
    =/  ec                      (ec-codewords-per-block version lvl)
    =/  ecs                     (error-correction-words subdivided ec)
    =/  interleaved             (interleave subdivided ecs ec)
    =/  interleaved-padding     (interleaved-padding version)
    (weld interleaved interleaved-padding)
  ++  encode-msg
    :: Encodes the message into a list of bits.
    |=  [in=tape =lvl]
    =/  version=@ud             (determine-version in lvl)
    =/  char-count-indicator    (char-count-indicator in version)
    =/  final-len               (bit-len version lvl)
    =/  encoded                 (encode in)
    =/  content                 ;:(weld mode-indicator char-count-indicator encoded)
    =/  terminator              (terminator content final-len)
    =.  content                 (weld content terminator)
    =/  extra-bytes             (extra-bytes (lent content) final-len)
    =/  content                 (weld content extra-bytes)
    =/  remaining-len           (sub final-len (lent content))
    =/  final-padding           (final-padding remaining-len)
    =/  msg                     (weld content final-padding)
    [msg version]
  ++  mode-indicator  ~[0b0 0b1 0b0 0b0]
    :: The mode indicator for byte mode. 
    :: Numeric, Alphanumeric and Kanji mode are not supported.
  ++  char-count-indicator
    :: The character count indicator for a given version and message length.
    |=  [in=tape version=@ud]
    ^-  (list @ub)
    =/  bin-len=@ub  `@ub`(lent in)
    :: Indicator must have different lengths depending on 
    :: the version we're using.
    =/  result-len=@ud  
    ?:  (lte version 9)
      8
    16
    =/  len=(list @ub)        (rip 0 bin-len)
    =/  padding-amount=@ud    (sub result-len (lent len))
    =/  padded=(list @ub)     (weld len (reap padding-amount 0b0))
    :: Reverse order
    (flop padded)
  ++  encode
    :: Converts each char to its ASCII value.
    :: Produces a list of bits.
    |=  in=tape
    =<
    ^-  (list @ub)
    (zing (turn in char-to-byte))
    |%
    ++  char-to-byte 
      |=  char=@tD
      ^-  (list @ub)
      =/  bin-list          (flop (rip 0 `@ub`char))
      =/  padding-amount    (sub 8 (lent bin-list))
      (weld (reap padding-amount 0b0) bin-list)
    --
  ++  determine-version
    :: Determines the smallest version with which the input can be encoded. 
    :: Version 1: 21 * 21 pixels
    :: Version 2: 25 * 25 pixels
    :: ... 
    :: Version 40: 177 * 177 pixels
    :: That means with each version, we increment width and height by 4 pixels.
    :: I WISH there was a solid mathematical way to determine these without hardcoding, 
    :: but knowing the version requires how many bits are needed 
    :: which requires knowing the version...
    :: So we just hardcode it.
    |=  [in=tape =lvl]
    ^-  @ud
    =|  idx=@ud  
    =/  capacities=(list @ud)
    ?-  lvl
      %l
        ~[17 32 53 78 106 134 154 192 230 271 321 367 425 458 520 586 644 718 792 858 929 1.003 1.091 1.171 1.273 1.367 1.465 1.528 1.628 1.732 1.840 1.952 2.068 2.188 2.303 2.431 2.563 2.699 2.809 2.953]
      %m
        ~[14 26 42 62 84 106 122 152 180 213 251 287 331 362 412 450 504 560 624 666 711 779 857 911 997 1.059 1.125 1.190 1.264 1.370 1.452 1.538 1.628 1.722 1.809 1.911 1.989 2.099 2.213 2.331]
      %q
        ~[11 20 32 46 60 74 86 108 130 151 177 203 241 258 292 322 364 394 442 482 509 565 611 661 715 751 805 868 908 982 1.030 1.112 1.168 1.228 1.283 1.351 1.423 1.499 1.579 1.663]
      %h
        ~[7 14 24 34 44 58 64 84 98 119 137 155 177 194 220 250 280 310 338 382 403 439 461 511 535 593 625 658 698 742 790 842 898 958 983 1.051 1.093 1.139 1.219 1.273]
    ==
    |-  
    ?:  (lte (lent in) (snag idx capacities))
      ?.  (lth idx (lent capacities))
        ~&  "Input tape is too long!"
        !!
      (add idx 1)
    $(idx (add idx 1))
  ++  len-table 
    :: The maximum number of characters that can be encoded in a QR code
    :: for a given version and error correction level.
    :: The version is the index of the list -1.
    |=  lvl=lvl
    ?-  lvl
      %l
      ~[19 34 55 80 108 136 156 194 232 274 324 370 428 461 523 589 647 721 795 861 932 1.006 1.094 1.174 1.276 1.370 1.468 1.531 1.631 1.735 1.843 1.955 2.071 2.191 2.306 2.434 2.566 2.702 2.812 2.956]
      %m
      ~[16 28 44 64 86 108 124 154 182 216 254 290 334 365 415 453 507 563 627 669 714 782 860 914 1.000 1.062 1.128 1.193 1.267 1.373 1.455 1.541 1.631 1.725 1.812 1.914 1.992 2.102 2.216 2.334]
      %q
      ~[13 22 34 48 62 76 88 110 132 154 180 206 244 261 295 325 367 397 445 485 512 568 614 664 718 754 808 871 911 985 1.033 1.115 1.171 1.231 1.286 1.354 1.426 1.502 1.582 1.666]
      %h
      ~[9 16 26 36 46 60 66 86 100 122 140 158 180 197 223 253 283 313 341 385 406 442 464 514 538 596 628 661 701 745 793 845 901 961 986 1.054 1.096 1.142 1.222 1.276]
    ==
  ++  ec-codewords-per-block
    :: The number of error correction codewords per block for a given version and error correction level.
    |=  [version=@ud =lvl]
    =/  table=(list @ud)  
      ?-  lvl
        %l 
        [7 10 15 20 26 18 20 24 30 18 20 24 26 30 22 24 28 30 28 28 28 28 30 30 26 28 30 30 30 30 30 30 30 30 30 30 30 30 30 30 ~]
        %m
        [10 16 26 18 24 16 18 22 22 26 30 22 22 24 24 28 28 26 26 26 26 28 28 28 28 28 28 28 28 28 28 28 28 28 28 28 28 28 28 28 ~]
        %q
        [13 22 18 26 18 24 18 22 20 24 28 26 24 20 30 24 28 28 26 30 28 30 30 30 30 28 30 30 30 30 30 30 30 30 30 30 30 30 30 30 ~]
        %h
        [17 28 22 16 22 28 26 26 24 28 24 28 22 24 24 30 28 28 26 28 30 24 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 ~]
      ==
    (snag (sub version 1) table)
  ++  dimensions
    :: Lookup table for the dimensions of a QR code for a given version
    :: in the form 
    :: [[blks per grp 1, wrds per blk in grp 1], [blks per grp 2, wrds per blk in grp 2]
    :: The version is the index of the list -1.
    |=  [version=@ud lvl=lvl]
    ^-  (list (list @ud))
    =/  table=(list (list (list @ud)))
      ?-  lvl
      %l
      [[[1 19 ~] ~] [[1 34 ~] ~] [[1 55 ~] ~] [[1 80 ~] ~] [[1 108 ~] ~] [[2 68 ~] ~] [[2 78 ~] ~] [[2 97 ~] ~] [[2 116 ~] ~] [[2 68 ~] [2 69 ~] ~] [[4 81 ~] ~] [[2 92 ~] [2 93 ~] ~] [[4 107 ~] ~] [[3 115 ~] [1 116 ~] ~] [[5 87 ~] [1 88 ~] ~] [[5 98 ~] [1 99 ~] ~] [[1 107 ~] [5 108 ~] ~] [[5 120 ~] [1 121 ~] ~] [[3 113 ~] [4 114 ~] ~] [[3 107 ~] [5 108 ~] ~] [[4 116 ~] [4 117 ~] ~] [[2 111 ~] [7 112 ~] ~] [[4 121 ~] [5 122 ~] ~] [[6 117 ~] [4 118 ~] ~] [[8 106 ~] [4 107 ~] ~] [[10 114 ~] [2 115 ~] ~] [[8 122 ~] [4 123 ~] ~] [[3 117 ~] [10 118 ~] ~] [[7 116 ~] [7 117 ~] ~] [[5 115 ~] [10 116 ~] ~] [[13 115 ~] [3 116 ~] ~] [[17 115 ~] ~] [[17 115 ~] [1 116 ~] ~] [[13 115 ~] [6 116 ~] ~] [[12 121 ~] [7 122 ~] ~] [[6 121 ~] [14 122 ~] ~] [[17 122 ~] [4 123 ~] ~] [[4 122 ~] [18 123 ~] ~] [[20 117 ~] [4 118 ~] ~] [[19 118 ~] [6 119 ~] ~] ~]
      %m
      [[[1 16 ~] ~] [[1 28 ~] ~] [[1 44 ~] ~] [[2 32 ~] ~] [[2 43 ~] ~] [[4 27 ~] ~] [[4 31 ~] ~] [[2 38 ~] [2 39 ~] ~] [[3 36 ~] [2 37 ~] ~] [[4 43 ~] [1 44 ~] ~] [[1 50 ~] [4 51 ~] ~] [[6 36 ~] [2 37 ~] ~] [[8 37 ~] [1 38 ~] ~] [[4 40 ~] [5 41 ~] ~] [[5 41 ~] [5 42 ~] ~] [[7 45 ~] [3 46 ~] ~] [[10 46 ~] [1 47 ~] ~] [[9 43 ~] [4 44 ~] ~] [[3 44 ~] [11 45 ~] ~] [[3 41 ~] [13 42 ~] ~] [[17 42 ~] ~] [[17 46 ~] ~] [[4 47 ~] [14 48 ~] ~] [[6 45 ~] [14 46 ~] ~] [[8 47 ~] [13 48 ~] ~] [[19 46 ~] [4 47 ~] ~] [[22 45 ~] [3 46 ~] ~] [[3 45 ~] [23 46 ~] ~] [[21 45 ~] [7 46 ~] ~] [[19 47 ~] [10 48 ~] ~] [[2 46 ~] [29 47 ~] ~] [[10 46 ~] [23 47 ~] ~] [[14 46 ~] [21 47 ~] ~] [[14 46 ~] [23 47 ~] ~] [[12 47 ~] [26 48 ~] ~] [[6 47 ~] [34 48 ~] ~] [[29 46 ~] [14 47 ~] ~] [[13 46 ~] [32 47 ~] ~] [[40 47 ~] [7 48 ~] ~] [[18 47 ~] [31 48 ~] ~] ~]
      %q
      [[[1 13 ~] ~] [[1 22 ~] ~] [[2 17 ~] ~] [[2 24 ~] ~] [[2 15 ~] [2 16 ~] ~] [[4 19 ~] ~] [[2 14 ~] [4 15 ~] ~] [[4 18 ~] [2 19 ~] ~] [[4 16 ~] [4 17 ~] ~] [[6 19 ~] [2 20 ~] ~] [[4 22 ~] [4 23 ~] ~] [[4 20 ~] [6 21 ~] ~] [[8 20 ~] [4 21 ~] ~] [[11 16 ~] [5 17 ~] ~] [[5 24 ~] [7 25 ~] ~] [[15 19 ~] [2 20 ~] ~] [[1 22 ~] [15 23 ~] ~] [[17 22 ~] [1 23 ~] ~] [[17 21 ~] [4 22 ~] ~] [[15 24 ~] [5 25 ~] ~] [[17 22 ~] [6 23 ~] ~] [[7 24 ~] [16 25 ~] ~] [[11 24 ~] [14 25 ~] ~] [[11 24 ~] [16 25 ~] ~] [[7 24 ~] [22 25 ~] ~] [[28 22 ~] [6 23 ~] ~] [[8 23 ~] [26 24 ~] ~] [[4 24 ~] [31 25 ~] ~] [[1 23 ~] [37 24 ~] ~] [[15 24 ~] [25 25 ~] ~] [[42 24 ~] [1 25 ~] ~] [[10 24 ~] [35 25 ~] ~] [[29 24 ~] [19 25 ~] ~] [[44 24 ~] [7 25 ~] ~] [[39 24 ~] [14 25 ~] ~] [[46 24 ~] [10 25 ~] ~] [[49 24 ~] [10 25 ~] ~] [[48 24 ~] [14 25 ~] ~] [[43 24 ~] [22 25 ~] ~] [[34 24 ~] [34 25 ~] ~] ~]
      %h
      [[[1 9 ~] ~] [[1 16 ~] ~] [[2 13 ~] ~] [[4 9 ~] ~] [[2 11 ~] [2 12 ~] ~] [[4 15 ~] ~] [[4 13 ~] [1 14 ~] ~] [[4 14 ~] [2 15 ~] ~] [[4 12 ~] [4 13 ~] ~] [[6 15 ~] [2 16 ~] ~] [[3 12 ~] [8 13 ~] ~] [[7 14 ~] [4 15 ~] ~] [[12 11 ~] [4 12 ~] ~] [[11 12 ~] [5 13 ~] ~] [[11 12 ~] [7 13 ~] ~] [[3 15 ~] [13 16 ~] ~] [[2 14 ~] [17 15 ~] ~] [[2 14 ~] [19 15 ~] ~] [[9 13 ~] [16 14 ~] ~] [[15 15 ~] [10 16 ~] ~] [[19 16 ~] [6 17 ~] ~] [[34 13 ~] ~] [[16 15 ~] [14 16 ~] ~] [[30 16 ~] [2 17 ~] ~] [[22 15 ~] [13 16 ~] ~] [[33 16 ~] [4 17 ~] ~] [[12 15 ~] [28 16 ~] ~] [[11 15 ~] [31 16 ~] ~] [[19 15 ~] [26 16 ~] ~] [[23 15 ~] [25 16 ~] ~] [[23 15 ~] [28 16 ~] ~] [[19 15 ~] [35 16 ~] ~] [[11 15 ~] [46 16 ~] ~] [[59 16 ~] [1 17 ~] ~] [[22 15 ~] [41 16 ~] ~] [[2 15 ~] [64 16 ~] ~] [[24 15 ~] [46 16 ~] ~] [[42 15 ~] [32 16 ~] ~] [[10 15 ~] [67 16 ~] ~] ~]
      ==
    (snag (sub version 1) table)
  ++  bit-len
    :: Determines how long the bit string will end up being 
    :: based on the QR version and error correction
    |=  [version=@ud lvl=lvl]
    ^-  @ud
    (mul 8 (snag (sub version 1) `(list @ud)`(len-table lvl)))
  ++  terminator
    :: Generates the terminator bit string
    :: has a maximum length of 4 bits
    |=  [data=(list @ub) final-len=@ud]
    ^-  (list @ub)
    =/  remaining-len  (sub final-len (lent data))
    ?:  (gte remaining-len 4)
      (reap 4 0b0)
    (reap remaining-len 0b0)
  ++  extra-bytes
    :: Generates `len` bytes of 0b0
    :: Used for padding messages
    |=  [len=@ud final-len=@ud]
    ^-  (list @ub)
    =/  amnt
      ?:  =(0 (mod len 8))
        0
      %+  min
        (sub 8 (mod len 8))
      (sub final-len len)
    (reap amnt 0b0)
  ++  final-padding 
    :: Alternatively pad the message with 0b11101100
    :: and 0b00010001 until the message is a multiple of 8 bits
    :: If it doesn't end up being a multiple of 8 bits, pad with 0b0s
    :: until it is.
    |=  remaining-len=@ud
    ^-  (list @ub)
    =/  remaining-words=@ud  (div remaining-len 8)
    =|  idx=@ud
    =|  res=(list @ub)
    |-  
    ?:  =(remaining-words 0)
      res
    %=  $
      remaining-words   (sub remaining-words 1)
      res               (weld res (pad-word idx))
      idx               (add idx 1)
    ==
  ++  pad-word
    :: Returns a word padded with 0b11101100 or 0b00010001
    :: depending on the index.
    |=  idx=@ud
    ^-  (list @ub)
    ?:  =((mod idx 2) 0)
      [0b1 0b1 0b1 0b0 0b1 0b1 0b0 0b0 ~]
    [0b0 0b0 0b0 0b1 0b0 0b0 0b0 0b1 ~]
  ++  subdivide
    :: Subdivides the msg according to dim. See ++  dimensions
    :: for more info. Produces a structure of groups containing 
    :: blocks, that in turn contain words, which are a byte.
    |=  [msg=(list @ub) dim=(list (list @ud))]
    ^-  (list (list (list (list @ub))))
    =/  bytes=(list (list @ub))   (bits-to-bytes:helper msg)
    =|  idx=@ud
    =|  grp-idx=@ud
    =|  res=(list (list (list (list @ub))))
    |-  
    ?.  =(grp-idx (lent dim))
      =/  grp-info          (snag grp-idx dim)
      =/  num-blks=@ud      (snag 0 grp-info)
      =/  num-wrds=@ud      (snag 1 grp-info)
      =|  blk-idx=@ud
      =|  grp=(list (list (list @ub)))
      |- 
      ?.  =(blk-idx num-blks)
        =|  blk=(list (list @ub))
        =|  wrd-idx=@ud
        |- 
        ?.  =(wrd-idx num-wrds)
          %=  $
            idx         (add idx 1)
            wrd-idx     (add wrd-idx 1)
            blk         (snoc blk (snag idx bytes))
          ==
        %=  ^$
          blk-idx       (add blk-idx 1)
          grp           (snoc grp blk)
        ==
      %=  ^$
        grp-idx           (add grp-idx 1)
        res               (snoc res grp)
      ==
    res
  ++  error-correction-words
    :: Generates the error correction words for each 
    :: block in each group. 
    |=  [in=(list (list (list (list @ub)))) ec=@ud]
    ^-  (list (list (list @ub)))
    =/  gf256  galois-field-256:gf
    =/  c
      |=  blk=(list (list @ub))
      (error-correction-word (zing blk) ec gf256)
    =/  b
      |=  grp=(list (list (list @ub)))
      (turn grp c)
    (zing (turn in b))
  ++  error-correction-word
    :: Generates the error correction word for a given word. 
    :: This is done by doing polynomial division of
    :: the message polynomial by the generator polynomial
    :: in GF(256). The remainder is the error correction word.
    |=  [in=(list @ub) ec=@ud gf256=(list @ud)]
    ^-  (list (list @ub))
    =/  msg             (message-poly:gf in gf256)
    =/  gen             (generator-poly:gf ec gf256)
    =/  res             (poly-long-div:gf msg gen ec gf256)  
    (flop res)
  ++  interleave
    :: Interleaves the error correction words with the data words
    |=  [data=(list (list (list (list @ub)))) ecw=(list (list (list @ub))) ec=@ud]
    ^-  (list @ub)
    =/  max-blk-size  (max-block-size data)
    =/  dat           (interleave-data data max-blk-size)
    =/  err           (interleave-error-codewords ecw ec)
    (weld dat err)
  ++  max-block-size
    :: Returns the maximum number of words in a block
    :: across all blocks in all groups.
    |=  data=(list (list (list (list @ub)))) 
    ^-  @ud
    =/  b
      |=  blk=(list (list @ub))
      ^-  @ud
      (lent blk)
    =/  a
      |=  grp=(list (list (list @ub)))
      ^-  (list @ud)
      (turn grp b)
    =/  flattened=(list @ud)  (zing (turn data a))
    (reel flattened max)
  ++  interleave-data
    :: Interleaves the data words by taking one word from each block
    :: in each group and then taking the next word from each block, 
    :: etc. until all words have been interleaved.
    |=  [data=(list (list (list (list @ub)))) max-blk-size=@ud]
    ^-  (list @ub)
    =|  res=(list @ub)
    =|  idx=@ud
    =|  cntr=@ud
    |- 
    ?.  =(idx max-blk-size)
      =|  grp-idx=@ud
      |- 
      ?.  =(grp-idx (lent data))
        =/  grp         (snag grp-idx data)
        =/  grp-len     (lent grp)
        =|  blk-idx=@ud
        |-
        ?.  =(blk-idx grp-len)
          =/  blk         (snag blk-idx grp)
          =/  blk-len     (lent blk)
          =|  suf=(list @ub)
          =?  suf  (lth idx blk-len)
            (snag idx blk)
          =.  cntr  (add cntr 1)
          %=  $
            res       (weld res suf)
            blk-idx   (add blk-idx 1)
          ==
        %=  ^$
          grp-idx     (add grp-idx 1)
        ==
      %=  ^$
        idx             (add idx 1)
      ==
    res
  ++  interleave-error-codewords
    :: Interleaves the error correction words by taking one word from each block
    :: in each group and then taking the next word from each block, etc.
    :: until all words have been interleaved.
    |=  [ecw=(list (list (list @ub))) ec=@ud]
    ^-  (list @ub)
    =|  idx=@ud
    =|  res=(list @ub)
    |- 
    ?.  =(idx ec)
      =|  blk-idx=@ud
      |-
      ?.  =(blk-idx (lent ecw))
        =/  blk   (snag blk-idx ecw)
        =/  wrd   (snag idx blk)
        %=  $
          res        (weld res wrd)
          blk-idx    (add blk-idx 1)
        ==
      %=  ^$
        idx       (add idx 1)  
      ==
    res
  ++  interleaved-padding
    :: Adds padding to the interleaved data and error correction words
    :: based on the version used. The padding is added to the end of the
    :: data and error correction words.
    |=  version=@ud
    ^-  (list @ub)
    =/  pad-amounts=(list @ud)  [0 7 7 7 7 7 0 0 0 0 0 0 0 3 3 3 3 3 3 3 4 4 4 4 4 4 4 3 3 3 3 3 3 3 0 0 0 0 0 0 ~]
    =/  i   (sub version 1)
    =/  pad-amount=@ud   (snag i pad-amounts)
    (reap pad-amount 0b0)
  --
++  gf
  :: Galois Field 256 Operations
  |%
  ++  poly-long-div
    :: Polynomial Long Division in GF(256). 
    :: `n`: numerator of the division
    :: `d`: denominator of the division
    :: `ec`: error correction codewords required for padding.
    |=  [n=(list @ud) d=(list @ud) ec=@ud gf256=(list @ud)]
    ^-  (list (list @ub))
    =/  ns            (rshift n ec)
    =/  ddiff         (sub (degree ns) (degree d))
    =/  ds            (rshift d ddiff)
    =/  tmp           ns
    =|  idx=@ud
    |- 
    ?:  (gte (degree tmp) (degree d))
      =/  new-ddiff   (sub (degree tmp) (degree d))
      =/  new-ds      (rshift d new-ddiff)
      =/  muled       (mul-poly-scalar new-ds (rear tmp) gf256)
      =/  xored       (snip (poly-xor muled tmp gf256))
      %=  $
        tmp           xored
        idx           (add idx 1)
      ==
    (ud-to-ub:helper (to-non-alpha tmp gf256))
  ++  to-non-alpha
    :: Converts the polynomial to non alpha form.
    |=  [p=(list @ud) gf256=(list @ud)]
    ^-  (list @ud)
    =|  idx=@ud
    =|  res=(list @ud)
    |- 
      ?:  =(idx (lent p))
        res
      %=  $
        res     (snoc res (log (snag idx p) gf256))
        idx     (add idx 1)
      ==
  ++  message-poly
    :: Generates the message polynomial from the encoded data,
    :: by slicing the stream of encoded data into bytes and converting
    :: them into decimal form. 
    :: The order is then reversed to match the polynomial order.
    |=  [in=(list @ub) gf256=(list @ud)]
    ^-  (list @ud)
    =|  idx=@ud
    =|  res=(list @ud)
    |-  
    ?:  =(idx (lent in))
      (flop res)
    =/  sub-list  `(list @ub)`(swag [idx 8] in)
    =/  val       `@ud`(rep 0 (flop sub-list))
    %=  $
      res       (snoc res (alog val gf256))
      idx       (add idx 8)
    ==
  ++  generator-poly
    :: Generates the generator polynomial for the given error correction
    :: codewords. 
    |=  [ec=@ud gf256=(list @ud)]
    =/  idx=@ud         1
    =/  res=(list @ud)  [0 0 ~]
    |-  
    ?:  =(idx ec)
      res
    %=  $
      res     (poly-mul res [idx 0 ~] gf256)
      idx     (add idx 1)
    ==
  ++  mul-poly-scalar
    :: Multiplies a polynomial by a scalar in GF(256).
    :: Produces the alpha form of the polynomial.
    |=  [p=(list @ud) s=@ud gf256=(list @ud)]
    ^-  (list @ud)
    =|  idx=@ud
    =|  res=(list @ud)
    |-
    ?:  =(idx (lent p))
      res
    %=  $
      res     (snoc res (alpha-mul (snag idx p) s))
      idx     (add idx 1)
    ==
  ++  poly-xor 
    :: XORs two polynomials in GF(256).
    :: Note: This is equivalent to polynomial addition and subtraction 
    :: in GF(256).
    :: Produces the alpha form of the polynomial.
    |=  [a=(list @ud) b=(list @ud) gf256=(list @ud)]
    ^-  (list @ud)
    =/  max-len         (max (lent a) (lent b))
    =/  a-pad-amnt      (sub max-len (lent a))
    =/  b-pad-amnt      (sub max-len (lent b))
    =/  padded-a        (rpad a a-pad-amnt 420)   
    =/  padded-b        (rpad b b-pad-amnt 420)   
    =|  res=(list @ud)
    =|  idx=@ud
    |-
    ?:  =(idx max-len)
      res
    =/  xored   (alpha-xor (snag idx padded-a) (snag idx padded-b) gf256)
    %=  $
      idx       (add idx 1)
      res       (snoc res xored)
    ==
  ++  poly-mul
    :: Multiplies two polynomials in GF(256).
    :: Produces the alpha form of the polynomial.
    |=  [p1=(list @ud) p2=(list @ud) gf256=(list @ud)]
    ^-  (list @ud)
    =/  p1-deg    (degree p1)
    =/  p2-deg    (degree p2)
    =/  res       (rpad [~] ;:(add p1-deg p2-deg 1) 420)
    =|  i=@ud
    =|  j=@ud
    |- 
    ?:  =(i (add p1-deg 1))
      res
    |-
    ?:  =(j (add p2-deg 1))
      %=  ^$
        i     (add i 1)
        j     0
      == 
    =/  idx   (add i j)
    =/  cur   (snag idx res)
    =/  val   (alpha-mul (snag i p1) (snag j p2))
    %=  $
      res     (snap res idx (alpha-xor cur val gf256))
      j       (add j 1)
    ==
  ++  alpha-mul
    :: When multiplying two exponents, such as a^251 * a^10
    :: inside of a a GF(256), we use
    :: ((251 + 10) % 256) + floor((251 + 10) / 256) = 6
    :: Produces the polynomial in alpha form.
    :: Note: 420 is used as a placeholder for 0 in the polynomial.
    |=  [exp1=@ud exp2=@ud]
    ^-  @ud
    ?:  |(=(exp1 420) =(exp2 420))
      420
    (mod (add exp1 exp2) 255)
  ++  alpha-xor
    :: When wanting to add something like 
    :: a^201*x^2 + a^199*x^2,
    :: we first need to convert a^exp by looking up
    :: the log value in gf(256). Finally, values should not be
    :: added together, but XORed.
    :: Produces the result in non-exponential form.
    :: Note: In GF(256), addition and subtraction are both xor.
    |=  [exp1=@ud exp2=@ud gf256=(list @ud)]
    ^-  @ud
    ?>  |((lth exp1 256) =(exp1 420))
    ?>  |((lth exp2 256) =(exp2 420))
    =/  log1  (log exp1 gf256)
    =/  log2  (log exp2 gf256)
    =/  res   (alog (mix log1 log2) gf256)
    res
  ++  degree
    :: Returns the degree of a polynomial `p`.
    |=  p=(list @ud)
    ^-  @ud
    =/  idx  (sub (lent p) 1)
    |-
    ?:  =((snag idx p) 420) 
      ?:  =(idx 0)
        0
      $(idx (sub idx 1))
    idx
  ++  rshift
    :: Multiplies a polynomial by x^a. 
    |=  [p=(list @ud) a=@ud]
    ^-  (list @ud)
    (weld (reap a 420) p)
  ++  rpad
    :: Right pads a list with a given value.
    |=  [p=(list @ud) a=@ud val=@ud]
    ^-  (list @ud)
    (weld p (reap a val))
  ++  log
    :: GF256 Log
    :: Produces the polynomial in non-alpha form.
    |=  [exp=@ud gf256=(list @ud)]
    ^-  @ud
    ?:  =(exp 420)
      0
    (snag exp gf256)
  ++  alog
    :: GF256 Antilog
    :: Produces the polynomial in alpha form.
    |=  [val=@ud gf256=(list @ud)]
    ^-  @ud
    ?:  =(val 0)
      420
    =|  idx=@ud
    |-  
    ?:  =((log idx gf256) val)
      idx
    $(idx (add idx 1))
  ++  galois-field-256
    :: Produces the Galois Field 256.
    :: This is a list of 256 elements, where each element is the
    :: log of the element in GF(256).
    =|  i=@ud 
    =|  res=(list @ud)
    |- 
    ?:  (lth i 256)
      =|  j=@ud
      =/  acc=@ud  1
      |-  
      ?:  (lth j i)
        =/  new  (mul acc 2)
        =?  new  (gte new 256)
          (mix 285 new)
        %=  $
          acc     new
          j       (add j 1)
        ==
      %=  ^$
        res   (snoc res acc)
        i     (add i 1)
      ==
    res
  --
++  matrix-placement
  :: Module used for generating the QR code matrix.
  |%
  ++  run
    :: Generates the QR code matrix.
    :: The outer list contains the rows of the matrix, 
    :: and the inner list contains the columns.
    :: This means that we access rows with (snag y matrix).
    |=  [=lvl version=@ud data=(list @ub)]
    ^-  (list (list @ud))
    =/  dim=@ud                 (add (mul (sub version 1) 4) 21)
    =/  res=(list (list @ud))   (reap dim (reap dim 2))
    =.  res                     (place-unsafe res finder-ptn --0 --0)
    =.  res                     (place-unsafe res sep-ptn -1 -1)
    =.  res                     (place-unsafe res finder-ptn (udsd (sub dim 7)) --0)
    =.  res                     (place-unsafe res sep-ptn (dif:si (udsd dim) --8) -1)
    =.  res                     (place-unsafe res finder-ptn --0 (udsd (sub dim 7)))
    =.  res                     (place-unsafe res sep-ptn -1 (dif:si (udsd dim) --8))
    =/  points                  (point-combinations version)
    =.  res                     (place-alignment-ptns points res) 
    =.  res                     (place-timing-ptns res)
    =.  res                     (place-dark-module res version)
    =.  res                     (place-format-space res dim)
    =.  res                     (place-version-info res version dim)
    =.  res                     (place-data res data dim)
    =.  res                     (place-format-info res lvl dim)
    res
  ++  version-info
    :: Version information for QR codes, added for version 
    :: 7 and above.
    |=  version=@ud
    ?:  (lth version 7)
      ~&  "Tried getting version info on version less than 8!"
      !!
    =/  lut=(list tape)  ["000111110010010100" "001000010110111100" "001001101010011001" "001010010011010011" "001011101111110110" "001100011101100010" "001101100001000111" "001110011000001101" "001111100100101000" "010000101101111000" "010001010001011101" "010010101000010111" "010011010100110010" "010100100110100110" "010101011010000011" "010110100011001001" "010111011111101100" "011000111011000100" "011001000111100001" "011010111110101011" "011011000010001110" "011100110000011010" "011101001100111111" "011110110101110101" "011111001001010000" "100000100111010101" "100001011011110000" "100010100010111010" "100011011110011111" "100100101100001011" "100101010000101110" "100110101001100100" "100111010101000001" "101000110001101001" ~]
    (tape-to-list:helper (snag (sub version 7) lut))
  ++  lvl-to-idx
    :: Converts a level to an index to better address LUTs.
    |=  lvl=lvl
    ^-  @ud
    ?-  lvl
      %l  0
      %m  1
      %q  2
      %h  3
    ==
  ++  format-info
    :: Format information for QR codes.
    :: LUT is addressed by level and mask.
    |=  [mask=@ud lvl=lvl] 
    ^-  (list @ub)
    =/  lvl-idx=@ud  (lvl-to-idx lvl)
    =/  lut=(list (list tape))  
      [["111011111000100" "111001011110011" "111110110101010" "111100010011101" "110011000101111" "110001100011000" "110110001000001" "110100101110110" ~] ["101010000010010" "101000100100101" "101111001111100" "101101101001011" "100010111111001" "100000011001110" "100111110010111" "100101010100000" ~] ["011010101011111" "011000001101000" "011111100110001" "011101000000110" "010010010110100" "010000110000011" "010111011011010" "010101111101101" ~] ["001011010001001" "001001110111110" "001110011100111" "001100111010000" "000011101100010" "000001001010101" "000110100001100" "000100000111011" ~] ~]
    =/  res-tape  (snag mask (snag lvl-idx lut))
    (tape-to-list:helper res-tape)
  ++  place-format-info
    :: Places the format information in the QR code matrix.
    :: This is very hardcoded due to the QR specification.
    |=  [in=(list (list @ud)) lvl=lvl dim=@ud]
    =/  res  in
    =/  format-info  (format-info 3 lvl)
    =/  mapping=(list [@ud [@ud @ud]])  [[0 [0 8]] [1 [1 8]] [2 [2 8]] [3 [3 8]] [4 [4 8]] [5 [5 8]] [6 [7 8]] [7 [8 8]] [7 [(sub dim 8) 8]] [8 [(sub dim 7) 8]] [9 [(sub dim 6) 8]] [10 [(sub dim 5) 8]] [11 [(sub dim 4)] 8] [12 [(sub dim 3) 8]] [13 [(sub dim 2) 8]] [14 [(sub dim 1) 8]] ~] 
    =.  mapping  (weld mapping [[0 [8 (sub dim 1)]] [1 [8 (sub dim 2)]] [2 [8 (sub dim 3)]] [3 [8 (sub dim 4)]] [4 [8 (sub dim 5)]] [5 [8 (sub dim 6)]] [6 [8 (sub dim 7)]] [7 [8 8]] [8 [8 7]] [9 [8 5]] [10 [8 4]] [11 [8 3]] [12 [8 2]] [13 [8 1]] [14 [8 0]] ~])
    =|  i=@ud
    |- 
    ?:  (lth i (lent mapping))
      =/  val   (snag -:(snag i mapping) format-info)
      =/  coord     +:(snag i mapping)
      %=  $
        res  -:(place-pixel res -:coord +:coord `@ud`val)
        i  (add i 1)
      ==
    res
  ++  mask
    :: There are 8 different masks that can be applied to the QR code.
    :: Each of those have a different pattern that is applied to the
    :: QR code. 
    :: We're using the mask 3, because it looks the best.
    |=  [x=@ud y=@ud mask=@ud]
    ^-  ?
    ?:  =(mask 0)
      =(0 (mod (add x y) 2))
    ?:  =(mask 1)
      =(0 (mod y 2))
    ?:  =(mask 2)
      =(0 (mod x 3))
    ?:  =(mask 3)
      =(0 (mod (add x y) 3))
    ?:  =(mask 4)
      =(0 (mod (add (div y 2) (div x 3)) 2))
    ?:  =(mask 5)
      =(0 (add (mod (mul x y) 2) (mod (mul x y) 3)))
    ?:  =(mask 6)
      =(0 (mod (add (mod (mul x y) 2) (mod (mul x y) 3)) 2))
    ?:  =(mask 7)
      =(0 (mod (add (mod (add x y) 2) (mod (mul x y) 3)) 2))
    ~&  ["mask" mask "is not valid"]
    !!
  ++  flip
    |=  x=@ud
    ?:  =(x 0)
      1
    0
  ++  place-data
    :: Places the data stream in the QR code matrix, and 
    :: applying mask 3.
    :: Goes through a predefined data trajectory, and for each
    :: cell, it checks if it's occupied (2) or not (anything else).
    :: If it's occupied, it skips it, otherwise it places the
    :: next bit from the data stream.
    |=  [in=(list (list @ud)) data=(list @ub) dim=@ud]
    ^-  (list (list @ud))
    =/  points  (data-trajectory in dim)
    =/  res     in 
    =|  i=@ud
    |-
    ?:  (lth i (lent data))
      =/  point  (snag i points)
      =/  x    -:point
      =/  y    +:point
      =/  val  `@ud`(snag i data)
      :: I'm lazy, I don't want to evaluate which mask pattern is the most
      :: efficient, it's not 1994 anymore. I'll just use the third one,
      :: because it looks cool.
      =?  val  (mask x y 3)
        (flip val)
      %=  $
        res  -:(place-pixel res x y val)
        i    (add i 1)
      ==
    res
  ++  data-trajectory
    :: Generates a list of coordinates that the data stream
    :: will be placed in.
    |=  [in=(list (list @ud)) dim=@ud]
    ^-  (list [@ud @ud])
    =|  points=(list [@ud @ud])
    =/  up=?  %.y
    =/  last-idx  (dif:si (udsd dim) --1)
    =/  x=@sd  last-idx
    =/  y=@sd  last-idx
    |- 
    ?:  (syn:si x)
      |-
      ?:  =((abs:si x) 6)
        %=  ^$
          x  (dif:si x --1)
        ==
      ?:  &((syn:si y) (lte (abs:si y) (abs:si last-idx)))
        =/  candidates=(list [@ud @ud])  [[(abs:si x) (abs:si y)] [(sub (abs:si x) 1) (abs:si y)] ~]
        =.  candidates  (skim candidates |=(p=[@ud @ud] (free in -:p +:p)))
        =/  dir  -1
        =?  dir  up
          --1
        %=  $
          y       (dif:si y dir)
          points  (weld points candidates)
        ==
      =.  up  !up
      =/  new-y  --0
      =?  new-y  up
        last-idx
      %=  ^$
        x     (dif:si x --2)
        y     new-y 
      ==
    points
  ++  place-version-info
    :: If the version is greater than 7, we add version information to the QR code.
    :: Marked with number 4.
    |=  [res=(list (list @ud)) version=@ud dim=@ud]
    ^-  (list (list @ud))
    ?:  (lth version 7)
      res
    =/  version-info=(list @ub)     (version-info version)
    =/  el1=(list @ud)              [(sub dim 9) (sub dim 10) (sub dim 11) ~]
    =/  el2=(list @ud)              [0 1 2 3 4 5 ~]
    =|  points=(list [@ud @ud @ud])
    =|  i=@ud
    =|  j=@ud
    |- 
    ?.  =(i (lent el1))
      |- 
      ?:  =(j (lent el2))
        %=  ^$
          i  (add i 1)
          j  0
        ==
      =/  i-val  (snag i el1)
      =/  j-val  (snag j el2)
      =/  val    `@ud`(snag (add i (mul 3 j)) version-info)

      =/  point  [[val i-val j-val] [val j-val i-val] ~]
      %=  $
        points  (weld points point)
        j       (add j 1)
      ==
    =.  i  0
    |-
    ?:  =(i (lent points))
      res
    =/  info    (snag i points)
    =/  coord   +:info
    =/  val     -:info
    %=  $
      res  -:(place-pixel res -:coord +:coord val)
      i    (add i 1)
    ==
  ++  place-format-space
    :: Space reserved for format information, marked with number 3.
    |=  [in=(list (list @ud)) dim=@ud]
    ^-  (list (list @ud))
    =/  vals=(list @ud)  [0 1 2 3 4 5 6 7 ~]
    =.  vals    (weld vals (turn vals |=(a=@ud (sub (sub dim 1) a))))
    =/  row     (turn vals |=(val=@ud [8 val]))
    =/  col     (turn vals |=(val=@ud [val 8]))
    =/  coords  (weld row col)
    =.  coords  (snoc coords [8 8])
    =.  coords  (skim coords |=(coord=[@ud @ud] (free in -:coord +:coord)))
    =|  i=@ud
    =/  res=(list (list @ud))  in
    |-
    ?:  =(i (lent coords))
      res
    =/  coord   (snag i coords)
    =.  res     (place-unsafe res [[3 ~] ~] (udsd -:coord) (udsd +:coord))
    $(i (add i 1))
  ++  free
    :: Checks if the matrix cell is free.
    |=  [matrix=(list (list @ud)) x=@ud y=@ud]
    ^-  ?
    =(2 (snag x (snag y matrix)))
  ++  place-dark-module
    ::  Place the QRs dark module at the top right
    ::  of the bottom left finder pattern. 
    |=  [in=(list (list @ud)) version=@ud]
    ^-  (list (list @ud))
    =/  x=@ud  8
    =/  y=@ud  (add (mul 4 version) 9)
    -:(place-pixel in x y 1)
  ++  place-timing-ptns
    :: Place the timing patterns into the qr code. 
    |=  [in=(list (list @ud))]
    ^-  (list (list @ud))
    =/  dim=@ud  (lent in)
    =/  x=@ud    8
    =/  y=@ud    6
    =/  res=(list (list @ud))  in
    =|  val=@ud  
    =|  idx=@ud
    |- 
    ?.  =(x (sub dim 8))
      =.  val  (alternate-vals idx)
      %=  $
        idx   (add idx 1)
        res   (place-unsafe res [[val ~] ~] (udsd x) (udsd y))
        x     (add x 1)
      ==
    =.  x     6
    =.  y     8
    =.  idx   0
    |-  
    ?.  =(y (sub dim 8))
      =.  val  (alternate-vals idx)
      %=  $
        idx   (add idx 1)
        res   (place-unsafe res [[val ~] ~] (udsd x) (udsd y))
        y     (add y 1)
      ==
    res
  ++  alternate-vals
    |=  idx=@ud
    ^-  @ud
    ?:  =((mod idx 2) 0)
      1
    0
  ++  place-alignment-ptns
    :: Place the alignment patterns into the qr code.
    |=  [points=(list (list @ud)) in=(list (list @ud))]
    ^-  (list (list @ud))
    =|  idx=@ud
    =/  res=(list (list @ud))  in
    |-
    ?:  =(idx (lent points))
      res
    =/  point=(list @ud)  (snag idx points)
    =/  x=@ud             (snag 0 point)
    =/  y=@ud             (snag 1 point)
    =/  ptn               alignment-ptn
    =/  coords            (top-left-corner-to-mid x y ptn)
    =/  x=@sd             (udsd (snag 0 coords))
    =/  y=@sd             (udsd (snag 1 coords))
    %=  $
      res                 (place-safe res ptn x y)
      idx                 (add idx 1)
    ==
  ++  alignment-ptn
    :: Hardcoded alignment pattern.
    =|  res=(list (list @ud))
    =|  idx=@ud
    |-
    ?:  =(idx 5)
      res
    =|  col=(list @ud)
    =?  col  |(=(idx 0) =(idx 4))
      (reap 5 1)
    =?  col  |(=(idx 1) =(idx 3))
      [1 0 0 0 1 ~]
    =?  col  =(idx 2)
      [1 0 1 0 1 ~]
    %=  $
      res   (snoc res col)
      idx   (add idx 1)
    ==
  ++  top-left-corner-to-mid
    :: Given `matrix`, converts coordinates that represent the 
    :: top-left corner of a pattern to coordinates that represent 
    :: the center of the ptn.
    |=  [x=@ud y=@ud matrix=(list (list @ud))]
    ^-  (list @ud)
    =/  dim=@ud  (lent matrix)
    =/  mid  (div dim 2)
    =/  x  (sub x mid)
    =/  y  (sub y mid)
    [x y ~]
  ++  place-unsafe
    :: Places a pattern into the matrix without checking if the
    :: cells are free.
    |=  [existing=(list (list @ud)) ptn=(list (list @ud)) x=@sd y=@sd]
    ^-  (list (list @ud))
    -:(place existing ptn x y)
  ++  place-safe
    :: Places a pattern into the matrix, checking if the cells are free,
    :: and if not, returns the original matrix.
    |=  [existing=(list (list @ud)) ptn=(list (list @ud)) x=@sd y=@sd]
    ^-  (list (list @ud))
    =/  placed  (place existing ptn x y)
    ?:  +:placed
      existing
    -:placed
  ++  place
    :: Places a pattern into the matrix, returning the matrix and a boolean
    :: indicating if the placement hit any occupied cells.
    |=  [existing=(list (list @ud)) ptn=(list (list @ud)) x1=@sd y1=@sd]
    ^-  [(list (list @ud)) ?]
    =|  x=@ud 
    =|  y=@ud
    =/  failed=?  %.n
    |-
    ?:  =(x (lent ptn))
      [existing failed]
    |-  
    ?:  =(y (lent (snag x ptn)))
      %=  ^$
        x  (add x 1)
        y  0
      ==
    =/  add-x=@sd  (sum:si x1 (udsd x))
    =/  add-y=@sd  (sum:si y1 (udsd y))
    =/  lent=@sd   (udsd (lent existing))
    ?:  &((gte add-x 0) (gte add-y 0) (lth add-x lent) (lth add-y lent))
      =/  x-coord  (abs:si add-x)
      =/  y-coord  (abs:si add-y)
      =/  val      (snag y (snag x ptn))
      =/  result   (place-pixel existing x-coord y-coord val)
      =?  failed   +:result
        %.y
      %=  $
        existing     -:result
        y            (add y 1)
      ==
    $(y (add y 1))
  ++  place-pixel
    :: Places a pixel into the matrix if it is not already occupied.
    :: A pixel counts as occupied if it is not 2.
    |=  [matrix=(list (list @ud)) x=@ud y=@ud val=@ud]
    ^-  [(list (list @ud)) ?]
    =/  existing-px  (snag x (snag y matrix))
    =|  failure=?
    ?:  &((gte existing-px 2) !=(val 2))
      [(snap matrix y (snap (snag y matrix) x val)) %.n]
    [matrix %.y]
  ++  point-combinations
    :: All possible combinations of points as pairs
    |=  [version=@ud]
    ^-  (list (list @ud))
    =/  base  (alignment-ptn-locations version)
    =|  res=(list (list @ud))
    =|  i=@ud
    =|  j=@ud
    |- 
    ?:  =(i (lent base))
      res
    |- 
    ?.  =(j (lent base))
      =/  point-i  (snag i base)
      =/  point-j  (snag j base)
      %=  $
        res   (snoc res `(list @ud)`~[point-i point-j])
        j     (add j 1)
      ==
    %=  ^$
      i     (add i 1)
      j     0
    ==
  ++  sep-ptn
    :: Separation pattern.
    =|  res=(list (list @ud))
    =|  x=@ud
    =|  y=@ud
    =|  col=(list @ud)
    |- 
    ?:  =(x 9)
      res
    |- 
    ?:  =(y 9)
      %=  ^$
        res   (snoc res col)
        x     (add x 1)
        y     0
        col   [~]
      ==
    =/  val=@ud  2
    =?  val  |(=(x 0) =(x 8) =(y 0) =(y 8))
      0
    %=  $
      y       (add y 1)
      col     (snoc col val)
    ==
  ++  finder-ptn  
    :: Finder pattern.
    =|  res=(list (list @ud))
    =|  idx=@ud
    |-
    ?:  =(idx 7)
      res
    =|  col=(list @ud)
    =?  col  |(=(idx 0) =(idx 6))
      (reap 7 1)
    =?  col  |(=(idx 1) =(idx 5))
      [1 0 0 0 0 0 1 ~]
    =?  col  &((gth idx 1) (lth idx 5))
      [1 0 1 1 1 0 1 ~]
    %=  $
      res   (snoc res col)
      idx   (add idx 1)
    ==
  ++  alignment-ptn-locations
    :: Locations of alignment patterns.
    |=  version=@ud
    =/  locs=(list (list @ud))  [[~] [6 18 ~] [6 22 ~] [6 26 ~] [6 30 ~] [6 34 ~] [6 22 38 ~] [6 24 42 ~] [6 26 46 ~] [6 28 50 ~] [6 30 54 ~] [6 32 58 ~] [6 34 62 ~] [6 26 46 66 ~] [6 26 48 70 ~] [6 26 50 74 ~] [6 30 54 78 ~] [6 30 56 82 ~] [6 30 58 86 ~] [6 34 62 90 ~] [6 28 50 72 94 ~] [6 26 50 74 98 ~] [6 30 54 78 102 ~] [6 28 54 80 106 ~] [6 32 58 84 110 ~] [6 30 58 86 114 ~] [6 34 62 90 118 ~] [6 26 50 74 98 122 ~] [6 30 54 78 102 126 ~] [6 26 52 78 104 130 ~] [6 30 56 82 108 134 ~] [6 34 60 86 112 138 ~] [6 30 58 86 114 142 ~] [6 34 62 90 118 146 ~] [6 30 54 78 102 126 150 ~] [6 24 50 76 102 128 154 ~] [6 28 54 80 106 132 158 ~] [6 32 58 84 110 136 162 ~] [6 26 54 82 110 138 166 ~] [6 30 58 86 114 142 170 ~] ~]
    (snag (sub version 1) locs)
  :: Converts a `@ud` to `@sd`
  ++  udsd
    |=  a=@ud
    `@sd`(sun:si a)
  --
++  helper
  |%
  ++  ud-to-ub
    :: Converts a list of `@ud` to a nested 
    :: list of `@ub`, where the inner list
    :: represents bytes.
    |=  in=(list @ud)
    ^-  (list (list @ub))
    =|  res=(list (list @ub))
    =|  idx=@ud
    |- 
    ?.  =(idx (lent in))
      =/  converted  (flop (rip 0 (snag idx in)))
      =/  pad-amount   (sub 8 (lent converted))
      =.  converted    (weld (reap pad-amount 0) converted)
      %=  $
        idx     (add idx 1)
        res     (snoc res converted)
      ==
    res
  ++  bits-to-bytes 
    :: Converts a list of @ub to a list of lists of @ub, where the
    :: inner list contains 8 bits each.
    |=  bits=(list @ub)
    ^-  (list (list @ub))
    =|  res=(list (list @ub))
    =|  byte=(list @ub)
    =|  idx=@ud
    |-  
    ?:  =(idx (lent bits))
      (snoc res byte)
    ?:  &(=((mod idx 8) 0) (gth idx 0))
      %=  $
        res     (snoc res byte)
        byte    [(snag idx bits) ~]
        idx     (add idx 1)
      ==
    %=  $
      byte    (snoc byte (snag idx bits))
      idx     (add idx 1)
    ==
  ++  display
    :: Converts a list of @ub to tape form
    |=  in=(list @ub)
    ^-  tape
    =|  res=(list @tD)
    =|  idx=@ud
    |- 
    ?:  =((lent in) (lent res))
      `tape`res
    %=  $
      res       (snoc res (ub-to-td (snag idx in)))
      idx       (add idx 1)
    ==
  ++  tape-to-list
    :: Converts a tape to a list of @ub
    |=  [in=tape]
    ^-  (list @ub)
    =|  idx=@ud
    =|  res=(list @ub)
    |-  
    ?:  =(idx (lent in))
      res
    %=  $
      res   (snoc res (td-to-ub (snag idx in)))
      idx   (add idx 1)
    ==
  ++  ub-to-td
    |=  ub=@ub
    ^-  @tD
    ?:  =(ub 0b0)
      '0'
    '1'
  ++  td-to-ub
    |=  in=@tD
    ^-  @ub
    ?:  =(in '0')
      0b0
    0b1
  --
++  convert-svg
  |=  qr=(list (list @ud))
  :: Produces dim and content
  ^-  [@ud tape]
  :: Converts the QR code (list of lists of @ud) to SVG
  =/  qr-size  (lent qr)
  =/  base-px  3
  =/  dim    (mul qr-size base-px)
  =/  res     ""
  =|  x=@ud
  =|  y=@ud
  |-
  ?:  (lth y qr-size)
    |-
    ?:  (lth x qr-size)
      =/  row   (snag y qr)
      =/  val   (snag x row)
      =/  x0    (mul base-px x)
      =/  x1    (add (mul base-px x) base-px)
      =/  y0    (add (mul base-px y) base-px)
      =/  y1    (mul base-px y)
      ?:  =(val 1)
        %=  $
          x       (add x 1)  
          res     (weld res "M {<x0>},{<y0>} {<x1>},{<y0>} {<x1>},{<y1>} {<x0>},{<y1>} z ")
        ==
      %=  $
        x      (add x 1)
      ==
    %=  ^$
      y      (add y 1)
      x      0
    ==
  [dim res]
--