theory f_puzzle_Solution_G
  imports "NTP4Verif.NTP4Verif" "./f_puzzle_Puzzle" "./f_puzzle_Step1"
begin
definition p' :: "int \<Rightarrow> _"
  where "p' k \<longleftrightarrow> (\<forall>(n :: int) (m :: int). (0 :: int) \<le> n \<and> n \<le> m \<and> m \<le> k \<longrightarrow> f n \<le> f m)" for k
axiomatization where base:   "p' (0 :: int)"
axiomatization where induction_step:   "p' (n + (1 :: int))"
 if "(0 :: int) \<le> n"
 and "p' n"
  for n :: "int"
axiomatization where SimpleInduction:   "p' n"
 if "(0 :: int) \<le> n"
  for n :: "int"
theorem G:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "f n = n"
  sorry
end
