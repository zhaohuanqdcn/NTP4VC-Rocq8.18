theory verifythis_2021_lexicographic_permutations_2_BoxedIntArrays_greaterqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut"
begin
definition boxed :: "int \<Rightarrow> int list \<Rightarrow> _"
  where "boxed u a \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length a) \<longrightarrow> (2 :: int) * abs (a ! nat i) < u)" for u a
theorem greater'vc:
  fixes a :: "int list"
  shows "\<forall>(a :: int list) (l :: int). (0 :: int) \<le> l \<and> l \<le> int (length a) \<longrightarrow> (let o1 :: int = int (length a) in (\<not>l = o1 \<longrightarrow> (let o2 :: int = l + (1 :: int) in (((0 :: int) \<le> int (length a) - l \<and> int (length a) - o2 < int (length a) - l) \<and> (0 :: int) \<le> o2 \<and> o2 \<le> int (length a)) \<and> (\<forall>(r :: int). (0 :: int) \<le> r \<and> (\<forall>(i :: int). o2 \<le> i \<and> i < int (length a) \<longrightarrow> (2 :: int) * abs (a ! nat i) < r) \<longrightarrow> (0 :: int) \<le> l \<and> l < int (length a)))) \<and> (\<forall>(result :: int). (if l = o1 then result = (0 :: int) else \<exists>(r :: int). ((0 :: int) \<le> r \<and> (\<forall>(i :: int). l + (1 :: int) \<le> i \<and> i < int (length a) \<longrightarrow> (2 :: int) * abs (a ! nat i) < r)) \<and> result = max r ((2 :: int) * abs (a ! nat l) + (1 :: int))) \<longrightarrow> (0 :: int) \<le> result \<and> (\<forall>(i :: int). l \<le> i \<and> i < int (length a) \<longrightarrow> (2 :: int) * abs (a ! nat i) < result)))"
  and "\<forall>(great :: int list \<Rightarrow> int \<Rightarrow> int). (\<forall>(a :: int list) (l :: int). (0 :: int) \<le> l \<and> l \<le> int (length a) \<longrightarrow> great a l = (if l = int (length a) then 0 :: int else max (great a (l + (1 :: int))) ((2 :: int) * abs (a ! nat l) + (1 :: int))) \<and> (0 :: int) \<le> great a l \<and> (\<forall>(i :: int). l \<le> i \<and> i < int (length a) \<longrightarrow> (2 :: int) * abs (a ! nat i) < great a l)) \<longrightarrow> (0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> int (length a)"
  sorry
end
