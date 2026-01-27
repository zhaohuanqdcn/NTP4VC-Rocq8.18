theory relabel_Relabel_labels_Nodeqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype 'a tree = Leaf "'a" | Node "'a tree" "'a tree"
fun labels :: "'a tree \<Rightarrow> 'a list"
  where "labels (Leaf x) = Cons x (Nil :: 'a list)" for x
      | "labels (Node l r) = labels l @ labels r" for l r
theorem labels_Node'vc:
  fixes x :: "'a"
  fixes l :: "'a tree"
  fixes r :: "'a tree"
  shows "x \<in> set (labels (Node l r)) \<longleftrightarrow> x \<in> set (labels l) \<or> x \<in> set (labels r)"
  sorry
end
