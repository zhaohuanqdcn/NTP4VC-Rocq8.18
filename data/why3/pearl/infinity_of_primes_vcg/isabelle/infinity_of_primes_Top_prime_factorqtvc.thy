theory infinity_of_primes_Top_prime_factorqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem prime_factor'vc:
  fixes n :: "int"
  assumes fact0: "(2 :: int) \<le> n"
  shows "(2 :: int) \<le> n + (1 :: int) \<longrightarrow> (\<forall>(d :: int). (2 :: int) \<le> d \<and> d < (2 :: int) \<longrightarrow> \<not>d dvd n) \<and> (\<forall>(p :: int). ((2 :: int) \<le> p \<and> p \<le> n) \<and> (\<forall>(d :: int). (2 :: int) \<le> d \<and> d < p \<longrightarrow> \<not>d dvd n) \<longrightarrow> \<not>p = (0 :: int) \<and> (if n cmod p = (0 :: int) then prime p \<and> p dvd n else \<forall>(d :: int). (2 :: int) \<le> d \<and> d < p + (1 :: int) \<longrightarrow> \<not>d dvd n)) \<and> ((\<forall>(d :: int). (2 :: int) \<le> d \<and> d < n + (1 :: int) \<longrightarrow> \<not>d dvd n) \<longrightarrow> prime n \<and> n dvd n)"
  and "n + (1 :: int) < (2 :: int) \<longrightarrow> prime n \<and> n dvd n"
  sorry
end
