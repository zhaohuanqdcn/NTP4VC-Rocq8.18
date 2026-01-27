theory verifythis_2021_lexicographic_permutations_2_Permut_find_eqqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut" "Why3STD.array_IntArraySorted"
begin
definition sorted_sub :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "sorted_sub a l u \<longleftrightarrow> (\<forall>(i1 :: int) (i2 :: int). l \<le> i1 \<and> i1 < i2 \<and> i2 < u \<longrightarrow> a ! nat i2 \<le> a ! nat i1)" for a l u
definition sorted :: "int list \<Rightarrow> _"
  where "sorted a \<longleftrightarrow> (\<forall>(i1 :: int) (i2 :: int). (0 :: int) \<le> i1 \<and> i1 < i2 \<and> i2 < int (length a) \<longrightarrow> a ! nat i2 \<le> a ! nat i1)" for a
definition le :: "int list \<Rightarrow> int list \<Rightarrow> _"
  where "le a1 a2 \<longleftrightarrow> length a1 = length a2 \<and> (\<exists>(i :: int). ((0 :: int) \<le> i \<and> i \<le> int (length a1)) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i \<longrightarrow> a1 ! nat j = a2 ! nat j) \<and> (i < int (length a1) \<longrightarrow> a1 ! nat i < a2 ! nat i))" for a1 a2
definition lt :: "int list \<Rightarrow> int list \<Rightarrow> _"
  where "lt a1 a2 \<longleftrightarrow> le a1 a2 \<and> \<not>a1 = a2" for a1 a2
theorem find_eq'vc:
  fixes a1 :: "int list"
  fixes a2 :: "int list"
  fixes i :: "int"
  assumes fact0: "length a1 = length a2"
  assumes fact1: "(0 :: int) \<le> i"
  assumes fact2: "i \<le> int (length a1)"
  assumes fact3: "drop (0 :: nat) (take (nat i - (0 :: nat)) a1) = drop (0 :: nat) (take (nat i - (0 :: nat)) a2)"
  shows "let o1 :: int = int (length a1) in (\<not>i = o1 \<longrightarrow> ((0 :: int) \<le> i \<and> i < int (length a2)) \<and> (0 :: int) \<le> i \<and> i < int (length a1)) \<and> (\<forall>(o2 :: bool). (if i = o1 then o2 = True else o2 = (if a1 ! nat i = a2 ! nat i then False else True)) \<longrightarrow> (\<not>o2 = True \<longrightarrow> (let o3 :: int = i + (1 :: int) in ((0 :: int) \<le> int (length a1) - i \<and> int (length a1) - o3 < int (length a1) - i) \<and> length a1 = length a2 \<and> ((0 :: int) \<le> o3 \<and> o3 \<le> int (length a1)) \<and> drop (0 :: nat) (take (nat o3 - (0 :: nat)) a1) = drop (0 :: nat) (take (nat o3 - (0 :: nat)) a2))) \<and> (\<forall>(result :: int). (if o2 = True then result = i else ((0 :: int) \<le> result \<and> result \<le> int (length a1)) \<and> drop (0 :: nat) (take (nat result - (0 :: nat)) a1) = drop (0 :: nat) (take (nat result - (0 :: nat)) a2) \<and> (result < int (length a1) \<longrightarrow> \<not>a1 ! nat result = a2 ! nat result)) \<longrightarrow> ((0 :: int) \<le> result \<and> result \<le> int (length a1)) \<and> drop (0 :: nat) (take (nat result - (0 :: nat)) a1) = drop (0 :: nat) (take (nat result - (0 :: nat)) a2) \<and> (result < int (length a1) \<longrightarrow> \<not>a1 ! nat result = a2 ! nat result)))"
  sorry
end
