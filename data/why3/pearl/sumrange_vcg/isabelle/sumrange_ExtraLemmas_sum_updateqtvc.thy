theory sumrange_ExtraLemmas_sum_updateqtvc
  imports "NTP4Verif.NTP4Verif" "./sumrange_ArraySum"
begin
theorem sum_update'vc:
  fixes l :: "int"
  fixes i :: "int"
  fixes h :: "int"
  fixes a :: "int list"
  fixes v :: "int"
  assumes fact0: "(0 :: int) \<le> l"
  assumes fact1: "l \<le> i"
  assumes fact2: "i < h"
  assumes fact3: "h \<le> int (length a)"
  shows "sum (a[nat i := v]) l h = sum a l h + v - a ! nat i"
  sorry
end
