theory f_puzzle_Step1
  imports "NTP4Verif.NTP4Verif" "./f_puzzle_Puzzle"
begin
definition p :: "int \<Rightarrow> _"
  where "p k \<longleftrightarrow> (\<forall>(n :: int). (0 :: int) \<le> n \<longrightarrow> k \<le> f (n + k))" for k
axiomatization where base:   "p (0 :: int)"
axiomatization where induction_step:   "p (n + (1 :: int))"
 if "(0 :: int) \<le> n"
 and "p n"
  for n :: "int"
axiomatization where SimpleInduction:   "p n"
 if "(0 :: int) \<le> n"
  for n :: "int"
end
