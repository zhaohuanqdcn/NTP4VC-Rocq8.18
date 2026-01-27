theory f_puzzle_Step1_induction_step
  imports "NTP4Verif.NTP4Verif" "./f_puzzle_Puzzle"
begin
definition p :: "int \<Rightarrow> _"
  where "p k \<longleftrightarrow> (\<forall>(n :: int). (0 :: int) \<le> n \<longrightarrow> k \<le> f (n + k))" for k
axiomatization where base:   "p (0 :: int)"
theorem induction_step:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  assumes fact1: "p n"
  shows "p (n + (1 :: int))"
  sorry
end
