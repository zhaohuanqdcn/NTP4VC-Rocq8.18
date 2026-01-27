theory rac_Variants_loop_var_fail1qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem loop_var_fail1'vc:
  fixes i :: "int"
  assumes fact0: "(0 :: int) \<le> i"
  shows "if (1 :: int) < i then (0 :: int) \<le> i \<and> i - (1 :: int) < i else (0 :: int) \<le> i \<and> i < i"
  sorry
end
