theory queens_bv_BitsSpec
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded" "Why3STD.Ref_Ref" "./queens_bv_S"
begin
typedecl  t
consts mdl :: "t \<Rightarrow> int fset"
axiomatization where t'invariant'0:   "(0 :: int) \<le> i"
 if "i |\<in>| mdl self"
  for i :: "int"
  and self :: "t"
axiomatization where t'invariant'1:   "i < (32 :: int)"
 if "i |\<in>| mdl self"
  for i :: "int"
  and self :: "t"
end
