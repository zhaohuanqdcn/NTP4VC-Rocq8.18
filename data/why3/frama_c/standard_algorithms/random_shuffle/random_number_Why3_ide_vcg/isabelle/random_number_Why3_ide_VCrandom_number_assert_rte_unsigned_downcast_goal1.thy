theory random_number_Why3_ide_VCrandom_number_assert_rte_unsigned_downcast_goal1
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Cint_Cint"
begin
theorem goal1:
  fixes i_1 :: "int"
  fixes i :: "int"
  assumes fact0: "(0 :: int) < i_1"
  assumes fact1: "(0 :: int) \<le> i"
  assumes fact2: "i \<le> (2147483647 :: int)"
  assumes fact3: "is_uint32 i_1"
  assumes fact4: "is_sint32 i"
  shows "i \<le> (4294967295 :: int)"
  sorry
end
