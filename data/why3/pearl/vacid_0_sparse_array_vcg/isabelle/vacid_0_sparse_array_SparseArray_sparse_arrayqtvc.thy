theory vacid_0_sparse_array_SparseArray_sparse_arrayqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem sparse_array'vc:
  shows "(0 :: int) \<le> (0 :: int)"
  and "\<forall>(o1 :: int list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) \<longrightarrow> o1 ! nat i = (0 :: int)) \<and> int (length o1) = (0 :: int) \<longrightarrow> (0 :: int) \<le> (0 :: int) \<and> (\<forall>(o2 :: int list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) \<longrightarrow> o2 ! nat i = (0 :: int)) \<and> int (length o2) = (0 :: int) \<longrightarrow> (\<forall>(o3 :: 'a). (0 :: int) \<le> (0 :: int) \<and> (\<forall>(o4 :: 'a list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) \<longrightarrow> o4 ! nat i = o3) \<and> int (length o4) = (0 :: int) \<longrightarrow> ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> int (length o4) \<and> int (length o4) \<le> (1000 :: int)) \<and> (length o4 = length o2 \<and> length o2 = length o1) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) \<longrightarrow> ((0 :: int) \<le> o1 ! nat i \<and> o1 ! nat i < int (length o4)) \<and> o2 ! nat (o1 ! nat i) = i))))"
  sorry
end
