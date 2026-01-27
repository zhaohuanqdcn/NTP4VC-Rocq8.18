theory snapshotable_trees_Harness_testqtvc
  imports "NTP4Verif.NTP4Verif" "./snapshotable_trees_Tree" "./snapshotable_trees_MyEnum" "./snapshotable_trees_Iterator" "./snapshotable_trees_BSTree" "./snapshotable_trees_ITree"
begin
theorem test'vc:
  fixes t :: "itree"
  fixes x :: "bool"
  fixes t1 :: "itree"
  fixes x_1 :: "bool"
  fixes t2 :: "itree"
  fixes x_2 :: "bool"
  fixes t3 :: "itree"
  fixes s :: "itree"
  fixes it :: "enum"
  assumes fact0: "tree t = (Empty :: tree)"
  assumes fact1: "x = False \<longleftrightarrow> mem (1 :: int) (tree t)"
  assumes fact2: "\<forall>(y :: int). mem y (tree t1) \<longleftrightarrow> y = (1 :: int) \<or> mem y (tree t)"
  assumes fact3: "x_1 = False \<longleftrightarrow> mem (2 :: int) (tree t1)"
  assumes fact4: "\<forall>(y :: int). mem y (tree t2) \<longleftrightarrow> y = (2 :: int) \<or> mem y (tree t1)"
  assumes fact5: "x_2 = False \<longleftrightarrow> mem (3 :: int) (tree t2)"
  assumes fact6: "\<forall>(y :: int). mem y (tree t3) \<longleftrightarrow> y = (3 :: int) \<or> mem y (tree t2)"
  assumes fact7: "tree s = tree t3"
  assumes fact8: "elements (iterator'mk it) = tree_elements (tree s)"
  shows "bst (tree t3)"
  and "\<forall>(it1 :: enum) (t4 :: itree) (t_tree :: tree). let it2 :: iterator = iterator'mk it1 in bst t_tree \<longrightarrow> hasNext it2 \<longrightarrow> hasNext it2 \<and> (\<forall>(it3 :: enum). let it4 :: iterator = iterator'mk it3 in \<forall>(x :: int). elements it2 = Cons x (elements it4) \<longrightarrow> (let o1 :: int = x * (3 :: int) in bst t_tree \<and> (t_tree = tree t4 \<longrightarrow> (\<forall>(t5 :: itree) (x_3 :: bool). (x_3 = False \<longleftrightarrow> mem o1 (tree t4)) \<and> (\<forall>(y :: int). mem y (tree t5) \<longleftrightarrow> y = o1 \<or> mem y (tree t4)) \<longrightarrow> ((0 :: int) \<le> int (length (elements it2)) \<and> length (elements it4) < length (elements it2)) \<and> bst (tree t5)))))"
  sorry
end
