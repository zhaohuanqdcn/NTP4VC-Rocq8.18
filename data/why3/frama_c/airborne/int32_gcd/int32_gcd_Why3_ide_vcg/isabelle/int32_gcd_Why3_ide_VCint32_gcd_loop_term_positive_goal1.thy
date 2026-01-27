theory int32_gcd_Why3_ide_VCint32_gcd_loop_term_positive_goal1
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Cint_Cint"
begin
theorem goal1:
  fixes i :: "int"
  assumes fact0: "\<not>i = (0 :: int)"
  assumes fact1: "is_uint32 i"
  shows "(0 :: int) \<le> i"
  sorry
end
