import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.NumOf
open Classical
open Lean4Why3
namespace InverseInPlace
noncomputable def prefix_tl (x : ℤ) := -x - (1 : ℤ)
axiom fc : (ℤ -> ℤ) -> ℤ -> Bool
axiom fc'def (m : ℤ -> ℤ) (n : ℤ) : (fc m n = true) = ((0 : ℤ) ≤ m n)
noncomputable def numof (m : ℤ -> ℤ) (l : ℤ) (r : ℤ) := NumOf.numof (fc m) l r
noncomputable def is_permutation (a : List ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) → ((0 : ℤ) ≤ a[Int.toNat i]! ∧ a[Int.toNat i]! < Int.ofNat (List.length a)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a) → ¬i = j → ¬a[Int.toNat i]! = a[Int.toNat j]!)
noncomputable def loopinvariant (olda : List ℤ) (a : List ℤ) (m : ℤ) (m' : ℤ) (n : ℤ) := (∀(e : ℤ), (0 : ℤ) ≤ e ∧ e < n → -n ≤ a[Int.toNat e]! ∧ a[Int.toNat e]! < n) ∧ (∀(e : ℤ), m < e ∧ e < n → (0 : ℤ) ≤ a[Int.toNat e]!) ∧ (∀(e : ℤ), m < e ∧ e < n → olda[Int.toNat (a[Int.toNat e]!)]! = e) ∧ (∀(e : ℤ), (0 : ℤ) ≤ e ∧ e ≤ m' → (0 : ℤ) ≤ a[Int.toNat e]! → olda[Int.toNat e]! = a[Int.toNat e]!) ∧ (∀(e : ℤ), (0 : ℤ) ≤ e ∧ e ≤ m → a[Int.toNat e]! ≤ m) ∧ (∀(e : ℤ), (0 : ℤ) ≤ e ∧ e ≤ m' → a[Int.toNat e]! < (0 : ℤ) → olda[Int.toNat (prefix_tl (a[Int.toNat e]!))]! = e ∧ (prefix_tl (a[Int.toNat e]!) ≤ m → a[Int.toNat (prefix_tl (a[Int.toNat e]!))]! < (0 : ℤ)))
end InverseInPlace
