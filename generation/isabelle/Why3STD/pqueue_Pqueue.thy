theory pqueue_Pqueue
  imports "NTP4Verif.NTP4Verif" int_NumOf
begin
typedecl  elt
consts le :: "elt \<Rightarrow> elt \<Rightarrow> bool"
axiomatization where Refl:   "le x x"
  for x :: "elt"
axiomatization where Trans:   "le x z"
 if "le x y"
 and "le y z"
  for x :: "elt"
  and y :: "elt"
  and z :: "elt"
axiomatization where Total:   "le x y \<or> le y x"
  for x :: "elt"
  and y :: "elt"
typedecl  t
consts elts :: "t \<Rightarrow> elt list"
axiomatization where t'invariant:   "le (elts self ! nat i1) (elts self ! nat i2)"
 if "(0 :: int) \<le> i1"
 and "i1 \<le> i2"
 and "i2 < int (length (elts self))"
  for i1 :: "int"
  and i2 :: "int"
  and self :: "t"
end
