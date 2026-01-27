theory euler_sieve_DivisibilityResults_divides_divqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem divides_div'vc:
  fixes n :: "int"
  fixes m :: "int"
  fixes k :: "int"
  assumes fact0: "(2 :: int) \<le> n"
  assumes fact1: "(2 :: int) \<le> m"
  assumes fact2: "(2 :: int) \<le> k"
  assumes fact3: "k < n"
  assumes fact4: "n dvd m"
  assumes fact5: "\<not>k dvd m"
  shows "\<not>k dvd m ediv n"
  sorry
end
