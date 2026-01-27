theory f_puzzle_Solution_l3qtvc
  imports "NTP4Verif.NTP4Verif" "./f_puzzle_Puzzle" "./f_puzzle_Step1"
begin
theorem l3'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "n \<le> f n"
  and "f n \<le> f (f n)"
  sorry
end
