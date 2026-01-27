import Why3.Base
open Classical
open Lean4Why3
namespace queue_two_lists_Queue_safe_popqtvc
axiom t : Type -> Type
axiom inhabited_axiom_t {α : Type} [Inhabited α] : Inhabited (t α)
attribute [instance] inhabited_axiom_t
axiom front :  {α : Type} -> [Inhabited α] -> t α -> List α
axiom rear :  {α : Type} -> [Inhabited α] -> t α -> List α
axiom seq :  {α : Type} -> [Inhabited α] -> t α -> List α
axiom t'invariant {α : Type} [Inhabited α] (self : t α) : Int.ofNat (List.length (seq self)) = Int.ofNat (List.length (front self)) + Int.ofNat (List.length (rear self)) ∧ ((0 : ℤ) < Int.ofNat (List.length (front self)) → (0 : ℤ) < Int.ofNat (List.length (rear self))) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length (seq self)) → (seq self)[Int.toNat i]! = (let n : ℤ := Int.ofNat (List.length (rear self)); if i < n then (rear self)[Int.toNat i]! else (front self)[Int.toNat (Int.ofNat (List.length (front self)) - (1 : ℤ) - (i - n))]!))
noncomputable def t'eq {α : Type} [Inhabited α] (a : t α) (b : t α) := front a = front b ∧ rear a = rear b ∧ seq a = seq b
axiom t'inj {α : Type} [Inhabited α] (a : t α) (b : t α) (fact0 : t'eq a b) : a = b
theorem safe_pop'vc {α : Type} [Inhabited α] (q : t α) (q1 : t α) (fact0 : ¬seq q = ([] : List α)) : (¬seq q = ([] : List α) ∧ seq q1 = List.drop (1 : ℕ) (seq q) → seq q1 = List.drop (1 : ℕ) (seq q)) ∧ ¬(q1 = q ∧ seq q = ([] : List α))
  := sorry
end queue_two_lists_Queue_safe_popqtvc
