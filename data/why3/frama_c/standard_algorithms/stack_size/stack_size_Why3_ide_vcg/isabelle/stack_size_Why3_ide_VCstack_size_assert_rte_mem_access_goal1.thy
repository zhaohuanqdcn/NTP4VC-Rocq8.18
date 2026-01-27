theory stack_size_Why3_ide_VCstack_size_assert_rte_mem_access_goal1
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Memory_Memory" "Why3STD.Cint_Cint" "../../lib/isabelle/Compound_Compound" "../../lib/isabelle/Axiomatic_Axiomatic"
begin
theorem goal1:
  fixes a :: "addr"
  fixes t_2 :: "addr \<Rightarrow> addr"
  fixes t :: "int \<Rightarrow> int"
  fixes t_1 :: "addr \<Rightarrow> int"
  assumes fact0: "region (base a) \<le> (0 :: int)"
  assumes fact1: "framed t_2"
  assumes fact2: "linked t"
  assumes fact3: "valid_rw t a (3 :: int)"
  assumes fact4: "p_invariant t t_2 t_1 a"
  shows "valid_rd t (shift a (2 :: int)) (1 :: int)"
  sorry
end
