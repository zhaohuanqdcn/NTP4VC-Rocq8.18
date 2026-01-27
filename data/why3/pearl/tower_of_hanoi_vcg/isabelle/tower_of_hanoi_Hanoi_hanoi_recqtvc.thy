theory tower_of_hanoi_Hanoi_hanoi_recqtvc
  imports "NTP4Verif.NTP4Verif"
begin
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
consts prepend :: "int \<Rightarrow> int list \<Rightarrow> int list"
axiomatization where prepend_def_zero:   "prepend n s = s"
 if "n \<le> (0 :: int)"
  for n :: "int"
  and s :: "int list"
axiomatization where prepend_def_succ:   "prepend n s = prepend (n - (1 :: int)) (Cons n s)"
 if "(0 :: int) < n"
  for n :: "int"
  and s :: "int list"
theorem hanoi_rec'vc:
  fixes a :: "tower"
  fixes n :: "int"
  fixes s :: "int list"
  fixes b :: "tower"
  fixes c :: "tower"
  assumes fact0: "rod a = prepend n s"
  assumes fact1: "case rod b of Nil \<Rightarrow> True | Cons x _ \<Rightarrow> n < x"
  assumes fact2: "case rod c of Nil \<Rightarrow> True | Cons x _ \<Rightarrow> n < x"
  shows "if (0 :: int) < n then let t :: int list = rod c; o1 :: int list = Cons n s; o2 :: int = n - (1 :: int) in (((0 :: int) \<le> n \<and> o2 < n) \<and> rod a = prepend o2 o1 \<and> (case rod c of Nil \<Rightarrow> True | Cons x _ \<Rightarrow> o2 < x) \<and> (case rod b of Nil \<Rightarrow> True | Cons x _ \<Rightarrow> o2 < x)) \<and> (\<forall>(c1 :: tower) (b1 :: tower) (a1 :: tower). rod a1 = o1 \<and> rod c1 = prepend o2 (rod c) \<and> rod b1 = rod b \<longrightarrow> (rod a1 = Cons n s \<and> (case rod b1 of Nil \<Rightarrow> True | Cons x _ \<Rightarrow> n < x)) \<and> (\<forall>(b2 :: tower) (a2 :: tower). rod a2 = s \<and> rod b2 = Cons n (rod b1) \<longrightarrow> (let o3 :: int = n - (1 :: int) in (((0 :: int) \<le> n \<and> o3 < n) \<and> rod c1 = prepend o3 t \<and> (case rod b2 of Nil \<Rightarrow> True | Cons x _ \<Rightarrow> o3 < x) \<and> (case rod a2 of Nil \<Rightarrow> True | Cons x _ \<Rightarrow> o3 < x)) \<and> (\<forall>(c2 :: tower) (b3 :: tower) (a3 :: tower). rod c2 = t \<and> rod b3 = prepend o3 (rod b2) \<and> rod a3 = rod a2 \<longrightarrow> rod a3 = s \<and> rod b3 = prepend n (rod b) \<and> rod c2 = rod c)))) else rod a = s \<and> rod b = prepend n (rod b)"
  sorry
end
