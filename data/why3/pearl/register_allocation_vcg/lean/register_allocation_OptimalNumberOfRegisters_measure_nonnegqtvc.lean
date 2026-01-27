import Why3.Base
import pearl.register_allocation_vcg.lean.register_allocation.Spec
import pearl.register_allocation_vcg.lean.register_allocation.DWP
open Classical
open Lean4Why3
namespace register_allocation_OptimalNumberOfRegisters_measure_nonnegqtvc
axiom k : ℤ
axiom k'def : (2 : ℤ) ≤ k
noncomputable def n : Spec.expr -> ℤ
  | (Spec.expr.Evar x) => (1 : ℤ)
  | (Spec.expr.Eneg e1) => n e1
  | (Spec.expr.Eadd e1 e2) => let n1 : ℤ := n e1; let n2 : ℤ := n e2; if n1 = n2 then (1 : ℤ) + n1 else max n1 n2
noncomputable def measure : Spec.expr -> ℤ
  | (Spec.expr.Evar x) => (0 : ℤ)
  | (Spec.expr.Eneg e1) => (1 : ℤ) + measure e1
  | (Spec.expr.Eadd e1 e2) => (1 : ℤ) + (if n e2 ≤ n e1 then measure e1 + measure e2 else (1 : ℤ) + measure e1 + measure e2)
theorem measure_nonneg'vc (e : Spec.expr) : (0 : ℤ) ≤ measure e
  := sorry
end register_allocation_OptimalNumberOfRegisters_measure_nonnegqtvc
