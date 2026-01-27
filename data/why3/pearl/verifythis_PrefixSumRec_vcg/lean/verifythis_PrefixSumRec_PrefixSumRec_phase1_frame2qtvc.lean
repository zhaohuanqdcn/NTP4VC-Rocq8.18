import Why3.Base
import Why3.int.Sum
open Classical
open Lean4Why3
namespace verifythis_PrefixSumRec_PrefixSumRec_phase1_frame2qtvc
noncomputable def is_power_of_2 (x : ℤ) := ∃(k : ℤ), (0 : ℤ) ≤ k ∧ x = HPow.hPow (2 : ℤ) (Int.toNat k)
noncomputable def go_left (left1 : ℤ) (right1 : ℤ) := let space : ℤ := right1 - left1; left1 - Int.tdiv space (2 : ℤ)
noncomputable def go_right (left1 : ℤ) (right1 : ℤ) := let space : ℤ := right1 - left1; right1 - Int.tdiv space (2 : ℤ)
inductive phase1 : ℤ -> ℤ -> List ℤ -> List ℤ -> Prop where
 | Leaf (right1 : ℤ) (left1 : ℤ) (a : List ℤ) (a0 : List ℤ) : right1 = left1 + (1 : ℤ) → a[Int.toNat left1]! = a0[Int.toNat left1]! → phase1 left1 right1 a0 a
 | Node (left1 : ℤ) (right1 : ℤ) (a0 : List ℤ) (a : List ℤ) : left1 + (1 : ℤ) < right1 → phase1 (go_left left1 right1) left1 a0 a → phase1 (go_right left1 right1) right1 a0 a → a[Int.toNat left1]! = List.sum (List.drop (Int.toNat (left1 - (right1 - left1) + (1 : ℤ))) (List.take (Int.toNat (left1 + (1 : ℤ)) - Int.toNat (left1 - (right1 - left1) + (1 : ℤ))) a0)) → phase1 left1 right1 a0 a
theorem phase1_frame2'vc (left1 : ℤ) (right1 : ℤ) (a0 : List ℤ) (a0' : List ℤ) (a : List ℤ) (fact0 : ∀(i : ℤ), left1 - (right1 - left1) < i ∧ i < right1 → a0[Int.toNat i]! = a0'[Int.toNat i]!) (fact1 : phase1 left1 right1 a0 a) : phase1 left1 right1 a0' a
  := sorry
end verifythis_PrefixSumRec_PrefixSumRec_phase1_frame2qtvc
