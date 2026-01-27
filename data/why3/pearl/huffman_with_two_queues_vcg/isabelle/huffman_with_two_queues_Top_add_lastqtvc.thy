theory huffman_with_two_queues_Top_add_lastqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_Sum"
begin
consts get_closure :: "'a list \<Rightarrow> int \<Rightarrow> 'a"
axiomatization where get_closure_def:   "get_closure y y1 = y ! nat y1"
  for y :: "'a list"
  and y1 :: "int"
definition last :: "int list \<Rightarrow> int"
  where "last s = s ! nat (int (length s) - (1 :: int))" for s
theorem add_last'vc:
  fixes s :: "int list"
  fixes x :: "int"
  assumes fact0: "(0 :: int) < int (length s)"
  assumes fact1: "sorted s"
  assumes fact2: "last s \<le> x"
  shows "sorted (s @ [x])"
  sorry
end
