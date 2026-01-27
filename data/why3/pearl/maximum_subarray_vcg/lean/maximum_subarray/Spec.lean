import Why3.Base
import Why3.int.Sum
open Classical
open Lean4Why3
namespace Spec
noncomputable def maxsublo (a : List ℤ) (maxlo : ℤ) (s : ℤ) := ∀(l : ℤ) (h : ℤ), (0 : ℤ) ≤ l ∧ l < maxlo → l ≤ h ∧ h ≤ Int.ofNat (List.length a) → List.sum (List.drop (Int.toNat l) (List.take (Int.toNat h - Int.toNat l) a)) ≤ s
noncomputable def maxsub (a : List ℤ) (s : ℤ) := ∀(l : ℤ) (h : ℤ), (0 : ℤ) ≤ l ∧ l ≤ h ∧ h ≤ Int.ofNat (List.length a) → List.sum (List.drop (Int.toNat l) (List.take (Int.toNat h - Int.toNat l) a)) ≤ s
end Spec
