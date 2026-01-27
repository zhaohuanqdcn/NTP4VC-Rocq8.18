theory euler_sieve_EulerSieve_conservation_only_multiples_markedqtvc
  imports "NTP4Verif.NTP4Verif" "./euler_sieve_ArithmeticResults" "./euler_sieve_DivisibilityResults" "./euler_sieve_EulerSieveSpec"
begin
theorem conservation_only_multiples_marked'vc:
  fixes i :: "int"
  fixes n :: "int"
  fixes j :: "int"
  fixes marked :: "bool list"
  assumes fact0: "(2 :: int) \<le> i"
  assumes fact1: "i < n"
  assumes fact2: "(2 :: int) \<le> j"
  assumes fact3: "j < int (length marked)"
  assumes fact4: "i * j < int (length marked)"
  assumes fact5: "only_multiples_marked marked n"
  shows "only_multiples_marked (marked[nat (i * j) := True]) n"
  sorry
end
