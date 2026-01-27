import Why3.Base
open Classical
open Lean4Why3
namespace same_fringe_SameFringe_benchqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
inductive tree where
  | Empty : tree
  | Node : tree -> elt -> tree -> tree
axiom inhabited_axiom_tree : Inhabited tree
attribute [instance] inhabited_axiom_tree
noncomputable def elements : tree -> List elt
  | tree.Empty => ([] : List elt)
  | (tree.Node l x r) => elements l ++ List.cons x (elements r)
inductive enum where
  | Done : enum
  | Next : elt -> tree -> enum -> enum
axiom inhabited_axiom_enum : Inhabited enum
attribute [instance] inhabited_axiom_enum
noncomputable def enum_elements : enum -> List elt
  | enum.Done => ([] : List elt)
  | (enum.Next x r e1) => List.cons x (elements r ++ enum_elements e1)
axiom a : elt
axiom b : elt
theorem bench'vc : True
  := sorry
end same_fringe_SameFringe_benchqtvc
