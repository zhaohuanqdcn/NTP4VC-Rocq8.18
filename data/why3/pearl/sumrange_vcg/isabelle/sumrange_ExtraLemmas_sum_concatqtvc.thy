theory sumrange_ExtraLemmas_sum_concatqtvc
  imports "NTP4Verif.NTP4Verif" "./sumrange_ArraySum"
begin
theorem sum_concat'vc:
  fixes i :: "int"
  fixes j :: "int"
  fixes k :: "int"
  fixes a :: "int list"
  assumes fact0: "(0 :: int) \<le> i"
  assumes fact1: "i \<le> j"
  assumes fact2: "j \<le> k"
  assumes fact3: "k \<le> int (length a)"
  shows "sum a i k = sum a i j + sum a j k"
  sorry
end
