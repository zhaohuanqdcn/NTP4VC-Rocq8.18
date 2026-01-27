theory bintree_InorderLength
  imports "NTP4Verif.NTP4Verif" bintree_Tree bintree_Size bintree_Inorder
begin
axiomatization where inorder_length:   "int (length (inorder t)) = bintree_Size.size t"
  for t :: "'a tree"
end
