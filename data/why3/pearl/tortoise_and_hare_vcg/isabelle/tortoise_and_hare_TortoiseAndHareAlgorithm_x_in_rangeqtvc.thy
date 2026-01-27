theory tortoise_and_hare_TortoiseAndHareAlgorithm_x_in_rangeqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Iter" "Why3STD.pigeon_Pigeonhole"
begin
consts f :: "int \<Rightarrow> int"
consts m :: "int"
axiomatization where m_positive:   "(0 :: int) < m"
axiomatization where f_range'0:   "(0 :: int) \<le> f x"
 if "(0 :: int) \<le> x"
 and "x < m"
  for x :: "int"
axiomatization where f_range'1:   "f x < m"
 if "(0 :: int) \<le> x"
 and "x < m"
  for x :: "int"
consts x0 :: "int"
axiomatization where x0'def'0:   "(0 :: int) \<le> x0"
axiomatization where x0'def'1:   "x0 < m"
consts f_closure :: "int \<Rightarrow> int"
axiomatization where f_closure_def:   "f_closure y = f y"
  for y :: "int"
definition x :: "int \<Rightarrow> int"
  where "x i = iter f_closure i x0" for i
theorem x_in_range'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "(0 :: int) \<le> x n"
  and "x n < m"
  sorry
end
