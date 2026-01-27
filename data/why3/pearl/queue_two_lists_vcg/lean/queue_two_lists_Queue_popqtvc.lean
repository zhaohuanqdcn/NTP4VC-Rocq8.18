import Why3.Base
open Classical
open Lean4Why3
namespace queue_two_lists_Queue_popqtvc
axiom t : Type -> Type
axiom inhabited_axiom_t {α : Type} [Inhabited α] : Inhabited (t α)
attribute [instance] inhabited_axiom_t
axiom front :  {α : Type} -> [Inhabited α] -> t α -> List α
axiom rear :  {α : Type} -> [Inhabited α] -> t α -> List α
axiom seq :  {α : Type} -> [Inhabited α] -> t α -> List α
axiom t'invariant {α : Type} [Inhabited α] (self : t α) : Int.ofNat (List.length (seq self)) = Int.ofNat (List.length (front self)) + Int.ofNat (List.length (rear self)) ∧ ((0 : ℤ) < Int.ofNat (List.length (front self)) → (0 : ℤ) < Int.ofNat (List.length (rear self))) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length (seq self)) → (seq self)[Int.toNat i]! = (let n : ℤ := Int.ofNat (List.length (rear self)); if i < n then (rear self)[Int.toNat i]! else (front self)[Int.toNat (Int.ofNat (List.length (front self)) - (1 : ℤ) - (i - n))]!))
noncomputable def t'eq {α : Type} [Inhabited α] (a : t α) (b : t α) := front a = front b ∧ rear a = rear b ∧ seq a = seq b
axiom t'inj {α : Type} [Inhabited α] (a : t α) (b : t α) (fact0 : t'eq a b) : a = b
theorem pop'vc {α : Type} [Inhabited α] (q : t α) : match rear q with | ([] : List α) => seq q = ([] : List α) | List.cons x ([] : List α) => ((0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) ≤ Int.ofNat (List.length (seq q))) ∧ (∀(q1 : t α), (Int.ofNat (List.length (List.drop (1 : ℕ) (seq q))) = Int.ofNat (List.length ([] : List α)) + Int.ofNat (List.length (List.reverse (front q))) ∧ ((0 : ℤ) < Int.ofNat (List.length ([] : List α)) → (0 : ℤ) < Int.ofNat (List.length (List.reverse (front q)))) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length (List.drop (1 : ℕ) (seq q))) → (List.drop (1 : ℕ) (seq q))[Int.toNat i]! = (let n : ℤ := Int.ofNat (List.length (List.reverse (front q))); if i < n then (List.reverse (front q))[Int.toNat i]! else ([] : List α)[Int.toNat (Int.ofNat (List.length ([] : List α)) - (1 : ℤ) - (i - n))]!))) ∧ (List.drop (1 : ℕ) (seq q) = seq q1 ∧ List.reverse (front q) = rear q1 ∧ ([] : List α) = front q1 → ¬seq q = ([] : List α) ∧ x = (seq q)[(0 : ℕ)]! ∧ seq q1 = List.drop (1 : ℕ) (seq q))) | List.cons x s => ((0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) ≤ Int.ofNat (List.length (seq q))) ∧ (∀(q1 : t α), (Int.ofNat (List.length (List.drop (1 : ℕ) (seq q))) = Int.ofNat (List.length (front q)) + Int.ofNat (List.length s) ∧ ((0 : ℤ) < Int.ofNat (List.length (front q)) → (0 : ℤ) < Int.ofNat (List.length s)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length (List.drop (1 : ℕ) (seq q))) → (List.drop (1 : ℕ) (seq q))[Int.toNat i]! = (let n : ℤ := Int.ofNat (List.length s); if i < n then s[Int.toNat i]! else (front q)[Int.toNat (Int.ofNat (List.length (front q)) - (1 : ℤ) - (i - n))]!))) ∧ (List.drop (1 : ℕ) (seq q) = seq q1 ∧ s = rear q1 ∧ front q = front q1 → ¬seq q = ([] : List α) ∧ x = (seq q)[(0 : ℕ)]! ∧ seq q1 = List.drop (1 : ℕ) (seq q)))
  := sorry
end queue_two_lists_Queue_popqtvc
