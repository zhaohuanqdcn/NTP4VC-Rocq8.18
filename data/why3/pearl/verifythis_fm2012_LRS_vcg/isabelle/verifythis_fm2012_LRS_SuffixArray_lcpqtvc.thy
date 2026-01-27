theory verifythis_fm2012_LRS_SuffixArray_lcpqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut" "Why3STD.map_MapInjection" "./verifythis_fm2012_LRS_LCP" "./verifythis_fm2012_LRS_SuffixSort"
begin
definition permutation :: "(int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> _"
  where "permutation m u \<longleftrightarrow> map_MapInjection.range m u \<and> injective m u" for m u
typedecl  suffixArray
consts "values" :: "suffixArray \<Rightarrow> int list"
consts suffixes :: "suffixArray \<Rightarrow> int list"
axiomatization where suffixArray'invariant'0:   "length (values self) = length (suffixes self)"
  for self :: "suffixArray"
axiomatization where suffixArray'invariant'1:   "permutation (nth (suffixes self) o nat) (int (length (suffixes self)))"
  for self :: "suffixArray"
axiomatization where suffixArray'invariant'2:   "verifythis_fm2012_LRS_SuffixSort.sorted (values self) (suffixes self)"
  for self :: "suffixArray"
definition suffixArray'eq :: "suffixArray \<Rightarrow> suffixArray \<Rightarrow> _"
  where "suffixArray'eq a b \<longleftrightarrow> values a = values b \<and> suffixes a = suffixes b" for a b
axiomatization where suffixArray'inj:   "a = b"
 if "suffixArray'eq a b"
  for a :: "suffixArray"
  and b :: "suffixArray"
theorem lcp'vc:
  fixes i :: "int"
  fixes s :: "suffixArray"
  assumes fact0: "(0 :: int) < i"
  assumes fact1: "i < int (length (values s))"
  shows "let o1 :: int = i - (1 :: int); o2 :: int list = suffixes s in ((0 :: int) \<le> o1 \<and> o1 < int (length o2)) \<and> (let o3 :: int = o2 ! nat o1; o4 :: int list = suffixes s in ((0 :: int) \<le> i \<and> i < int (length o4)) \<and> (let o5 :: int = o4 ! nat i; o6 :: int list = values s in (((0 :: int) \<le> o5 \<and> o5 \<le> int (length o6)) \<and> (0 :: int) \<le> o3 \<and> o3 \<le> int (length o6)) \<and> (\<forall>(result :: int). is_longest_common_prefix o6 o5 o3 result \<longrightarrow> is_longest_common_prefix (values s) (suffixes s ! nat (i - (1 :: int))) (suffixes s ! nat i) result)))"
  sorry
end
