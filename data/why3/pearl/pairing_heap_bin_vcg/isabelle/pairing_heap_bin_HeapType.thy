theory pairing_heap_bin_HeapType
  imports "NTP4Verif.NTP4Verif" "Why3STD.bintree_Tree"
begin
typedecl  elt
datatype  heap = E | T "elt" "elt tree"
end
