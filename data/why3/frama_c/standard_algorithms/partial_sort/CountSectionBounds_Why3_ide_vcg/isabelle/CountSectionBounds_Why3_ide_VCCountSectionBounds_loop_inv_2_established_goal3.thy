theory CountSectionBounds_Why3_ide_VCCountSectionBounds_loop_inv_2_established_goal3
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Memory_Memory" "Why3STD.Cint_Cint" "../../lib/isabelle/A_Count_A_Count" "../../lib/isabelle/Compound_Compound" "../../lib/isabelle/Axiomatic_Axiomatic"
begin
theorem goal3:
  fixes t :: "addr \<Rightarrow> int"
  fixes a :: "addr"
  fixes i_2 :: "int"
  fixes i_1 :: "int"
  fixes i :: "int"
  shows "let x :: int = l_count_1' t a i_2 i_2 i_1 in i_2 \<le> i \<longrightarrow> region (base a) \<le> (0 :: int) \<longrightarrow> is_uint32 i \<longrightarrow> is_uint32 i_2 \<longrightarrow> is_sint32 i_1 \<longrightarrow> x \<le> (0 :: int) \<and> (0 :: int) \<le> x"
  sorry
end
