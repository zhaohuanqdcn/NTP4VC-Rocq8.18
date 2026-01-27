theory tree_height_HeightCPS_heightqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.bintree_Tree" "Why3STD.bintree_Height"
begin
consts identity :: "int \<Rightarrow> int"
axiomatization where identity_def:   "identity y = y"
  for y :: "int"
theorem height'vc:
  fixes t :: "'a tree"
  shows "identity (height t) = height t"
  sorry
end
