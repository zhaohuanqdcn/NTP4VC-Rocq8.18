import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace LCP
noncomputable def eqseq (a : List ℤ) (x : ℤ) (y : ℤ) (len : ℤ) := (0 : ℤ) ≤ len ∧ x + len ≤ Int.ofNat (List.length a) ∧ y + len ≤ Int.ofNat (List.length a) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < len → a[Int.toNat (x + i)]! = a[Int.toNat (y + i)]!)
end LCP
