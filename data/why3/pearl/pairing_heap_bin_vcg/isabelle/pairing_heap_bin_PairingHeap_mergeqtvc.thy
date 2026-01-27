theory pairing_heap_bin_PairingHeap_mergeqtvc
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
consts empty :: "heap"
axiomatization where empty'def'0:   "heap empty"
axiomatization where empty'def'1:   "pairing_heap_bin_MySize.size empty = (0 :: int)"
axiomatization where empty'def'2:   "\<forall>(e :: elt). \<not>pairing_heap_bin_MyOcc.mem e empty"
theorem merge'vc:
  fixes h1 :: "heap"
  fixes h2 :: "heap"
  assumes fact0: "heap h1"
  assumes fact1: "heap h2"
  shows "case h2 of E \<Rightarrow> (case h1 of E \<Rightarrow> True | _ \<Rightarrow> True) | T x x1 \<Rightarrow> (case h1 of E \<Rightarrow> True | T x2 x3 \<Rightarrow> True)"
  and "\<forall>(result :: heap). (case h2 of E \<Rightarrow> (case h1 of E \<Rightarrow> result = h2 | _ \<Rightarrow> result = h1) | T x x1 \<Rightarrow> (case h1 of E \<Rightarrow> result = h2 | T x2 x3 \<Rightarrow> (if le x2 x then result = T x2 (Node x1 x x3) else result = T x (Node x3 x2 x1)))) \<longrightarrow> heap result \<and> pairing_heap_bin_MySize.size result = pairing_heap_bin_MySize.size h1 + pairing_heap_bin_MySize.size h2 \<and> (\<forall>(x :: elt). pairing_heap_bin_MyOcc.occ x result = pairing_heap_bin_MyOcc.occ x h1 + pairing_heap_bin_MyOcc.occ x h2)"
  sorry
end
