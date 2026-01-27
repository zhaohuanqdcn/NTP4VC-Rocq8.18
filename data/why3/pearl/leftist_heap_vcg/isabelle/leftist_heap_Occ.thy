theory leftist_heap_Occ
  imports "NTP4Verif.NTP4Verif" "./leftist_heap_TreeRank"
begin
fun occ :: "'a \<Rightarrow> 'a tree \<Rightarrow> int"
  where "occ x (E :: 'a tree) = (0 :: int)" for x
      | "occ x (N x0 l e r) = (if x = e then 1 :: int else (0 :: int)) + occ x l + occ x r" for x x0 l e r
definition mem :: "'a \<Rightarrow> 'a tree \<Rightarrow> _"
  where "mem x t \<longleftrightarrow> (0 :: int) < occ x t" for x t
end
