theory hillel_challenge_FulcrumNoOverflow_big_zeroqtvc
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
theorem big_zero'vc:
  shows "-((2147483647 :: int) + (1 :: int)) \<le> (0 :: int)"
  and "(0 :: int) \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)"
  and "(0 :: int) \<le> (0 :: int)"
  and "(0 :: int) \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)"
  and "(0 :: int) = (0 :: int) * ((2147483647 :: int) + (1 :: int)) + (0 :: int)"
  sorry
end
