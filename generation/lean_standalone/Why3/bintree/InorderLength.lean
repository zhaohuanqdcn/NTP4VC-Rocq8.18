namespace InorderLength
axiom inorder_length {α : Type} [Inhabited α] (t : Tree.tree α) : Int.ofNat (List.length (Inorder.inorder t)) = Size.size t
end InorderLength
