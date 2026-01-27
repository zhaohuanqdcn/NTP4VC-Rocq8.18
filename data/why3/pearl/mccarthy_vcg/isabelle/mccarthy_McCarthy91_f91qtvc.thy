theory mccarthy_McCarthy91_f91qtvc
  imports "NTP4Verif.NTP4Verif"
begin
definition spec :: "int \<Rightarrow> int"
  where "spec x = (if x \<le> (100 :: int) then 91 :: int else x - (10 :: int))" for x
theorem f91'vc:
  fixes n :: "int"
  shows "n \<le> (100 :: int) \<longrightarrow> (let o1 :: int = n + (11 :: int) in ((0 :: int) \<le> (101 :: int) - n \<and> (101 :: int) - o1 < (101 :: int) - n) \<and> (0 :: int) \<le> (101 :: int) - n \<and> (101 :: int) - spec o1 < (101 :: int) - n)"
  and "\<forall>(result :: int). (if n \<le> (100 :: int) then result = spec (spec (n + (11 :: int))) else result = n - (10 :: int)) \<longrightarrow> result = spec n"
  sorry
end
