theory tower_of_hanoi_Hanoi_tower_of_hanoiqtvc
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
theorem tower_of_hanoi'vc:
  fixes a :: "tower"
  fixes b :: "tower"
  fixes c :: "tower"
  assumes fact0: "rod a = prepend (int (length (rod a))) (Nil :: int list)"
  assumes fact1: "rod b = rod c"
  assumes fact2: "rod c = (Nil :: int list)"
  shows "let o1 :: int list = (Nil :: int list); o2 :: int = int (length (rod a)) in (rod a = prepend o2 o1 \<and> (case rod b of Nil \<Rightarrow> True | Cons x _ \<Rightarrow> o2 < x) \<and> (case rod c of Nil \<Rightarrow> True | Cons x _ \<Rightarrow> o2 < x)) \<and> (\<forall>(c1 :: tower) (b1 :: tower) (a1 :: tower). rod a1 = o1 \<and> rod b1 = prepend o2 (rod b) \<and> rod c1 = rod c \<longrightarrow> rod b1 = rod a \<and> rod a1 = rod c1 \<and> rod c1 = (Nil :: int list))"
  sorry
end
