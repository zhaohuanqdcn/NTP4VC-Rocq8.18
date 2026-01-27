theory verifythis_2017_odd_even_transposition_sort_Challenge3_odd_even_sortedqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_NumOf" "Why3STD.int_Sum" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut" "Why3STD.array_IntArraySorted" "Why3STD.array_Inversions"
begin
definition odd_sorted :: "int list \<Rightarrow> int \<Rightarrow> _"
  where "odd_sorted a n \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<longrightarrow> (2 :: int) * i + (2 :: int) < n \<longrightarrow> a ! nat ((2 :: int) * i + (1 :: int)) \<le> a ! nat ((2 :: int) * i + (2 :: int)))" for a n
definition even_sorted :: "int list \<Rightarrow> int \<Rightarrow> _"
  where "even_sorted a n \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<longrightarrow> (2 :: int) * i + (1 :: int) < n \<longrightarrow> a ! nat ((2 :: int) * i) \<le> a ! nat ((2 :: int) * i + (1 :: int)))" for a n
theorem odd_even_sorted'vc:
  fixes n :: "int"
  fixes a :: "int list"
  assumes fact0: "(0 :: int) \<le> n"
  assumes fact1: "n \<le> int (length a)"
  assumes fact2: "odd_sorted a n"
  assumes fact3: "even_sorted a n"
  shows "sorted_sub1 a (0 :: int) n"
  sorry
end
