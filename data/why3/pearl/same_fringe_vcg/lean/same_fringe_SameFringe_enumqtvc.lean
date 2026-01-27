import Why3.Base
open Classical
open Lean4Why3
namespace same_fringe_SameFringe_enumqtvc
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
theorem enum'vc (t : tree) (e : enum) : (match t with | tree.Empty => True | tree.Node l x r => (match t with | tree.Empty => False | tree.Node f _ f1 => f = l ∨ f1 = l)) ∧ (∀(result : enum), (match t with | tree.Empty => result = e | tree.Node l x r => enum_elements result = elements l ++ enum_elements (enum.Next x r e)) → enum_elements result = elements t ++ enum_elements e)
  := sorry
end same_fringe_SameFringe_enumqtvc
