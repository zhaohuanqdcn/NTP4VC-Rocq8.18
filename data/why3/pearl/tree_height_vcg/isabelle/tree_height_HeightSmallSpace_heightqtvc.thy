theory tree_height_HeightSmallSpace_heightqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.bintree_Tree" "Why3STD.bintree_Size" "Why3STD.bintree_Height"
begin
definition leaves :: "'a tree \<Rightarrow> int"
  where "leaves t = (1 :: int) + bintree_Size.size t" for t
theorem height'vc:
  fixes t :: "'a tree"
  shows "(0 :: int) < (1 :: int)"
  and "\<forall>(lim :: int). (0 :: int) < lim \<longrightarrow> ((0 :: int) < lim \<and> (0 :: int) \<le> (0 :: int)) \<and> (\<forall>(o1 :: (int \<times> int) option). (case o1 of None \<Rightarrow> lim < leaves t | Some (res, dl) \<Rightarrow> res = max (0 :: int) ((0 :: int) + height t) \<and> lim = leaves t + dl \<and> (0 :: int) \<le> dl) \<longrightarrow> (case o1 of None \<Rightarrow> ((0 :: int) \<le> leaves t - lim \<and> leaves t - lim * (2 :: int) < leaves t - lim) \<and> (0 :: int) < lim * (2 :: int) | Some (h, _) \<Rightarrow> h = height t))"
  sorry
end
