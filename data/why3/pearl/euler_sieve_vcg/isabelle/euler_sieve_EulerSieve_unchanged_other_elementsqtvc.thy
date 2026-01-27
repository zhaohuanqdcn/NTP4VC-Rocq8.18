theory euler_sieve_EulerSieve_unchanged_other_elementsqtvc
  imports "NTP4Verif.NTP4Verif" "./euler_sieve_ArithmeticResults" "./euler_sieve_DivisibilityResults" "./euler_sieve_EulerSieveSpec"
begin
theorem unchanged_other_elements'vc:
  fixes i :: "int"
  fixes s2 :: "'a list"
  fixes v :: "'a"
  fixes j :: "int"
  assumes fact0: "(0 :: int) \<le> i"
  assumes fact1: "i < int (length (s2[nat i := v]))"
  assumes fact2: "length (s2[nat i := v]) = length s2"
  assumes fact3: "(0 :: int) \<le> j"
  assumes fact4: "j < int (length (s2[nat i := v]))"
  assumes fact5: "\<not>i = j"
  shows "s2[nat i := v] ! nat j = s2 ! nat j"
  sorry
end
