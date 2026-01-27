theory tower_of_hanoi_Tower_of_Hanoi_moveqtvc
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
typedecl  tower
consts rod :: "tower \<Rightarrow> int list"
axiomatization where tower'invariant:   "sorted (rod self)"
  for self :: "tower"
definition tower'eq :: "tower \<Rightarrow> tower \<Rightarrow> _"
  where "tower'eq a b \<longleftrightarrow> rod a = rod b" for a b
axiomatization where tower'inj:   "a = b"
 if "tower'eq a b"
  for a :: "tower"
  and b :: "tower"
theorem move'vc:
  fixes a :: "tower"
  fixes x :: "int"
  fixes s :: "int list"
  fixes b :: "tower"
  assumes fact0: "rod a = Cons x s"
  assumes fact1: "case rod b of Nil \<Rightarrow> True | Cons y _ \<Rightarrow> x < y"
  shows "case rod a of Cons x1 r \<Rightarrow> (\<forall>(a1 :: tower) (b1 :: tower). sorted r \<and> (r = rod a1 \<longrightarrow> sorted (Cons x1 (rod b)) \<and> (Cons x1 (rod b) = rod b1 \<longrightarrow> rod a1 = s \<and> rod b1 = Cons x (rod b)))) | Nil \<Rightarrow> False"
  sorry
end
