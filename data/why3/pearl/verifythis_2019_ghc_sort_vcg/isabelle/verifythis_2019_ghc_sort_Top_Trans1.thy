theory verifythis_2019_ghc_sort_Top_Trans1
  imports "NTP4Verif.NTP4Verif" "Why3STD.exn_Exn"
begin
axiomatization where Trans:   "x < z"
 if "x < y"
 and "y < z"
  for x :: "int"
  and y :: "int"
  and z :: "int"
inductive sorted :: "int list \<Rightarrow> bool" where
   Sorted_Nil: "sorted (Nil :: int list)"
 | Sorted_One: "sorted (Cons x (Nil :: int list))" for x :: "int"
 | Sorted_Two: "x < y \<Longrightarrow> sorted (Cons y l) \<Longrightarrow> sorted (Cons x (Cons y l))" for x :: "int" and y :: "int" and l :: "int list"
axiomatization where sorted_mem:   "(\<forall>(y :: int). y \<in> set l \<longrightarrow> x < y) \<and> sorted l \<longleftrightarrow> sorted (Cons x l)"
  for l :: "int list"
  and x :: "int"
axiomatization where sorted_append:   "sorted l1 \<and> sorted l2 \<and> (\<forall>(x :: int) (y :: int). x \<in> set l1 \<longrightarrow> y \<in> set l2 \<longrightarrow> x < y) \<longleftrightarrow> sorted (l1 @ l2)"
  for l1 :: "int list"
  and l2 :: "int list"
theorem Trans1:
  fixes x :: "int"
  fixes y :: "int"
  fixes z :: "int"
  assumes fact0: "x \<le> y"
  assumes fact1: "y \<le> z"
  shows "x \<le> z"
  sorry
end
