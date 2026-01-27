theory cursor_examples_TestCursor_sumqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Sum" "Why3STD.cursor_Cursor"
begin
consts get_closure :: "'a list \<Rightarrow> int \<Rightarrow> 'a"
axiomatization where get_closure_def:   "get_closure y y1 = y ! nat y1"
  for y :: "'a list"
  and y1 :: "int"
theorem sum'vc:
  fixes c :: "int cursor"
  assumes fact0: "permitted c"
  assumes fact1: "visited c = []"
  shows "permitted c"
  and "(0 :: int) = sum (get_closure (visited c)) (0 :: int) (int (length (visited c)))"
  and "\<forall>(c1 :: int cursor). permitted c1 \<longrightarrow> permitted c1 \<and> (if \<not>complete c1 then (\<not>complete c1 \<and> permitted c1) \<and> (\<forall>(c2 :: int cursor) (x :: int). visited c2 = visited c1 @ [x] \<and> permitted c2 \<longrightarrow> permitted c2 \<and> sum (get_closure (visited c1)) (0 :: int) (int (length (visited c1))) + x = sum (get_closure (visited c2)) (0 :: int) (int (length (visited c2)))) else True)"
  sorry
end
