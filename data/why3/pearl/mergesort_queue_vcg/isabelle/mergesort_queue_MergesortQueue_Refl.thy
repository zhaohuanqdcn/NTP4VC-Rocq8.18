theory mergesort_queue_MergesortQueue_Refl
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_NumOf" "Why3STD.queue_Queue"
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
theorem Refl1:
  fixes x :: "elt"
  shows "le x x"
  sorry
end
