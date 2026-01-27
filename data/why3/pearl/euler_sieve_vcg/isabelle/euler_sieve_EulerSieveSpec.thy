theory euler_sieve_EulerSieveSpec
  imports "NTP4Verif.NTP4Verif" "./euler_sieve_ArithmeticResults" "./euler_sieve_DivisibilityResults"
begin
definition inv_nexts :: "int list \<Rightarrow> int \<Rightarrow> _"
  where "inv_nexts nexts n \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < n \<longrightarrow> i < nexts ! nat i \<and> nexts ! nat i \<le> n)" for nexts n
definition all_eliminated_marked :: "bool list \<Rightarrow> int list \<Rightarrow> _"
  where "all_eliminated_marked marked nexts \<longleftrightarrow> length marked = length nexts \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length marked) \<longrightarrow> (\<forall>(j :: int). i < j \<and> j < nexts ! nat i \<longrightarrow> marked ! nat j = True))" for marked nexts
definition all_eliminated_marked_partial :: "bool list \<Rightarrow> int list \<Rightarrow> int \<Rightarrow> _"
  where "all_eliminated_marked_partial marked nexts min \<longleftrightarrow> length marked = length nexts \<and> (\<forall>(i :: int). min \<le> i \<and> i < int (length marked) \<longrightarrow> (\<forall>(j :: int). i < j \<and> j < nexts ! nat i \<longrightarrow> marked ! nat j = True))" for marked nexts min
definition not_marked_impl_next_not_marked :: "bool list \<Rightarrow> int list \<Rightarrow> int \<Rightarrow> _"
  where "not_marked_impl_next_not_marked marked_old nexts n \<longleftrightarrow> length marked_old = length nexts \<and> (2 :: int) \<le> int (length marked_old) \<and> (2 :: int) \<le> n \<and> (\<forall>(i :: int). (2 :: int) \<le> i \<and> i \<le> (int (length marked_old) - (1 :: int)) ediv n \<longrightarrow> nexts ! nat i \<le> (int (length marked_old) - (1 :: int)) ediv n \<longrightarrow> \<not>marked_old ! nat i = True \<longrightarrow> \<not>marked_old ! nat (nexts ! nat i) = True)" for marked_old nexts n
definition is_copy :: "bool list \<Rightarrow> bool list \<Rightarrow> _"
  where "is_copy marked marked_old \<longleftrightarrow> length marked = length marked_old \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length marked) \<longrightarrow> \<not>marked ! nat i = True \<longrightarrow> \<not>marked_old ! nat i = True)" for marked marked_old
definition not_marked_impl_next_not_marked_partial :: "bool list \<Rightarrow> int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "not_marked_impl_next_not_marked_partial marked nexts n p \<longleftrightarrow> length marked = length nexts \<and> (2 :: int) \<le> int (length marked) \<and> (2 :: int) \<le> n \<and> p \<le> (int (length marked) - (1 :: int)) ediv n \<and> (\<forall>(i :: int). (2 :: int) \<le> i \<and> i < p \<longrightarrow> nexts ! nat i \<le> (int (length marked) - (1 :: int)) ediv n \<longrightarrow> \<not>marked ! nat i = True \<longrightarrow> \<not>marked ! nat (nexts ! nat i) = True)" for marked nexts n p
definition all_primes :: "bool list \<Rightarrow> int \<Rightarrow> _"
  where "all_primes marked n \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < n \<longrightarrow> \<not>marked ! nat i = True \<longleftrightarrow> prime i)" for marked n
definition all_multiples_marked :: "bool list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "all_multiples_marked marked i max \<longleftrightarrow> ((2 :: int) \<le> i \<and> i < int (length marked)) \<and> (\<forall>(k :: int). (2 :: int) \<le> k \<and> k < max \<longrightarrow> i * k < int (length marked) \<longrightarrow> marked ! nat (i * k) = True)" for marked i max
definition previously_marked_multiples :: "bool list \<Rightarrow> int \<Rightarrow> _"
  where "previously_marked_multiples marked n \<longleftrightarrow> (\<forall>(i :: int). (2 :: int) \<le> i \<and> i < n \<longrightarrow> all_multiples_marked marked i (int (length marked)))" for marked n
definition only_multiples_marked :: "bool list \<Rightarrow> int \<Rightarrow> _"
  where "only_multiples_marked marked n \<longleftrightarrow> (\<forall>(k :: int). (2 :: int) \<le> k \<and> k < int (length marked) \<longrightarrow> marked ! nat k = True \<longrightarrow> (\<exists>(i :: int) (j :: int). ((2 :: int) \<le> i \<and> i < n) \<and> ((2 :: int) \<le> j \<and> j < int (length marked)) \<and> i * j = k))" for marked n
definition prime_multiples_marked :: "bool list \<Rightarrow> bool list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "prime_multiples_marked marked_old marked n max \<longleftrightarrow> length marked_old = length marked \<and> (n < max \<and> max \<le> int (length marked)) \<and> (\<forall>(i :: int). n \<le> i \<and> i < max \<longrightarrow> \<not>marked_old ! nat i = True \<longrightarrow> n * i < int (length marked_old) \<longrightarrow> marked ! nat (n * i) = True)" for marked_old marked n max
definition inv_remove_products :: "int list \<Rightarrow> bool list \<Rightarrow> int \<Rightarrow> _"
  where "inv_remove_products nexts marked n \<longleftrightarrow> length nexts = length marked \<and> \<not>marked ! (2 :: nat) = True \<and> all_primes marked n \<and> prime n \<and> \<not>marked ! nat n = True \<and> inv_nexts nexts (int (length nexts))" for nexts marked n
definition ordered :: "int list \<Rightarrow> int \<Rightarrow> _"
  where "ordered a n \<longleftrightarrow> (\<forall>(i :: int) (j :: int). (0 :: int) \<le> i \<and> i < j \<and> j < n \<longrightarrow> a ! nat i < a ! nat j)" for a n
definition all_inf_or_eq :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "all_inf_or_eq a n k \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < n \<longrightarrow> a ! nat i \<le> k)" for a n k
end
