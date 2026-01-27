theory strncmp_Why3_ide_VCstrncmp_assert_goal3
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "../../lib/isabelle/Axiomatic3_Axiomatic3" "Why3STD.Memory_Memory" "Why3STD.Cint_Cint" "../../lib/isabelle/A_Strnlen_A_Strnlen" "../../lib/isabelle/Compound_Compound" "../../lib/isabelle/A_Strlen_A_Strlen"
begin
theorem goal3:
  fixes t_1 :: "addr \<Rightarrow> int"
  fixes a_1 :: "addr"
  fixes i :: "int"
  fixes a :: "addr"
  fixes i_1 :: "int"
  fixes t :: "int \<Rightarrow> int"
  shows "let x :: int = t_1 (shift a_1 i); x_1 :: int = t_1 (shift a i) in (0 :: int) \<le> i \<longrightarrow> region (base a) \<le> (0 :: int) \<longrightarrow> region (base a_1) \<le> (0 :: int) \<longrightarrow> i < l_strnlen t_1 a_1 i_1 \<longrightarrow> linked t \<longrightarrow> sconst t_1 \<longrightarrow> is_uint64 i_1 \<longrightarrow> p_valid_strn t t_1 a i_1 \<longrightarrow> p_valid_strn t t_1 a_1 i_1 \<longrightarrow> to_uint8 x = to_uint8 x_1 \<longleftrightarrow> x = x_1"
  sorry
end
