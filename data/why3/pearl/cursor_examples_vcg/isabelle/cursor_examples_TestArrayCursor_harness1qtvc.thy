theory cursor_examples_TestArrayCursor_harness1qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Sum" "./cursor_examples_ArrayCursorImpl"
begin
theorem harness1'vc:
  shows "(0 :: int) \<le> (42 :: int)"
  and "\<forall>(a :: int list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (42 :: int) \<longrightarrow> a ! nat i = (0 :: int)) \<and> int (length a) = (42 :: int) \<longrightarrow> (\<forall>(c :: int cursor). permitted c \<and> visited c = [] \<and> collection c = a \<longrightarrow> \<not>complete c \<and> permitted c)"
  sorry
end
