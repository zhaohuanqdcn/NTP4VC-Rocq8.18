theory cursor_examples_ArrayCursorImplqtimpl_cursorqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem cursor'vc:
  shows "let visited :: 'a list = ([] :: 'a list); collection :: 'a list = ([] :: 'a list) in ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> int (length collection)) \<and> (0 :: int) = int (length visited) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) \<longrightarrow> collection ! nat i = visited ! nat i)"
  sorry
end
