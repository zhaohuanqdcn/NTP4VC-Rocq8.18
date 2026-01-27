import Why3.Base
import Why3.bintree.Tree
import Why3.bintree.Size
import Why3.bintree.Inorder
open Classical
open Lean4Why3
namespace InorderLength
axiom inorder_length {α : Type} [Inhabited α] (t : Tree.tree α) : Int.ofNat (List.length (Inorder.inorder t)) = Size.size t
end InorderLength
