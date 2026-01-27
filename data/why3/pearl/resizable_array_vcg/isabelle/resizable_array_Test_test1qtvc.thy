theory resizable_array_Test_test1qtvc
  imports "NTP4Verif.NTP4Verif" "./resizable_array_ResizableArrayImplem"
begin
theorem test1'vc:
  shows "(0 :: int) \<le> (10 :: int)"
  and "\<forall>(r :: int rarray). dummy r = (0 :: int) \<and> resizable_array_ResizableArrayImplem.length r = (10 :: int) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (10 :: int) \<longrightarrow> data r ! nat i = (0 :: int)) \<longrightarrow> ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) < resizable_array_ResizableArrayImplem.length r) \<and> (\<forall>(r1 :: int rarray). List.length (data r1) = List.length (data r) \<longrightarrow> resizable_array_ResizableArrayImplem.length r = resizable_array_ResizableArrayImplem.length r1 \<and> dummy r = dummy r1 \<longrightarrow> nth (data r1) o nat = (nth (data r) o nat)(0 :: int := 17 :: int) \<longrightarrow> (0 :: int) \<le> (7 :: int))"
  sorry
end
