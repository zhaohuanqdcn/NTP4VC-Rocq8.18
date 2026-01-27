theory bintree_Size
  imports "NTP4Verif.NTP4Verif" bintree_Tree
begin
fun size :: "'a tree \<Rightarrow> int"
  where "size (Empty :: 'a tree) = (0 :: int)"
      | "size (Node l x r) = (1 :: int) + size l + size r" for l x r
axiomatization where size_nonneg:   "(0 :: int) \<le> size t"
  for t :: "'a tree"
axiomatization where size_empty:   "(0 :: int) = size t \<longleftrightarrow> t = (Empty :: 'a tree)"
  for t :: "'a tree"
end
