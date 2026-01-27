theory mergesort_list_Mergesort_mergesortqtvc
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
theorem mergesort'vc:
  fixes l :: "elt list"
  shows "case l of Nil \<Rightarrow> True | Cons _ Nil \<Rightarrow> True | _ \<Rightarrow> (2 :: int) \<le> int (length l) \<and> (\<forall>(l1 :: elt list) (l2 :: elt list). (1 :: int) \<le> int (length l1) \<and> (1 :: int) \<le> int (length l2) \<and> l <~~> l1 @ l2 \<longrightarrow> ((0 :: int) \<le> int (length l) \<and> length l2 < length l) \<and> (\<forall>(o1 :: elt list). sorted o1 \<and> o1 <~~> l2 \<longrightarrow> ((0 :: int) \<le> int (length l) \<and> length l1 < length l) \<and> (\<forall>(o2 :: elt list). sorted o2 \<and> o2 <~~> l1 \<longrightarrow> sorted o2 \<and> sorted o1)))"
  and "\<forall>(result :: elt list). (case l of Nil \<Rightarrow> result = l | Cons _ Nil \<Rightarrow> result = l | _ \<Rightarrow> (\<exists>(l1 :: elt list) (l2 :: elt list). ((1 :: int) \<le> int (length l1) \<and> (1 :: int) \<le> int (length l2) \<and> l <~~> l1 @ l2) \<and> (\<exists>(o1 :: elt list). (sorted o1 \<and> o1 <~~> l2) \<and> (\<exists>(o2 :: elt list). (sorted o2 \<and> o2 <~~> l1) \<and> sorted result \<and> result <~~> o2 @ o1)))) \<longrightarrow> sorted result \<and> result <~~> l"
  sorry
end
