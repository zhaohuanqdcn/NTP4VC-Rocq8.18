theory mergesort_list_Mergesort_splitqtvc
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
theorem split'vc:
  fixes l0 :: "'a list"
  assumes fact0: "(2 :: int) \<le> int (length l0)"
  shows "\<forall>(l1 :: 'a list) (l2 :: 'a list) (l :: 'a list). length l2 = length l1 \<or> int (length l2) = int (length l1) + (1 :: int) \<longrightarrow> (case l of (Nil :: 'a list) \<Rightarrow> True | Cons x r \<Rightarrow> (let o1 :: 'a list = Cons x l1 in ((0 :: int) \<le> int (length l) \<and> length r < length l) \<and> (length o1 = length l2 \<or> int (length o1) = int (length l2) + (1 :: int)))) \<and> (\<forall>(r1 :: 'a list) (r2 :: 'a list). (case l of (Nil :: 'a list) \<Rightarrow> r1 = l1 \<and> r2 = l2 | Cons x r \<Rightarrow> (length r2 = length r1 \<or> int (length r2) = int (length r1) + (1 :: int)) \<and> r1 @ r2 <~~> l2 @ Cons x l1 @ r) \<longrightarrow> (length r2 = length r1 \<or> int (length r2) = int (length r1) + (1 :: int)) \<and> r1 @ r2 <~~> l1 @ l2 @ l)"
  and "let o1 :: 'a list = (Nil :: 'a list); o2 :: 'a list = (Nil :: 'a list) in (length o1 = length o2 \<or> int (length o1) = int (length o2) + (1 :: int)) \<and> (\<forall>(l1 :: 'a list) (l2 :: 'a list). (length l2 = length l1 \<or> int (length l2) = int (length l1) + (1 :: int)) \<and> l1 @ l2 <~~> o2 @ o1 @ l0 \<longrightarrow> (1 :: int) \<le> int (length l1) \<and> (1 :: int) \<le> int (length l2) \<and> l0 <~~> l1 @ l2)"
  sorry
end
