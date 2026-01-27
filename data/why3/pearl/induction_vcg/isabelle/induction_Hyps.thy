theory induction_Hyps
  imports "NTP4Verif.NTP4Verif"
begin
consts p :: "int \<Rightarrow> bool"
axiomatization where H0:   "p (0 :: int)"
axiomatization where H1:   "p (1 :: int)"
axiomatization where H2:   "p (n + (2 :: int))"
 if "(0 :: int) \<le> n"
 and "p n"
  for n :: "int"
end
