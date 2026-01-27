theory toupper_Why3_ide_VCtoupper_assign_normal_goal3
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Cint_Cint"
begin
theorem goal3:
  fixes i :: "int"
  assumes fact0: "(0 :: int) \<le> i"
  assumes fact1: "i \<le> (255 :: int)"
  shows "\<not>is_sint32 i"
  sorry
end
