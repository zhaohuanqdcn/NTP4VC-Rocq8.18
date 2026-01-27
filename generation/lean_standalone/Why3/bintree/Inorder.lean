namespace Inorder
noncomputable def inorder {α : Type} [Inhabited α] : Tree.tree α -> List α
  | (Tree.tree.Empty : Tree.tree α) => ([] : List α)
  | (Tree.tree.Node l x r) => inorder l ++ List.cons x (inorder r)
end Inorder
