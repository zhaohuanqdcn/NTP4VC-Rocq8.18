theory space_saving_Top_minimum_kqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Sum"
begin
typedecl  elt
consts dummy :: "elt"
consts minimum :: "int list \<Rightarrow> int"
axiomatization where minimum'spec'0'0:   "(0 :: int) \<le> minimum a"
 if "(0 :: int) < int (length a)"
  for a :: "int list"
axiomatization where minimum'spec'0'1:   "minimum a < int (length a)"
 if "(0 :: int) < int (length a)"
  for a :: "int list"
axiomatization where minimum'spec:   "a ! nat (minimum a) \<le> a ! nat i"
 if "(0 :: int) < int (length a)"
 and "(0 :: int) \<le> i"
 and "i < int (length a)"
  for a :: "int list"
  and i :: "int"
definition occurs :: "elt \<Rightarrow> elt list \<Rightarrow> _"
  where "occurs v a \<longleftrightarrow> (\<exists>(i :: int). ((0 :: int) \<le> i \<and> i < int (length a)) \<and> v = a ! nat i)" for v a
theorem minimum_k'vc:
  fixes c :: "int list"
  assumes fact0: "(2 :: int) \<le> int (length c)"
  assumes fact1: "(0 :: int) \<le> sum_list (drop (0 :: nat) (take (length c - (0 :: nat)) c))"
  shows "int (length c) * c ! nat (minimum c) \<le> sum_list (drop (0 :: nat) (take (length c - (0 :: nat)) c))"
  sorry
end
