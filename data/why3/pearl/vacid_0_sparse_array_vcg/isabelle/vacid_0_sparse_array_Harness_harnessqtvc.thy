theory vacid_0_sparse_array_Harness_harnessqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.map_MapInjection" "./vacid_0_sparse_array_SparseArray"
begin
typedecl  elt
consts default :: "elt"
consts c1 :: "elt"
consts c2 :: "elt"
theorem harness'vc:
  shows "(0 :: int) \<le> (10 :: int)"
  and "(10 :: int) \<le> (1000 :: int)"
  and "\<forall>(a :: elt sparse_array). card a = (0 :: int) \<and> def1 a = default \<and> vacid_0_sparse_array_SparseArray.length a = (10 :: int) \<longrightarrow> ((0 :: int) \<le> (20 :: int) \<and> (20 :: int) \<le> (1000 :: int)) \<and> (\<forall>(b :: elt sparse_array). card b = (0 :: int) \<and> def1 b = default \<and> vacid_0_sparse_array_SparseArray.length b = (20 :: int) \<longrightarrow> ((0 :: int) \<le> (5 :: int) \<and> (5 :: int) < vacid_0_sparse_array_SparseArray.length a) \<and> ((0 :: int) \<le> (7 :: int) \<and> (7 :: int) < vacid_0_sparse_array_SparseArray.length b) \<and> ((0 :: int) \<le> (5 :: int) \<and> (5 :: int) < vacid_0_sparse_array_SparseArray.length a) \<and> (\<forall>(a1 :: elt sparse_array). List.length (values a1) = List.length (values a) \<and> List.length (index a1) = List.length (index a) \<and> List.length (back a1) = List.length (back a) \<longrightarrow> def1 a = def1 a1 \<longrightarrow> value a1 (5 :: int) = c1 \<and> (\<forall>(j :: int). \<not>j = (5 :: int) \<longrightarrow> value a1 j = value a j) \<longrightarrow> ((0 :: int) \<le> (7 :: int) \<and> (7 :: int) < vacid_0_sparse_array_SparseArray.length b) \<and> (\<forall>(b1 :: elt sparse_array). List.length (values b1) = List.length (values b) \<and> List.length (index b1) = List.length (index b) \<and> List.length (back b1) = List.length (back b) \<longrightarrow> def1 b = def1 b1 \<longrightarrow> value b1 (7 :: int) = c2 \<and> (\<forall>(j :: int). \<not>j = (7 :: int) \<longrightarrow> value b1 j = value b j) \<longrightarrow> ((0 :: int) \<le> (5 :: int) \<and> (5 :: int) < vacid_0_sparse_array_SparseArray.length a1) \<and> ((0 :: int) \<le> (7 :: int) \<and> (7 :: int) < vacid_0_sparse_array_SparseArray.length b1) \<and> ((0 :: int) \<le> (7 :: int) \<and> (7 :: int) < vacid_0_sparse_array_SparseArray.length a1) \<and> ((0 :: int) \<le> (5 :: int) \<and> (5 :: int) < vacid_0_sparse_array_SparseArray.length b1) \<and> ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) < vacid_0_sparse_array_SparseArray.length a1) \<and> (0 :: int) \<le> (0 :: int) \<and> (0 :: int) < vacid_0_sparse_array_SparseArray.length b1)))"
  sorry
end
