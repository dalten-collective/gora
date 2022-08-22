|%
::  mei:
::  (map key $@(value [value (map key $@(value [value (map key value)]))]))
::               /                        \
::              /                          \
::             /                            \
::           value   [value (map key $@(value [value (map key value)]))]
::                                  /        \
::                                value       [value (map key value)]
::
++  mei
  |$  [key value]
+$  meigora
  %+  map  key
  $@  value
  $:  value
  %+  map  key
  $@  value
  $:  value
  %+  map  key
  $@  value
  [value (map key value)]
--