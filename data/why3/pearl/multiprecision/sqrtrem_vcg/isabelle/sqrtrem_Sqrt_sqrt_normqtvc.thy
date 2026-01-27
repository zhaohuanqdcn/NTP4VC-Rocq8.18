theory sqrtrem_Sqrt_sqrt_normqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_Const" "Why3STD.map_MapEq" "Why3STD.real_Truncate" "mach.c_C" "mach.int_Unsigned" "../../lib/isabelle/types_Config" "../../lib/isabelle/types_Types" "../../lib/isabelle/types_Int32Eq" "../../lib/isabelle/types_UInt64Eq" "../../lib/isabelle/lemmas_Lemmas" "../../lib/isabelle/compare_Compare" "../../lib/isabelle/util_Util" "../../lib/isabelle/ptralias_Alias" "../../lib/isabelle/util_UtilOld" "../../lib/isabelle/add_1_Add_1" "../../lib/isabelle/add_Add" "../../lib/isabelle/add_AddOld" "../../lib/isabelle/sub_1_Sub_1" "../../lib/isabelle/sub_SubOld" "../../lib/isabelle/mul_Mul" "../../lib/isabelle/mul_Mul_basecase" "../../lib/isabelle/logical_LogicalUtil" "../../lib/isabelle/logical_Logical" "../../lib/isabelle/logical_LogicalOld" "../../lib/isabelle/div_Div" "../../lib/isabelle/sqrt_Sqrt1" "mach.fxp_Fxp" "../../lib/isabelle/toom_Toom" "../../lib/isabelle/valuation_Valuation"
begin
definition ceilhalf :: "int \<Rightarrow> int"
  where "ceilhalf n = (n + (1 :: int)) cdiv (2 :: int)" for n
axiomatization where ceilhalf'spec'0:   "n \<le> (2 :: int) * ceilhalf n"
  for n :: "int"
axiomatization where ceilhalf'spec:   "n < (2 :: int) * (ceilhalf n + (1 :: int))"
  for n :: "int"
theorem sqrt_norm'vc:
  fixes c :: "int"
  fixes n :: "int"
  fixes s :: "int"
  fixes s0 :: "int"
  assumes fact0: "(0 :: int) \<le> c"
  assumes fact1: "(0 :: int) < n"
  assumes fact2: "(0 :: int) \<le> s"
  assumes fact3: "(0 :: int) \<le> s0"
  assumes fact4: "s0 < (2 :: int) ^\<^sub>i c"
  assumes fact5: "((2 :: int) ^\<^sub>i c * s + s0) * ((2 :: int) ^\<^sub>i c * s + s0) \<le> (2 :: int) ^\<^sub>i ((2 :: int) * c) * n"
  assumes fact6: "(2 :: int) ^\<^sub>i ((2 :: int) * c) * n < ((2 :: int) ^\<^sub>i c * s + s0 + (1 :: int)) * ((2 :: int) ^\<^sub>i c * s + s0 + (1 :: int))"
  shows "s * s \<le> n"
  and "n < (s + (1 :: int)) * (s + (1 :: int))"
  sorry
end
