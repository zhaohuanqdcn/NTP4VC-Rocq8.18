theory verifythis_fm2012_LRS_LRS_le_le_longest_common_prefixqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut" "Why3STD.map_MapInjection" "./verifythis_fm2012_LRS_LCP" "./verifythis_fm2012_LRS_SuffixSort" "./verifythis_fm2012_LRS_SuffixArray"
begin
theorem le_le_longest_common_prefix'vc:
  fixes a :: "int list"
  fixes x :: "int"
  fixes y :: "int"
  fixes z :: "int"
  fixes l :: "int"
  fixes m :: "int"
  assumes fact0: "le a x y"
  assumes fact1: "le a y z"
  assumes fact2: "is_longest_common_prefix a x z l"
  assumes fact3: "is_longest_common_prefix a y z m"
  shows "l \<le> m"
  sorry
end
