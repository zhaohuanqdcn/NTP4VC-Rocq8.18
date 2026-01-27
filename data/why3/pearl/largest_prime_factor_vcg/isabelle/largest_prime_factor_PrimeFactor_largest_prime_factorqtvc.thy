theory largest_prime_factor_PrimeFactor_largest_prime_factorqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem largest_prime_factor'vc:
  fixes n :: "int"
  assumes fact0: "(2 :: int) \<le> n"
  shows "(2 :: int) \<le> n"
  and "(2 :: int) \<le> (2 :: int)"
  and "(2 :: int) \<le> n"
  and "\<forall>(i :: int). (2 :: int) \<le> i \<and> i < (2 :: int) \<longrightarrow> \<not>i dvd n"
  and "\<forall>(d :: int). ((2 :: int) \<le> d \<and> d \<le> n) \<and> d dvd n \<and> (\<forall>(i :: int). (2 :: int) \<le> i \<and> i < d \<longrightarrow> \<not>i dvd n) \<longrightarrow> \<not>d = (0 :: int) \<and> (let o1 :: int = n cdiv d in (((1 :: int) \<le> o1 \<and> o1 \<le> n) \<and> ((2 :: int) \<le> d \<and> d \<le> n) \<and> d dvd n \<and> prime d \<and> (\<forall>(i :: int). i dvd o1 \<and> (2 :: int) \<le> i \<longrightarrow> d \<le> i \<and> i dvd n) \<and> (\<forall>(i :: int). prime i \<and> i dvd n \<and> d < i \<longrightarrow> i dvd o1)) \<and> (\<forall>(target :: int) (factor :: int). ((1 :: int) \<le> target \<and> target \<le> n) \<and> ((2 :: int) \<le> factor \<and> factor \<le> n) \<and> factor dvd n \<and> prime factor \<and> (\<forall>(i :: int). i dvd target \<and> (2 :: int) \<le> i \<longrightarrow> factor \<le> i \<and> i dvd n) \<and> (\<forall>(i :: int). prime i \<and> i dvd n \<and> factor < i \<longrightarrow> i dvd target) \<longrightarrow> (if (2 :: int) \<le> target then ((2 :: int) \<le> target \<and> ((2 :: int) \<le> factor \<and> factor \<le> target) \<and> (\<forall>(i :: int). (2 :: int) \<le> i \<and> i < factor \<longrightarrow> \<not>i dvd target)) \<and> (\<forall>(d1 :: int). (factor \<le> d1 \<and> d1 \<le> target) \<and> d1 dvd target \<and> (\<forall>(i :: int). (2 :: int) \<le> i \<and> i < d1 \<longrightarrow> \<not>i dvd target) \<longrightarrow> \<not>d1 = (0 :: int) \<and> ((0 :: int) \<le> target \<and> target cdiv d1 < target) \<and> ((1 :: int) \<le> target cdiv d1 \<and> target cdiv d1 \<le> n) \<and> ((2 :: int) \<le> d1 \<and> d1 \<le> n) \<and> d1 dvd n \<and> prime d1 \<and> (\<forall>(i :: int). i dvd target cdiv d1 \<and> (2 :: int) \<le> i \<longrightarrow> d1 \<le> i \<and> i dvd n) \<and> (\<forall>(i :: int). prime i \<and> i dvd n \<and> d1 < i \<longrightarrow> i dvd target cdiv d1)) else prime factor \<and> factor dvd n \<and> (\<forall>(i :: int). factor < i \<and> i \<le> n \<longrightarrow> \<not>(prime i \<and> i dvd n)))))"
  sorry
end
