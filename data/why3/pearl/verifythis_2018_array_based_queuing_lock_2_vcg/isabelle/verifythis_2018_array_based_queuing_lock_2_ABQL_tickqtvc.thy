theory verifythis_2018_array_based_queuing_lock_2_ABQL_tickqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
consts n :: "int"
axiomatization where N_val:   "(2 :: int) \<le> n"
consts k :: "int"
axiomatization where K_val:   "(2 :: int) \<le> k"
theorem tick'vc:
  shows "(0 :: int) \<le> (0 :: int)"
  and "(0 :: int) \<le> (0 :: int)"
  and "(0 :: int) < k * n"
  and "(0 :: int) = (0 :: int) emod (k * n)"
  sorry
end
