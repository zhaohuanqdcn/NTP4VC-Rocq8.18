theory f_puzzle_Step1_base
  imports "NTP4Verif.NTP4Verif" "./f_puzzle_Puzzle"
begin
definition p :: "int \<Rightarrow> _"
  where "p k \<longleftrightarrow> (\<forall>(n :: int). (0 :: int) \<le> n \<longrightarrow> k \<le> f (n + k))" for k
theorem base:
  shows "p (0 :: int)"
  sorry
end
