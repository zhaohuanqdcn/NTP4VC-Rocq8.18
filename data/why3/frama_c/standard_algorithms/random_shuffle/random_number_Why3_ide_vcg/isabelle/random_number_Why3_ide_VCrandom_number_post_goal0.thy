theory random_number_Why3_ide_VCrandom_number_post_goal0
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Cint_Cint"
begin
theorem goal0:
  fixes i :: "int"
  fixes i_1 :: "int"
  assumes fact0: "(0 :: int) < i"
  assumes fact1: "(0 :: int) \<le> i_1"
  assumes fact2: "i_1 \<le> (2147483647 :: int)"
  assumes fact3: "i_1 \<le> (4294967295 :: int)"
  assumes fact4: "is_uint32 i"
  assumes fact5: "is_sint32 i_1"
  shows "to_uint32 (i_1 cmod i) < i"
  sorry
end
