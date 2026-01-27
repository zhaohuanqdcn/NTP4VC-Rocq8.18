theory euler_sieve_EulerSieve_multiples_of_marked_are_markedqtvc
  imports "NTP4Verif.NTP4Verif" "./euler_sieve_ArithmeticResults" "./euler_sieve_DivisibilityResults" "./euler_sieve_EulerSieveSpec"
begin
theorem multiples_of_marked_are_marked'vc:
  fixes n :: "int"
  fixes marked :: "bool list"
  fixes k :: "int"
  fixes i :: "int"
  fixes j :: "int"
  assumes fact0: "(2 :: int) \<le> n"
  assumes fact1: "n \<le> int (length marked)"
  assumes fact2: "previously_marked_multiples marked n"
  assumes fact3: "(2 :: int) \<le> k"
  assumes fact4: "k < n"
  assumes fact5: "(2 :: int) \<le> i"
  assumes fact6: "i < int (length marked)"
  assumes fact7: "k * i < int (length marked)"
  assumes fact8: "(1 :: int) \<le> j"
  assumes fact9: "j < int (length marked)"
  assumes fact10: "k * i * j < int (length marked)"
  shows "marked ! nat (k * i * j) = True"
  sorry
end
