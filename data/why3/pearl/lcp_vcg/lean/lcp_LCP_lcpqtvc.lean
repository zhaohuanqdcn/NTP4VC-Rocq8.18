import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace lcp_LCP_lcpqtvc
noncomputable def eqseq (a : List ℤ) (x : ℤ) (y : ℤ) (len : ℤ) := (0 : ℤ) ≤ len ∧ x + len ≤ Int.ofNat (List.length a) ∧ y + len ≤ Int.ofNat (List.length a) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < len → a[Int.toNat (x + i)]! = a[Int.toNat (y + i)]!)
theorem lcp'vc (x : ℤ) (a : List ℤ) (y : ℤ) (fact0 : (0 : ℤ) ≤ x) (fact1 : x < Int.ofNat (List.length a)) (fact2 : (0 : ℤ) ≤ y) (fact3 : y < Int.ofNat (List.length a)) : eqseq a x y (0 : ℤ) ∧ (∀(l : ℤ), eqseq a x y l → (let o1 : ℤ := Int.ofNat (List.length a); let o2 : ℤ := x + l; (o2 < o1 → y + l < Int.ofNat (List.length a) → (let o3 : ℤ := y + l; ((0 : ℤ) ≤ o3 ∧ o3 < Int.ofNat (List.length a)) ∧ (let o4 : ℤ := x + l; (0 : ℤ) ≤ o4 ∧ o4 < Int.ofNat (List.length a)))) ∧ (∀(o3 : Bool), (if o2 < o1 then if y + l < Int.ofNat (List.length a) then o3 = (if a[Int.toNat (x + l)]! = a[Int.toNat (y + l)]! then true else false) else o3 = false else o3 = false) → (if o3 = true then ((0 : ℤ) ≤ Int.ofNat (List.length a) - l ∧ Int.ofNat (List.length a) - (l + (1 : ℤ)) < Int.ofNat (List.length a) - l) ∧ eqseq a x y (l + (1 : ℤ)) else eqseq a x y l ∧ (∀(len : ℤ), l < len → ¬eqseq a x y len)))))
  := sorry
end lcp_LCP_lcpqtvc
