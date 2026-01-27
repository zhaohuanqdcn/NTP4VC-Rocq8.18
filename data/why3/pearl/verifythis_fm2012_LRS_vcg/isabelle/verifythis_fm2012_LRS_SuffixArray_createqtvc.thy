theory verifythis_fm2012_LRS_SuffixArray_createqtvc
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
theorem create'vc:
  fixes a :: "int list"
  shows "let n :: int = int (length a) in (0 :: int) \<le> n \<and> (\<forall>(suf :: int list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < n \<longrightarrow> suf ! nat i = (0 :: int)) \<and> int (length suf) = n \<longrightarrow> (let o1 :: int = n - (1 :: int) in ((0 :: int) \<le> o1 + (1 :: int) \<longrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < (0 :: int) \<longrightarrow> suf ! nat j = j) \<and> (\<forall>(suf1 :: int list). length suf1 = length suf \<longrightarrow> (\<forall>(i :: int). ((0 :: int) \<le> i \<and> i \<le> o1) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i \<longrightarrow> suf1 ! nat j = j) \<longrightarrow> ((0 :: int) \<le> i \<and> i < int (length suf1)) \<and> (length (suf1[nat i := i]) = length suf1 \<longrightarrow> nth (suf1[nat i := i]) o nat = (nth suf1 o nat)(i := i) \<longrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i + (1 :: int) \<longrightarrow> suf1[nat i := i] ! nat j = j))) \<and> ((\<forall>(j :: int). (0 :: int) \<le> j \<and> j < o1 + (1 :: int) \<longrightarrow> suf1 ! nat j = j) \<longrightarrow> (length suf1 = length a \<and> verifythis_fm2012_LRS_SuffixSort.range suf1) \<and> (\<forall>(suf2 :: int list). length suf2 = length suf1 \<longrightarrow> verifythis_fm2012_LRS_SuffixSort.sorted a suf2 \<and> suf1 <~~> suf2 \<longrightarrow> (length a = length suf2 \<and> permutation (nth suf2 o nat) (int (length suf2)) \<and> verifythis_fm2012_LRS_SuffixSort.sorted a suf2) \<and> (\<forall>(result :: suffixArray). values result = a \<and> suffixes result = suf2 \<longrightarrow> values result = a))))) \<and> (o1 + (1 :: int) < (0 :: int) \<longrightarrow> (length suf = length a \<and> verifythis_fm2012_LRS_SuffixSort.range suf) \<and> (\<forall>(suf1 :: int list). length suf1 = length suf \<longrightarrow> verifythis_fm2012_LRS_SuffixSort.sorted a suf1 \<and> suf <~~> suf1 \<longrightarrow> (length a = length suf1 \<and> permutation (nth suf1 o nat) (int (length suf1)) \<and> verifythis_fm2012_LRS_SuffixSort.sorted a suf1) \<and> (\<forall>(result :: suffixArray). values result = a \<and> suffixes result = suf1 \<longrightarrow> values result = a)))))"
  sorry
end
