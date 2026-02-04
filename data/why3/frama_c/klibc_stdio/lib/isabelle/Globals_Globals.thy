theory Globals_Globals
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Memory_Memory"
begin
axiomatization where Q_G___stdio_headnode_1722_region:   "region (1723 :: int) = (0 :: int)"
axiomatization where Q_G___stdio_headnode_1722_linked:   "t (1723 :: int) = (11 :: int)"
 if "linked t"
  for t :: "int \<Rightarrow> int"
axiomatization where Q_L___va_arg0_38234_region:   "region (38235 :: int) = (2 :: int)"
axiomatization where Q_L___va_arg0_38234_linked:   "t (38235 :: int) = (0 :: int)"
 if "linked t"
  for t :: "int \<Rightarrow> int"
axiomatization where Q_L_ch_20234_region:   "region (20235 :: int) = (2 :: int)"
axiomatization where Q_L_ch_20234_linked:   "t (20235 :: int) = (0 :: int)"
 if "linked t"
  for t :: "int \<Rightarrow> int"
end
