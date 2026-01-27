theory insertion_sort_naive_InsertionSortNaiveGen_sortqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut"
begin
typedecl  elt
consts le :: "elt \<Rightarrow> elt \<Rightarrow> bool"
definition sorted_sub :: "(int \<Rightarrow> elt) \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "sorted_sub a l u \<longleftrightarrow> (\<forall>(i1 :: int) (i2 :: int). l \<le> i1 \<and> i1 \<le> i2 \<and> i2 < u \<longrightarrow> le (a i1) (a i2))" for a l u
axiomatization where le_refl:   "le x x"
  for x :: "elt"
axiomatization where le_asym:   "le y x"
 if "\<not>le x y"
  for x :: "elt"
  and y :: "elt"
axiomatization where le_trans:   "le x z"
 if "le x y"
 and "le y z"
  for x :: "elt"
  and y :: "elt"
  and z :: "elt"
definition sorted_sub1 :: "elt list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "sorted_sub1 a l u \<longleftrightarrow> sorted_sub (nth a o nat) l u" for a l u
definition sorted :: "elt list \<Rightarrow> _"
  where "sorted a \<longleftrightarrow> sorted_sub (nth a o nat) (0 :: int) (int (length a))" for a
theorem sort'vc:
  fixes a :: "elt list"
  shows "let o1 :: int = int (length a) - (1 :: int) in ((0 :: int) \<le> o1 + (1 :: int) \<longrightarrow> (a <~~> a \<and> sorted_sub1 a (0 :: int) (0 :: int)) \<and> (\<forall>(a1 :: elt list). length a1 = length a \<longrightarrow> (\<forall>(i :: int). ((0 :: int) \<le> i \<and> i \<le> o1) \<and> a <~~> a1 \<and> sorted_sub1 a1 (0 :: int) i \<longrightarrow> (((0 :: int) \<le> i \<and> i \<le> i) \<and> a <~~> a1 \<and> sorted_sub1 a1 (0 :: int) i \<and> sorted_sub1 a1 i (i + (1 :: int)) \<and> (\<forall>(k1 :: int) (k2 :: int). ((0 :: int) \<le> k1 \<and> k1 < i) \<and> i + (1 :: int) \<le> k2 \<and> k2 \<le> i \<longrightarrow> le (a1 ! nat k1) (a1 ! nat k2))) \<and> (\<forall>(j :: int) (a2 :: elt list). length a2 = length a1 \<longrightarrow> ((0 :: int) \<le> j \<and> j \<le> i) \<and> a <~~> a2 \<and> sorted_sub1 a2 (0 :: int) j \<and> sorted_sub1 a2 j (i + (1 :: int)) \<and> (\<forall>(k1 :: int) (k2 :: int). ((0 :: int) \<le> k1 \<and> k1 < j) \<and> j + (1 :: int) \<le> k2 \<and> k2 \<le> i \<longrightarrow> le (a2 ! nat k1) (a2 ! nat k2)) \<longrightarrow> ((0 :: int) < j \<longrightarrow> ((0 :: int) \<le> j \<and> j < int (length a2)) \<and> (let o2 :: int = j - (1 :: int) in (0 :: int) \<le> o2 \<and> o2 < int (length a2))) \<and> (\<forall>(o2 :: bool). (if (0 :: int) < j then o2 = (if le (a2 ! nat (j - (1 :: int))) (a2 ! nat j) then False else True) else o2 = False) \<longrightarrow> (if o2 = True then let b :: int = j - (1 :: int) in ((0 :: int) \<le> j \<and> j < int (length a2)) \<and> (let t :: elt = a2 ! nat j in ((0 :: int) \<le> b \<and> b < int (length a2)) \<and> (let o3 :: elt = a2 ! nat b in ((0 :: int) \<le> j \<and> j < int (length a2)) \<and> (length (a2[nat j := o3]) = length a2 \<longrightarrow> nth (a2[nat j := o3]) o nat = (nth a2 o nat)(j := o3) \<longrightarrow> ((0 :: int) \<le> b \<and> b < int (length (a2[nat j := o3]))) \<and> (length (a2[nat b := t, nat j := o3]) = length (a2[nat j := o3]) \<longrightarrow> nth (a2[nat b := t, nat j := o3]) o nat = (nth (a2[nat j := o3]) o nat)(b := t) \<longrightarrow> ((0 :: int) \<le> j \<and> j - (1 :: int) < j) \<and> ((0 :: int) \<le> j - (1 :: int) \<and> j - (1 :: int) \<le> i) \<and> a <~~> a2[nat b := t, nat j := o3] \<and> sorted_sub1 (a2[nat b := t, nat j := o3]) (0 :: int) (j - (1 :: int)) \<and> sorted_sub1 (a2[nat b := t, nat j := o3]) (j - (1 :: int)) (i + (1 :: int)) \<and> (\<forall>(k1 :: int) (k2 :: int). ((0 :: int) \<le> k1 \<and> k1 < j - (1 :: int)) \<and> j - (1 :: int) + (1 :: int) \<le> k2 \<and> k2 \<le> i \<longrightarrow> le (a2[nat b := t, nat j := o3] ! nat k1) (a2[nat b := t, nat j := o3] ! nat k2)))))) else a <~~> a2 \<and> sorted_sub1 a2 (0 :: int) (i + (1 :: int)))))) \<and> (a <~~> a1 \<and> sorted_sub1 a1 (0 :: int) (o1 + (1 :: int)) \<longrightarrow> sorted a1 \<and> a <~~> a1))) \<and> (o1 + (1 :: int) < (0 :: int) \<longrightarrow> sorted a \<and> a <~~> a)"
  sorry
end
