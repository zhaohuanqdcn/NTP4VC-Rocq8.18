theory isqrt_Simple_mainqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "./isqrt_Square"
begin
theorem main'vc:
  shows "(0 :: int) \<le> (17 :: int)"
  and "\<forall>(result :: int). isqrt_spec (17 :: int) result \<longrightarrow> result = (4 :: int)"
  sorry
end
