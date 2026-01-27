theory verifythis_fm2012_LRS_SuffixArray_selectqtvc
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
theorem select'vc:
  fixes i :: "int"
  fixes s :: "suffixArray"
  assumes fact0: "(0 :: int) \<le> i"
  assumes fact1: "i < int (length (values s))"
  shows "let o1 :: int list = suffixes s in ((0 :: int) \<le> i \<and> i < int (length o1)) \<and> o1 ! nat i = suffixes s ! nat i"
  sorry
end
