theory replay_Top_lqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem l'vc:
  shows "\<forall>(x :: int). x + x = (2 :: int) * x"
  and "\<forall>(x :: int). x = (0 :: int)"
  sorry
end
