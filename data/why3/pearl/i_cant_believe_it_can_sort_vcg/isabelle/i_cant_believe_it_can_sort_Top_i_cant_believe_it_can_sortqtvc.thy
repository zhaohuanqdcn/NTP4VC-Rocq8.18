theory i_cant_believe_it_can_sort_Top_i_cant_believe_it_can_sortqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut"
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
definition max_array :: "elt list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "max_array a lo hi i \<longleftrightarrow> (\<forall>(j :: int). lo \<le> j \<and> j < hi \<longrightarrow> le (a ! nat j) (a ! nat i))" for a lo hi i
theorem i_cant_believe_it_can_sort'vc:
  fixes a :: "elt list"
  shows "let n :: int = int (length a); o1 :: int = n - (1 :: int) in ((0 :: int) \<le> o1 + (1 :: int) \<longrightarrow> (a <~~> a \<and> sorted_sub a (0 :: int) ((0 :: int) - (1 :: int))) \<and> (\<forall>(a1 :: elt list). length a1 = length a \<longrightarrow> (\<forall>(i :: int). ((0 :: int) \<le> i \<and> i \<le> o1) \<and> a <~~> a1 \<and> sorted_sub a1 (0 :: int) (i - (1 :: int)) \<and> (i = (0 :: int) \<or> max_array a1 (0 :: int) n (i - (1 :: int))) \<longrightarrow> (let o2 :: int = n - (1 :: int) in ((0 :: int) \<le> o2 + (1 :: int) \<longrightarrow> (a <~~> a1 \<and> max_array a1 (0 :: int) (0 :: int) i \<and> (i = (0 :: int) \<or> (if (0 :: int) < i then max_array a1 (0 :: int) n (i - (1 :: int)) else max_array a1 (0 :: int) n i)) \<and> (if (0 :: int) < i then sorted_sub a1 (0 :: int) (i - (1 :: int)) else sorted_sub a1 (0 :: int) i)) \<and> (\<forall>(a2 :: elt list). length a2 = length a1 \<longrightarrow> (\<forall>(j :: int). ((0 :: int) \<le> j \<and> j \<le> o2) \<and> a <~~> a2 \<and> max_array a2 (0 :: int) j i \<and> (i = (0 :: int) \<or> (if j < i then max_array a2 (0 :: int) n (i - (1 :: int)) else max_array a2 (0 :: int) n i)) \<and> (if j < i then sorted_sub a2 (0 :: int) (i - (1 :: int)) else sorted_sub a2 (0 :: int) i) \<longrightarrow> ((0 :: int) \<le> j \<and> j < int (length a2)) \<and> (let o3 :: elt = a2 ! nat j in ((0 :: int) \<le> i \<and> i < int (length a2)) \<and> (let o4 :: elt = a2 ! nat i in if le o4 o3 \<and> \<not>o4 = o3 then (((0 :: int) \<le> i \<and> i < int (length a2)) \<and> (0 :: int) \<le> j \<and> j < int (length a2)) \<and> (\<forall>(a3 :: elt list). length a3 = length a2 \<longrightarrow> list_exchange a2 a3 i j \<longrightarrow> a <~~> a3 \<and> max_array a3 (0 :: int) (j + (1 :: int)) i \<and> (i = (0 :: int) \<or> (if j + (1 :: int) < i then max_array a3 (0 :: int) n (i - (1 :: int)) else max_array a3 (0 :: int) n i)) \<and> (if j + (1 :: int) < i then sorted_sub a3 (0 :: int) (i - (1 :: int)) else sorted_sub a3 (0 :: int) i)) else a <~~> a2 \<and> max_array a2 (0 :: int) (j + (1 :: int)) i \<and> (i = (0 :: int) \<or> (if j + (1 :: int) < i then max_array a2 (0 :: int) n (i - (1 :: int)) else max_array a2 (0 :: int) n i)) \<and> (if j + (1 :: int) < i then sorted_sub a2 (0 :: int) (i - (1 :: int)) else sorted_sub a2 (0 :: int) i)))) \<and> (a <~~> a2 \<and> max_array a2 (0 :: int) (o2 + (1 :: int)) i \<and> (i = (0 :: int) \<or> (if o2 + (1 :: int) < i then max_array a2 (0 :: int) n (i - (1 :: int)) else max_array a2 (0 :: int) n i)) \<and> (if o2 + (1 :: int) < i then sorted_sub a2 (0 :: int) (i - (1 :: int)) else sorted_sub a2 (0 :: int) i) \<longrightarrow> a <~~> a2 \<and> sorted_sub a2 (0 :: int) (i + (1 :: int) - (1 :: int)) \<and> (i + (1 :: int) = (0 :: int) \<or> max_array a2 (0 :: int) n (i + (1 :: int) - (1 :: int)))))) \<and> (o2 + (1 :: int) < (0 :: int) \<longrightarrow> a <~~> a1 \<and> sorted_sub a1 (0 :: int) (i + (1 :: int) - (1 :: int)) \<and> (i + (1 :: int) = (0 :: int) \<or> max_array a1 (0 :: int) n (i + (1 :: int) - (1 :: int)))))) \<and> (a <~~> a1 \<and> sorted_sub a1 (0 :: int) (o1 + (1 :: int) - (1 :: int)) \<and> (o1 + (1 :: int) = (0 :: int) \<or> max_array a1 (0 :: int) n (o1 + (1 :: int) - (1 :: int))) \<longrightarrow> a <~~> a1 \<and> sorted a1))) \<and> (o1 + (1 :: int) < (0 :: int) \<longrightarrow> a <~~> a \<and> sorted a)"
  sorry
end
