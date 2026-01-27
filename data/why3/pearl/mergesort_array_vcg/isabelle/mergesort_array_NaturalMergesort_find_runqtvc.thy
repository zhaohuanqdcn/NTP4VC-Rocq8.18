theory mergesort_array_NaturalMergesort_find_runqtvc
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
theorem find_run'vc:
  fixes lo :: "int"
  fixes a :: "elt list"
  assumes fact0: "(0 :: int) \<le> lo"
  assumes fact1: "lo < int (length a)"
  shows "let o1 :: int = lo + (1 :: int) in ((lo < o1 \<and> o1 \<le> int (length a)) \<and> sorted_sub a lo o1) \<and> (\<forall>(i :: int). (lo < i \<and> i \<le> int (length a)) \<and> sorted_sub a lo i \<longrightarrow> (let o2 :: int = int (length a) in (i < o2 \<longrightarrow> ((0 :: int) \<le> i \<and> i < int (length a)) \<and> (let o3 :: int = i - (1 :: int) in (0 :: int) \<le> o3 \<and> o3 < int (length a))) \<and> (\<forall>(o3 :: bool). (if i < o2 then o3 = (if le (a ! nat (i - (1 :: int))) (a ! nat i) then True else False) else o3 = False) \<longrightarrow> (if o3 = True then ((0 :: int) \<le> int (length a) - i \<and> int (length a) - (i + (1 :: int)) < int (length a) - i) \<and> (lo < i + (1 :: int) \<and> i + (1 :: int) \<le> int (length a)) \<and> sorted_sub a lo (i + (1 :: int)) else (lo < i \<and> i \<le> int (length a)) \<and> sorted_sub a lo i \<and> (i < int (length a) \<longrightarrow> \<not>le (a ! nat (i - (1 :: int))) (a ! nat i))))))"
  sorry
end
