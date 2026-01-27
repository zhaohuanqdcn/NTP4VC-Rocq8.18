theory verifythis_fm2012_treedel_Treedel_subst_zip_treeqtvc
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
theorem subst_zip_tree'vc:
  fixes m :: "loc \<Rightarrow> node"
  fixes t1 :: "loc tree"
  fixes z :: "loc zipper"
  fixes m' :: "loc \<Rightarrow> node"
  fixes t2 :: "loc tree"
  assumes fact0: "istree m (zip t1 z)"
  assumes fact1: "istree m' t2"
  assumes fact2: "root t1 = root t2"
  assumes fact3: "distinct (inorder (zip t1 z))"
  assumes fact4: "\<forall>(x :: loc). \<not>m x = m' x \<longrightarrow> x \<in> set (inorder t1)"
  shows "case z of Top \<Rightarrow> True | Left z1 p r \<Rightarrow> (let t3 :: loc tree = Node t1 p r in istree m (zip t3 z1) \<and> (istree m t3 \<longrightarrow> (istree m r \<and> (\<forall>(p1 :: loc). p1 \<in> set (inorder r) \<longrightarrow> left1 (m p1) = left1 (m' p1) \<and> right1 (m p1) = right1 (m' p1))) \<and> (istree m' r \<longrightarrow> (let o1 :: loc tree = Node t2 p r in (case z of Top \<Rightarrow> False | Left f _ _ \<Rightarrow> f = z1) \<and> (istree m (zip t3 z1) \<and> istree m' o1) \<and> root t3 = root o1 \<and> distinct (inorder (zip t3 z1)) \<and> (\<forall>(x :: loc). \<not>m x = m' x \<longrightarrow> x \<in> set (inorder t3))))))"
  and "(case z of Top \<Rightarrow> True | Left z1 p r \<Rightarrow> (let t3 :: loc tree = Node t1 p r in istree m t3 \<and> istree m' r \<and> (let o1 :: loc tree = Node t2 p r in istree m' (zip o1 z1) \<and> root (zip t3 z1) = root (zip o1 z1)))) \<longrightarrow> istree m' (zip t2 z) \<and> root (zip t1 z) = root (zip t2 z)"
  sorry
end
