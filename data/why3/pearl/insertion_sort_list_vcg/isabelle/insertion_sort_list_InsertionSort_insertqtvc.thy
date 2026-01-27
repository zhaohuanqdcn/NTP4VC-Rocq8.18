theory insertion_sort_list_InsertionSort_insertqtvc
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
theorem insert'vc:
  fixes l :: "elt list"
  fixes x :: "elt"
  assumes fact0: "sorted l"
  shows "case l of Nil \<Rightarrow> True | Cons y r \<Rightarrow> \<not>le x y \<longrightarrow> (case l of Nil \<Rightarrow> False | Cons _ f \<Rightarrow> f = r) \<and> sorted r"
  and "\<forall>(result :: elt list). (case l of Nil \<Rightarrow> result = Cons x (Nil :: elt list) | Cons y r \<Rightarrow> (if le x y then result = Cons x l else \<exists>(o1 :: elt list). (sorted o1 \<and> Cons x r <~~> o1) \<and> result = Cons y o1)) \<longrightarrow> sorted result \<and> Cons x l <~~> result"
  sorry
end
