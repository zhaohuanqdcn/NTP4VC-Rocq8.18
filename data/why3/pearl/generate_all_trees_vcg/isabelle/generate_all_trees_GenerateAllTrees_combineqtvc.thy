theory generate_all_trees_GenerateAllTrees_combineqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  tree = Empty | Node "tree" "tree"
fun size :: "tree \<Rightarrow> int"
  where "size (Empty :: tree) = (0 :: int)"
      | "size (Node l r) = (1 :: int) + size l + size r" for l r
definition all_trees :: "int \<Rightarrow> tree list \<Rightarrow> _"
  where "all_trees n l \<longleftrightarrow> distinct l \<and> (\<forall>(t :: tree). size t = n \<longleftrightarrow> t \<in> set l)" for n l
theorem combine'vc:
  fixes i1 :: "int"
  fixes l1 :: "tree list"
  fixes i2 :: "int"
  fixes l2 :: "tree list"
  assumes fact0: "(0 :: int) \<le> i1"
  assumes fact1: "all_trees i1 l1"
  assumes fact2: "(0 :: int) \<le> i2"
  assumes fact3: "all_trees i2 l2"
  shows "\<forall>(l11 :: tree list). distinct l11 \<longrightarrow> (case l11 of Nil \<Rightarrow> True | Cons t1 l12 \<Rightarrow> (\<forall>(l21 :: tree list). distinct l21 \<longrightarrow> (case l21 of Nil \<Rightarrow> True | Cons t2 l22 \<Rightarrow> (case l21 of Nil \<Rightarrow> False | Cons _ f \<Rightarrow> f = l22) \<and> distinct l22) \<and> (\<forall>(result :: tree list). (case l21 of Nil \<Rightarrow> result = (Nil :: tree list) | Cons t2 l22 \<Rightarrow> (\<exists>(o1 :: tree list). (distinct o1 \<and> (\<forall>(t :: tree). t \<in> set o1 \<longleftrightarrow> (\<exists>(r :: tree). t = Node t1 r \<and> r \<in> set l22))) \<and> result = Cons (Node t1 t2) o1)) \<longrightarrow> distinct result \<and> (\<forall>(t :: tree). t \<in> set result \<longleftrightarrow> (\<exists>(r :: tree). t = Node t1 r \<and> r \<in> set l21)))) \<and> ((case l11 of Nil \<Rightarrow> False | Cons _ f \<Rightarrow> f = l12) \<and> distinct l12) \<and> (\<forall>(o1 :: tree list). distinct o1 \<and> (\<forall>(t :: tree). t \<in> set o1 \<longleftrightarrow> (\<exists>(l :: tree) (r :: tree). t = Node l r \<and> l \<in> set l12 \<and> r \<in> set l2)) \<longrightarrow> distinct l2)) \<and> (\<forall>(result :: tree list). (case l11 of Nil \<Rightarrow> result = (Nil :: tree list) | Cons t1 l12 \<Rightarrow> (\<exists>(o1 :: tree list). (distinct o1 \<and> (\<forall>(t :: tree). t \<in> set o1 \<longleftrightarrow> (\<exists>(l :: tree) (r :: tree). t = Node l r \<and> l \<in> set l12 \<and> r \<in> set l2))) \<and> (\<exists>(o2 :: tree list). (distinct o2 \<and> (\<forall>(t :: tree). t \<in> set o2 \<longleftrightarrow> (\<exists>(r :: tree). t = Node t1 r \<and> r \<in> set l2))) \<and> result = o2 @ o1))) \<longrightarrow> distinct result \<and> (\<forall>(t :: tree). t \<in> set result \<longleftrightarrow> (\<exists>(l :: tree) (r :: tree). t = Node l r \<and> l \<in> set l11 \<and> r \<in> set l2)))"
  and "distinct l1"
  and "\<forall>(result :: tree list). distinct result \<and> (\<forall>(t :: tree). t \<in> set result \<longleftrightarrow> (\<exists>(l :: tree) (r :: tree). t = Node l r \<and> l \<in> set l1 \<and> r \<in> set l2)) \<longrightarrow> distinct result \<and> (\<forall>(t :: tree). t \<in> set result \<longleftrightarrow> (\<exists>(l :: tree) (r :: tree). t = Node l r \<and> size l = i1 \<and> size r = i2))"
  sorry
end
