theory tower_of_hanoi_Tower_of_Hanoi_towerqtvc
  imports "NTP4Verif.NTP4Verif"
begin
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
inductive sorted1 :: "int list \<Rightarrow> bool" where
   Sorted_Nil1: "sorted1 (Nil :: int list)"
 | Sorted_One1: "sorted1 (Cons x (Nil :: int list))" for x :: "int"
 | Sorted_Two1: "y < x \<Longrightarrow> sorted1 (Cons y l) \<Longrightarrow> sorted1 (Cons x (Cons y l))" for y :: "int" and x :: "int" and l :: "int list"
axiomatization where sorted_mem1:   "(\<forall>(y :: int). y \<in> set l \<longrightarrow> y < x) \<and> sorted1 l \<longleftrightarrow> sorted1 (Cons x l)"
  for l :: "int list"
  and x :: "int"
axiomatization where sorted_append1:   "sorted1 l1 \<and> sorted1 l2 \<and> (\<forall>(x :: int) (y :: int). x \<in> set l1 \<longrightarrow> y \<in> set l2 \<longrightarrow> y < x) \<longleftrightarrow> sorted1 (l1 @ l2)"
  for l1 :: "int list"
  and l2 :: "int list"
definition compat :: "int list \<Rightarrow> int list \<Rightarrow> _"
  where "compat s t \<longleftrightarrow> (case (s, t) of (Cons x _, Cons y _) \<Rightarrow> x < y | (_, _) \<Rightarrow> True)" for s t
axiomatization where rev_append_sorted_incr:   "sorted (rev s @ t) \<longleftrightarrow> sorted1 s \<and> sorted t \<and> compat s t"
  for s :: "int list"
  and t :: "int list"
axiomatization where rev_append_sorted_decr:   "sorted1 (rev s @ t) \<longleftrightarrow> sorted s \<and> sorted1 t \<and> compat t s"
  for s :: "int list"
  and t :: "int list"
theorem tower'vc:
  shows "\<exists>(rod :: int list). sorted rod"
  sorry
end
