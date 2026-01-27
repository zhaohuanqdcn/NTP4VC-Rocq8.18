theory tower_of_hanoi_Tower_of_Hanoi_hanoi_recqtvc
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
theorem hanoi_rec'vc:
  fixes p :: "int list"
  fixes a :: "tower"
  fixes s :: "int list"
  fixes b :: "tower"
  fixes c :: "tower"
  assumes fact0: "sorted1 p"
  assumes fact1: "rod a = rev p @ s"
  assumes fact2: "compat p (rod b)"
  assumes fact3: "compat p (rod c)"
  shows "if (0 :: int) < int (length p) then let t :: int list = rod c in (case p of Cons x r \<Rightarrow> True | Nil \<Rightarrow> False) \<and> (\<forall>(x :: int) (r :: int list). (case p of Cons x1 r1 \<Rightarrow> x = x1 \<and> r = r1 | Nil \<Rightarrow> False) \<longrightarrow> (let o1 :: int list = Cons x s; o2 :: int = int (length p) - (1 :: int) in (((0 :: int) \<le> int (length p) \<and> o2 < int (length p)) \<and> (int (length r) = o2 \<and> sorted1 r) \<and> rod a = rev r @ o1 \<and> compat r (rod c) \<and> compat r (rod b)) \<and> (\<forall>(c1 :: tower) (b1 :: tower) (a1 :: tower). rod a1 = o1 \<and> rod c1 = rev r @ rod c \<and> rod b1 = rod b \<longrightarrow> (rod a1 = Cons x s \<and> (case rod b1 of Nil \<Rightarrow> True | Cons y _ \<Rightarrow> x < y)) \<and> (\<forall>(b2 :: tower) (a2 :: tower). rod a2 = s \<and> rod b2 = Cons x (rod b1) \<longrightarrow> (let o3 :: int = int (length p) - (1 :: int) in (((0 :: int) \<le> int (length p) \<and> o3 < int (length p)) \<and> (int (length r) = o3 \<and> sorted1 r) \<and> rod c1 = rev r @ t \<and> compat r (rod b2) \<and> compat r (rod a2)) \<and> (\<forall>(c2 :: tower) (b3 :: tower) (a3 :: tower). rod c2 = t \<and> rod b3 = rev r @ rod b2 \<and> rod a3 = rod a2 \<longrightarrow> rod a3 = s \<and> rod b3 = rev p @ rod b \<and> rod c2 = rod c)))))) else rod a = s \<and> rod b = rev p @ rod b"
  sorry
end
