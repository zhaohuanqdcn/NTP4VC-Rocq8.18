theory flexible_arrays_FlexibleArrays_tqtvc
  imports "NTP4Verif.NTP4Verif" "./flexible_arrays_BraunTrees" "Why3STD.bintree_Tree" "Why3STD.bintree_Size"
begin
theorem t'vc:
  shows "\<exists>(tree :: 'a tree). braun tree \<and> (0 :: int) \<le> bintree_Size.size tree"
  sorry
end
