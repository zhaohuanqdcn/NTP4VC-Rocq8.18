theory space_saving_Top_incrementqtvc
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
theorem increment'vc:
  fixes i :: "int"
  fixes c :: "int list"
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> i"
  assumes fact1: "i < int (length c)"
  assumes fact2: "sum_list (drop (0 :: nat) (take (length c - (0 :: nat)) c)) = n - (1 :: int)"
  shows "(0 :: int) \<le> i"
  and "i < int (length c)"
  and "let o1 :: int = c ! nat i + (1 :: int) in ((0 :: int) \<le> i \<and> i < int (length c)) \<and> (length (c[nat i := o1]) = length c \<longrightarrow> nth (c[nat i := o1]) o nat = (nth c o nat)(i := o1) \<longrightarrow> c[nat i := o1] ! nat i = c ! nat i + (1 :: int) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < int (length c) \<longrightarrow> \<not>j = i \<longrightarrow> c[nat i := o1] ! nat j = c ! nat j) \<and> sum_list (drop (0 :: nat) (take (length c - (0 :: nat)) (c[nat i := o1]))) = n)"
  sorry
end
