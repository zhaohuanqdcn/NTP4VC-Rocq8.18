import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.NumOf
open Classical
open Lean4Why3
namespace inverse_in_place_InverseInPlace_is_permutation_inverseqtvc
noncomputable def prefix_tl (x : ℤ) := -x - (1 : ℤ)
axiom fc : (ℤ -> ℤ) -> ℤ -> Bool
axiom fc'def (m : ℤ -> ℤ) (n : ℤ) : (fc m n = true) = ((0 : ℤ) ≤ m n)
noncomputable def numof (m : ℤ -> ℤ) (l : ℤ) (r : ℤ) := NumOf.numof (fc m) l r
noncomputable def is_permutation (a : List ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) → ((0 : ℤ) ≤ a[Int.toNat i]! ∧ a[Int.toNat i]! < Int.ofNat (List.length a)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a) → ¬i = j → ¬a[Int.toNat i]! = a[Int.toNat j]!)
theorem is_permutation_inverse'vc (a : List ℤ) (b : List ℤ) (fact0 : List.length a = List.length b) (fact1 : is_permutation a) (fact2 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length b) → (0 : ℤ) ≤ b[Int.toNat i]! ∧ b[Int.toNat i]! < Int.ofNat (List.length b)) (fact3 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length b) → a[Int.toNat (b[Int.toNat i]!)]! = i) : is_permutation b
  := sorry
end inverse_in_place_InverseInPlace_is_permutation_inverseqtvc
