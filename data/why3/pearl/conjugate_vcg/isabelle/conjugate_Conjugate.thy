theory conjugate_Conjugate
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition is_partition :: "int list \<Rightarrow> _"
  where "is_partition a \<longleftrightarrow> (0 :: int) < int (length a) \<and> (\<forall>(i :: int) (j :: int). (0 :: int) \<le> i \<and> i \<le> j \<and> j < int (length a) \<longrightarrow> a ! nat j \<le> a ! nat i) \<and> a ! nat (int (length a) - (1 :: int)) = (0 :: int)" for a
definition numofgt :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "numofgt a n v \<longleftrightarrow> ((0 :: int) \<le> n \<and> n < int (length a)) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < n \<longrightarrow> v < a ! nat j) \<and> a ! nat n \<le> v" for a n v
definition is_conjugate :: "int list \<Rightarrow> int list \<Rightarrow> _"
  where "is_conjugate a b \<longleftrightarrow> a ! (0 :: nat) < int (length b) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < int (length b) \<longrightarrow> numofgt a (b ! nat j) j)" for a b
end
