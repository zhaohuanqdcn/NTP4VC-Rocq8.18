theory hackers_delight_Utils_Spec_numOfZeroqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded" "Why3STD.int_NumOf" "./hackers_delight_Utils"
begin
consts nth_closure :: "32 word \<Rightarrow> int \<Rightarrow> bool"
axiomatization where nth_closure_def:   "nth_closure y y1 = (take_bit (nat y1) y \<noteq> (0))"
  for y :: "32 word"
  and y1 :: "int"
theorem numOfZero'vc:
  shows "numof (nth_closure (0 :: 32 word)) (0 :: int) (32 :: int) = (0 :: int)"
  sorry
end
