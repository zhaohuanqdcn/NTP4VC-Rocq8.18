theory strim_Why3_ide_VCstrim_complete_len_zero_len_goal0
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "../../lib/isabelle/Axiomatic3_Axiomatic3" "Why3STD.Memory_Memory" "../../lib/isabelle/A_Strlen_A_Strlen" "../../lib/isabelle/Compound_Compound" "Why3STD.Cint_Cint"
begin
theorem goal0:
  fixes t_1 :: "addr \<Rightarrow> int"
  fixes a :: "addr"
  fixes t :: "int \<Rightarrow> int"
  shows "let x :: int = l_strlen t_1 a in region (base a) \<le> (0 :: int) \<longrightarrow> linked t \<longrightarrow> sconst t_1 \<longrightarrow> p_valid_str t t_1 a \<longrightarrow> x = (0 :: int) \<or> (0 :: int) < x"
  sorry
end
