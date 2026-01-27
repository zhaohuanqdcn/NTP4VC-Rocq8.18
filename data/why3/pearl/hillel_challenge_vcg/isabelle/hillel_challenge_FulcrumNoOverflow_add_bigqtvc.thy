theory hillel_challenge_FulcrumNoOverflow_add_bigqtvc
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
theorem add_big'vc:
  fixes b :: "big"
  fixes x :: "32 word"
  assumes fact0: "-((2147483647 :: int) + (1 :: int)) * ((2147483647 :: int) + (1 :: int)) \<le> v b + sint x"
  assumes fact1: "v b + sint x \<le> ((2147483647 :: int) + (1 :: int)) * ((2147483647 :: int) + (1 :: int)) - (1 :: int)"
  shows "if sint x < (0 :: int) then let o1 :: 32 word = r b in int'32_in_bounds (sint o1 + sint x) \<and> (\<forall>(r' :: 32 word). sint r' = sint o1 + sint x \<longrightarrow> (if sint r' < (0 :: int) then let o2 :: 32 word = q b in int'32_in_bounds (sint o2 - (1 :: int)) \<and> (\<forall>(o3 :: 32 word). sint o3 = sint o2 - (1 :: int) \<longrightarrow> int'32_in_bounds (sint r' + (1 :: int)) \<and> (\<forall>(o4 :: 32 word). sint o4 = sint r' + (1 :: int) \<longrightarrow> int'32_in_bounds (sint o4 + sint (2147483647 :: 32 word)) \<and> (\<forall>(o5 :: 32 word). sint o5 = sint o4 + sint (2147483647 :: 32 word) \<longrightarrow> (\<forall>(b1 :: big). ((-((2147483647 :: int) + (1 :: int)) \<le> sint o3 \<and> sint o3 \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)) \<and> ((0 :: int) \<le> sint o5 \<and> sint o5 \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)) \<and> v b + sint x = sint o3 * ((2147483647 :: int) + (1 :: int)) + sint o5) \<and> (v b + sint x = v b1 \<and> o5 = r b1 \<and> o3 = q b1 \<longrightarrow> v b1 = v b + sint x))))) else \<forall>(b1 :: big). ((-((2147483647 :: int) + (1 :: int)) \<le> sint (q b) \<and> sint (q b) \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)) \<and> ((0 :: int) \<le> sint r' \<and> sint r' \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)) \<and> v b + sint x = sint (q b) * ((2147483647 :: int) + (1 :: int)) + sint r') \<and> (v b + sint x = v b1 \<and> r' = r b1 \<and> q b = q b1 \<longrightarrow> v b1 = v b + sint x))) else int'32_in_bounds (sint (Groups.uminus_class.uminus (2147483648 :: 32 word)) + sint x) \<and> (\<forall>(o1 :: 32 word). sint o1 = sint (Groups.uminus_class.uminus (2147483648 :: 32 word)) + sint x \<longrightarrow> (let o2 :: 32 word = r b in int'32_in_bounds (sint o2 + sint o1) \<and> (\<forall>(r' :: 32 word). sint r' = sint o2 + sint o1 \<longrightarrow> (if sint r' < (0 :: int) then int'32_in_bounds (sint r' + (1 :: int)) \<and> (\<forall>(o3 :: 32 word). sint o3 = sint r' + (1 :: int) \<longrightarrow> int'32_in_bounds (sint o3 + sint (2147483647 :: 32 word)) \<and> (\<forall>(o4 :: 32 word). sint o4 = sint o3 + sint (2147483647 :: 32 word) \<longrightarrow> (\<forall>(b1 :: big). ((-((2147483647 :: int) + (1 :: int)) \<le> sint (q b) \<and> sint (q b) \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)) \<and> ((0 :: int) \<le> sint o4 \<and> sint o4 \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)) \<and> v b + sint x = sint (q b) * ((2147483647 :: int) + (1 :: int)) + sint o4) \<and> (v b + sint x = v b1 \<and> o4 = r b1 \<and> q b = q b1 \<longrightarrow> v b1 = v b + sint x)))) else let o3 :: 32 word = q b in int'32_in_bounds (sint o3 + (1 :: int)) \<and> (\<forall>(o4 :: 32 word). sint o4 = sint o3 + (1 :: int) \<longrightarrow> (\<forall>(b1 :: big). ((-((2147483647 :: int) + (1 :: int)) \<le> sint o4 \<and> sint o4 \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)) \<and> ((0 :: int) \<le> sint r' \<and> sint r' \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)) \<and> v b + sint x = sint o4 * ((2147483647 :: int) + (1 :: int)) + sint r') \<and> (v b + sint x = v b1 \<and> r' = r b1 \<and> o4 = q b1 \<longrightarrow> v b1 = v b + sint x)))))))"
  sorry
end
