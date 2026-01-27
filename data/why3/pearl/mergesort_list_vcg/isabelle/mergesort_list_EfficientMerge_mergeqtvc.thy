theory mergesort_list_EfficientMerge_mergeqtvc
  imports "NTP4Verif.NTP4Verif"
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
inductive sorted :: "elt list \<Rightarrow> bool" where
   Sorted_Nil: "sorted (Nil :: elt list)"
 | Sorted_One: "sorted (Cons x (Nil :: elt list))" for x :: "elt"
 | Sorted_Two: "le x y \<Longrightarrow> sorted (Cons y l) \<Longrightarrow> sorted (Cons x (Cons y l))" for x :: "elt" and y :: "elt" and l :: "elt list"
axiomatization where sorted_mem:   "(\<forall>(y :: elt). y \<in> set l \<longrightarrow> le x y) \<and> sorted l \<longleftrightarrow> sorted (Cons x l)"
  for l :: "elt list"
  and x :: "elt"
axiomatization where sorted_append:   "sorted l1 \<and> sorted l2 \<and> (\<forall>(x :: elt) (y :: elt). x \<in> set l1 \<longrightarrow> y \<in> set l2 \<longrightarrow> le x y) \<longleftrightarrow> sorted (l1 @ l2)"
  for l1 :: "elt list"
  and l2 :: "elt list"
theorem merge'vc:
  fixes l1 :: "elt list"
  fixes l2 :: "elt list"
  assumes fact0: "sorted l1"
  assumes fact1: "sorted l2"
  shows "let o1 :: elt list = (Nil :: elt list) in ((sorted (rev o1) \<and> sorted l1 \<and> sorted l2) \<and> (\<forall>(x :: elt) (y :: elt). x \<in> set o1 \<longrightarrow> y \<in> set l1 \<longrightarrow> le x y) \<and> (\<forall>(x :: elt) (y :: elt). x \<in> set o1 \<longrightarrow> y \<in> set l2 \<longrightarrow> le x y)) \<and> (\<forall>(result :: elt list). sorted result \<and> result <~~> (o1 @ l1) @ l2 \<longrightarrow> sorted result \<and> result <~~> l1 @ l2)"
  sorry
end
