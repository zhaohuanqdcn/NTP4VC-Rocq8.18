theory pairing_heap_bin_PairingHeap_mem_heapqtvc
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
fun heap_tree :: "elt tree \<Rightarrow> _"
  where "heap_tree (Empty :: elt tree) = True"
      | "heap_tree (Node l x r) = (le_root_tree x l \<and> heap_tree l \<and> heap_tree r)" for l x r
definition heap :: "heap \<Rightarrow> _"
  where "heap h \<longleftrightarrow> (case h of E \<Rightarrow> True | T x r \<Rightarrow> le_root_tree x r \<and> heap_tree r)" for h
consts minimum :: "heap \<Rightarrow> elt"
axiomatization where minimum_def:   "minimum (T x r) = x"
  for x :: "elt"
  and r :: "elt tree"
definition is_minimum :: "elt \<Rightarrow> heap \<Rightarrow> _"
  where "is_minimum x h \<longleftrightarrow> pairing_heap_bin_MyOcc.mem x h \<and> (\<forall>(e :: elt). pairing_heap_bin_MyOcc.mem e h \<longrightarrow> le x e)" for x h
theorem mem_heap'vc:
  fixes h :: "heap"
  fixes x :: "elt"
  fixes y :: "elt"
  assumes fact0: "heap h"
  assumes fact1: "le_root x h"
  assumes fact2: "pairing_heap_bin_MyOcc.mem y h"
  shows "le x y"
  sorry
end
