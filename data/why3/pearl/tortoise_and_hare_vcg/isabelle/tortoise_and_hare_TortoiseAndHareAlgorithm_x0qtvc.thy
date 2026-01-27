theory tortoise_and_hare_TortoiseAndHareAlgorithm_x0qtvc
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
theorem x0'vc:
  shows "True"
  sorry
end
