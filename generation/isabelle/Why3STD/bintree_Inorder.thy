theory bintree_Inorder
  imports "NTP4Verif.NTP4Verif" bintree_Tree
begin
fun inorder :: "'a tree \<Rightarrow> 'a list"
  where "inorder (Empty :: 'a tree) = (Nil :: 'a list)"
      | "inorder (Node l x r) = inorder l @ Cons x (inorder r)" for l x r
end
