theory verifythis_fm2012_LRS_LRS_lcp_symqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut" "Why3STD.map_MapInjection" "./verifythis_fm2012_LRS_LCP" "./verifythis_fm2012_LRS_SuffixSort" "./verifythis_fm2012_LRS_SuffixArray"
begin
theorem lcp_sym'vc:
  fixes x :: "int"
  fixes a :: "int list"
  fixes y :: "int"
  fixes l :: "int"
  assumes fact0: "(0 :: int) \<le> x"
  assumes fact1: "x \<le> int (length a)"
  assumes fact2: "(0 :: int) \<le> y"
  assumes fact3: "y \<le> int (length a)"
  assumes fact4: "is_longest_common_prefix a x y l"
  shows "is_longest_common_prefix a y x l"
  sorry
end
