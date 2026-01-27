theory skew_heaps_SkewHeaps_addqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.bintree_Tree" "Why3STD.bintree_Size" "Why3STD.bintree_Occ"
begin
typedecl  elt
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
definition le_root :: "elt \<Rightarrow> elt tree \<Rightarrow> _"
  where "le_root e t \<longleftrightarrow> (case t of (Empty :: elt tree) \<Rightarrow> True | Node _ x _ \<Rightarrow> le e x)" for e t
fun heap :: "elt tree \<Rightarrow> _"
  where "heap (Empty :: elt tree) = True"
      | "heap (Node l x r) = (le_root x l \<and> heap l \<and> le_root x r \<and> heap r)" for l x r
consts minimum :: "elt tree \<Rightarrow> elt"
axiomatization where minimum_def:   "minimum (Node l x r) = x"
  for l :: "elt tree"
  and x :: "elt"
  and r :: "elt tree"
definition is_minimum :: "elt \<Rightarrow> elt tree \<Rightarrow> _"
  where "is_minimum x t \<longleftrightarrow> mem x t \<and> (\<forall>(e :: elt). mem e t \<longrightarrow> le x e)" for x t
consts empty :: "elt tree"
axiomatization where empty'def'0:   "heap empty"
axiomatization where empty'def'1:   "bintree_Size.size empty = (0 :: int)"
axiomatization where empty'def'2:   "\<forall>(e :: elt). \<not>mem e empty"
theorem add'vc:
  fixes t :: "elt tree"
  fixes x :: "elt"
  assumes fact0: "heap t"
  shows "let o1 :: elt tree = Node (Empty :: elt tree) x (Empty :: elt tree) in (heap o1 \<and> heap t) \<and> (\<forall>(result :: elt tree). heap result \<and> (\<forall>(e :: elt). occ e result = occ e o1 + occ e t) \<and> bintree_Size.size result = bintree_Size.size o1 + bintree_Size.size t \<longrightarrow> heap result \<and> occ x result = occ x t + (1 :: int) \<and> (\<forall>(e :: elt). \<not>e = x \<longrightarrow> occ e result = occ e t) \<and> bintree_Size.size result = bintree_Size.size t + (1 :: int))"
  sorry
end
