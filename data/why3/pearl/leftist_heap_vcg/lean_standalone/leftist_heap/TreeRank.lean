namespace TreeRank
inductive tree (α : Type) where
  | E : tree α
  | N : ℤ -> tree α -> α -> tree α -> tree α
axiom inhabited_axiom_tree {α : Type} [Inhabited α] : Inhabited (tree α)
attribute [instance] inhabited_axiom_tree
end TreeRank
