theory fputs_Why3_ide_VCfputs_call__fwrite_pre_2_goal2
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Memory_Memory" "../../lib/isabelle/Axiomatic_Axiomatic" "../../lib/isabelle/Compound_Compound" "Why3STD.Cint_Cint" "../../lib/isabelle/A_Length_A_Length" "../../lib/isabelle/Axiomatic3_Axiomatic3"
begin
theorem goal2:
  fixes a_1 :: "addr"
  fixes a_2 :: "addr"
  fixes t_3 :: "addr \<Rightarrow> addr"
  fixes t :: "int \<Rightarrow> int"
  fixes t_2 :: "addr \<Rightarrow> int"
  fixes i :: "int"
  fixes t_1 :: "addr \<Rightarrow> int"
  fixes a :: "addr"
  assumes fact0: "region (base a_1) \<le> (0 :: int)"
  assumes fact1: "region (base a_2) \<le> (0 :: int)"
  assumes fact2: "framed t_3"
  assumes fact3: "linked t"
  assumes fact4: "sconst t_2"
  assumes fact5: "is_sint32 (l_length t_2 a_1)"
  assumes fact6: "p_length_of_str_is t t_2 a_1 i"
  shows "p_valid_io_file_pvt t t_3 t_1 a"
  sorry
end
