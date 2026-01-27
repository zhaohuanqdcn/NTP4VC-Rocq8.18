theory rac_Premises_test1qtvc
  imports "NTP4Verif.NTP4Verif"
begin
consts p :: "int \<Rightarrow> bool"
consts q :: "int \<Rightarrow> bool"
axiomatization where a:   "q x"
 if "p x"
  for x :: "int"
theorem test1'vc:
  assumes fact0: "p (42 :: int)"
  shows "q (42 :: int)"
  sorry
end
