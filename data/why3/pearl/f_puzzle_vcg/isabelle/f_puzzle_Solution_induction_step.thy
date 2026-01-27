theory f_puzzle_Solution_induction_step
  imports "NTP4Verif.NTP4Verif" "./f_puzzle_Puzzle" "./f_puzzle_Step1"
begin
definition p' :: "int \<Rightarrow> _"
  where "p' k \<longleftrightarrow> (\<forall>(n :: int) (m :: int). (0 :: int) \<le> n \<and> n \<le> m \<and> m \<le> k \<longrightarrow> f n \<le> f m)" for k
axiomatization where base:   "p' (0 :: int)"
theorem induction_step:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  assumes fact1: "p' n"
  shows "p' (n + (1 :: int))"
  sorry
end
