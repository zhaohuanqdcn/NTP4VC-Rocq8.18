theory dreal_Misc_log_limit
  imports "NTP4Verif.NTP4Verif"
begin
theorem log_limit:
  shows "-ln ((1 :: Real.real) - (1 :: Real.real) / (549755813888)) + abs (ln ((1 :: Real.real) - (1 :: Real.real) / (549755813888)) * ((1 :: Real.real) / (68719476736))) \<le> (1 :: Real.real) / (274877906944)"
  sorry
end
