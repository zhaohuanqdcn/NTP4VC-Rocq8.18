theory snapshotable_trees_ITree_addqtvc
  imports "NTP4Verif.NTP4Verif" "./snapshotable_trees_Tree" "./snapshotable_trees_MyEnum" "./snapshotable_trees_Iterator" "./snapshotable_trees_BSTree"
begin
typedecl  itree
consts tree :: "itree \<Rightarrow> tree"
axiomatization where itree'invariant:   "bst (tree self)"
  for self :: "itree"
definition itree'eq :: "itree \<Rightarrow> itree \<Rightarrow> _"
  where "itree'eq a b \<longleftrightarrow> tree a = tree b" for a b
axiomatization where itree'inj:   "a = b"
 if "itree'eq a b"
  for a :: "itree"
  and b :: "itree"
theorem add'vc:
  fixes t :: "itree"
  fixes x :: "int"
  shows "let o1 :: tree = tree t in bst o1 \<and> (\<forall>(o2 :: tree). bst o2 \<and> \<not>mem x o1 \<and> (\<forall>(y :: int). mem y o2 \<longleftrightarrow> y = x \<or> mem y o1) \<longrightarrow> (\<forall>(t1 :: itree). bst o2 \<and> (o2 = tree t1 \<longrightarrow> \<not>mem x (tree t) \<and> (\<forall>(y :: int). mem y (tree t1) \<longleftrightarrow> y = x \<or> mem y (tree t))))) \<and> (mem x o1 \<longrightarrow> mem x (tree t) \<and> (\<forall>(y :: int). mem y (tree t) \<longleftrightarrow> y = x \<or> mem y (tree t)))"
  sorry
end
