theory bitcount_BitCount8bit_fact_step1qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded" "Why3STD.Ref_Ref" "Why3STD.int_NumOf"
begin
definition nth_as_bv :: "8 word \<Rightarrow> 8 word \<Rightarrow> 8 word"
  where "nth_as_bv a i = (if (take_bit (unat i) a \<noteq> (0)) = True then 1 :: 8 word else (0 :: 8 word))" for a i
definition nth_as_int :: "8 word \<Rightarrow> int \<Rightarrow> int"
  where "nth_as_int a i = (if (take_bit (nat i) a \<noteq> (0)) = True then 1 :: int else (0 :: int))" for a i
consts nth_closure :: "8 word \<Rightarrow> int \<Rightarrow> bool"
axiomatization where nth_closure_def:   "nth_closure y y1 = (take_bit (nat y1) y \<noteq> (0))"
  for y :: "8 word"
  and y1 :: "int"
theorem step1'vc:
  fixes i :: "int"
  fixes n :: "8 word"
  assumes fact0: "(0 :: int) \<le> i"
  assumes fact1: "i < (4 :: int)"
  shows "uint ((n - ((n >> unat (1 :: 8 word)) AND (85 :: 8 word)) >> nat ((2 :: int) * i)) AND (3 :: 8 word)) = numof (nth_closure n) ((2 :: int) * i) ((2 :: int) * i + (2 :: int))"
  and "(n - ((n >> unat (1 :: 8 word)) AND (85 :: 8 word)) >> nat ((2 :: int) * i)) AND (3 :: 8 word) \<le> (2 :: 8 word)"
  sorry
end
