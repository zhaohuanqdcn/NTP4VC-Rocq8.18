theory relabel_Relabel_relabelqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
datatype 'a tree = Leaf "'a" | Node "'a tree" "'a tree"
fun labels :: "'a tree \<Rightarrow> 'a list"
  where "labels (Leaf x) = Cons x (Nil :: 'a list)" for x
      | "labels (Node l r) = labels l @ labels r" for l r
inductive same_shape :: "'a tree \<Rightarrow> 'b tree \<Rightarrow> bool" where
   same_shape_Leaf: "same_shape (Leaf x1) (Leaf x2)" for x1 :: "'a" and x2 :: "'b"
 | same_shape_Node: "same_shape l1 l2 \<Longrightarrow> same_shape r1 r2 \<Longrightarrow> same_shape (Node l1 r1) (Node l2 r2)" for l1 :: "'a tree" and l2 :: "'b tree" and r1 :: "'a tree" and r2 :: "'b tree"
theorem relabel'vc:
  fixes t :: "'a tree"
  fixes r :: "int"
  shows "case t of Leaf _ \<Rightarrow> (let result :: int tree = Leaf (r + (1 :: int)) in same_shape t result \<and> distinct (labels result) \<and> r \<le> r + (1 :: int) \<and> (\<forall>(x :: int). x \<in> set (labels result) \<longrightarrow> r < x \<and> x \<le> r + (1 :: int))) | Node l r1 \<Rightarrow> (case t of Leaf _ \<Rightarrow> False | Node f f1 \<Rightarrow> f = r1 \<or> f1 = r1) \<and> (\<forall>(r2 :: int) (o1 :: int tree). same_shape r1 o1 \<and> distinct (labels o1) \<and> r \<le> r2 \<and> (\<forall>(x :: int). x \<in> set (labels o1) \<longrightarrow> r < x \<and> x \<le> r2) \<longrightarrow> (case t of Leaf _ \<Rightarrow> False | Node f f1 \<Rightarrow> f = l \<or> f1 = l) \<and> (\<forall>(r3 :: int) (o2 :: int tree). same_shape l o2 \<and> distinct (labels o2) \<and> r2 \<le> r3 \<and> (\<forall>(x :: int). x \<in> set (labels o2) \<longrightarrow> r2 < x \<and> x \<le> r3) \<longrightarrow> (let result :: int tree = Node o2 o1 in same_shape t result \<and> distinct (labels result) \<and> r \<le> r3 \<and> (\<forall>(x :: int). x \<in> set (labels result) \<longrightarrow> r < x \<and> x \<le> r3))))"
  sorry
end
