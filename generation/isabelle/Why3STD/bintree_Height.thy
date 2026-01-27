theory bintree_Height
  imports "NTP4Verif.NTP4Verif" bintree_Tree
begin
fun height :: "'a tree \<Rightarrow> int"
  where "height (Empty :: 'a tree) = (0 :: int)"
      | "height (Node l x r) = (1 :: int) + max (height l) (height r)" for l x r
axiomatization where height_nonneg:   "(0 :: int) \<le> height t"
  for t :: "'a tree"
end
