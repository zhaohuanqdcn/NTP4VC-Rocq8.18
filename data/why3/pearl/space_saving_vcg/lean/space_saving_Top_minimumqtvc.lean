import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Sum
open Classical
open Lean4Why3
namespace space_saving_Top_minimumqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom dummy : elt
theorem minimum'vc (a : List ℤ) (fact0 : (0 : ℤ) < Int.ofNat (List.length a)) : let o1 : ℤ := Int.ofNat (List.length a) - (1 : ℤ); ((1 : ℤ) ≤ o1 + (1 : ℤ) → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < Int.ofNat (List.length a)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < (1 : ℤ) → a[(0 : ℕ)]! ≤ a[Int.toNat j]!)) ∧ (∀(m : ℤ), (∀(i : ℤ), ((1 : ℤ) ≤ i ∧ i ≤ o1) ∧ ((0 : ℤ) ≤ m ∧ m < Int.ofNat (List.length a)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → a[Int.toNat m]! ≤ a[Int.toNat j]!) → ((0 : ℤ) ≤ m ∧ m < Int.ofNat (List.length a)) ∧ ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)) ∧ (if a[Int.toNat i]! < a[Int.toNat m]! then ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i + (1 : ℤ) → a[Int.toNat i]! ≤ a[Int.toNat j]!) else ((0 : ℤ) ≤ m ∧ m < Int.ofNat (List.length a)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i + (1 : ℤ) → a[Int.toNat m]! ≤ a[Int.toNat j]!))) ∧ (((0 : ℤ) ≤ m ∧ m < Int.ofNat (List.length a)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < o1 + (1 : ℤ) → a[Int.toNat m]! ≤ a[Int.toNat j]!) → ((0 : ℤ) ≤ m ∧ m < Int.ofNat (List.length a)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) → a[Int.toNat m]! ≤ a[Int.toNat i]!)))) ∧ (o1 + (1 : ℤ) < (1 : ℤ) → ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < Int.ofNat (List.length a)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) → a[(0 : ℕ)]! ≤ a[Int.toNat i]!))
  := sorry
end space_saving_Top_minimumqtvc
