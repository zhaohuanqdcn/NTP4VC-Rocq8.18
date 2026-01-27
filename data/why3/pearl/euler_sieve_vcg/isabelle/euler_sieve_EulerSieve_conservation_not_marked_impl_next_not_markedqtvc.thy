theory euler_sieve_EulerSieve_conservation_not_marked_impl_next_not_markedqtvc
  imports "NTP4Verif.NTP4Verif" "./euler_sieve_ArithmeticResults" "./euler_sieve_DivisibilityResults" "./euler_sieve_EulerSieveSpec"
begin
theorem conservation_not_marked_impl_next_not_marked'vc:
  fixes marked :: "bool list"
  fixes nexts :: "int list"
  fixes n :: "int"
  fixes max :: "int"
  assumes fact0: "not_marked_impl_next_not_marked marked nexts n"
  assumes fact1: "n < nexts ! nat n"
  assumes fact2: "(0 :: int) < n"
  assumes fact3: "max ediv nexts ! nat n \<le> max ediv n"
  shows "not_marked_impl_next_not_marked marked nexts (nexts ! nat n)"
  sorry
end
