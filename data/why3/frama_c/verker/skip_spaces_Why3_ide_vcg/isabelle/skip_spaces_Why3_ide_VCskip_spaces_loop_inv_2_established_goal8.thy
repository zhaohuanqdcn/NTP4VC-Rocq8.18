theory skip_spaces_Why3_ide_VCskip_spaces_loop_inv_2_established_goal8
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "../../lib/isabelle/Axiomatic3_Axiomatic3" "Why3STD.Memory_Memory" "Why3STD.Cint_Cint" "../../lib/isabelle/A_Strlen_A_Strlen" "../../lib/isabelle/Compound_Compound"
begin
theorem goal8:
  fixes a :: "addr"
  fixes t :: "int \<Rightarrow> int"
  fixes t_1 :: "addr \<Rightarrow> int"
  assumes fact0: "region (base a) \<le> (0 :: int)"
  assumes fact1: "linked t"
  assumes fact2: "sconst t_1"
  assumes fact3: "p_valid_str t t_1 a"
  shows "addr_le a a"
  and "addr_le a (shift a (l_strlen t_1 a))"
  sorry
end
