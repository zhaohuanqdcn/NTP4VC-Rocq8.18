import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace lcp_LCP_not_eqseqqtvc
noncomputable def eqseq (a : List ℤ) (x : ℤ) (y : ℤ) (len : ℤ) := (0 : ℤ) ≤ len ∧ x + len ≤ Int.ofNat (List.length a) ∧ y + len ≤ Int.ofNat (List.length a) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < len → a[Int.toNat (x + i)]! = a[Int.toNat (y + i)]!)
theorem not_eqseq'vc (i : ℤ) (a : List ℤ) (x : ℤ) (y : ℤ) (len : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : ¬a[Int.toNat (x + i)]! = a[Int.toNat (y + i)]!) (fact2 : i < len) : ¬eqseq a x y len
  := sorry
end lcp_LCP_not_eqseqqtvc
