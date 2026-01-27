theory euler_sieve_EulerSieve_prev_and_new_impl_all_multiples_markedqtvc
  imports "NTP4Verif.NTP4Verif" "./euler_sieve_ArithmeticResults" "./euler_sieve_DivisibilityResults" "./euler_sieve_EulerSieveSpec"
begin
theorem prev_and_new_impl_all_multiples_marked'vc:
  fixes n :: "int"
  fixes marked :: "bool list"
  fixes max :: "int"
  fixes marked_old :: "bool list"
  assumes fact0: "(2 :: int) \<le> n"
  assumes fact1: "n < int (length marked)"
  assumes fact2: "(2 :: int) \<le> max"
  assumes fact3: "max < int (length marked)"
  assumes fact4: "length marked_old = length marked"
  assumes fact5: "is_copy marked marked_old"
  assumes fact6: "previously_marked_multiples marked_old n"
  assumes fact7: "previously_marked_multiples marked n"
  assumes fact8: "only_multiples_marked marked_old n"
  assumes fact9: "prime_multiples_marked marked_old marked n (int (length marked))"
  shows "all_multiples_marked marked n (int (length marked))"
  sorry
end
