theory verifythis_fm2012_treedel_Treedel_main_lemmaqtvc
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
theorem main_lemma'vc:
  fixes p :: "loc"
  fixes pr :: "loc tree"
  fixes pp :: "loc"
  fixes ppr :: "loc tree"
  fixes z :: "loc zipper"
  fixes m :: "loc \<Rightarrow> node"
  assumes fact0: "let it :: loc tree = zip (Node (Node (Empty :: loc tree) p pr) pp ppr) z in istree m it \<and> distinct (inorder it)"
  shows "let t2 :: loc tree = Node pr pp ppr in istree (m(pp := let x_q' :: node = m pp in node'mk (right1 (m p)) (right1 x_q') (data x_q'))) (zip t2 z) \<and> root (zip (Node (Node (Empty :: loc tree) p pr) pp ppr) z) = root (zip t2 z)"
  sorry
end
