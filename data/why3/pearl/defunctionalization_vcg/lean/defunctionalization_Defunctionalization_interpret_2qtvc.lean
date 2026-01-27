import Why3.Base
import pearl.defunctionalization_vcg.lean.defunctionalization.Expr
import pearl.defunctionalization_vcg.lean.defunctionalization.DirectSem
open Classical
open Lean4Why3
namespace defunctionalization_Defunctionalization_interpret_2qtvc
inductive cont where
  | A1 : Expr.expr -> cont -> cont
  | A2 : ℤ -> cont -> cont
  | I : cont
axiom inhabited_axiom_cont : Inhabited cont
attribute [instance] inhabited_axiom_cont
inductive eval_cont : cont -> ℤ -> ℤ -> Prop where
 | a1 (v : ℤ) (k : cont) (e2 : Expr.expr) (r : ℤ) : eval_cont (cont.A2 v k) (DirectSem.eval_0 e2) r → eval_cont (cont.A1 e2 k) v r
 | a2 (k : cont) (v1 : ℤ) (v : ℤ) (r : ℤ) : eval_cont k (v1 - v) r → eval_cont (cont.A2 v1 k) v r
 | a3 (v : ℤ) : eval_cont cont.I v v
noncomputable def size_e : Expr.expr -> ℤ
  | (Expr.expr.Cte x) => (1 : ℤ)
  | (Expr.expr.Sub e1 e2) => (3 : ℤ) + size_e e1 + size_e e2
noncomputable def size_c : cont -> ℤ
  | cont.I => (0 : ℤ)
  | (cont.A1 e2 k) => (2 : ℤ) + size_e e2 + size_c k
  | (cont.A2 x k) => (1 : ℤ) + size_c k
theorem interpret_2'vc (p : Expr.expr) (result : ℤ) (fact0 : eval_cont cont.I (DirectSem.eval_0 p) result) : result = DirectSem.eval_0 p
  := sorry
end defunctionalization_Defunctionalization_interpret_2qtvc
