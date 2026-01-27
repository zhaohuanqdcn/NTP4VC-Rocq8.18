theory rac_Variants_loop_var_ok1qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem loop_var_ok1'vc:
  fixes i :: "int"
  assumes fact0: "(0 :: int) \<le> i"
  shows "(0 :: int) \<le> i"
  and "i - (1 :: int) < i"
  sorry
end
