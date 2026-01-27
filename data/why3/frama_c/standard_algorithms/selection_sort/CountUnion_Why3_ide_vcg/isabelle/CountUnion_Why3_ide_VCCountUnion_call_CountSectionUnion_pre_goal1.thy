theory CountUnion_Why3_ide_VCCountUnion_call_CountSectionUnion_pre_goal1
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Memory_Memory" "Why3STD.Cint_Cint"
begin
theorem goal1:
  fixes i_1 :: "int"
  fixes i :: "int"
  fixes a :: "addr"
  assumes fact0: "i_1 \<le> i"
  assumes fact1: "region (base a) \<le> (0 :: int)"
  assumes fact2: "is_uint32 i"
  assumes fact3: "is_uint32 i_1"
  shows "(0 :: int) \<le> i_1"
  sorry
end
