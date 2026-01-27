import Why3.Base
import Why3.bintree.Tree
open Classical
open Lean4Why3
namespace Height
noncomputable def height {α : Type} [Inhabited α] : Tree.tree α -> ℤ
  | (Tree.tree.Empty : Tree.tree α) => (0 : ℤ)
  | (Tree.tree.Node l x r) => (1 : ℤ) + max (height l) (height r)
axiom height_nonneg {α : Type} [Inhabited α] (t : Tree.tree α) : (0 : ℤ) ≤ height t
end Height
