theory huffman_with_two_queues_Top_sorted_tail_tailqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_Sum"
begin
consts get_closure :: "'a list \<Rightarrow> int \<Rightarrow> 'a"
axiomatization where get_closure_def:   "get_closure y y1 = y ! nat y1"
  for y :: "'a list"
  and y1 :: "int"
definition last :: "int list \<Rightarrow> int"
  where "last s = s ! nat (int (length s) - (1 :: int))" for s
theorem sorted_tail_tail'vc:
  fixes s :: "int list"
  assumes fact0: "sorted s"
  assumes fact1: "(2 :: int) \<le> int (length s)"
  shows "sorted (drop (2 :: nat) s)"
  sorry
end
