theory mergesort_list_Elt_Trans
  imports "NTP4Verif.NTP4Verif"
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
theorem Trans1:
  fixes x :: "elt"
  fixes y :: "elt"
  fixes z :: "elt"
  assumes fact0: "le x y"
  assumes fact1: "le y z"
  shows "le x z"
  sorry
end
