import Why3.Base
import Why3.bintree.Tree
import Why3.bintree.Height
open Classical
open Lean4Why3
namespace tree_height_HeightCPS_heightqtvc
axiom identity : ℤ -> ℤ
axiom identity_def (y : ℤ) : identity y = y
theorem height'vc {α : Type} [Inhabited α] (t : Tree.tree α) : identity (Height.height t) = Height.height t
  := sorry
end tree_height_HeightCPS_heightqtvc
