import Why3.Base
open Classical
open Lean4Why3
namespace cursor_examples_ListCursorImplqtimpl_createqtvc
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
theorem create'vc {α : Type} [Inhabited α] (t : List α) : let o1 : List α := ([] : List α); o1 ++ t = t ∧ (∀(result : cursor α), visited result = o1 ∧ collection result = t ∧ to_visit result = t → visited result = ([] : List α) ∧ collection result = t ∧ to_visit result = t)
  := sorry
end cursor_examples_ListCursorImplqtimpl_createqtvc
