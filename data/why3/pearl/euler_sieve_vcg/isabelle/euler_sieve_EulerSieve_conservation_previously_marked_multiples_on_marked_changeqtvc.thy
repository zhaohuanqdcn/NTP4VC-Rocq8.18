theory euler_sieve_EulerSieve_conservation_previously_marked_multiples_on_marked_changeqtvc
  imports "NTP4Verif.NTP4Verif" "./euler_sieve_ArithmeticResults" "./euler_sieve_DivisibilityResults" "./euler_sieve_EulerSieveSpec"
begin
theorem conservation_previously_marked_multiples_on_marked_change'vc:
  fixes marked :: "bool list"
  fixes n :: "int"
  fixes i :: "int"
  assumes fact0: "previously_marked_multiples marked n"
  assumes fact1: "(0 :: int) \<le> i"
  assumes fact2: "i < int (length marked)"
  shows "previously_marked_multiples (marked[nat i := True]) n"
  sorry
end
