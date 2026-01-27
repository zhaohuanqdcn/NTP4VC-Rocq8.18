theory insertion_sort_InsertionSortGen_insertion_sortqtvc
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
theorem insertion_sort'vc:
  fixes a :: "elt list"
  shows "let o1 :: int = int (length a) - (1 :: int) in ((1 :: int) \<le> o1 + (1 :: int) \<longrightarrow> (sorted_sub1 a (0 :: int) (1 :: int) \<and> a <~~> a) \<and> (\<forall>(a1 :: elt list). length a1 = length a \<longrightarrow> (\<forall>(i :: int). ((1 :: int) \<le> i \<and> i \<le> o1) \<and> sorted_sub1 a1 (0 :: int) i \<and> a <~~> a1 \<longrightarrow> ((0 :: int) \<le> i \<and> i < int (length a1)) \<and> (let v :: elt = a1 ! nat i in (((0 :: int) \<le> i \<and> i \<le> i) \<and> a <~~> a1[nat i := v] \<and> (\<forall>(k1 :: int) (k2 :: int). (0 :: int) \<le> k1 \<and> k1 \<le> k2 \<and> k2 \<le> i \<longrightarrow> \<not>k1 = i \<longrightarrow> \<not>k2 = i \<longrightarrow> le (a1 ! nat k1) (a1 ! nat k2)) \<and> (\<forall>(k :: int). i + (1 :: int) \<le> k \<and> k \<le> i \<longrightarrow> le v (a1 ! nat k))) \<and> (\<forall>(j :: int) (a2 :: elt list). length a2 = length a1 \<longrightarrow> ((0 :: int) \<le> j \<and> j \<le> i) \<and> a <~~> a2[nat j := v] \<and> (\<forall>(k1 :: int) (k2 :: int). (0 :: int) \<le> k1 \<and> k1 \<le> k2 \<and> k2 \<le> i \<longrightarrow> \<not>k1 = j \<longrightarrow> \<not>k2 = j \<longrightarrow> le (a2 ! nat k1) (a2 ! nat k2)) \<and> (\<forall>(k :: int). j + (1 :: int) \<le> k \<and> k \<le> i \<longrightarrow> le v (a2 ! nat k)) \<longrightarrow> ((0 :: int) < j \<longrightarrow> (let o2 :: int = j - (1 :: int) in (0 :: int) \<le> o2 \<and> o2 < int (length a2))) \<and> (\<forall>(o2 :: bool). (if (0 :: int) < j then o2 = (if le (a2 ! nat (j - (1 :: int))) v then False else True) else o2 = False) \<longrightarrow> (if o2 = True then let o3 :: int = j - (1 :: int) in ((0 :: int) \<le> o3 \<and> o3 < int (length a2)) \<and> (let o4 :: elt = a2 ! nat o3 in ((0 :: int) \<le> j \<and> j < int (length a2)) \<and> (length (a2[nat j := o4]) = length a2 \<longrightarrow> nth (a2[nat j := o4]) o nat = (nth a2 o nat)(j := o4) \<longrightarrow> ((0 :: int) \<le> j \<and> j - (1 :: int) < j) \<and> ((0 :: int) \<le> j - (1 :: int) \<and> j - (1 :: int) \<le> i) \<and> a <~~> a2[nat (j - (1 :: int)) := v, nat j := o4] \<and> (\<forall>(k1 :: int) (k2 :: int). (0 :: int) \<le> k1 \<and> k1 \<le> k2 \<and> k2 \<le> i \<longrightarrow> \<not>k1 = j - (1 :: int) \<longrightarrow> \<not>k2 = j - (1 :: int) \<longrightarrow> le (a2[nat j := o4] ! nat k1) (a2[nat j := o4] ! nat k2)) \<and> (\<forall>(k :: int). j - (1 :: int) + (1 :: int) \<le> k \<and> k \<le> i \<longrightarrow> le v (a2[nat j := o4] ! nat k)))) else ((0 :: int) \<le> j \<and> j < int (length a2)) \<and> (length (a2[nat j := v]) = length a2 \<longrightarrow> nth (a2[nat j := v]) o nat = (nth a2 o nat)(j := v) \<longrightarrow> sorted_sub1 (a2[nat j := v]) (0 :: int) (i + (1 :: int)) \<and> a <~~> a2[nat j := v])))))) \<and> (sorted_sub1 a1 (0 :: int) (o1 + (1 :: int)) \<and> a <~~> a1 \<longrightarrow> sorted a1 \<and> a <~~> a1))) \<and> (o1 + (1 :: int) < (1 :: int) \<longrightarrow> sorted a \<and> a <~~> a)"
  sorry
end
