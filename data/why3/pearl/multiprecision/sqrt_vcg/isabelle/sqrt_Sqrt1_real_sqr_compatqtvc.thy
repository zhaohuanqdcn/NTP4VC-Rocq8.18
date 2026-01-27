theory sqrt_Sqrt1_real_sqr_compatqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_Const" "Why3STD.map_MapEq" "Why3STD.real_Truncate" "mach.int_Unsigned" "mach.c_C" "../../lib/isabelle/lemmas_Lemmas" "../../lib/isabelle/types_Config" "../../lib/isabelle/types_Types" "../../lib/isabelle/types_Int32Eq" "../../lib/isabelle/types_UInt64Eq" "mach.fxp_Fxp"
begin
theorem real_sqr_compat'vc:
  fixes x :: "real"
  fixes y :: "real"
  assumes fact0: "(0 :: Real.real) < x"
  assumes fact1: "x < y"
  shows "x * x < y * y"
  sorry
end
