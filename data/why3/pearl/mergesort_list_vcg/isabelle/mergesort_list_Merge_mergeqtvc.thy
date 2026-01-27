theory mergesort_list_Merge_mergeqtvc
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
  shows "case l2 of Nil \<Rightarrow> (case l1 of Nil \<Rightarrow> True | _ \<Rightarrow> True) | Cons x x1 \<Rightarrow> (case l1 of Nil \<Rightarrow> True | Cons x2 x3 \<Rightarrow> (if le x2 x then ((0 :: int) \<le> int (length l1) + int (length l2) \<and> int (length x3) + int (length l2) < int (length l1) + int (length l2)) \<and> sorted x3 \<and> sorted l2 else ((0 :: int) \<le> int (length l1) + int (length l2) \<and> int (length l1) + int (length x1) < int (length l1) + int (length l2)) \<and> sorted l1 \<and> sorted x1))"
  and "\<forall>(result :: elt list). (case l2 of Nil \<Rightarrow> (case l1 of Nil \<Rightarrow> result = l2 | _ \<Rightarrow> result = l1) | Cons x x1 \<Rightarrow> (case l1 of Nil \<Rightarrow> result = l2 | Cons x2 x3 \<Rightarrow> (if le x2 x then \<exists>(o1 :: elt list). (sorted o1 \<and> o1 <~~> x3 @ l2) \<and> result = Cons x2 o1 else \<exists>(o1 :: elt list). (sorted o1 \<and> o1 <~~> l1 @ x1) \<and> result = Cons x o1))) \<longrightarrow> sorted result \<and> result <~~> l1 @ l2"
  sorry
end
