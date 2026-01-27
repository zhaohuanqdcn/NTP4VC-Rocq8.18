import Why3.Base
open Classical
open Lean4Why3
namespace Fill
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
inductive tree where
  | Null : tree
  | Node : tree -> elt -> tree -> tree
axiom inhabited_axiom_tree : Inhabited tree
attribute [instance] inhabited_axiom_tree
noncomputable def contains : tree -> elt -> Prop
  | tree.Null, x => False
  | (tree.Node l y r), x => contains l x ∨ x = y ∨ contains r x
end Fill
