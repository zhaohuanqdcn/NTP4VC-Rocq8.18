import Why3.Base
import Why3.bintree.Tree
open Classical
open Lean4Why3
namespace Occ
noncomputable def occ {α : Type} [Inhabited α] : α -> Tree.tree α -> ℤ
  | x, (Tree.tree.Empty : Tree.tree α) => (0 : ℤ)
  | x, (Tree.tree.Node l y r) => (if y = x then (1 : ℤ) else (0 : ℤ)) + occ x l + occ x r
axiom occ_nonneg {α : Type} [Inhabited α] (x : α) (t : Tree.tree α) : (0 : ℤ) ≤ occ x t
noncomputable def mem {α : Type} [Inhabited α] (x : α) (t : Tree.tree α) := (0 : ℤ) < occ x t
end Occ
