theory Globals_Globals
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Memory_Memory"
begin
axiomatization where Q_L_exp_omega_dt_3319_region:   "region (3320 :: int) = (2 :: int)"
axiomatization where Q_L_exp_omega_dt_3319_linked:   "t (3320 :: int) = (0 :: int)"
 if "linked t"
  for t :: "int \<Rightarrow> int"
end
