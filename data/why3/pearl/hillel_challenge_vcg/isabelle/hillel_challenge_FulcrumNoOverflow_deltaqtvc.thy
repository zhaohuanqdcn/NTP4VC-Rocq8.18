theory hillel_challenge_FulcrumNoOverflow_deltaqtvc
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
theorem delta'vc:
  fixes x :: "big"
  fixes y :: "big"
  assumes fact0: "-((2147483647 :: int) + (1 :: int)) * ((2147483647 :: int) + (1 :: int)) \<le> abs (v x - v y)"
  assumes fact1: "abs (v x - v y) \<le> ((2147483647 :: int) + (1 :: int)) * ((2147483647 :: int) + (1 :: int)) - (1 :: int)"
  shows "let o1 :: 32 word = r x; o2 :: 32 word = r y in int'32_in_bounds (sint o2 - sint o1) \<and> (\<forall>(r1 :: 32 word). sint r1 = sint o2 - sint o1 \<longrightarrow> (let v1 :: int = abs (v x - v y) in (if sint (q y) < sint (q x) then if (0 :: int) < sint r1 then int'32_in_bounds (-sint r1) \<and> (\<forall>(o3 :: 32 word). sint o3 = -sint r1 \<longrightarrow> int'32_in_bounds (sint o3 + (1 :: int)) \<and> (\<forall>(o4 :: 32 word). sint o4 = sint o3 + (1 :: int) \<longrightarrow> int'32_in_bounds (sint o4 + sint (2147483647 :: 32 word)) \<and> (\<forall>(o5 :: 32 word). sint o5 = sint o4 + sint (2147483647 :: 32 word) \<longrightarrow> (let o6 :: 32 word = q y; o7 :: 32 word = q x in int'32_in_bounds (sint o7 - (1 :: int)) \<and> (\<forall>(o8 :: 32 word). sint o8 = sint o7 - (1 :: int) \<longrightarrow> int'32_in_bounds (sint o8 - sint o6) \<and> (\<forall>(o9 :: 32 word). sint o9 = sint o8 - sint o6 \<longrightarrow> (-((2147483647 :: int) + (1 :: int)) \<le> sint o9 \<and> sint o9 \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)) \<and> ((0 :: int) \<le> sint o5 \<and> sint o5 \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)) \<and> v1 = sint o9 * ((2147483647 :: int) + (1 :: int)) + sint o5)))))) else int'32_in_bounds (-sint r1) \<and> (\<forall>(o3 :: 32 word). sint o3 = -sint r1 \<longrightarrow> (let o4 :: 32 word = q y; o5 :: 32 word = q x in int'32_in_bounds (sint o5 - sint o4) \<and> (\<forall>(o6 :: 32 word). sint o6 = sint o5 - sint o4 \<longrightarrow> (-((2147483647 :: int) + (1 :: int)) \<le> sint o6 \<and> sint o6 \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)) \<and> ((0 :: int) \<le> sint o3 \<and> sint o3 \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)) \<and> v1 = sint o6 * ((2147483647 :: int) + (1 :: int)) + sint o3))) else let o3 :: 32 word = q x; o4 :: 32 word = q y in (sint o4 = sint o3 \<longrightarrow> o4 = o3) \<longrightarrow> (if o4 = o3 then if sint r1 < (0 :: int) then int'32_in_bounds (-sint r1) \<and> (\<forall>(o5 :: 32 word). sint o5 = -sint r1 \<longrightarrow> (-((2147483647 :: int) + (1 :: int)) \<le> (0 :: int) \<and> (0 :: int) \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)) \<and> ((0 :: int) \<le> sint o5 \<and> sint o5 \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)) \<and> v1 = (0 :: int) * ((2147483647 :: int) + (1 :: int)) + sint o5) else (-((2147483647 :: int) + (1 :: int)) \<le> (0 :: int) \<and> (0 :: int) \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)) \<and> ((0 :: int) \<le> sint r1 \<and> sint r1 \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)) \<and> v1 = (0 :: int) * ((2147483647 :: int) + (1 :: int)) + sint r1 else if sint r1 < (0 :: int) then int'32_in_bounds (sint r1 + (1 :: int)) \<and> (\<forall>(o5 :: 32 word). sint o5 = sint r1 + (1 :: int) \<longrightarrow> int'32_in_bounds (sint o5 + sint (2147483647 :: 32 word)) \<and> (\<forall>(o6 :: 32 word). sint o6 = sint o5 + sint (2147483647 :: 32 word) \<longrightarrow> (let o7 :: 32 word = q x; o8 :: 32 word = q y in int'32_in_bounds (sint o8 - (1 :: int)) \<and> (\<forall>(o9 :: 32 word). sint o9 = sint o8 - (1 :: int) \<longrightarrow> int'32_in_bounds (sint o9 - sint o7) \<and> (\<forall>(o10 :: 32 word). sint o10 = sint o9 - sint o7 \<longrightarrow> (-((2147483647 :: int) + (1 :: int)) \<le> sint o10 \<and> sint o10 \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)) \<and> ((0 :: int) \<le> sint o6 \<and> sint o6 \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)) \<and> v1 = sint o10 * ((2147483647 :: int) + (1 :: int)) + sint o6))))) else let o5 :: 32 word = q x; o6 :: 32 word = q y in int'32_in_bounds (sint o6 - sint o5) \<and> (\<forall>(o7 :: 32 word). sint o7 = sint o6 - sint o5 \<longrightarrow> (-((2147483647 :: int) + (1 :: int)) \<le> sint o7 \<and> sint o7 \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)) \<and> ((0 :: int) \<le> sint r1 \<and> sint r1 \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)) \<and> v1 = sint o7 * ((2147483647 :: int) + (1 :: int)) + sint r1))) \<and> (\<forall>(result :: big) (result_v :: int) (result_r :: 32 word) (result_q :: 32 word). (if sint (q y) < sint (q x) then if (0 :: int) < sint r1 then \<exists>(o3 :: 32 word). sint o3 = -sint r1 \<and> (\<exists>(o4 :: 32 word). sint o4 = sint o3 + (1 :: int) \<and> sint (r result) = sint o4 + sint (2147483647 :: 32 word) \<and> (\<exists>(o5 :: 32 word). sint o5 = sint (q x) - (1 :: int) \<and> sint (q result) = sint o5 - sint (q y) \<and> (result_v = v result \<and> result_r = r result \<and> result_q = q result) \<and> v result = v1)) else sint (r result) = -sint r1 \<and> sint (q result) = sint (q x) - sint (q y) \<and> (result_v = v result \<and> result_r = r result \<and> result_q = q result) \<and> v result = v1 else let o3 :: 32 word = q x; o4 :: 32 word = q y in (sint o4 = sint o3 \<longrightarrow> o4 = o3) \<and> (if o4 = o3 then if sint r1 < (0 :: int) then sint (r result) = -sint r1 \<and> (result_v = v result \<and> result_r = r result \<and> result_q = q result) \<and> q result = (0 :: 32 word) \<and> v result = v1 else (result_v = v result \<and> result_r = r result \<and> result_q = q result) \<and> q result = (0 :: 32 word) \<and> r result = r1 \<and> v result = v1 else if sint r1 < (0 :: int) then \<exists>(o5 :: 32 word). sint o5 = sint r1 + (1 :: int) \<and> sint (r result) = sint o5 + sint (2147483647 :: 32 word) \<and> (\<exists>(o6 :: 32 word). sint o6 = sint (q y) - (1 :: int) \<and> sint (q result) = sint o6 - sint (q x) \<and> (result_v = v result \<and> result_r = r result \<and> result_q = q result) \<and> v result = v1) else sint (q result) = sint (q y) - sint (q x) \<and> (result_v = v result \<and> result_r = r result \<and> result_q = q result) \<and> r result = r1 \<and> v result = v1)) \<longrightarrow> v result = abs (v x - v y))))"
  sorry
end
