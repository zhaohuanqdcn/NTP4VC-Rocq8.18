theory queens_bv_S
  imports "NTP4Verif.NTP4Verif"
begin
consts succ :: "int fset \<Rightarrow> int fset"
axiomatization where succ_def:   "i |\<in>| succ s \<longleftrightarrow> (1 :: int) \<le> i \<and> i - (1 :: int) |\<in>| s"
  for i :: "int"
  and s :: "int fset"
consts pred :: "int fset \<Rightarrow> int fset"
axiomatization where pred_def:   "i |\<in>| pred s \<longleftrightarrow> (0 :: int) \<le> i \<and> i + (1 :: int) |\<in>| s"
  for i :: "int"
  and s :: "int fset"
end
