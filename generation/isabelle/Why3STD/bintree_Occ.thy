theory bintree_Occ
  imports "NTP4Verif.NTP4Verif" bintree_Tree
begin
fun occ :: "'a \<Rightarrow> 'a tree \<Rightarrow> int"
  where "occ x (Empty :: 'a tree) = (0 :: int)" for x
      | "occ x (Node l y r) = (if y = x then 1 :: int else (0 :: int)) + occ x l + occ x r" for x l y r
axiomatization where occ_nonneg:   "(0 :: int) \<le> occ x t"
  for x :: "'a"
  and t :: "'a tree"
definition mem :: "'a \<Rightarrow> 'a tree \<Rightarrow> _"
  where "mem x t \<longleftrightarrow> (0 :: int) < occ x t" for x t
end
