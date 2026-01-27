import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_fm2012_LRS_LCP_not_common_prefix_if_last_char_are_differentqtvc
noncomputable def is_common_prefix (a : List ℤ) (x : ℤ) (y : ℤ) (l : ℤ) := (0 : ℤ) ≤ l ∧ x + l ≤ Int.ofNat (List.length a) ∧ y + l ≤ Int.ofNat (List.length a) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < l → a[Int.toNat (x + i)]! = a[Int.toNat (y + i)]!)
theorem not_common_prefix_if_last_char_are_different'vc (l : ℤ) (x : ℤ) (a : List ℤ) (y : ℤ) (fact0 : (0 : ℤ) ≤ l) (fact1 : x + l < Int.ofNat (List.length a)) (fact2 : y + l < Int.ofNat (List.length a)) (fact3 : ¬a[Int.toNat (x + l)]! = a[Int.toNat (y + l)]!) : ¬is_common_prefix a x y (l + (1 : ℤ))
  := sorry
end verifythis_fm2012_LRS_LCP_not_common_prefix_if_last_char_are_differentqtvc
