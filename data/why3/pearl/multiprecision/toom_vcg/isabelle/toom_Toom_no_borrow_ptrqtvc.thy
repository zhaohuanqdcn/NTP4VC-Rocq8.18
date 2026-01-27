theory toom_Toom_no_borrow_ptrqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_Const" "Why3STD.map_MapEq" "mach.c_C" "mach.int_Unsigned" "../../lib/isabelle/valuation_Valuation" "../../lib/isabelle/types_Config" "../../lib/isabelle/types_Types" "../../lib/isabelle/types_Int32Eq" "../../lib/isabelle/types_UInt64Eq" "../../lib/isabelle/lemmas_Lemmas" "../../lib/isabelle/compare_Compare" "../../lib/isabelle/util_Util" "../../lib/isabelle/ptralias_Alias" "../../lib/isabelle/util_UtilOld" "../../lib/isabelle/add_1_Add_1" "../../lib/isabelle/add_Add" "../../lib/isabelle/add_AddOld" "../../lib/isabelle/sub_1_Sub_1" "../../lib/isabelle/sub_SubOld" "../../lib/isabelle/mul_Mul" "../../lib/isabelle/mul_Mul_basecase" "../../lib/isabelle/logical_LogicalUtil" "../../lib/isabelle/logical_Logical"
begin
theorem no_borrow_ptr'vc:
  fixes ny :: "int"
  fixes nx :: "int"
  fixes y :: "64 word ptr"
  fixes x :: "64 word ptr"
  fixes r :: "64 word ptr"
  fixes b :: "64 word"
  assumes fact0: "(0 :: int) < ny"
  assumes fact1: "ny \<le> nx"
  assumes fact2: "value y ny \<le> value x nx"
  assumes fact3: "value r nx - ((18446744073709551615 :: int) + (1 :: int)) ^\<^sub>i nx * uint b = value x nx - value y ny"
  assumes fact4: "(0 :: int) \<le> uint b"
  shows "uint b = (0 :: int)"
  sorry
end
