theory stringlemmas_String_lemmas_in_base_concatqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_Const" "Why3STD.map_MapEq" "../../lib/isabelle/lemmas_Lemmas" "mach.int_Unsigned" "mach.c_C" "mach.c_UChar" "../../lib/isabelle/types_Config" "../../lib/isabelle/types_Types" "../../lib/isabelle/types_Int32Eq" "../../lib/isabelle/types_UInt64Eq"
begin
definition in_base :: "int \<Rightarrow> (int \<Rightarrow> 8 word) \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "in_base b x n m \<longleftrightarrow> (\<forall>(i :: int). n \<le> i \<and> i < m \<longrightarrow> (0 :: int) \<le> uint (x i) \<and> uint (x i) < b)" for b x n m
theorem in_base_concat'vc:
  fixes b :: "int"
  fixes x :: "int \<Rightarrow> 8 word"
  fixes n :: "int"
  fixes m :: "int"
  fixes l :: "int"
  assumes fact0: "in_base b x n m"
  assumes fact1: "in_base b x m l"
  shows "in_base b x n l"
  sorry
end
