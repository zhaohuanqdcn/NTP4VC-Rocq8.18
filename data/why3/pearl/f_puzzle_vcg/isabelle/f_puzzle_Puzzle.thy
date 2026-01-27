theory f_puzzle_Puzzle
  imports "NTP4Verif.NTP4Verif"
begin
consts f :: "int \<Rightarrow> int"
axiomatization where H1:   "(0 :: int) \<le> f n"
 if "(0 :: int) \<le> n"
  for n :: "int"
axiomatization where H2:   "f (f n) < f (n + (1 :: int))"
 if "(0 :: int) \<le> n"
  for n :: "int"
end
