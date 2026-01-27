theory knuth_prime_numbers_PrimeNumbers_benchqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition no_prime_in :: "int \<Rightarrow> int \<Rightarrow> _"
  where "no_prime_in l u \<longleftrightarrow> (\<forall>(x :: int). l < x \<and> x < u \<longrightarrow> \<not>prime x)" for l u
definition first_primes :: "(int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> _"
  where "first_primes p u \<longleftrightarrow> p (0 :: int) = (2 :: int) \<and> (\<forall>(i :: int) (j :: int). (0 :: int) \<le> i \<and> i < j \<and> j < u \<longrightarrow> p i < p j) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < u \<longrightarrow> prime (p i)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < u - (1 :: int) \<longrightarrow> no_prime_in (p i) (p (i + (1 :: int))))" for p u
axiomatization where Bertrand_postulate:   "\<not>no_prime_in p ((2 :: int) * p)"
 if "prime p"
  for p :: "int"
theorem bench'vc:
  shows "(2 :: int) \<le> (100 :: int)"
  and "\<forall>(t :: int list). int (length t) = (100 :: int) \<and> first_primes (nth t o nat) (100 :: int) \<longrightarrow> ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) < int (length t)) \<and> (t ! (0 :: nat) = (2 :: int) \<longrightarrow> ((0 :: int) \<le> (1 :: int) \<and> (1 :: int) < int (length t)) \<and> (t ! (1 :: nat) = (3 :: int) \<longrightarrow> ((0 :: int) \<le> (2 :: int) \<and> (2 :: int) < int (length t)) \<and> (t ! (2 :: nat) = (5 :: int) \<longrightarrow> ((0 :: int) \<le> (3 :: int) \<and> (3 :: int) < int (length t)) \<and> (t ! (3 :: nat) = (7 :: int) \<longrightarrow> ((0 :: int) \<le> (4 :: int) \<and> (4 :: int) < int (length t)) \<and> (t ! (4 :: nat) = (11 :: int) \<longrightarrow> ((0 :: int) \<le> (5 :: int) \<and> (5 :: int) < int (length t)) \<and> (t ! (5 :: nat) = (13 :: int) \<longrightarrow> ((0 :: int) \<le> (6 :: int) \<and> (6 :: int) < int (length t)) \<and> (t ! (6 :: nat) = (17 :: int) \<longrightarrow> ((0 :: int) \<le> (7 :: int) \<and> (7 :: int) < int (length t)) \<and> (t ! (7 :: nat) = (19 :: int) \<longrightarrow> ((0 :: int) \<le> (8 :: int) \<and> (8 :: int) < int (length t)) \<and> (t ! (8 :: nat) = (23 :: int) \<longrightarrow> (0 :: int) \<le> (9 :: int) \<and> (9 :: int) < int (length t))))))))))"
  sorry
end
