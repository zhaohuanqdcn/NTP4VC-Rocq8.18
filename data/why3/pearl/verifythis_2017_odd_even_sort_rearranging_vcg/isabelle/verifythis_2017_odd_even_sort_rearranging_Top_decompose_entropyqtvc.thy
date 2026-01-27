theory verifythis_2017_odd_even_sort_rearranging_Top_decompose_entropyqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Sum" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut" "Why3STD.array_IntArraySorted"
begin
consts array_max :: "int list \<Rightarrow> int"
axiomatization where array_max'spec:   "a ! nat j \<le> array_max a"
 if "(0 :: int) \<le> j"
 and "j < int (length a)"
  for j :: "int"
  and a :: "int list"
definition aux :: "(int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int"
  where "aux a m i = i * (m - a i)" for a m i
consts aux_closure :: "(int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int"
axiomatization where aux_closure_def:   "aux_closure y y1 y2 = aux y y1 y2"
  for y :: "int \<Rightarrow> int"
  and y1 :: "int"
  and y2 :: "int"
definition entropy :: "int list \<Rightarrow> int \<Rightarrow> int"
  where "entropy a m = sum (aux_closure (nth a o nat) m) (0 :: int) (int (length a))" for a m
theorem decompose_entropy'vc:
  fixes i :: "int"
  fixes j :: "int"
  fixes n :: "int"
  fixes a :: "int \<Rightarrow> int"
  fixes m :: "int"
  assumes fact0: "(0 :: int) \<le> i"
  assumes fact1: "i < j"
  assumes fact2: "j < n"
  shows "sum (aux_closure a m) (0 :: int) n = sum (aux_closure a m) (0 :: int) i + sum (aux_closure a m) (j + (1 :: int)) n + sum (aux_closure a m) (i + (1 :: int)) j + aux a m i + aux a m j"
  sorry
end
