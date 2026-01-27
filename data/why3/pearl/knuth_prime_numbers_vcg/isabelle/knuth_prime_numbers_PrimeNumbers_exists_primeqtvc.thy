theory knuth_prime_numbers_PrimeNumbers_exists_primeqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition no_prime_in :: "int \<Rightarrow> int \<Rightarrow> _"
  where "no_prime_in l u \<longleftrightarrow> (\<forall>(x :: int). l < x \<and> x < u \<longrightarrow> \<not>prime x)" for l u
definition first_primes :: "(int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> _"
  where "first_primes p u \<longleftrightarrow> p (0 :: int) = (2 :: int) \<and> (\<forall>(i :: int) (j :: int). (0 :: int) \<le> i \<and> i < j \<and> j < u \<longrightarrow> p i < p j) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < u \<longrightarrow> prime (p i)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < u - (1 :: int) \<longrightarrow> no_prime_in (p i) (p (i + (1 :: int))))" for p u
theorem exists_prime'vc:
  fixes u :: "int"
  fixes p :: "int \<Rightarrow> int"
  fixes d :: "int"
  assumes fact0: "(1 :: int) \<le> u"
  assumes fact1: "first_primes p u"
  assumes fact2: "(2 :: int) \<le> d"
  assumes fact3: "d \<le> p (u - (1 :: int))"
  assumes fact4: "prime d"
  shows "\<exists>(i :: int). ((0 :: int) \<le> i \<and> i < u) \<and> d = p i"
  sorry
end
