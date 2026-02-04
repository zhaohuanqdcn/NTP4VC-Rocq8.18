theory Globals_Globals
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Memory_Memory"
begin
axiomatization where Q_G_ccmp_2604_region:   "region (2605 :: int) = (0 :: int)"
axiomatization where Q_G_ccmp_2604_linked:   "t (2605 :: int) = (1 :: int)"
 if "linked t"
  for t :: "int \<Rightarrow> int"
end
