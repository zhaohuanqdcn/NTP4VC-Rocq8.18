theory pairing_heap_bin_PairingHeap_merge_pairsqtvc
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
theorem merge_pairs'vc:
  fixes t :: "elt tree"
  assumes fact0: "heap_tree t"
  shows "case t of (Empty :: elt tree) \<Rightarrow> True | Node l x (Empty :: elt tree) \<Rightarrow> True | Node l x (Node l2 y r) \<Rightarrow> (let h :: heap = T x l; h' :: heap = T y l2 in (((0 :: int) \<le> bintree_Size.size t \<and> bintree_Size.size r < bintree_Size.size t) \<and> heap_tree r) \<and> (\<forall>(o1 :: heap). heap o1 \<and> pairing_heap_bin_MySize.size o1 = bintree_Size.size r \<and> (\<forall>(x1 :: elt). pairing_heap_bin_MyOcc.occ x1 o1 = bintree_Occ.occ x1 r) \<longrightarrow> (heap h \<and> heap h') \<and> (\<forall>(o2 :: heap). heap o2 \<and> pairing_heap_bin_MySize.size o2 = pairing_heap_bin_MySize.size h + pairing_heap_bin_MySize.size h' \<and> (\<forall>(x1 :: elt). pairing_heap_bin_MyOcc.occ x1 o2 = pairing_heap_bin_MyOcc.occ x1 h + pairing_heap_bin_MyOcc.occ x1 h') \<longrightarrow> heap o2 \<and> heap o1)))"
  and "\<forall>(result :: heap). (case t of (Empty :: elt tree) \<Rightarrow> result = (E :: heap) | Node l x (Empty :: elt tree) \<Rightarrow> result = T x l | Node l x (Node l2 y r) \<Rightarrow> (let h :: heap = T x l; h' :: heap = T y l2 in \<exists>(o1 :: heap). (heap o1 \<and> pairing_heap_bin_MySize.size o1 = bintree_Size.size r \<and> (\<forall>(x1 :: elt). pairing_heap_bin_MyOcc.occ x1 o1 = bintree_Occ.occ x1 r)) \<and> (\<exists>(o2 :: heap). (heap o2 \<and> pairing_heap_bin_MySize.size o2 = pairing_heap_bin_MySize.size h + pairing_heap_bin_MySize.size h' \<and> (\<forall>(x1 :: elt). pairing_heap_bin_MyOcc.occ x1 o2 = pairing_heap_bin_MyOcc.occ x1 h + pairing_heap_bin_MyOcc.occ x1 h')) \<and> heap result \<and> pairing_heap_bin_MySize.size result = pairing_heap_bin_MySize.size o2 + pairing_heap_bin_MySize.size o1 \<and> (\<forall>(x1 :: elt). pairing_heap_bin_MyOcc.occ x1 result = pairing_heap_bin_MyOcc.occ x1 o2 + pairing_heap_bin_MyOcc.occ x1 o1)))) \<longrightarrow> heap result \<and> pairing_heap_bin_MySize.size result = bintree_Size.size t \<and> (\<forall>(x :: elt). pairing_heap_bin_MyOcc.occ x result = bintree_Occ.occ x t)"
  sorry
end
