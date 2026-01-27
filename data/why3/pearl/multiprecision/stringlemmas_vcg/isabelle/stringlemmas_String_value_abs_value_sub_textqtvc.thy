theory stringlemmas_String_value_abs_value_sub_textqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_Const" "Why3STD.map_MapEq" "../../lib/isabelle/stringlemmas_String_lemmas" "../../lib/isabelle/lemmas_Lemmas" "mach.int_Unsigned" "mach.c_C" "mach.c_String" "mach.c_UChar" "../../lib/isabelle/types_Config" "../../lib/isabelle/types_Types" "../../lib/isabelle/types_Int32Eq" "../../lib/isabelle/types_UInt64Eq" "../../lib/isabelle/stringlemmas_Conversions"
begin
theorem abs_value_sub_text'vc:
  fixes n :: "int"
  fixes m :: "int"
  assumes fact0: "n < m"
  shows "(0 :: int) \<le> m - n"
  and "m - (1 :: int) - n < m - n"
  sorry
end
