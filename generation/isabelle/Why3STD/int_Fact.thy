theory int_Fact
  imports "NTP4Verif.NTP4Verif"
begin
consts fact :: "int \<Rightarrow> int"
axiomatization where fact'def:   "if n = (0 :: int) then fact n = (1 :: int) else fact n = n * fact (n - (1 :: int))"
 if "(0 :: int) \<le> n"
  for n :: "int"
end
