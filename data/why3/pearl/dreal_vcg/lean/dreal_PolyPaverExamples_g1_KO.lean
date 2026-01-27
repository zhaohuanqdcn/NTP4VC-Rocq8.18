import Why3.Base
open Classical
open Lean4Why3
namespace dreal_PolyPaverExamples_g1_KO
theorem g1_KO (a : ℝ) (b : ℝ) (fact0 : -(10 : ℝ) ≤ a) (fact1 : a ≤ (10 : ℝ)) (fact2 : -(10 : ℝ) ≤ b) (fact3 : b ≤ (10 : ℝ)) (fact4 : a + (1 : ℝ) / 10 < b) : (b - a) * Real.exp ((a + b) / (2 : ℝ)) < Real.exp a - Real.exp b
  := sorry
end dreal_PolyPaverExamples_g1_KO
