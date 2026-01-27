theory pairing_heap_bin_MySize
  imports "NTP4Verif.NTP4Verif" "./pairing_heap_bin_HeapType" "Why3STD.bintree_Tree" "Why3STD.bintree_Size"
begin
definition size :: "heap \<Rightarrow> int"
  where "size h = (case h of E \<Rightarrow> (0 :: int) | T _ r \<Rightarrow> (1 :: int) + bintree_Size.size r)" for h
end
