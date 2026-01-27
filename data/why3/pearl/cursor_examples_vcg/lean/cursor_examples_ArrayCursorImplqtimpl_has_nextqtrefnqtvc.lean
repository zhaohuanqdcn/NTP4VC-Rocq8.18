import Why3.Base
open Classical
open Lean4Why3
namespace cursor_examples_ArrayCursorImplqtimpl_has_nextqtrefnqtvc
axiom cursor : Type -> Type
axiom inhabited_axiom_cursor {α : Type} [Inhabited α] : Inhabited (cursor α)
attribute [instance] inhabited_axiom_cursor
axiom visited :  {α : Type} -> [Inhabited α] -> cursor α -> List α
axiom collection :  {α : Type} -> [Inhabited α] -> cursor α -> List α
axiom index :  {α : Type} -> [Inhabited α] -> cursor α -> ℤ
axiom cursor'invariant {α : Type} [Inhabited α] (self : cursor α) : (0 : ℤ) ≤ index self ∧ index self ≤ Int.ofNat (List.length (collection self)) ∧ index self = Int.ofNat (List.length (visited self)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < index self → (collection self)[Int.toNat i]! = (visited self)[Int.toNat i]!)
noncomputable def cursor'eq {α : Type} [Inhabited α] (a : cursor α) (b : cursor α) := visited a = visited b ∧ collection a = collection b ∧ index a = index b
axiom cursor'inj {α : Type} [Inhabited α] (a : cursor α) (b : cursor α) (fact0 : cursor'eq a b) : a = b
noncomputable def permitted {α : Type} [Inhabited α] (c : cursor α) := List.length (visited c) ≤ List.length (collection c) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length (visited c)) → (visited c)[Int.toNat i]! = (collection c)[Int.toNat i]!)
noncomputable def complete {α : Type} [Inhabited α] (c : cursor α) := List.length (visited c) = List.length (collection c)
theorem has_next'refn'vc : True
  := sorry
end cursor_examples_ArrayCursorImplqtimpl_has_nextqtrefnqtvc
