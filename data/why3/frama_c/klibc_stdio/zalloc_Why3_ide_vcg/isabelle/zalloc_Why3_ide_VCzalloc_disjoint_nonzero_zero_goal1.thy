theory zalloc_Why3_ide_VCzalloc_disjoint_nonzero_zero_goal1
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Memory_Memory" "Why3STD.Cint_Cint"
begin
theorem goal1:
  fixes t :: "int \<Rightarrow> int"
  fixes t_1 :: "addr \<Rightarrow> int"
  assumes fact0: "(0 :: int) \<le> (0 :: int)"
  assumes fact1: "linked t"
  assumes fact2: "sconst t_1"
  assumes fact3: "is_uint32 (0 :: int)"
  shows "\<not>True \<or> (0 :: int) \<le> (0 :: int)"
  sorry
end
