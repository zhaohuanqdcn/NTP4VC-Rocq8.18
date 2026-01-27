theory f_puzzle_Solution_base
  imports "NTP4Verif.NTP4Verif" "./f_puzzle_Puzzle" "./f_puzzle_Step1"
begin
definition p' :: "int \<Rightarrow> _"
  where "p' k \<longleftrightarrow> (\<forall>(n :: int) (m :: int). (0 :: int) \<le> n \<and> n \<le> m \<and> m \<le> k \<longrightarrow> f n \<le> f m)" for k
theorem base:
  shows "p' (0 :: int)"
  sorry
end
