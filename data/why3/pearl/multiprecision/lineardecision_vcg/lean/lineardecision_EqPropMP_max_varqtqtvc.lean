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
namespace lineardecision_EqPropMP_max_varqtqtvc
noncomputable def expr_bound' : LinearDecisionIntMP.expr' -> ℤ -> Prop
  | (LinearDecisionIntMP.expr'.Sum e1 e2), b => expr_bound' e1 b ∧ expr_bound' e2 b
  | (LinearDecisionIntMP.expr'.Diff e1 e2), b => expr_bound' e1 b ∧ expr_bound' e2 b
  | (LinearDecisionIntMP.expr'.ProdL e1 x), b => expr_bound' e1 b
  | (LinearDecisionIntMP.expr'.ProdR x e1), b => expr_bound' e1 b
  | (LinearDecisionIntMP.expr'.Var n), b => (0 : ℤ) ≤ n ∧ n ≤ b
  | (LinearDecisionIntMP.expr'.Coeff x), b => True
noncomputable def eq_bound' (eq : LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr') (b : ℤ) := match eq with | (e1, e2) => expr_bound' e1 b ∧ expr_bound' e2 b
noncomputable def ctx_bound' : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr') -> ℤ -> Prop
  | ([] : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')), b => True
  | (List.cons eq t), b => eq_bound' eq b ∧ ctx_bound' t b
theorem max_var''vc (e : LinearDecisionIntMP.expr') (fact0 : LinearDecisionIntMP.valid_expr' e) : (match e with | LinearDecisionIntMP.expr'.Var i => True | LinearDecisionIntMP.expr'.Coeff _ => True | LinearDecisionIntMP.expr'.Sum e1 e2 => ((match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.expr'.ProdL f _ => f = e2 | LinearDecisionIntMP.expr'.ProdR _ f => f = e2 | LinearDecisionIntMP.expr'.Diff f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) ∧ LinearDecisionIntMP.valid_expr' e2) ∧ (∀(o1 : ℤ), (0 : ℤ) ≤ o1 ∧ expr_bound' e2 o1 → (match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.ProdL f _ => f = e1 | LinearDecisionIntMP.expr'.ProdR _ f => f = e1 | LinearDecisionIntMP.expr'.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) ∧ LinearDecisionIntMP.valid_expr' e1) | LinearDecisionIntMP.expr'.Diff e1 e2 => ((match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.expr'.ProdL f _ => f = e2 | LinearDecisionIntMP.expr'.ProdR _ f => f = e2 | LinearDecisionIntMP.expr'.Diff f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) ∧ LinearDecisionIntMP.valid_expr' e2) ∧ (∀(o1 : ℤ), (0 : ℤ) ≤ o1 ∧ expr_bound' e2 o1 → (match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.ProdL f _ => f = e1 | LinearDecisionIntMP.expr'.ProdR _ f => f = e1 | LinearDecisionIntMP.expr'.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) ∧ LinearDecisionIntMP.valid_expr' e1) | LinearDecisionIntMP.expr'.ProdL e1 _ => (match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.ProdL f _ => f = e1 | LinearDecisionIntMP.expr'.ProdR _ f => f = e1 | LinearDecisionIntMP.expr'.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) ∧ LinearDecisionIntMP.valid_expr' e1 | LinearDecisionIntMP.expr'.ProdR _ e1 => (match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.ProdL f _ => f = e1 | LinearDecisionIntMP.expr'.ProdR _ f => f = e1 | LinearDecisionIntMP.expr'.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) ∧ LinearDecisionIntMP.valid_expr' e1) ∧ (∀(result : ℤ), (match e with | LinearDecisionIntMP.expr'.Var i => result = i | LinearDecisionIntMP.expr'.Coeff _ => result = (0 : ℤ) | LinearDecisionIntMP.expr'.Sum e1 e2 => (∃(o1 : ℤ), ((0 : ℤ) ≤ o1 ∧ expr_bound' e2 o1) ∧ (∃(o2 : ℤ), ((0 : ℤ) ≤ o2 ∧ expr_bound' e1 o2) ∧ result = max o2 o1)) | LinearDecisionIntMP.expr'.Diff e1 e2 => (∃(o1 : ℤ), ((0 : ℤ) ≤ o1 ∧ expr_bound' e2 o1) ∧ (∃(o2 : ℤ), ((0 : ℤ) ≤ o2 ∧ expr_bound' e1 o2) ∧ result = max o2 o1)) | LinearDecisionIntMP.expr'.ProdL e1 _ => (0 : ℤ) ≤ result ∧ expr_bound' e1 result | LinearDecisionIntMP.expr'.ProdR _ e1 => (0 : ℤ) ≤ result ∧ expr_bound' e1 result) → (0 : ℤ) ≤ result ∧ expr_bound' e result)
  := sorry
end lineardecision_EqPropMP_max_varqtqtvc
