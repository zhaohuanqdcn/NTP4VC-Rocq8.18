theory pairing_heap_HeapType
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  elt
datatype  raw_heap = E | H "tree"
     and  tree = T "elt" "tree list"
end
