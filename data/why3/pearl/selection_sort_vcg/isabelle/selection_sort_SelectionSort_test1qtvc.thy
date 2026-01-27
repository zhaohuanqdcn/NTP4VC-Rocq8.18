theory selection_sort_SelectionSort_test1qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut" "Why3STD.array_IntArraySorted"
begin
theorem test1'vc:
  shows "(0 :: int) \<le> (3 :: int)"
  and "\<forall>(a :: int list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (3 :: int) \<longrightarrow> a ! nat i = (0 :: int)) \<and> int (length a) = (3 :: int) \<longrightarrow> ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) < int (length a)) \<and> (length (a[nat (0 :: int) := 7 :: int]) = length a \<longrightarrow> nth (a[nat (0 :: int) := 7 :: int]) o nat = (nth a o nat)(0 :: int := 7 :: int) \<longrightarrow> ((0 :: int) \<le> (1 :: int) \<and> (1 :: int) < int (length (a[nat (0 :: int) := 7 :: int]))) \<and> (length (a[nat (1 :: int) := 3 :: int, nat (0 :: int) := 7 :: int]) = length (a[nat (0 :: int) := 7 :: int]) \<longrightarrow> nth (a[nat (1 :: int) := 3 :: int, nat (0 :: int) := 7 :: int]) o nat = (nth (a[nat (0 :: int) := 7 :: int]) o nat)(1 :: int := 3 :: int) \<longrightarrow> (0 :: int) \<le> (2 :: int) \<and> (2 :: int) < int (length (a[nat (1 :: int) := 3 :: int, nat (0 :: int) := 7 :: int]))))"
  sorry
end
