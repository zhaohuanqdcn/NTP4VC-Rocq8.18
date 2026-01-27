theory queens_bv_Bits_tqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded" "./queens_bv_S"
begin
theorem t'vc:
  shows "\<exists>(bv :: 32 word) (mdl :: int fset). \<forall>(i :: int). ((0 :: int) \<le> i \<and> i < (32 :: int)) \<and> (take_bit (nat i) bv \<noteq> (0)) = True \<longleftrightarrow> i |\<in>| mdl"
  sorry
end
