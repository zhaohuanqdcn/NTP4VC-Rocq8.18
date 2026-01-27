theory fxp_Fxp
  imports "NTP4Verif.NTP4Verif" "Why3STD.real_Truncate"
begin
definition pow2 :: "int \<Rightarrow> real"
  where "pow2 k = (2 :: Real.real) powr real_of_int k" for k
definition trunc_at :: "real \<Rightarrow> int \<Rightarrow> real"
  where "trunc_at x k = real_of_int (real_Truncate.floor (x * pow2 (-k))) * pow2 k" for x k
typedecl  fxp
consts ival :: "fxp \<Rightarrow> 64 word"
consts rval :: "fxp \<Rightarrow> real"
consts iexp :: "fxp \<Rightarrow> int"
axiomatization where fxp'invariant'0:   "rval self = trunc_at (rval self) (iexp self)"
  for self :: "fxp"
axiomatization where fxp'invariant'1:   "uint (ival self) = real_Truncate.floor (rval self * pow2 (-iexp self)) emod ((18446744073709551615 :: int) + (1 :: int))"
  for self :: "fxp"
definition fxp'eq :: "fxp \<Rightarrow> fxp \<Rightarrow> _"
  where "fxp'eq a b \<longleftrightarrow> ival a = ival b \<and> rval a = rval b \<and> iexp a = iexp b" for a b
axiomatization where fxp'inj:   "a = b"
 if "fxp'eq a b"
  for a :: "fxp"
  and b :: "fxp"
end
