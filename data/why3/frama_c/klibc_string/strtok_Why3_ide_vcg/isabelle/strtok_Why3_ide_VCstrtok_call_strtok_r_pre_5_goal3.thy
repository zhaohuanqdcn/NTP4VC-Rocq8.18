theory strtok_Why3_ide_VCstrtok_call_strtok_r_pre_5_goal3
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Memory_Memory" "../../lib/isabelle/Axiomatic_Axiomatic" "../../lib/isabelle/Compound_Compound" "../../lib/isabelle/A_Length_A_Length"
begin
theorem goal3:
  fixes a :: "addr"
  fixes a_1 :: "addr"
  fixes a_2 :: "addr"
  fixes t :: "int \<Rightarrow> int"
  fixes t_1 :: "addr \<Rightarrow> int"
  assumes fact0: "region (base a) \<le> (0 :: int)"
  assumes fact1: "region (base a_1) \<le> (0 :: int)"
  assumes fact2: "region (base a_2) \<le> (0 :: int)"
  assumes fact3: "linked t"
  assumes fact4: "sconst t_1"
  shows "separated (shift a (0 :: int)) ((1 :: int) + l_length t_1 a) (shift a_2 (0 :: int)) ((1 :: int) + l_length t_1 a_2)"
  sorry
end
