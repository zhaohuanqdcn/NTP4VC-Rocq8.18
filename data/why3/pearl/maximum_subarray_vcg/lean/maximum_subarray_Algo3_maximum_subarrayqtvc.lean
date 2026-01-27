import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Sum
import pearl.maximum_subarray_vcg.lean.maximum_subarray.Spec
open Classical
open Lean4Why3
namespace maximum_subarray_Algo3_maximum_subarrayqtvc
theorem maximum_subarray'vc (a : List ℤ) : let o1 : ℤ := Int.ofNat (List.length a); ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ o1 ∧ o1 ≤ Int.ofNat (List.length a)) ∧ (∀(hi : ℤ) (lo : ℤ), ((0 : ℤ) ≤ lo ∧ lo ≤ hi ∧ hi ≤ o1) ∧ (∀(l' : ℤ) (h' : ℤ), (0 : ℤ) ≤ l' ∧ l' ≤ h' ∧ h' ≤ o1 → List.sum (List.drop (Int.toNat l') (List.take (Int.toNat h' - Int.toNat l') a)) ≤ List.sum (List.drop (Int.toNat lo) (List.take (Int.toNat hi - Int.toNat lo) a))) → ((0 : ℤ) ≤ lo ∧ lo ≤ hi ∧ hi ≤ Int.ofNat (List.length a)) ∧ Spec.maxsub a (List.sum (List.drop (Int.toNat lo) (List.take (Int.toNat hi - Int.toNat lo) a))))
  := sorry
end maximum_subarray_Algo3_maximum_subarrayqtvc
