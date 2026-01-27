theory f_puzzle_Solution_l4qtvc
  imports "NTP4Verif.NTP4Verif" "./f_puzzle_Puzzle" "./f_puzzle_Step1"
begin
theorem l4'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "f n < f (n + (1 :: int))"
  sorry
end
