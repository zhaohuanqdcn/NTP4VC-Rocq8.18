theory hackers_delight_Utils_Spec_numof_shiftqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded" "Why3STD.int_NumOf" "./hackers_delight_Utils"
begin
theorem numof_shift'vc:
  fixes q :: "int \<Rightarrow> bool"
  fixes p :: "int \<Rightarrow> bool"
  fixes k :: "int"
  fixes a :: "int"
  fixes b :: "int"
  assumes fact0: "\<forall>(i :: int). q i = p (i + k)"
  shows "numof p (a + k) (b + k) = numof q a b"
  sorry
end
