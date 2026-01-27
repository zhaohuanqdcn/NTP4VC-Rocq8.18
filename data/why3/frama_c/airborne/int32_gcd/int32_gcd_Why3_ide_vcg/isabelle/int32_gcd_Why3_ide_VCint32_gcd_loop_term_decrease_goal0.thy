theory int32_gcd_Why3_ide_VCint32_gcd_loop_term_decrease_goal0
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Cint_Cint"
begin
theorem goal0:
  fixes i :: "int"
  fixes i_1 :: "int"
  assumes fact0: "\<not>i = (0 :: int)"
  assumes fact1: "is_uint32 i"
  assumes fact2: "is_uint32 i_1"
  shows "to_uint32 (i_1 cmod i) < i"
  sorry
end
