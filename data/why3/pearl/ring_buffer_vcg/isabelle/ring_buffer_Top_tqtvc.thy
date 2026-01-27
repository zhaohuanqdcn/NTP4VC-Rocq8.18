theory ring_buffer_Top_tqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem t'vc:
  fixes o2 :: "'a"
  shows "(0 :: int) \<le> (1 :: int)"
  and "\<forall>(o1 :: 'a list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (1 :: int) \<longrightarrow> o1 ! nat i = o2) \<and> int (length o1) = (1 :: int) \<longrightarrow> (let contents :: 'a list = ([] :: 'a list) in (0 :: int) < int (length o1) \<and> ((0 :: int) < int (length o1) \<longrightarrow> ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> int (length o1)) \<and> ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> int (length o1) \<longrightarrow> int (length contents) = (0 :: int) - (0 :: int) \<and> (int (length contents) = (0 :: int) - (0 :: int) \<longrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) - (0 :: int) \<longrightarrow> contents ! nat i = o1 ! nat ((0 :: int) + i))))))"
  sorry
end
