import Why3.Base
import Why3.why3.Ref.Ref
import pearl.verifythis_fm2012_LRS_vcg.lean.verifythis_fm2012_LRS.LCP
open Classical
open Lean4Why3
namespace verifythis_fm2012_LRS_SuffixSort_compareqtvc
noncomputable def lt (a : List ℤ) (x : ℤ) (y : ℤ) := let n : ℤ := Int.ofNat (List.length a); ((0 : ℤ) ≤ x ∧ x ≤ n) ∧ ((0 : ℤ) ≤ y ∧ y ≤ n) ∧ (∃(l : ℤ), LCP.is_common_prefix a x y l ∧ y + l < n ∧ (x + l = n ∨ a[Int.toNat (x + l)]! < a[Int.toNat (y + l)]!))
theorem compare'vc (x : ℤ) (a : List ℤ) (y : ℤ) (fact0 : (0 : ℤ) ≤ x) (fact1 : x ≤ Int.ofNat (List.length a)) (fact2 : (0 : ℤ) ≤ y) (fact3 : y ≤ Int.ofNat (List.length a)) : (¬x = y → (let n : ℤ := Int.ofNat (List.length a); (((0 : ℤ) ≤ x ∧ x ≤ Int.ofNat (List.length a)) ∧ (0 : ℤ) ≤ y ∧ y ≤ Int.ofNat (List.length a)) ∧ (∀(l : ℤ), LCP.is_longest_common_prefix a x y l → ¬x + l = n → ¬y + l = n → (let o1 : ℤ := y + l; ((0 : ℤ) ≤ o1 ∧ o1 < Int.ofNat (List.length a)) ∧ (let o2 : ℤ := x + l; ((0 : ℤ) ≤ o2 ∧ o2 < Int.ofNat (List.length a)) ∧ (¬a[Int.toNat o2]! < a[Int.toNat o1]! → (let o3 : ℤ := y + l; ((0 : ℤ) ≤ o3 ∧ o3 < Int.ofNat (List.length a)) ∧ (let o4 : ℤ := x + l; ((0 : ℤ) ≤ o4 ∧ o4 < Int.ofNat (List.length a)) ∧ a[Int.toNat o3]! < a[Int.toNat o4]!)))))))) ∧ (∀(result : ℤ), (if x = y then result = (0 : ℤ) else let n : ℤ := Int.ofNat (List.length a); ∃(l : ℤ), LCP.is_longest_common_prefix a x y l ∧ (if x + l = n then result = -(1 : ℤ) else if y + l = n then result = (1 : ℤ) else if a[Int.toNat (x + l)]! < a[Int.toNat (y + l)]! then result = -(1 : ℤ) else a[Int.toNat (y + l)]! < a[Int.toNat (x + l)]! ∧ result = (1 : ℤ))) → (result = (0 : ℤ) → x = y) ∧ (result < (0 : ℤ) → lt a x y) ∧ ((0 : ℤ) < result → lt a y x))
  := sorry
end verifythis_fm2012_LRS_SuffixSort_compareqtvc
