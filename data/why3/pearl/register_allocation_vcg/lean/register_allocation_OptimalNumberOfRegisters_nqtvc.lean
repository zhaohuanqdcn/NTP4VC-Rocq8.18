import Why3.Base
import pearl.register_allocation_vcg.lean.register_allocation.Spec
import pearl.register_allocation_vcg.lean.register_allocation.DWP
open Classical
open Lean4Why3
namespace register_allocation_OptimalNumberOfRegisters_nqtvc
axiom k : ℤ
axiom k'def : (2 : ℤ) ≤ k
theorem n'vc (e : Spec.expr) : match e with | Spec.expr.Evar _ => True | Spec.expr.Eneg e1 => (match e with | Spec.expr.Evar _ => False | Spec.expr.Eneg f => f = e1 | Spec.expr.Eadd f f1 => f = e1 ∨ f1 = e1) | Spec.expr.Eadd e1 e2 => (match e with | Spec.expr.Evar _ => False | Spec.expr.Eneg f => f = e1 | Spec.expr.Eadd f f1 => f = e1 ∨ f1 = e1) ∧ (match e with | Spec.expr.Evar _ => False | Spec.expr.Eneg f => f = e2 | Spec.expr.Eadd f f1 => f = e2 ∨ f1 = e2)
  := sorry
end register_allocation_OptimalNumberOfRegisters_nqtvc
