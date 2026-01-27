theory rac_Variants_loop_var_ok2qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem loop_var_ok2'vc:
  fixes j :: "int"
  fixes i :: "int"
  assumes fact0: "(0 :: int) \<le> j"
  shows "if (0 :: int) < i then (0 :: int) \<le> i \<and> i - (1 :: int) < i \<or> i = i - (1 :: int) \<and> (0 :: int) \<le> j \<and> j < j else (0 :: int) \<le> i \<and> i < i \<or> (0 :: int) \<le> j \<and> j - (1 :: int) < j"
  sorry
end
