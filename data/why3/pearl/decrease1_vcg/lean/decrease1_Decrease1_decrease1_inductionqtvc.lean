import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace decrease1_Decrease1_decrease1_inductionqtvc
noncomputable def decrease1 (a : List ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) - (1 : ℤ) → a[Int.toNat i]! - (1 : ℤ) ≤ a[Int.toNat (i + (1 : ℤ))]!
theorem decrease1_induction'vc (a : List ℤ) (i : ℤ) (j : ℤ) (fact0 : decrease1 a) (fact1 : (0 : ℤ) ≤ i) (fact2 : i ≤ j) (fact3 : j < Int.ofNat (List.length a)) : a[Int.toNat i]! + i - j ≤ a[Int.toNat j]!
  := sorry
end decrease1_Decrease1_decrease1_inductionqtvc
