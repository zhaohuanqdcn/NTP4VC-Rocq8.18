theory pairing_heap_bin_PairingHeap_le_root_tree_transqtvc
  imports "NTP4Verif.NTP4Verif" "./pairing_heap_bin_HeapType" "Why3STD.bintree_Tree" "Why3STD.bintree_Size" "Why3STD.bintree_Occ" "./pairing_heap_bin_MySize" "./pairing_heap_bin_MyOcc"
begin
consts le :: "elt \<Rightarrow> elt \<Rightarrow> bool"
axiomatization where Refl:   "le x x"
  for x :: "elt"
axiomatization where Trans:   "le x z"
 if "le x y"
 and "le y z"
  for x :: "elt"
  and y :: "elt"
  and z :: "elt"
axiomatization where Total:   "le x y \<or> le y x"
  for x :: "elt"
  and y :: "elt"
definition le_root :: "elt \<Rightarrow> heap \<Rightarrow> _"
  where "le_root e h \<longleftrightarrow> (case h of E \<Rightarrow> True | T x _ \<Rightarrow> le e x)" for e h
fun le_root_tree :: "elt \<Rightarrow> elt tree \<Rightarrow> _"
  where "le_root_tree e (Empty :: elt tree) = True" for e
      | "le_root_tree e (Node x0 x r) = (le e x \<and> le_root_tree e r)" for e x0 x r
theorem le_root_tree_trans'vc:
  fixes x :: "elt"
  fixes y :: "elt"
  fixes t :: "elt tree"
  assumes fact0: "le x y"
  assumes fact1: "le_root_tree y t"
  shows "le_root_tree x t"
  sorry
end
