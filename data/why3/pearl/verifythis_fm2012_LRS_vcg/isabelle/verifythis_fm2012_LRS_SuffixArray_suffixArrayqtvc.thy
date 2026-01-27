theory verifythis_fm2012_LRS_SuffixArray_suffixArrayqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut" "Why3STD.map_MapInjection" "./verifythis_fm2012_LRS_LCP" "./verifythis_fm2012_LRS_SuffixSort"
begin
definition permutation :: "(int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> _"
  where "permutation m u \<longleftrightarrow> map_MapInjection.range m u \<and> injective m u" for m u
theorem suffixArray'vc:
  shows "(0 :: int) \<le> (0 :: int)"
  and "\<forall>(o1 :: int list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) \<longrightarrow> o1 ! nat i = (0 :: int)) \<and> int (length o1) = (0 :: int) \<longrightarrow> (0 :: int) \<le> (0 :: int) \<and> (\<forall>(o2 :: int list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) \<longrightarrow> o2 ! nat i = (0 :: int)) \<and> int (length o2) = (0 :: int) \<longrightarrow> length o2 = length o1 \<and> permutation (nth o1 o nat) (int (length o1)) \<and> verifythis_fm2012_LRS_SuffixSort.sorted o2 o1)"
  sorry
end
