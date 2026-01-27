theory int_Unsigned
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  t
consts max :: "int"
consts to_int :: "t \<Rightarrow> int"
definition in_bounds :: "int \<Rightarrow> _"
  where "in_bounds n \<longleftrightarrow> (0 :: int) \<le> n \<and> n \<le> max" for n
axiomatization where to_int_in_bounds:   "in_bounds (to_int n)"
  for n :: "t"
axiomatization where extensionality:   "x = y"
 if "to_int x = to_int y"
  for x :: "t"
  and y :: "t"
consts zero_unsigned :: "t"
axiomatization where zero_unsigned_is_zero:   "to_int zero_unsigned = (0 :: int)"
consts radix :: "int"
axiomatization where radix_def:   "radix = max + (1 :: int)"
end
