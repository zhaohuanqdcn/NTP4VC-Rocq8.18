theory queens_bv_BitsSpec_tqtvc
  imports "NTP4Verif.NTP4Verif" "./queens_bv_S"
begin
theorem t'vc:
  shows "\<exists>(mdl :: int fset). \<forall>(i :: int). i |\<in>| mdl \<longrightarrow> (0 :: int) \<le> i \<and> i < (32 :: int)"
  sorry
end
