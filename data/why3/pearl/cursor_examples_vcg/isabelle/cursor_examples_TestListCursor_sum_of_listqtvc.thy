theory cursor_examples_TestListCursor_sum_of_listqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Sum" "./cursor_examples_ListCursorImpl"
begin
consts get_closure :: "'a list \<Rightarrow> int \<Rightarrow> 'a"
axiomatization where get_closure_def:   "get_closure y y1 = y ! nat y1"
  for y :: "'a list"
  and y1 :: "int"
theorem sum_of_list'vc:
  fixes l :: "int list"
  shows "sum_list l = sum (get_closure l) (0 :: int) (int (length l))"
  sorry
end
