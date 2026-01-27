import Why3.Base
import Why3.why3.Ref.Ref
import Why3.mach.matrix.Matrix63
import Why3.debug.Debug
import pearl.multiprecision.lib.lean.lineardecision.RationalCoeffs
import pearl.multiprecision.lib.lean.lineardecision.LinearDecisionRational
import pearl.multiprecision.lib.lean.lineardecision.LinearDecisionInt
open Classical
open Lean4Why3
namespace lineardecision_TestInt_g
theorem g (x : ℤ) (y : ℤ) (fact0 : (3 : ℤ) * x + (2 : ℤ) * y = (21 : ℤ)) (fact1 : (7 : ℤ) * x + (4 : ℤ) * y = (47 : ℤ)) : x = (5 : ℤ)
  := sorry
end lineardecision_TestInt_g
