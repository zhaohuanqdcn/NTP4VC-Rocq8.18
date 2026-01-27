theory resizable_array_ResizableArrayImplem_rarrayqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem rarray'vc:
  fixes o2 :: "'a"
  shows "(0 :: int) \<le> (0 :: int)"
  and "\<forall>(o1 :: 'a list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) \<longrightarrow> o1 ! nat i = o2) \<and> int (length o1) = (0 :: int) \<longrightarrow> (\<forall>(o3 :: 'a). ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> int (length o1)) \<and> ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> int (length o1) \<longrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length o1) \<longrightarrow> o1 ! nat i = o3)))"
  sorry
end
