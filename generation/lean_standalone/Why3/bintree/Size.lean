namespace Size
noncomputable def size {α : Type} [Inhabited α] : Tree.tree α -> ℤ
  | (Tree.tree.Empty : Tree.tree α) => (0 : ℤ)
  | (Tree.tree.Node l x r) => (1 : ℤ) + size l + size r
axiom size_nonneg {α : Type} [Inhabited α] (t : Tree.tree α) : (0 : ℤ) ≤ size t
axiom size_empty {α : Type} [Inhabited α] (t : Tree.tree α) : ((0 : ℤ) = size t) = (t = (Tree.tree.Empty : Tree.tree α))
end Size
