theory quicksort_Traditional_quicksortqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut" "Why3STD.array_IntArraySorted"
begin
theorem quicksort'vc:
  fixes a :: "int list"
  shows "let o1 :: int = int (length a) in ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> o1 \<and> o1 \<le> int (length a)) \<and> (\<forall>(a1 :: int list). length a1 = length a \<longrightarrow> sorted_sub1 a1 (0 :: int) o1 \<and> permut_sub' a a1 (0 :: nat) (nat o1) \<longrightarrow> array_IntArraySorted.sorted a1 \<and> a <~~> a1)"
  sorry
end
