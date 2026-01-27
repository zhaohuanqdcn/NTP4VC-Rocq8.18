theory insertion_sort_list_InsertionSort_insertion_sortqtvc
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
theorem insertion_sort'vc:
  fixes l :: "elt list"
  shows "case l of Nil \<Rightarrow> True | Cons x r \<Rightarrow> (case l of Nil \<Rightarrow> False | Cons _ f \<Rightarrow> f = r) \<and> (\<forall>(o1 :: elt list). sorted o1 \<and> r <~~> o1 \<longrightarrow> sorted o1)"
  and "\<forall>(result :: elt list). (case l of Nil \<Rightarrow> result = (Nil :: elt list) | Cons x r \<Rightarrow> (\<exists>(o1 :: elt list). (sorted o1 \<and> r <~~> o1) \<and> sorted result \<and> Cons x o1 <~~> result)) \<longrightarrow> sorted result \<and> l <~~> result"
  sorry
end
