import Why3.Base
import pearl.defunctionalization_vcg.lean.defunctionalization.Expr
import pearl.defunctionalization_vcg.lean.defunctionalization.DirectSem
open Classical
open Lean4Why3
namespace defunctionalization_CPS_interpret_1qtvc
axiom identity : ℤ -> ℤ
axiom identity_def (y : ℤ) : identity y = y
theorem interpret_1'vc (p : Expr.expr) : identity (DirectSem.eval_0 p) = DirectSem.eval_0 p
  := sorry
end defunctionalization_CPS_interpret_1qtvc
