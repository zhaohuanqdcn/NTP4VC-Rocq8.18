theory gnome_sort_GnomeSort_gnome_sortqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_NumOf" "Why3STD.int_Sum" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut" "Why3STD.array_IntArraySorted" "Why3STD.array_Inversions"
begin
theorem gnome_sort'vc:
  fixes a :: "int list"
  shows "(0 :: int) \<le> (0 :: int)"
  and "(0 :: int) \<le> int (length a)"
  and "sorted_sub1 a (0 :: int) (0 :: int)"
  and "a <~~> a"
  and "\<forall>(pos :: int) (a1 :: int list). length a1 = length a \<longrightarrow> ((0 :: int) \<le> pos \<and> pos \<le> int (length a1)) \<and> sorted_sub1 a1 (0 :: int) pos \<and> a <~~> a1 \<longrightarrow> (if pos < int (length a1) then (\<not>pos = (0 :: int) \<longrightarrow> (let o1 :: int = pos - (1 :: int) in ((0 :: int) \<le> o1 \<and> o1 < int (length a1)) \<and> (0 :: int) \<le> pos \<and> pos < int (length a1))) \<and> (\<forall>(o1 :: bool). (if pos = (0 :: int) then o1 = True else o1 = (if a1 ! nat (pos - (1 :: int)) \<le> a1 ! nat pos then True else False)) \<longrightarrow> (if o1 = True then ((0 :: int) \<le> inversions a1 \<and> inversions a1 < inversions a1 \<or> (0 :: int) \<le> int (length a1) - pos \<and> int (length a1) - (pos + (1 :: int)) < int (length a1) - pos) \<and> ((0 :: int) \<le> pos + (1 :: int) \<and> pos + (1 :: int) \<le> int (length a1)) \<and> sorted_sub1 a1 (0 :: int) (pos + (1 :: int)) \<and> a <~~> a1 else let o2 :: int = pos - (1 :: int) in (((0 :: int) \<le> pos \<and> pos < int (length a1)) \<and> (0 :: int) \<le> o2 \<and> o2 < int (length a1)) \<and> (\<forall>(a2 :: int list). length a2 = length a1 \<longrightarrow> list_exchange a1 a2 pos o2 \<longrightarrow> ((0 :: int) \<le> inversions a1 \<and> inversions a2 < inversions a1 \<or> inversions a1 = inversions a2 \<and> (0 :: int) \<le> int (length a1) - pos \<and> int (length a2) - (pos - (1 :: int)) < int (length a1) - pos) \<and> ((0 :: int) \<le> pos - (1 :: int) \<and> pos - (1 :: int) \<le> int (length a2)) \<and> sorted_sub1 a2 (0 :: int) (pos - (1 :: int)) \<and> a <~~> a2))) else array_IntArraySorted.sorted a1 \<and> a <~~> a1)"
  sorry
end
