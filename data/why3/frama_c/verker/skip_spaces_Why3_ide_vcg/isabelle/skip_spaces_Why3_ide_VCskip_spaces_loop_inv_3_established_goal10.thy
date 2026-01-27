theory skip_spaces_Why3_ide_VCskip_spaces_loop_inv_3_established_goal10
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "../../lib/isabelle/Axiomatic3_Axiomatic3" "Why3STD.Memory_Memory" "Why3STD.Cint_Cint" "../../lib/isabelle/A_Ctype_A_Ctype" "../../lib/isabelle/A_Strlen_A_Strlen" "../../lib/isabelle/Compound_Compound"
begin
theorem goal10:
  fixes a :: "addr"
  fixes t :: "int \<Rightarrow> int"
  fixes t_1 :: "addr \<Rightarrow> int"
  fixes a_1 :: "addr"
  assumes fact0: "region (base a) \<le> (0 :: int)"
  assumes fact1: "linked t"
  assumes fact2: "sconst t_1"
  assumes fact3: "addr_lt a_1 a"
  assumes fact4: "addr_le a a_1"
  assumes fact5: "p_valid_str t t_1 a"
  shows "p_isspace (t_1 a_1)"
  sorry
end
