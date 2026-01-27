theory euler001_SumMultiple_div_3qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_Div2" "./euler001_DivModHints" "./euler001_TriangularNumbers"
begin
consts sum_multiple_3_5_lt :: "int \<Rightarrow> int"
axiomatization where SumEmpty:   "sum_multiple_3_5_lt (0 :: int) = (0 :: int)"
axiomatization where SumNo:   "sum_multiple_3_5_lt (n + (1 :: int)) = sum_multiple_3_5_lt n"
 if "(0 :: int) \<le> n"
 and "\<not>n cmod (3 :: int) = (0 :: int)"
 and "\<not>n cmod (5 :: int) = (0 :: int)"
  for n :: "int"
axiomatization where SumYes:   "sum_multiple_3_5_lt (n + (1 :: int)) = sum_multiple_3_5_lt n + n"
 if "(0 :: int) \<le> n"
 and "n cmod (3 :: int) = (0 :: int) \<or> n cmod (5 :: int) = (0 :: int)"
  for n :: "int"
definition closed_formula_aux :: "int \<Rightarrow> int"
  where "closed_formula_aux n = (let n3 :: int = n cdiv (3 :: int); n5 :: int = n cdiv (5 :: int); n15 :: int = n cdiv (15 :: int) in (3 :: int) * tr n3 + (5 :: int) * tr n5 - (15 :: int) * tr n15)" for n
definition p :: "int \<Rightarrow> _"
  where "p n \<longleftrightarrow> sum_multiple_3_5_lt (n + (1 :: int)) = closed_formula_aux n" for n
axiomatization where Induction:   "p n"
 if "\<forall>(n :: int). (0 :: int) \<le> n \<longrightarrow> (\<forall>(k :: int). (0 :: int) \<le> k \<and> k < n \<longrightarrow> p k) \<longrightarrow> p n"
 and "(0 :: int) \<le> n"
  for n :: "int"
axiomatization where Induction_bound:   "p n"
 if "\<forall>(n :: int). (0 :: int) \<le> n \<longrightarrow> (\<forall>(k :: int). (0 :: int) \<le> k \<and> k < n \<longrightarrow> p k) \<longrightarrow> p n"
 and "(0 :: int) \<le> n"
  for n :: "int"
definition closed_formula :: "int \<Rightarrow> int"
  where "closed_formula n = (let n3 :: int = n cdiv (3 :: int); n5 :: int = n cdiv (5 :: int); n15 :: int = n cdiv (15 :: int) in ((3 :: int) * (n3 * (n3 + (1 :: int))) + (5 :: int) * (n5 * (n5 + (1 :: int))) - (15 :: int) * (n15 * (n15 + (1 :: int)))) cdiv (2 :: int))" for n
theorem div_3'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "(0 :: int) \<le> n cdiv (3 :: int)"
  sorry
end
