import Why3.Base
import Why3.why3.Ref.Ref
import Why3.mach.matrix.Matrix63
import Why3.debug.Debug
import pearl.multiprecision.lib.lean.lineardecision.RationalCoeffs
import pearl.multiprecision.lib.lean.lineardecision.LinearDecisionRational
open Classical
open Lean4Why3
namespace lineardecision_Test_g
theorem g (x : ℝ) (y : ℝ) (fact0 : Int.to_Real (3 : ℤ) / Int.to_Real (1 : ℤ) * x + Int.to_Real (2 : ℤ) / Int.to_Real (1 : ℤ) * y = Int.to_Real (21 : ℤ) / Int.to_Real (1 : ℤ)) (fact1 : Int.to_Real (7 : ℤ) / Int.to_Real (1 : ℤ) * x + Int.to_Real (4 : ℤ) / Int.to_Real (1 : ℤ) * y = Int.to_Real (47 : ℤ) / Int.to_Real (1 : ℤ)) : x = Int.to_Real (5 : ℤ) / Int.to_Real (1 : ℤ)
  := sorry
end lineardecision_Test_g
