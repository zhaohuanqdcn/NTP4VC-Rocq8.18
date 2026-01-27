import Why3.Base
import Why3.int.NumOf
open Classical
open Lean4Why3
namespace verifythis_2021_lexicographic_permutations_1_Top_lt_totalqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom permutation : Type
axiom inhabited_axiom_permutation : Inhabited permutation
attribute [instance] inhabited_axiom_permutation
noncomputable def lt (p : List ℤ) (q : List ℤ) := (List.length p = List.length q ∧ (0 : ℤ) < Int.ofNat (List.length q)) ∧ (∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length p)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → p[Int.toNat j]! = q[Int.toNat j]!) ∧ p[Int.toNat i]! < q[Int.toNat i]!)
theorem lt_total'vc (p : List ℤ) (q : List ℤ) (fact0 : List.length p = List.length q) : let o1 : ℤ := Int.ofNat (List.length p) - (1 : ℤ); ((0 : ℤ) ≤ o1 + (1 : ℤ) → (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < (0 : ℤ) → p[Int.toNat j]! = q[Int.toNat j]!) ∧ (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ o1) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → p[Int.toNat j]! = q[Int.toNat j]!) → (if p[Int.toNat i]! < q[Int.toNat i]! then lt p q else if q[Int.toNat i]! < p[Int.toNat i]! then p = q ∨ lt q p else ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i + (1 : ℤ) → p[Int.toNat j]! = q[Int.toNat j]!)) ∧ ((∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < o1 + (1 : ℤ) → p[Int.toNat j]! = q[Int.toNat j]!) → p = q ∨ lt q p)) ∧ (o1 + (1 : ℤ) < (0 : ℤ) → p = q ∨ lt q p)
  := sorry
end verifythis_2021_lexicographic_permutations_1_Top_lt_totalqtvc
