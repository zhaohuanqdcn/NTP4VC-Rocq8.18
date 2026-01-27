theory lemma_functions_LemmaFunction1_g
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
consts fact :: "int \<Rightarrow> int"
axiomatization where fact0:   "fact (0 :: int) = (1 :: int)"
axiomatization where factn:   "fact n = n * fact (n - (1 :: int))"
 if "(0 :: int) < n"
  for n :: "int"
theorem g:
  shows "(1 :: int) \<le> fact (42 :: int)"
  sorry
end
