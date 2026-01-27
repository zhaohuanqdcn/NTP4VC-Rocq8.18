theory isalpha_Why3_ide_VCisalpha_post_goal0
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "../../lib/isabelle/Axiomatic3_Axiomatic3" "Why3STD.Cint_Cint" "../../lib/isabelle/A_Ctype_A_Ctype" "Why3STD.Cbits_Cbits"
begin
theorem goal0:
  fixes t :: "int \<Rightarrow> int"
  fixes i :: "int"
  shows "let x :: int = t (to_uint8 i) in is_sint8 i \<longrightarrow> is_uint8 x \<longrightarrow> p_isalpha i \<longleftrightarrow> \<not>land (3 :: int) x = (0 :: int)"
  sorry
end
