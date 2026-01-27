theory insertion_sort_InsertionSort_benchqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut" "Why3STD.array_IntArraySorted"
begin
theorem bench'vc:
  fixes a :: "int list"
  assumes fact0: "int (length a) = (8 :: int)"
  shows "(0 :: int) \<le> (0 :: int)"
  and "(0 :: int) < int (length a)"
  and "a ! (0 :: nat) = -(5 :: int) \<longrightarrow> ((0 :: int) \<le> (1 :: int) \<and> (1 :: int) < int (length a)) \<and> (a ! (1 :: nat) = (6 :: int) \<longrightarrow> ((0 :: int) \<le> (2 :: int) \<and> (2 :: int) < int (length a)) \<and> (a ! (2 :: nat) = (17 :: int) \<longrightarrow> ((0 :: int) \<le> (3 :: int) \<and> (3 :: int) < int (length a)) \<and> (a ! (3 :: nat) = (42 :: int) \<longrightarrow> ((0 :: int) \<le> (4 :: int) \<and> (4 :: int) < int (length a)) \<and> (a ! (4 :: nat) = (53 :: int) \<longrightarrow> ((0 :: int) \<le> (5 :: int) \<and> (5 :: int) < int (length a)) \<and> (a ! (5 :: nat) = (69 :: int) \<longrightarrow> ((0 :: int) \<le> (6 :: int) \<and> (6 :: int) < int (length a)) \<and> (a ! (6 :: nat) = (91 :: int) \<longrightarrow> (0 :: int) \<le> (7 :: int) \<and> (7 :: int) < int (length a)))))))"
  sorry
end
