theory max_matrix_MaxMatrixMemo_mqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_Const" "./max_matrix_Bitset"
begin
typedecl 'a t
consts contents :: "'a t \<Rightarrow> int \<Rightarrow> 'a"
consts create :: "'a \<Rightarrow> 'a t"
axiomatization where create'spec:   "contents (create x) = (const :: 'a \<Rightarrow> int \<Rightarrow> 'a) x"
  for x :: "'a"
consts mixfix_lbrb :: "'a t \<Rightarrow> int \<Rightarrow> 'a"
axiomatization where mixfix_lbrb'spec:   "mixfix_lbrb m k = contents m k"
  for m :: "'a t"
  and k :: "int"
consts mixfix_lblsmnrb :: "'a t \<Rightarrow> int \<Rightarrow> 'a \<Rightarrow> 'a t"
axiomatization where mixfix_lblsmnrb'spec:   "contents (mixfix_lblsmnrb m k v) = (contents m)(k := v)"
  for m :: "'a t"
  and k :: "int"
  and v :: "'a"
consts n :: "int"
axiomatization where n'def'0:   "(0 :: int) \<le> n"
axiomatization where n'def'1:   "n \<le> max_matrix_Bitset.size"
theorem m'vc:
  shows "True"
  sorry
end
