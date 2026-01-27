theory quicksort_QuicksortWithShuffle_qsqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut" "./quicksort_Quicksort" "Why3STD.array_IntArraySorted" "./quicksort_Shuffle" "Why3STD.random_State" "Why3STD.random_Random"
begin
theorem qs'vc:
  fixes a :: "int list"
  fixes a1 :: "int list"
  fixes a2 :: "int list"
  assumes fact0: "length a = length a1"
  assumes fact1: "a1 <~~> a"
  assumes fact2: "length a2 = length a"
  assumes fact3: "array_IntArraySorted.sorted a2"
  assumes fact4: "a <~~> a2"
  shows "array_IntArraySorted.sorted a2"
  and "a1 <~~> a2"
  sorry
end
