theory leftist_heap_Occ_occ_nonnegqtvc
  imports "NTP4Verif.NTP4Verif" "./leftist_heap_TreeRank"
begin
fun occ :: "'a \<Rightarrow> 'a tree \<Rightarrow> int"
  where "occ x (E :: 'a tree) = (0 :: int)" for x
      | "occ x (N x0 l e r) = (if x = e then 1 :: int else (0 :: int)) + occ x l + occ x r" for x x0 l e r
theorem occ_nonneg'vc:
  fixes x :: "'a"
  fixes t :: "'a tree"
  shows "(0 :: int) \<le> occ x t"
  sorry
end
