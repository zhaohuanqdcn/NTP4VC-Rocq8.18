theory verifythis_2021_lexicographic_permutations_2_ArrayListConversions_to_list_fromqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.map_MapEq"
begin
theorem to_list_from'vc:
  fixes i :: "int"
  fixes a :: "int list"
  assumes fact0: "(0 :: int) \<le> i"
  assumes fact1: "i \<le> int (length a)"
  shows "let o1 :: int = int (length a) in (\<not>i = o1 \<longrightarrow> (let o2 :: int = i + (1 :: int) in (((0 :: int) \<le> int (length a) - i \<and> int (length a) - o2 < int (length a) - i) \<and> (0 :: int) \<le> o2 \<and> o2 \<le> int (length a)) \<and> (\<forall>(o3 :: int list). int (length o3) = int (length a) - o2 \<and> (\<forall>(k :: int). (0 :: int) \<le> k \<and> k < int (length a) - o2 \<longrightarrow> nth_opt o3 k = Some (a ! nat (k + o2))) \<longrightarrow> (0 :: int) \<le> i \<and> i < int (length a)))) \<and> (\<forall>(result :: int list). (if i = o1 then result = (Nil :: int list) else let o2 :: int = i + (1 :: int) in \<exists>(o3 :: int list). (int (length o3) = int (length a) - o2 \<and> (\<forall>(k :: int). (0 :: int) \<le> k \<and> k < int (length a) - o2 \<longrightarrow> nth_opt o3 k = Some (a ! nat (k + o2)))) \<and> result = Cons (a ! nat i) o3) \<longrightarrow> int (length result) = int (length a) - i \<and> (\<forall>(k :: int). (0 :: int) \<le> k \<and> k < int (length a) - i \<longrightarrow> nth_opt result k = Some (a ! nat (k + i))))"
  sorry
end
