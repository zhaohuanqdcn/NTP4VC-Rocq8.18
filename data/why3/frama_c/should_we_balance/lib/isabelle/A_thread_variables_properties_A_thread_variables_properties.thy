theory A_thread_variables_properties_A_thread_variables_properties
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed"
begin
consts l_size :: "int"
axiomatization where Q_some'0:   "(0 :: int) < l_size"
axiomatization where Q_some'1:   "l_size \<le> (2147483647 :: int)"
end
