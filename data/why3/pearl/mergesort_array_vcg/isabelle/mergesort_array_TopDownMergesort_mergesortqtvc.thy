theory mergesort_array_TopDownMergesort_mergesortqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut"
begin
typedecl  elt
consts le :: "elt \<Rightarrow> elt \<Rightarrow> bool"
axiomatization where Refl:   "le x x"
  for x :: "elt"
axiomatization where Trans:   "le x z"
 if "le x y"
 and "le y z"
  for x :: "elt"
  and y :: "elt"
  and z :: "elt"
axiomatization where Total:   "le x y \<or> le y x"
  for x :: "elt"
  and y :: "elt"
definition sorted_sub :: "elt list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "sorted_sub a l u \<longleftrightarrow> (\<forall>(i1 :: int) (i2 :: int). l \<le> i1 \<and> i1 < i2 \<and> i2 < u \<longrightarrow> le (a ! nat i1) (a ! nat i2))" for a l u
definition sorted :: "elt list \<Rightarrow> _"
  where "sorted a \<longleftrightarrow> (\<forall>(i1 :: int) (i2 :: int). (0 :: int) \<le> i1 \<and> i1 < i2 \<and> i2 < int (length a) \<longrightarrow> le (a ! nat i1) (a ! nat i2))" for a
theorem mergesort'vc:
  fixes tmp :: "elt list"
  fixes a :: "elt list"
  assumes fact0: "length tmp = length a"
  assumes fact1: "\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length tmp) \<longrightarrow> tmp ! nat i = a ! nat i"
  shows "let o1 :: int = int (length a) in ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> o1 \<and> o1 \<le> int (length a) \<and> length a = length tmp) \<and> (\<forall>(a1 :: elt list). length a1 = length a \<longrightarrow> sorted_sub a1 (0 :: int) o1 \<and> permut_sub' a a1 (0 :: nat) (nat o1) \<longrightarrow> sorted a1 \<and> a <~~> a1)"
  sorry
end
