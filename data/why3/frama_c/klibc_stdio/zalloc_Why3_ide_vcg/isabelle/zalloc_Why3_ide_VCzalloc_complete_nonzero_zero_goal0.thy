theory zalloc_Why3_ide_VCzalloc_complete_nonzero_zero_goal0
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Memory_Memory" "Why3STD.Cint_Cint"
begin
theorem goal0:
  fixes i :: "int"
  fixes t :: "int \<Rightarrow> int"
  fixes t_1 :: "addr \<Rightarrow> int"
  assumes fact0: "(0 :: int) \<le> i"
  assumes fact1: "linked t"
  assumes fact2: "sconst t_1"
  assumes fact3: "is_uint32 i"
  shows "i = (0 :: int) \<or> (0 :: int) < i"
  sorry
end
