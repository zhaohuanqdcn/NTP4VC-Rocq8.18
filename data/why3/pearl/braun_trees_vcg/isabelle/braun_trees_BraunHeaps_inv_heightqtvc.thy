theory braun_trees_BraunHeaps_inv_heightqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.bintree_Tree" "Why3STD.bintree_Size" "Why3STD.bintree_Occ" "Why3STD.bintree_Height"
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
fun inv :: "elt tree \<Rightarrow> _"
  where "inv (Empty :: elt tree) = True"
      | "inv (Node l x r) = ((bintree_Size.size l = bintree_Size.size r \<or> bintree_Size.size l = bintree_Size.size r + (1 :: int)) \<and> inv l \<and> inv r)" for l x r
consts empty :: "elt tree"
axiomatization where empty'def'0:   "heap empty"
axiomatization where empty'def'1:   "inv empty"
axiomatization where empty'def'2:   "bintree_Size.size empty = (0 :: int)"
axiomatization where empty'def'3:   "\<forall>(e :: elt). \<not>mem e empty"
theorem inv_height'vc:
  fixes t :: "elt tree"
  assumes fact0: "inv t"
  assumes fact1: "(0 :: int) < bintree_Size.size t"
  shows "let h :: int = height t in (2 :: int) ^\<^sub>i (h - (1 :: int)) \<le> bintree_Size.size t \<and> bintree_Size.size t < (2 :: int) ^\<^sub>i h"
  sorry
end
