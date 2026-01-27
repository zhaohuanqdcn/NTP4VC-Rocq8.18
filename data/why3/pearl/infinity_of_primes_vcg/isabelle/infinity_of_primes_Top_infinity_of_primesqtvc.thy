theory infinity_of_primes_Top_infinity_of_primesqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem infinity_of_primes'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "let o1 :: int = n - (1 :: int) in ((0 :: int) \<le> o1 + (1 :: int) \<longrightarrow> ((1 :: int) \<le> (1 :: int) \<and> int (fcard fempty) = (0 :: int) \<and> (\<forall>(k :: int). k |\<in>| fempty \<longrightarrow> prime k) \<and> (\<forall>(k :: int). k |\<in>| fempty \<longrightarrow> k dvd (1 :: int))) \<and> (\<forall>(x :: int) (s :: int fset). (((0 :: int) \<le> int (fcard s) \<and> int (fcard s) \<le> o1) \<and> (1 :: int) \<le> x \<and> (\<forall>(k :: int). k |\<in>| s \<longrightarrow> prime k) \<and> (\<forall>(k :: int). k |\<in>| s \<longrightarrow> k dvd x) \<longrightarrow> (1 :: int) \<le> x * (x + (1 :: int)) \<and> int (fcard (finsert (x + (1 :: int)) s)) = int (fcard s) + (1 :: int) \<and> (\<forall>(k :: int). k |\<in>| finsert (x + (1 :: int)) s \<longrightarrow> prime k) \<and> (\<forall>(k :: int). k |\<in>| finsert (x + (1 :: int)) s \<longrightarrow> k dvd x * (x + (1 :: int)))) \<and> ((1 :: int) \<le> x \<and> int (fcard s) = o1 + (1 :: int) \<and> (\<forall>(k :: int). k |\<in>| s \<longrightarrow> prime k) \<and> (\<forall>(k :: int). k |\<in>| s \<longrightarrow> k dvd x) \<longrightarrow> int (fcard s) = n \<and> (\<forall>(k :: int). k |\<in>| s \<longrightarrow> prime k)))) \<and> (o1 + (1 :: int) < (0 :: int) \<longrightarrow> (let s :: int fset = fempty in int (fcard s) = n \<and> (\<forall>(k :: int). k |\<in>| s \<longrightarrow> prime k)))"
  sorry
end
