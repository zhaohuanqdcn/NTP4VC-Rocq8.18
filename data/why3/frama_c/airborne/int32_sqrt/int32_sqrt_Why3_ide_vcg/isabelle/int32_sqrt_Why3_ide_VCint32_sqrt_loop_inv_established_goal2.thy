theory int32_sqrt_Why3_ide_VCint32_sqrt_loop_inv_established_goal2
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Cint_Cint"
begin
theorem goal2:
  fixes i :: "int"
  assumes fact0: "\<not>i = (0 :: int)"
  assumes fact1: "(0 :: int) \<le> i"
  assumes fact2: "i \<le> (2147483647 :: int)"
  assumes fact3: "is_uint32 i"
  shows "(0 :: int) < i"
  sorry
end
