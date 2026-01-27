theory toom_Toom_no_borrowqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_Const" "Why3STD.map_MapEq" "mach.c_C" "mach.int_Unsigned" "../../lib/isabelle/valuation_Valuation" "../../lib/isabelle/types_Config" "../../lib/isabelle/types_Types" "../../lib/isabelle/types_Int32Eq" "../../lib/isabelle/types_UInt64Eq" "../../lib/isabelle/lemmas_Lemmas" "../../lib/isabelle/compare_Compare" "../../lib/isabelle/util_Util" "../../lib/isabelle/ptralias_Alias" "../../lib/isabelle/util_UtilOld" "../../lib/isabelle/add_1_Add_1" "../../lib/isabelle/add_Add" "../../lib/isabelle/add_AddOld" "../../lib/isabelle/sub_1_Sub_1" "../../lib/isabelle/sub_SubOld" "../../lib/isabelle/mul_Mul" "../../lib/isabelle/mul_Mul_basecase" "../../lib/isabelle/logical_LogicalUtil" "../../lib/isabelle/logical_Logical"
begin
theorem no_borrow'vc:
  fixes y :: "int"
  fixes x :: "int"
  fixes r :: "int"
  fixes m :: "int"
  fixes b :: "int"
  assumes fact0: "(0 :: int) \<le> y"
  assumes fact1: "y \<le> x"
  assumes fact2: "(0 :: int) \<le> r"
  assumes fact3: "r < m"
  assumes fact4: "r - m * b = x - y"
  assumes fact5: "(0 :: int) \<le> b"
  shows "b = (0 :: int)"
  sorry
end
