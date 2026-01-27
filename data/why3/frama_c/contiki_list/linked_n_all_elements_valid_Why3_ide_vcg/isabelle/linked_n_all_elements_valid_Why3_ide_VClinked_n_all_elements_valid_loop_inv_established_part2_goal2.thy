theory linked_n_all_elements_valid_Why3_ide_VClinked_n_all_elements_valid_loop_inv_established_part2_goal2
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Memory_Memory" "Why3STD.Cint_Cint" "../../lib/isabelle/Compound_Compound" "../../lib/isabelle/S1_list_S1_list" "../../lib/isabelle/Axiomatic_Axiomatic"
begin
theorem goal2:
  fixes a :: "addr"
  fixes a_1 :: "addr"
  fixes a_2 :: "addr"
  fixes t_1 :: "addr \<Rightarrow> addr"
  fixes t :: "int \<Rightarrow> int"
  fixes i :: "int"
  fixes i_1 :: "int"
  assumes fact0: "region (base a) \<le> (0 :: int)"
  assumes fact1: "region (base a_1) \<le> (0 :: int)"
  assumes fact2: "region (base a_2) \<le> (0 :: int)"
  assumes fact3: "framed t_1"
  assumes fact4: "linked t"
  assumes fact5: "is_sint32 i"
  assumes fact6: "is_sint32 i_1"
  assumes fact7: "valid_rw t (shift a_2 (0 :: int)) (2147483646 :: int)"
  assumes fact8: "p_linked_n t t_1 a a_2 i_1 i a_1"
  shows "(0 :: int) \<le> i"
  sorry
end
