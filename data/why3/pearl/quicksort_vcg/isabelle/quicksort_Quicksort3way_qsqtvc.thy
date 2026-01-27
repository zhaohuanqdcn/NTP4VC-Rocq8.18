theory quicksort_Quicksort3way_qsqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut" "Why3STD.array_IntArraySorted" "./quicksort_Shuffle" "Why3STD.random_State" "Why3STD.random_Random"
begin
definition qs_partition :: "int list \<Rightarrow> int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "qs_partition a1 a2 l ml mr r v \<longleftrightarrow> permut_sub' a1 a2 (nat l) (nat r) \<and> (\<forall>(j :: int). l \<le> j \<and> j < ml \<longrightarrow> a2 ! nat j < v) \<and> (\<forall>(j :: int). ml \<le> j \<and> j < mr \<longrightarrow> a2 ! nat j = v) \<and> (\<forall>(j :: int). mr \<le> j \<and> j < r \<longrightarrow> v < a2 ! nat j)" for a1 a2 l ml mr r v
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
