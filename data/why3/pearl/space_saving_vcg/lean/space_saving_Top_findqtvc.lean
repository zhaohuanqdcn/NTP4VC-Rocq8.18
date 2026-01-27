import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Sum
open Classical
open Lean4Why3
namespace space_saving_Top_findqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom dummy : elt
axiom minimum : List ℤ -> ℤ
axiom minimum'spec'0 (a : List ℤ) (fact0 : (0 : ℤ) < Int.ofNat (List.length a)) : (0 : ℤ) ≤ minimum a ∧ minimum a < Int.ofNat (List.length a)
axiom minimum'spec (a : List ℤ) (i : ℤ) (fact0 : (0 : ℤ) < Int.ofNat (List.length a)) (fact1 : (0 : ℤ) ≤ i) (fact2 : i < Int.ofNat (List.length a)) : a[Int.toNat (minimum a)]! ≤ a[Int.toNat i]!
noncomputable def occurs (v : elt) (a : List elt) := ∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)) ∧ v = a[Int.toNat i]!
theorem find'vc (e : List elt) (x : elt) : let o1 : ℤ := Int.ofNat (List.length e) - (1 : ℤ); ((0 : ℤ) ≤ o1 + (1 : ℤ) → (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < (0 : ℤ) → ¬e[Int.toNat j]! = x) ∧ (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ o1) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → ¬e[Int.toNat j]! = x) → ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length e)) ∧ (if e[Int.toNat i]! = x then ((0 : ℤ) ≤ i ∧ i ≤ Int.ofNat (List.length e)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → ¬e[Int.toNat j]! = x) ∧ (i < Int.ofNat (List.length e) → e[Int.toNat i]! = x) else ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i + (1 : ℤ) → ¬e[Int.toNat j]! = x)) ∧ ((∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < o1 + (1 : ℤ) → ¬e[Int.toNat j]! = x) → ((0 : ℤ) ≤ Int.ofNat (List.length e) ∧ List.length e ≤ List.length e) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length e) → ¬e[Int.toNat j]! = x) ∧ (List.length e < List.length e → e[List.length e]! = x))) ∧ (o1 + (1 : ℤ) < (0 : ℤ) → ((0 : ℤ) ≤ Int.ofNat (List.length e) ∧ List.length e ≤ List.length e) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length e) → ¬e[Int.toNat j]! = x) ∧ (List.length e < List.length e → e[List.length e]! = x))
  := sorry
end space_saving_Top_findqtvc
