import Why3.Base
open Classical
open Lean4Why3
namespace cursor_examples_ListCursorImplqtimpl_createqtrefnqtvc
axiom cursor : Type -> Type
axiom inhabited_axiom_cursor {α : Type} [Inhabited α] : Inhabited (cursor α)
attribute [instance] inhabited_axiom_cursor
axiom visited :  {α : Type} -> [Inhabited α] -> cursor α -> List α
axiom collection :  {α : Type} -> [Inhabited α] -> cursor α -> List α
axiom to_visit :  {α : Type} -> [Inhabited α] -> cursor α -> List α
axiom cursor'invariant {α : Type} [Inhabited α] (self : cursor α) : visited self ++ to_visit self = collection self
noncomputable def cursor'eq {α : Type} [Inhabited α] (a : cursor α) (b : cursor α) := visited a = visited b ∧ collection a = collection b ∧ to_visit a = to_visit b
axiom cursor'inj {α : Type} [Inhabited α] (a : cursor α) (b : cursor α) (fact0 : cursor'eq a b) : a = b
noncomputable def permitted {α : Type} [Inhabited α] (c : cursor α) := List.length (visited c) ≤ List.length (collection c) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length (visited c)) → (visited c)[Int.toNat i]! = (collection c)[Int.toNat i]!)
noncomputable def complete {α : Type} [Inhabited α] (c : cursor α) := List.length (visited c) = List.length (collection c)
theorem create'refn'vc {α : Type} [Inhabited α] (result : cursor α) (l : List α) (fact0 : visited result = ([] : List α)) (fact1 : collection result = l) (fact2 : to_visit result = l) : permitted result ∧ visited result = ([] : List α) ∧ collection result = l
  := sorry
end cursor_examples_ListCursorImplqtimpl_createqtrefnqtvc
