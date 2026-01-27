theory mpz_div2exp_Zdiv2exp_div_uniqueqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_Const" "Why3STD.map_MapEq" "mach.int_Unsigned" "mach.c_C" "../../lib/isabelle/lemmas_Lemmas" "../../lib/isabelle/types_Config" "../../lib/isabelle/types_Types" "../../lib/isabelle/types_Int32Eq" "../../lib/isabelle/types_UInt64Eq" "../../lib/isabelle/util_Util" "../../lib/isabelle/ptralias_Alias" "../../lib/isabelle/util_UtilOld" "../../lib/isabelle/compare_Compare" "../../lib/isabelle/logical_LogicalUtil" "../../lib/isabelle/logical_Logical" "../../lib/isabelle/logical_LogicalOld" "../../lib/isabelle/mpz_Z" "../../lib/isabelle/mpz_Zutil"
begin
theorem div_unique'vc:
  fixes y :: "int"
  fixes x :: "int"
  fixes q :: "int"
  assumes fact0: "(0 :: int) < y"
  assumes fact1: "(0 :: int) \<le> x"
  assumes fact2: "q * y \<le> x"
  assumes fact3: "x < q * y + y"
  shows "x cdiv y = q"
  sorry
end
