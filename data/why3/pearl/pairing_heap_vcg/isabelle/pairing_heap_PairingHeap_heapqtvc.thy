theory pairing_heap_PairingHeap_heapqtvc
  imports "NTP4Verif.NTP4Verif" "./pairing_heap_HeapType" "./pairing_heap_Size" "./pairing_heap_Occ"
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
definition le_tree :: "elt \<Rightarrow> tree \<Rightarrow> _"
  where "le_tree e t \<longleftrightarrow> (case t of T x _ \<Rightarrow> le e x)" for e t
definition le_root :: "elt \<Rightarrow> raw_heap \<Rightarrow> _"
  where "le_root e h \<longleftrightarrow> (case h of E \<Rightarrow> True | H t \<Rightarrow> le_tree e t)" for e h
fun le_roots :: "elt \<Rightarrow> tree list \<Rightarrow> _"
  where "le_roots e (Nil :: tree list) = True" for e
      | "le_roots e (Cons t r) = (le_tree e t \<and> le_roots e r)" for e t r
fun heap :: "raw_heap \<Rightarrow> _"  and heap_tree :: "tree \<Rightarrow> _"  and heap_list :: "tree list \<Rightarrow> _"
  where "heap (E :: raw_heap) = True"
      | "heap (H t) = heap_tree t" for t
      | "heap_tree (T x l) = (le_roots x l \<and> heap_list l)" for x l
      | "heap_list (Nil :: tree list) = True"
      | "heap_list (Cons t r) = (heap_tree t \<and> heap_list r)" for t r
theorem heap'vc:
  shows "heap (E :: raw_heap)"
  sorry
end
