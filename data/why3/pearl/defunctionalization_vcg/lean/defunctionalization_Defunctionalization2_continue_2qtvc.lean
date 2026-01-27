import Why3.Base
import pearl.defunctionalization_vcg.lean.defunctionalization.Expr
import pearl.defunctionalization_vcg.lean.defunctionalization.DirectSem
open Classical
open Lean4Why3
namespace defunctionalization_Defunctionalization2_continue_2qtvc
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
inductive nat where
  | S : nat -> nat
  | O1 : nat
axiom inhabited_axiom_nat : Inhabited nat
attribute [instance] inhabited_axiom_nat
noncomputable def size_e : Expr.expr -> nat -> nat
  | (Expr.expr.Cte x), acc => nat.S acc
  | (Expr.expr.Sub e1 e2), acc => nat.S (size_e e1 (nat.S (size_e e2 (nat.S acc))))
noncomputable def size_c : cont -> nat -> nat
  | cont.I, acc => acc
  | (cont.A1 e2 k), acc => nat.S (size_e e2 (nat.S (size_c k acc)))
  | (cont.A2 x k), acc => nat.S (size_c k acc)
theorem continue_2'vc (c : cont) (v : ℤ) : (match c with | cont.A1 e2 k => (match size_c c nat.O1 with | nat.S f => f = size_e e2 (size_c (cont.A2 v k) nat.O1) | nat.O1 => False) | cont.A2 v1 k => (match size_c c nat.O1 with | nat.S f => f = size_c k nat.O1 | nat.O1 => False) | cont.I => True) ∧ (∀(result : ℤ), (match c with | cont.A1 e2 k => eval_cont (cont.A2 v k) (DirectSem.eval_0 e2) result | cont.A2 v1 k => eval_cont k (v1 - v) result | cont.I => result = v) → eval_cont c v result)
  := sorry
end defunctionalization_Defunctionalization2_continue_2qtvc
