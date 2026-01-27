import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace Conjugate
noncomputable def is_partition (a : List ℤ) := (0 : ℤ) < Int.ofNat (List.length a) ∧ (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i ≤ j ∧ j < Int.ofNat (List.length a) → a[Int.toNat j]! ≤ a[Int.toNat i]!) ∧ a[Int.toNat (Int.ofNat (List.length a) - (1 : ℤ))]! = (0 : ℤ)
noncomputable def numofgt (a : List ℤ) (n : ℤ) (v : ℤ) := ((0 : ℤ) ≤ n ∧ n < Int.ofNat (List.length a)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < n → v < a[Int.toNat j]!) ∧ a[Int.toNat n]! ≤ v
noncomputable def is_conjugate (a : List ℤ) (b : List ℤ) := a[(0 : ℕ)]! < Int.ofNat (List.length b) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length b) → numofgt a (b[Int.toNat j]!) j)
end Conjugate
