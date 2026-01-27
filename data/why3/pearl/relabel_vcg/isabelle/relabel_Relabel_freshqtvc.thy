theory relabel_Relabel_freshqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
datatype 'a tree = Leaf "'a" | Node "'a tree" "'a tree"
fun labels :: "'a tree \<Rightarrow> 'a list"
  where "labels (Leaf x) = Cons x (Nil :: 'a list)" for x
      | "labels (Node l r) = labels l @ labels r" for l r
inductive same_shape :: "'a tree \<Rightarrow> 'b tree \<Rightarrow> bool" where
   same_shape_Leaf: "same_shape (Leaf x1) (Leaf x2)" for x1 :: "'a" and x2 :: "'b"
 | same_shape_Node: "same_shape l1 l2 \<Longrightarrow> same_shape r1 r2 \<Longrightarrow> same_shape (Node l1 r1) (Node l2 r2)" for l1 :: "'a tree" and l2 :: "'b tree" and r1 :: "'a tree" and r2 :: "'b tree"
theorem fresh'vc:
  shows "True"
  sorry
end
