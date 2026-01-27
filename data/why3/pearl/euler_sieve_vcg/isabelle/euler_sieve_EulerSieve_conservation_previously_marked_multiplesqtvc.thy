theory euler_sieve_EulerSieve_conservation_previously_marked_multiplesqtvc
  imports "NTP4Verif.NTP4Verif" "./euler_sieve_ArithmeticResults" "./euler_sieve_DivisibilityResults" "./euler_sieve_EulerSieveSpec"
begin
theorem conservation_previously_marked_multiples'vc:
  fixes n :: "int"
  fixes marked :: "bool list"
  fixes nexts :: "int list"
  assumes fact0: "(2 :: int) \<le> n"
  assumes fact1: "n < int (length marked)"
  assumes fact2: "length marked = length nexts"
  assumes fact3: "nexts ! nat n \<le> int (length marked)"
  assumes fact4: "previously_marked_multiples marked n"
  assumes fact5: "only_multiples_marked marked (n + (1 :: int))"
  assumes fact6: "all_eliminated_marked marked nexts"
  assumes fact7: "not_marked_impl_next_not_marked marked nexts (nexts ! nat n)"
  assumes fact8: "all_multiples_marked marked n (int (length marked))"
  shows "previously_marked_multiples marked (nexts ! nat n)"
  sorry
end
