theory euler_sieve_DivisibilityResults_divides_infqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem divides_inf'vc:
  fixes n :: "int"
  fixes m :: "int"
  fixes k :: "int"
  assumes fact0: "(2 :: int) \<le> n"
  assumes fact1: "(2 :: int) \<le> m"
  assumes fact2: "n dvd m"
  assumes fact3: "\<forall>(k :: int). (2 :: int) \<le> k \<and> k < n \<longrightarrow> \<not>k dvd m"
  assumes fact4: "(2 :: int) \<le> k"
  assumes fact5: "k < n"
  shows "\<not>k dvd m ediv n"
  sorry
end
