theory algo64_Algo64_qsqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut" "Why3STD.array_IntArraySorted"
begin
definition qs_partition :: "int list \<Rightarrow> int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "qs_partition t1 t2 m n i j x \<longleftrightarrow> permut_sub' t1 t2 (nat m) (nat (n + (1 :: int))) \<and> (\<forall>(k :: int). m \<le> k \<and> k \<le> j \<longrightarrow> t2 ! nat k \<le> x) \<and> (\<forall>(k :: int). j < k \<and> k < i \<longrightarrow> t2 ! nat k = x) \<and> (\<forall>(k :: int). i \<le> k \<and> k \<le> n \<longrightarrow> x \<le> t2 ! nat k)" for t1 t2 m n i j x
theorem qs'vc:
  fixes a :: "int list"
  shows "if (0 :: int) < int (length a) then let o1 :: int = int (length a) - (1 :: int) in ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> o1 \<and> o1 < int (length a)) \<and> (\<forall>(a1 :: int list). length a1 = length a \<longrightarrow> permut_sub' a a1 (0 :: nat) (nat (o1 + (1 :: int))) \<and> sorted_sub1 a1 (0 :: int) (o1 + (1 :: int)) \<longrightarrow> a <~~> a1 \<and> array_IntArraySorted.sorted a1) else a <~~> a \<and> array_IntArraySorted.sorted a"
  sorry
end
