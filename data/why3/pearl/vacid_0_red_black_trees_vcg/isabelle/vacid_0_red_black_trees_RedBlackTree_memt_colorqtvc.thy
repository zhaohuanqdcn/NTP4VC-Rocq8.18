theory vacid_0_red_black_trees_RedBlackTree_memt_colorqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  key
typedecl  "value"
datatype  color = Red | Black
datatype  tree = Leaf | Node "color" "tree" "int" "int" "tree"
fun memt :: "tree \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "memt Leaf k v = False" for k v
      | "memt (Node x l k' v' r) k v = (k = k' \<and> v = v' \<or> memt l k v \<or> memt r k v)" for x l k' v' r k v
theorem memt_color'vc:
  fixes c :: "color"
  fixes l :: "tree"
  fixes k :: "int"
  fixes v :: "int"
  fixes r :: "tree"
  fixes k' :: "int"
  fixes v' :: "int"
  fixes c' :: "color"
  assumes fact0: "memt (Node c l k v r) k' v'"
  shows "memt (Node c' l k v r) k' v'"
  sorry
end
