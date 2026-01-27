import Why3.Base
open Classical
open Lean4Why3
namespace same_fringe_SameFringe_same_fringeqtvc
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
theorem same_fringe'vc (o1 : enum) (t2 : tree) (o2 : enum) (t1 : tree) (fact0 : enum_elements o1 = elements t2 ++ enum_elements enum.Done) (fact1 : enum_elements o2 = elements t1 ++ enum_elements enum.Done) : (enum_elements o2 = enum_elements o1) = (elements t1 = elements t2)
  := sorry
end same_fringe_SameFringe_same_fringeqtvc
