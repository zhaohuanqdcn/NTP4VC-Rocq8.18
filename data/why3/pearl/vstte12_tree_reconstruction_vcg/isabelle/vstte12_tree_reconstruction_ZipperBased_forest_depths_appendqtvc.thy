theory vstte12_tree_reconstruction_ZipperBased_forest_depths_appendqtvc
  imports "NTP4Verif.NTP4Verif" "./vstte12_tree_reconstruction_Tree"
begin
fun forest_depths :: "(int \<times> tree) list \<Rightarrow> int list"
  where "forest_depths (Nil :: (int \<times> tree) list) = (Nil :: int list)"
      | "forest_depths (Cons (d, t) r) = depths d t @ forest_depths r" for d t r
theorem forest_depths_append'vc:
  fixes f1 :: "(int \<times> tree) list"
  fixes f2 :: "(int \<times> tree) list"
  shows "forest_depths (f1 @ f2) = forest_depths f1 @ forest_depths f2"
  sorry
end
