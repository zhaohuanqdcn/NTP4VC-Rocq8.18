theory hillel_challenge_FulcrumNoOverflow_sub_bigqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Sum"
begin
typedecl  big
consts q :: "big \<Rightarrow> 32 word"
consts r :: "big \<Rightarrow> 32 word"
consts v :: "big \<Rightarrow> int"
axiomatization where big'invariant'0:   "-((2147483647 :: int) + (1 :: int)) \<le> sint (q self)"
  for self :: "big"
axiomatization where big'invariant'1:   "sint (q self) \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)"
  for self :: "big"
axiomatization where big'invariant'2:   "(0 :: int) \<le> sint (r self)"
  for self :: "big"
axiomatization where big'invariant'3:   "sint (r self) \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)"
  for self :: "big"
axiomatization where big'invariant'4:   "v self = sint (q self) * ((2147483647 :: int) + (1 :: int)) + sint (r self)"
  for self :: "big"
definition big'eq :: "big \<Rightarrow> big \<Rightarrow> _"
  where "big'eq a b \<longleftrightarrow> q a = q b \<and> r a = r b \<and> v a = v b" for a b
axiomatization where big'inj:   "a = b"
 if "big'eq a b"
  for a :: "big"
  and b :: "big"
consts big_zero :: "unit \<Rightarrow> big"
axiomatization where big_zero'def'0:   "q (big_zero x) = (0 :: 32 word)"
  for x :: "unit"
axiomatization where big_zero'def'1:   "r (big_zero x) = (0 :: 32 word)"
  for x :: "unit"
axiomatization where big_zero'def'2:   "v (big_zero x) = (0 :: int)"
  for x :: "unit"
theorem sub_big'vc:
  fixes b :: "big"
  fixes x :: "32 word"
  assumes fact0: "-((2147483647 :: int) + (1 :: int)) * ((2147483647 :: int) + (1 :: int)) \<le> v b - sint x"
  assumes fact1: "v b - sint x \<le> ((2147483647 :: int) + (1 :: int)) * ((2147483647 :: int) + (1 :: int)) - (1 :: int)"
  assumes fact2: "sint x = sint (Groups.uminus_class.uminus (2147483648 :: 32 word)) \<longrightarrow> x = Groups.uminus_class.uminus (2147483648 :: 32 word)"
  shows "if x = Groups.uminus_class.uminus (2147483648 :: 32 word) then let o1 :: 32 word = q b in int'32_in_bounds (sint o1 + (1 :: int)) \<and> (\<forall>(o2 :: 32 word). sint o2 = sint o1 + (1 :: int) \<longrightarrow> (\<forall>(b1 :: big). ((-((2147483647 :: int) + (1 :: int)) \<le> sint o2 \<and> sint o2 \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)) \<and> ((0 :: int) \<le> sint (r b) \<and> sint (r b) \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)) \<and> v b - sint x = sint o2 * ((2147483647 :: int) + (1 :: int)) + sint (r b)) \<and> (v b - sint x = v b1 \<and> r b = r b1 \<and> o2 = q b1 \<longrightarrow> v b1 = v b - sint x))) else int'32_in_bounds (-sint x) \<and> (\<forall>(o1 :: 32 word). sint o1 = -sint x \<longrightarrow> (-((2147483647 :: int) + (1 :: int)) * ((2147483647 :: int) + (1 :: int)) \<le> v b + sint o1 \<and> v b + sint o1 \<le> ((2147483647 :: int) + (1 :: int)) * ((2147483647 :: int) + (1 :: int)) - (1 :: int)) \<and> (\<forall>(b1 :: big). v b1 = v b + sint o1 \<longrightarrow> v b1 = v b - sint x))"
  sorry
end
