import Why3.Base
import Why3.why3.Ref.Ref
import Why3.mach.matrix.Matrix63
import Why3.debug.Debug
import pearl.multiprecision.lib.lean.lineardecision.RationalCoeffs
import pearl.multiprecision.lib.lean.lineardecision.MP64Coeffs
import pearl.multiprecision.lib.lean.lineardecision.LinearDecisionRationalMP
import pearl.multiprecision.lib.lean.lineardecision.LinearDecisionIntMP
open Classical
open Lean4Why3
namespace lineardecision_EqPropMP_expr_boundqtqtvc
theorem expr_bound''vc (e : LinearDecisionIntMP.expr') : match e with | LinearDecisionIntMP.expr'.Sum e1 e2 => (match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.ProdL f _ => f = e1 | LinearDecisionIntMP.expr'.ProdR _ f => f = e1 | LinearDecisionIntMP.expr'.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) ∧ (match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.expr'.ProdL f _ => f = e2 | LinearDecisionIntMP.expr'.ProdR _ f => f = e2 | LinearDecisionIntMP.expr'.Diff f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) | LinearDecisionIntMP.expr'.Diff e1 e2 => (match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.ProdL f _ => f = e1 | LinearDecisionIntMP.expr'.ProdR _ f => f = e1 | LinearDecisionIntMP.expr'.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) ∧ (match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.expr'.ProdL f _ => f = e2 | LinearDecisionIntMP.expr'.ProdR _ f => f = e2 | LinearDecisionIntMP.expr'.Diff f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) | LinearDecisionIntMP.expr'.ProdL e1 _ => (match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.ProdL f _ => f = e1 | LinearDecisionIntMP.expr'.ProdR _ f => f = e1 | LinearDecisionIntMP.expr'.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) | LinearDecisionIntMP.expr'.ProdR _ e1 => (match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.ProdL f _ => f = e1 | LinearDecisionIntMP.expr'.ProdR _ f => f = e1 | LinearDecisionIntMP.expr'.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) | LinearDecisionIntMP.expr'.Var n => True | LinearDecisionIntMP.expr'.Coeff _ => True
  := sorry
end lineardecision_EqPropMP_expr_boundqtqtvc
