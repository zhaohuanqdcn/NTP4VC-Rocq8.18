theory base_info_BaseInfo_wmpn_base_infoqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_Const" "Why3STD.map_MapEq" "mach.int_Unsigned" "../../lib/isabelle/types_Config" "../../lib/isabelle/types_Types" "mach.c_C" "../../lib/isabelle/types_Int32Eq" "../../lib/isabelle/types_UInt64Eq" "../../lib/isabelle/logical_LogicalUtil" "../../lib/isabelle/lemmas_Lemmas" "../../lib/isabelle/logical_Logical" "../../lib/isabelle/ptralias_Alias"
begin
theorem wmpn_base_info'vc:
  shows "(2 :: int) \<le> (2 :: int)"
  and "(2 :: int) \<le> (256 :: int)"
  and "(2 :: int) \<le> (2 :: int) \<and> (2 :: int) \<le> (256 :: int) \<longrightarrow> ((9223372036854775808 :: int) < (18446744073709551615 :: int) + (1 :: int) \<and> (18446744073709551615 :: int) + (1 :: int) \<le> (9223372036854775808 :: int) * (2 :: int)) \<and> ((9223372036854775808 :: int) < (18446744073709551615 :: int) + (1 :: int) \<and> (18446744073709551615 :: int) + (1 :: int) \<le> (9223372036854775808 :: int) * (2 :: int) \<longrightarrow> ((7 :: int) \<le> (63 :: int) \<and> (63 :: int) \<le> (63 :: int)) \<and> ((7 :: int) \<le> (63 :: int) \<and> (63 :: int) \<le> (63 :: int) \<longrightarrow> (9223372036854775808 :: int) = (2 :: int) ^\<^sub>i (63 :: int)))"
  sorry
end
