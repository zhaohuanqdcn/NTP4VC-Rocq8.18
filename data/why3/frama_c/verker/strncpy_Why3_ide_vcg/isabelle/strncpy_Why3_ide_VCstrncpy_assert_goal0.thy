theory strncpy_Why3_ide_VCstrncpy_assert_goal0
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "../../lib/isabelle/Axiomatic3_Axiomatic3" "Why3STD.Memory_Memory" "Why3STD.Cint_Cint" "../../lib/isabelle/A_Strlen_A_Strlen" "../../lib/isabelle/Compound_Compound" "../../lib/isabelle/A_Strnlen_A_Strnlen"
begin
theorem goal0:
  fixes a_1 :: "addr"
  fixes a :: "addr"
  fixes t :: "int \<Rightarrow> int"
  fixes t_1 :: "addr \<Rightarrow> int"
  fixes i :: "int"
  shows "let x :: int = base a_1; x_1 :: int = base a in \<not>x = x_1 \<longrightarrow> region x_1 \<le> (0 :: int) \<longrightarrow> region x \<le> (0 :: int) \<longrightarrow> linked t \<longrightarrow> sconst t_1 \<longrightarrow> is_uint64 i \<longrightarrow> p_valid_str t t_1 a \<longrightarrow> valid_rw t (shift a_1 (0 :: int)) ((1 :: int) + l_strnlen t_1 a i) \<longrightarrow> p_valid_strn t t_1 a i"
  sorry
end
