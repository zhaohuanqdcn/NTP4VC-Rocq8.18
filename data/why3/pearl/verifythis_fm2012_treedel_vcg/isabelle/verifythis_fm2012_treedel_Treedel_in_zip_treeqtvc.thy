theory verifythis_fm2012_treedel_Treedel_in_zip_treeqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "./verifythis_fm2012_treedel_Memory" "Why3STD.bintree_Tree" "Why3STD.bintree_Inorder"
begin
definition root :: "loc tree \<Rightarrow> loc"
  where "root t = (case t of (Empty :: loc tree) \<Rightarrow> null | Node _ p _ \<Rightarrow> p)" for t
fun istree :: "(loc \<Rightarrow> node) \<Rightarrow> loc tree \<Rightarrow> _"
  where "istree m (Empty :: loc tree) = True" for m
      | "istree m (Node l p r) = (\<not>p = null \<and> istree m l \<and> istree m r \<and> root l = left1 (m p) \<and> root r = right1 (m p))" for m l p r
datatype 'a zipper = Top | Left "'a zipper" "'a" "'a tree"
fun zip :: "'a tree \<Rightarrow> 'a zipper \<Rightarrow> 'a tree"
  where "zip t (Top :: 'a zipper) = t" for t
      | "zip t (Left z1 x r) = zip (Node t x r) z1" for t z1 x r
fun inorderz :: "'a zipper \<Rightarrow> 'a list"
  where "inorderz (Top :: 'a zipper) = (Nil :: 'a list)"
      | "inorderz (Left z1 x r) = Cons x (inorder r) @ inorderz z1" for z1 x r
theorem in_zip_tree'vc:
  fixes m :: "loc \<Rightarrow> node"
  fixes t :: "loc tree"
  fixes z :: "loc zipper"
  assumes fact0: "istree m (zip t z)"
  shows "case z of Top \<Rightarrow> True | Left z1 p r \<Rightarrow> (case z of Top \<Rightarrow> False | Left f _ _ \<Rightarrow> f = z1) \<and> istree m (zip (Node t p r) z1)"
  and "(case z of Top \<Rightarrow> True | Left z1 p r \<Rightarrow> istree m (Node t p r)) \<longrightarrow> istree m t"
  sorry
end
