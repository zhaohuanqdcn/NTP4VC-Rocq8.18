theory sqrtrem_Sqrt_ceilhalfqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_Const" "Why3STD.map_MapEq" "Why3STD.real_Truncate" "mach.c_C" "mach.int_Unsigned" "../../lib/isabelle/types_Config" "../../lib/isabelle/types_Types" "../../lib/isabelle/types_Int32Eq" "../../lib/isabelle/types_UInt64Eq" "../../lib/isabelle/lemmas_Lemmas" "../../lib/isabelle/compare_Compare" "../../lib/isabelle/util_Util" "../../lib/isabelle/ptralias_Alias" "../../lib/isabelle/util_UtilOld" "../../lib/isabelle/add_1_Add_1" "../../lib/isabelle/add_Add" "../../lib/isabelle/add_AddOld" "../../lib/isabelle/sub_1_Sub_1" "../../lib/isabelle/sub_SubOld" "../../lib/isabelle/mul_Mul" "../../lib/isabelle/mul_Mul_basecase" "../../lib/isabelle/logical_LogicalUtil" "../../lib/isabelle/logical_Logical" "../../lib/isabelle/logical_LogicalOld" "../../lib/isabelle/div_Div" "../../lib/isabelle/sqrt_Sqrt1" "mach.fxp_Fxp" "../../lib/isabelle/toom_Toom" "../../lib/isabelle/valuation_Valuation"
begin
theorem ceilhalf'vc:
  fixes n :: "int"
  shows "\<not>(2 :: int) = (0 :: int)"
  and "let result :: int = (n + (1 :: int)) cdiv (2 :: int) in n \<le> (2 :: int) * result \<and> n < (2 :: int) * (result + (1 :: int))"
  sorry
end
