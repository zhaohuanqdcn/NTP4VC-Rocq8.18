theory counting_sort_Harness_harnessqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_NumOf" "./counting_sort_Spec" "Why3STD.array_IntArraySorted" "./counting_sort_InPlaceCountingSort"
begin
theorem harness'vc:
  assumes fact0: "k = (2 :: int)"
  shows "(0 :: int) \<le> (3 :: int)"
  and "\<forall>(a :: int list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (3 :: int) \<longrightarrow> a ! nat i = (0 :: int)) \<and> int (length a) = (3 :: int) \<longrightarrow> ((0 :: int) \<le> (1 :: int) \<and> (1 :: int) < int (length a)) \<and> (length (a[nat (1 :: int) := 1 :: int]) = length a \<longrightarrow> nth (a[nat (1 :: int) := 1 :: int]) o nat = (nth a o nat)(1 :: int := 1 :: int) \<longrightarrow> k_values (a[nat (1 :: int) := 1 :: int]))"
  sorry
end
