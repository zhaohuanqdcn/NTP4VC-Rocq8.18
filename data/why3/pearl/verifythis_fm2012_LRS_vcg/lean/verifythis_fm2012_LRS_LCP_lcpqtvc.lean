import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace verifythis_fm2012_LRS_LCP_lcpqtvc
noncomputable def is_common_prefix (a : List ℤ) (x : ℤ) (y : ℤ) (l : ℤ) := (0 : ℤ) ≤ l ∧ x + l ≤ Int.ofNat (List.length a) ∧ y + l ≤ Int.ofNat (List.length a) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < l → a[Int.toNat (x + i)]! = a[Int.toNat (y + i)]!)
noncomputable def is_longest_common_prefix (a : List ℤ) (x : ℤ) (y : ℤ) (l : ℤ) := is_common_prefix a x y l ∧ (∀(m : ℤ), l < m → ¬is_common_prefix a x y m)
theorem lcp'vc (x : ℤ) (a : List ℤ) (y : ℤ) (fact0 : (0 : ℤ) ≤ x) (fact1 : x ≤ Int.ofNat (List.length a)) (fact2 : (0 : ℤ) ≤ y) (fact3 : y ≤ Int.ofNat (List.length a)) : let n : ℤ := Int.ofNat (List.length a); is_common_prefix a x y (0 : ℤ) ∧ (∀(l : ℤ), is_common_prefix a x y l → (let o1 : ℤ := x + l; (o1 < n → y + l < n → (let o2 : ℤ := y + l; ((0 : ℤ) ≤ o2 ∧ o2 < Int.ofNat (List.length a)) ∧ (let o3 : ℤ := x + l; (0 : ℤ) ≤ o3 ∧ o3 < Int.ofNat (List.length a)))) ∧ (∀(o2 : Bool), (if o1 < n then if y + l < n then o2 = (if a[Int.toNat (x + l)]! = a[Int.toNat (y + l)]! then true else false) else o2 = false else o2 = false) → (if o2 = true then ((0 : ℤ) ≤ n - l ∧ n - (l + (1 : ℤ)) < n - l) ∧ is_common_prefix a x y (l + (1 : ℤ)) else is_longest_common_prefix a x y l))))
  := sorry
end verifythis_fm2012_LRS_LCP_lcpqtvc
