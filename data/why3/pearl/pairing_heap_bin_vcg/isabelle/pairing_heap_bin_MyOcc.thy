theory pairing_heap_bin_MyOcc
  imports "NTP4Verif.NTP4Verif" "./pairing_heap_bin_HeapType" "Why3STD.bintree_Tree" "Why3STD.bintree_Occ"
begin
definition occ :: "elt \<Rightarrow> heap \<Rightarrow> int"
  where "occ x h = (case h of E \<Rightarrow> (0 :: int) | T e r \<Rightarrow> (if x = e then 1 :: int else (0 :: int)) + bintree_Occ.occ x r)" for x h
definition mem :: "elt \<Rightarrow> heap \<Rightarrow> _"
  where "mem x h \<longleftrightarrow> (0 :: int) < occ x h" for x h
end
