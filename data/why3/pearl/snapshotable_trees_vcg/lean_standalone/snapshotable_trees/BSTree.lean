namespace BSTree
noncomputable def lt_tree (x : ℤ) (t : Tree.tree) := ∀(y : ℤ), Tree.mem y t → y < x
noncomputable def gt_tree (x : ℤ) (t : Tree.tree) := ∀(y : ℤ), Tree.mem y t → x < y
noncomputable def bst : Tree.tree -> Prop
  | (Tree.tree.Empty : Tree.tree) => True
  | (Tree.tree.Node l x r) => bst l ∧ bst r ∧ lt_tree x l ∧ gt_tree x r
end BSTree
