import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.NumOf
import Why3.mach.matrix.Matrix63
import Why3.debug.Debug
import pearl.multiprecision.lib.lean.lineardecision.RationalCoeffs
import pearl.multiprecision.lib.lean.lineardecision.MP64Coeffs
import pearl.multiprecision.lib.lean.lineardecision.LinearDecisionRationalMP
import pearl.multiprecision.lib.lean.lineardecision.LinearDecisionIntMP
import pearl.multiprecision.lib.lean.lineardecision.EqPropMP
open Classical
open Lean4Why3
namespace lineardecision_TestMP_gqt
theorem g' (i : ℤ) (a : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ i + (1 : ℤ)) : HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (i + (1 : ℤ))) * a = ((18446744073709551615 : ℤ) + (1 : ℤ)) * (HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat i) * a)
  := sorry
end lineardecision_TestMP_gqt
