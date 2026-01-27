theory relabel_Relabel_labels_Leafqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype 'a tree = Leaf "'a" | Node "'a tree" "'a tree"
fun labels :: "'a tree \<Rightarrow> 'a list"
  where "labels (Leaf x) = Cons x (Nil :: 'a list)" for x
      | "labels (Node l r) = labels l @ labels r" for l r
theorem labels_Leaf'vc:
  fixes x :: "'a"
  fixes y :: "'a"
  shows "x \<in> set (labels (Leaf y)) \<longleftrightarrow> x = y"
  sorry
end
