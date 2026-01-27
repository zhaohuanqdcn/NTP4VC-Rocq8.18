theory strcmp_Why3_ide_VCstrcmp_assert_goal1
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "../../lib/isabelle/Axiomatic3_Axiomatic3" "Why3STD.Memory_Memory" "../../lib/isabelle/Compound_Compound" "Why3STD.Cint_Cint" "../../lib/isabelle/A_Strlen_A_Strlen"
begin
theorem goal1:
  fixes t_1 :: "addr \<Rightarrow> int"
  fixes a_1 :: "addr"
  fixes a :: "addr"
  fixes t :: "int \<Rightarrow> int"
  shows "let x :: int = l_strlen t_1 a_1 in region (base a) \<le> (0 :: int) \<longrightarrow> region (base a_1) \<le> (0 :: int) \<longrightarrow> linked t \<longrightarrow> sconst t_1 \<longrightarrow> p_valid_str t t_1 a \<longrightarrow> p_valid_str t t_1 a_1 \<longrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<longrightarrow> i \<le> x \<longrightarrow> to_uint8 (t_1 (shift a_1 i)) = to_uint8 (t_1 (shift a i))) \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<longrightarrow> i \<le> x \<longrightarrow> t_1 (shift a_1 i) = t_1 (shift a i))"
  sorry
end
