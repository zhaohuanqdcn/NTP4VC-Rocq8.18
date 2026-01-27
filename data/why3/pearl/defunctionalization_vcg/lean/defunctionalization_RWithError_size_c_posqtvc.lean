import Why3.Base
import pearl.defunctionalization_vcg.lean.defunctionalization.Expr
import pearl.defunctionalization_vcg.lean.defunctionalization.DirectSem
import pearl.defunctionalization_vcg.lean.defunctionalization.Defunctionalization
import pearl.defunctionalization_vcg.lean.defunctionalization.SemWithError
open Classical
open Lean4Why3
namespace defunctionalization_RWithError_size_c_posqtvc
inductive context where
  | Empty : context
  | Left : context -> Expr.expr -> context
  | Right : ℤ -> context -> context
axiom inhabited_axiom_context : Inhabited context
attribute [instance] inhabited_axiom_context
noncomputable def size_c : context -> ℤ
  | context.Empty => (0 : ℤ)
  | (context.Left c1 e) => (2 : ℤ) + size_c c1 + Defunctionalization.size_e e
  | (context.Right x c1) => (1 : ℤ) + size_c c1
theorem size_c_pos'vc (c : context) : (0 : ℤ) ≤ size_c c
  := sorry
end defunctionalization_RWithError_size_c_posqtvc
