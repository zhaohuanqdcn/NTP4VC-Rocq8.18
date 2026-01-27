theory tree_of_list_TreeOfList_tree_of_list_auxqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.bintree_Tree" "Why3STD.bintree_Size" "Why3STD.bintree_Height" "Why3STD.bintree_Inorder" "Why3STD.bintree_InorderLength"
begin
typedecl  elt
theorem tree_of_list_aux'vc:
  fixes n :: "int"
  fixes l :: "elt list"
  assumes fact0: "(0 :: int) \<le> n"
  assumes fact1: "n \<le> int (length l)"
  shows "\<not>n = (0 :: int) \<longrightarrow> (let n1 :: int = n - (1 :: int) in \<not>(2 :: int) = (0 :: int) \<and> (let n11 :: int = n1 cdiv (2 :: int) in (((0 :: int) \<le> n \<and> n11 < n) \<and> (0 :: int) \<le> n11 \<and> n11 \<le> int (length l)) \<and> (\<forall>(left1 :: elt tree) (l1 :: elt list). inorder left1 @ l1 = l \<and> bintree_Size.size left1 = n11 \<and> ((0 :: int) < n11 \<longrightarrow> (let h :: int = height left1 in (2 :: int) ^\<^sub>i (h - (1 :: int)) \<le> n11 \<and> n11 < (2 :: int) ^\<^sub>i h)) \<longrightarrow> (case l1 of Nil \<Rightarrow> False | Cons x l2 \<Rightarrow> (let o1 :: int = n1 - n11 in ((0 :: int) \<le> n \<and> o1 < n) \<and> (0 :: int) \<le> o1 \<and> o1 \<le> int (length l2))))))"
  and "\<forall>(t :: elt tree) (l' :: elt list). (if n = (0 :: int) then t = (Empty :: elt tree) \<and> l' = l else let n1 :: int = n - (1 :: int); n11 :: int = n1 cdiv (2 :: int) in \<exists>(t1 :: elt tree) (l'1 :: elt list). (inorder t1 @ l'1 = l \<and> bintree_Size.size t1 = n11 \<and> ((0 :: int) < n11 \<longrightarrow> (let h :: int = height t1 in (2 :: int) ^\<^sub>i (h - (1 :: int)) \<le> n11 \<and> n11 < (2 :: int) ^\<^sub>i h))) \<and> (case l'1 of Nil \<Rightarrow> False | Cons x l1 \<Rightarrow> (let o1 :: int = n1 - n11 in \<exists>(t2 :: elt tree). (inorder t2 @ l' = l1 \<and> bintree_Size.size t2 = o1 \<and> ((0 :: int) < o1 \<longrightarrow> (let h :: int = height t2 in (2 :: int) ^\<^sub>i (h - (1 :: int)) \<le> o1 \<and> o1 < (2 :: int) ^\<^sub>i h))) \<and> t = Node t1 x t2))) \<longrightarrow> inorder t @ l' = l \<and> bintree_Size.size t = n \<and> ((0 :: int) < n \<longrightarrow> (let h :: int = height t in (2 :: int) ^\<^sub>i (h - (1 :: int)) \<le> n \<and> n < (2 :: int) ^\<^sub>i h))"
  sorry
end
