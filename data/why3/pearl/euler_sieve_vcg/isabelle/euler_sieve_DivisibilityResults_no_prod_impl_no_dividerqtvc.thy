theory euler_sieve_DivisibilityResults_no_prod_impl_no_dividerqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem no_prod_impl_no_divider'vc:
  fixes n :: "int"
  fixes i :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  assumes fact1: "(2 :: int) \<le> i"
  assumes fact2: "i < n * n"
  assumes fact3: "\<not>(\<exists>(k :: int) (l :: int). ((2 :: int) \<le> k \<and> k < n) \<and> ((2 :: int) \<le> l \<and> l < i) \<and> k * l = i)"
  shows "\<not>(\<exists>(k :: int). ((2 :: int) \<le> k \<and> k < n) \<and> \<not>k = i \<and> k dvd i)"
  sorry
end
