theory mergesort_list_EfficientMerge_merge_auxqtvc
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
theorem merge_aux'vc:
  fixes acc :: "elt list"
  fixes l1 :: "elt list"
  fixes l2 :: "elt list"
  assumes fact0: "sorted (rev acc)"
  assumes fact1: "sorted l1"
  assumes fact2: "sorted l2"
  assumes fact3: "\<forall>(x :: elt) (y :: elt). x \<in> set acc \<longrightarrow> y \<in> set l1 \<longrightarrow> le x y"
  assumes fact4: "\<forall>(x :: elt) (y :: elt). x \<in> set acc \<longrightarrow> y \<in> set l2 \<longrightarrow> le x y"
  shows "case l2 of Nil \<Rightarrow> (case l1 of Nil \<Rightarrow> True | _ \<Rightarrow> True) | Cons x x1 \<Rightarrow> (case l1 of Nil \<Rightarrow> True | Cons x2 x3 \<Rightarrow> (if le x2 x then let o1 :: elt list = Cons x2 acc in ((0 :: int) \<le> int (length l1) + int (length l2) \<and> int (length x3) + int (length l2) < int (length l1) + int (length l2)) \<and> (sorted (rev o1) \<and> sorted x3 \<and> sorted l2) \<and> (\<forall>(x4 :: elt) (y :: elt). x4 \<in> set o1 \<longrightarrow> y \<in> set x3 \<longrightarrow> le x4 y) \<and> (\<forall>(x4 :: elt) (y :: elt). x4 \<in> set o1 \<longrightarrow> y \<in> set l2 \<longrightarrow> le x4 y) else let o1 :: elt list = Cons x acc in ((0 :: int) \<le> int (length l1) + int (length l2) \<and> int (length l1) + int (length x1) < int (length l1) + int (length l2)) \<and> (sorted (rev o1) \<and> sorted l1 \<and> sorted x1) \<and> (\<forall>(x4 :: elt) (y :: elt). x4 \<in> set o1 \<longrightarrow> y \<in> set l1 \<longrightarrow> le x4 y) \<and> (\<forall>(x4 :: elt) (y :: elt). x4 \<in> set o1 \<longrightarrow> y \<in> set x1 \<longrightarrow> le x4 y)))"
  and "\<forall>(result :: elt list). (case l2 of Nil \<Rightarrow> (case l1 of Nil \<Rightarrow> result = rev acc @ l2 | _ \<Rightarrow> result = rev acc @ l1) | Cons x x1 \<Rightarrow> (case l1 of Nil \<Rightarrow> result = rev acc @ l2 | Cons x2 x3 \<Rightarrow> (if le x2 x then sorted result \<and> result <~~> (Cons x2 acc @ x3) @ l2 else sorted result \<and> result <~~> (Cons x acc @ l1) @ x1))) \<longrightarrow> sorted result \<and> result <~~> (acc @ l1) @ l2"
  sorry
end
