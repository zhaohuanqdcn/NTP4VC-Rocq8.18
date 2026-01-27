theory CountBounds_Why3_ide_VCCountBounds_call_CountSectionBounds_pre_goal1
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Memory_Memory" "Why3STD.Cint_Cint"
begin
theorem goal1:
  fixes a :: "addr"
  fixes i :: "int"
  assumes fact0: "region (base a) \<le> (0 :: int)"
  assumes fact1: "is_uint32 i"
  shows "(0 :: int) \<le> i"
  sorry
end
