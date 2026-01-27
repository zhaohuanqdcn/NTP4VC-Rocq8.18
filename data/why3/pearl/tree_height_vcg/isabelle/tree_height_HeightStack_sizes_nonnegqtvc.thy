theory tree_height_HeightStack_sizes_nonnegqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.bintree_Tree" "Why3STD.bintree_Size" "Why3STD.bintree_Height"
begin
typedecl 'a stack
fun heights :: "(int \<times> 'a tree) list \<Rightarrow> int"
  where "heights (Nil :: (int \<times> 'a tree) list) = (0 :: int)"
      | "heights (Cons (h, t) s') = max (h + height t) (heights s')" for h t s'
fun sizes :: "(int \<times> 'a tree) list \<Rightarrow> int"
  where "sizes (Nil :: (int \<times> 'a tree) list) = (0 :: int)"
      | "sizes (Cons (x, t) s') = bintree_Size.size t + sizes s'" for x t s'
theorem sizes_nonneg'vc:
  fixes s :: "(int \<times> 'a tree) list"
  shows "(0 :: int) \<le> sizes s"
  sorry
end
