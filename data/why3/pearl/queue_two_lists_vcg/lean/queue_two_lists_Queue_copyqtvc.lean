import Why3.Base
open Classical
open Lean4Why3
namespace queue_two_lists_Queue_copyqtvc
axiom t : Type -> Type
axiom inhabited_axiom_t {α : Type} [Inhabited α] : Inhabited (t α)
attribute [instance] inhabited_axiom_t
axiom front :  {α : Type} -> [Inhabited α] -> t α -> List α
axiom rear :  {α : Type} -> [Inhabited α] -> t α -> List α
axiom seq :  {α : Type} -> [Inhabited α] -> t α -> List α
axiom t'invariant {α : Type} [Inhabited α] (self : t α) : Int.ofNat (List.length (seq self)) = Int.ofNat (List.length (front self)) + Int.ofNat (List.length (rear self)) ∧ ((0 : ℤ) < Int.ofNat (List.length (front self)) → (0 : ℤ) < Int.ofNat (List.length (rear self))) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length (seq self)) → (seq self)[Int.toNat i]! = (let n : ℤ := Int.ofNat (List.length (rear self)); if i < n then (rear self)[Int.toNat i]! else (front self)[Int.toNat (Int.ofNat (List.length (front self)) - (1 : ℤ) - (i - n))]!))
noncomputable def t'eq {α : Type} [Inhabited α] (a : t α) (b : t α) := front a = front b ∧ rear a = rear b ∧ seq a = seq b
axiom t'inj {α : Type} [Inhabited α] (a : t α) (b : t α) (fact0 : t'eq a b) : a = b
theorem copy'vc {α : Type} [Inhabited α] (q : t α) : let o1 : List α := seq q; let o2 : List α := rear q; let o3 : List α := front q; (Int.ofNat (List.length o1) = Int.ofNat (List.length o3) + Int.ofNat (List.length o2) ∧ ((0 : ℤ) < Int.ofNat (List.length o3) → (0 : ℤ) < Int.ofNat (List.length o2)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length o1) → o1[Int.toNat i]! = (let n : ℤ := Int.ofNat (List.length o2); if i < n then o2[Int.toNat i]! else o3[Int.toNat (Int.ofNat (List.length o3) - (1 : ℤ) - (i - n))]!))) ∧ (∀(result : t α), front result = o3 ∧ rear result = o2 ∧ seq result = o1 → seq result = seq q)
  := sorry
end queue_two_lists_Queue_copyqtvc
