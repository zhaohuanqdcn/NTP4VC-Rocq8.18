import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace LCP
noncomputable def is_common_prefix (a : List ℤ) (x : ℤ) (y : ℤ) (l : ℤ) := (0 : ℤ) ≤ l ∧ x + l ≤ Int.ofNat (List.length a) ∧ y + l ≤ Int.ofNat (List.length a) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < l → a[Int.toNat (x + i)]! = a[Int.toNat (y + i)]!)
noncomputable def is_longest_common_prefix (a : List ℤ) (x : ℤ) (y : ℤ) (l : ℤ) := is_common_prefix a x y l ∧ (∀(m : ℤ), l < m → ¬is_common_prefix a x y m)
end LCP
