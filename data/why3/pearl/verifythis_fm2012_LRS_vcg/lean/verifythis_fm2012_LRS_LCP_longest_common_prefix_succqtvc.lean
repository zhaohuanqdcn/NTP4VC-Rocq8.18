import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_fm2012_LRS_LCP_longest_common_prefix_succqtvc
noncomputable def is_common_prefix (a : List ℤ) (x : ℤ) (y : ℤ) (l : ℤ) := (0 : ℤ) ≤ l ∧ x + l ≤ Int.ofNat (List.length a) ∧ y + l ≤ Int.ofNat (List.length a) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < l → a[Int.toNat (x + i)]! = a[Int.toNat (y + i)]!)
noncomputable def is_longest_common_prefix (a : List ℤ) (x : ℤ) (y : ℤ) (l : ℤ) := is_common_prefix a x y l ∧ (∀(m : ℤ), l < m → ¬is_common_prefix a x y m)
theorem longest_common_prefix_succ'vc (a : List ℤ) (x : ℤ) (y : ℤ) (l : ℤ) (fact0 : is_common_prefix a x y l) (fact1 : ¬is_common_prefix a x y (l + (1 : ℤ))) : is_longest_common_prefix a x y l
  := sorry
end verifythis_fm2012_LRS_LCP_longest_common_prefix_succqtvc
