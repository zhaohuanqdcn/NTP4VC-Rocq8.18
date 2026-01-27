import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace sf_MoreHoareLogic_list_memberqtvc
noncomputable def sum : List ℤ -> ℤ
  | ([] : List ℤ) => (0 : ℤ)
  | (List.cons x r) => x + sum r
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom eq : elt -> elt -> Prop
axiom eq'spec (x : elt) (y : elt) : eq x y = (x = y)
theorem list_member'vc (x : List elt) (y : elt) : List.length x ≤ List.length x ∧ ((0 : ℤ) = (1 : ℤ) ∧ y ∈ x ∨ True) ∧ (∀(z : ℤ) (x1 : List elt), List.length x1 ≤ List.length x ∧ (y ∈ x1 → y ∈ x) ∧ (z = (1 : ℤ) ∧ y ∈ x ∨ z = (0 : ℤ) ∧ (y ∈ x → y ∈ x1)) → is_nil x1 = (x1 = ([] : List elt)) → (if ¬is_nil x1 then ¬x1 = ([] : List elt) ∧ (∀(o1 : elt), Option.some o1 = List.head? x1 → eq y o1 = (y = o1) → (if eq y o1 then ¬x1 = ([] : List elt) ∧ (∀(o2 : List elt), Option.some o2 = List.tail? x1 → (match x1 with | ([] : List elt) => False | List.cons _ f => f = o2) ∧ List.length o2 ≤ List.length x ∧ (y ∈ o2 → y ∈ x) ∧ (y ∈ x ∨ (1 : ℤ) = (0 : ℤ) ∧ (y ∈ x → y ∈ o2))) else ¬x1 = ([] : List elt) ∧ (∀(o2 : List elt), Option.some o2 = List.tail? x1 → (match x1 with | ([] : List elt) => False | List.cons _ f => f = o2) ∧ List.length o2 ≤ List.length x ∧ (y ∈ o2 → y ∈ x) ∧ (z = (1 : ℤ) ∧ y ∈ x ∨ z = (0 : ℤ) ∧ (y ∈ x → y ∈ o2))))) else (z = (1 : ℤ)) = (y ∈ x)))
  := sorry
end sf_MoreHoareLogic_list_memberqtvc
