import Why3.Base
import pearl.defunctionalization_vcg.lean.defunctionalization.Expr
import pearl.defunctionalization_vcg.lean.defunctionalization.DirectSem
import pearl.defunctionalization_vcg.lean.defunctionalization.Defunctionalization
open Classical
open Lean4Why3
namespace defunctionalization_SemWithError_continue_4qtvc
inductive value where
  | Vnum : ℤ -> value
  | Underflow : value
axiom inhabited_axiom_value : Inhabited value
attribute [instance] inhabited_axiom_value
noncomputable def eval_0 : Expr.expr -> value
  | (Expr.expr.Cte n) => if (0 : ℤ) ≤ n then value.Vnum n else value.Underflow
  | (Expr.expr.Sub e1 e2) => match eval_0 e1 with | value.Underflow => value.Underflow | value.Vnum v1 => (match eval_0 e2 with | value.Underflow => value.Underflow | value.Vnum v2 => (if v2 ≤ v1 then value.Vnum (v1 - v2) else value.Underflow))
axiom fc :  {α : Type} -> [Inhabited α] -> (value -> α) -> ℤ -> value -> α
axiom fc1 :  {α : Type} -> [Inhabited α] -> (value -> α) -> Expr.expr -> value -> α
axiom fc'def {α : Type} [Inhabited α] (k : value -> α) (v1 : ℤ) (v2 : value) : fc k v1 v2 = (match v2 with | value.Underflow => k value.Underflow | value.Vnum v21 => k (if v21 ≤ v1 then value.Vnum (v1 - v21) else value.Underflow))
noncomputable def eval_1 {α : Type} [Inhabited α] : Expr.expr -> (value -> α) -> α
  | (Expr.expr.Cte n), k => k (if (0 : ℤ) ≤ n then value.Vnum n else value.Underflow)
  | (Expr.expr.Sub e1 e2), k => eval_1 e1 (fc1 k e2)
axiom fc'def1 {α : Type} [Inhabited α] (k : value -> α) (e2 : Expr.expr) (v1 : value) : fc1 k e2 v1 = (match v1 with | value.Underflow => k value.Underflow | value.Vnum v11 => eval_1 e2 (fc k v11))
axiom identity : value -> value
axiom identity_def (y : value) : identity y = y
noncomputable def interpret_1 (p : Expr.expr) := eval_1 p identity
axiom eval_2a :  {α : Type} -> [Inhabited α] -> Expr.expr -> (ℤ -> α) -> (Unit -> α) -> ℤ -> α
axiom eval_2b :  {α : Type} -> [Inhabited α] -> ℤ -> (ℤ -> α) -> (Unit -> α) -> ℤ -> α
axiom eval_2b'def {α : Type} [Inhabited α] (v1 : ℤ) (k : ℤ -> α) (kerr : Unit -> α) (v2 : ℤ) : eval_2b v1 k kerr v2 = (if v2 ≤ v1 then k (v1 - v2) else kerr ())
noncomputable def eval_2 {α : Type} [Inhabited α] : Expr.expr -> (ℤ -> α) -> (Unit -> α) -> α
  | (Expr.expr.Cte n), k, kerr => if (0 : ℤ) ≤ n then k n else kerr ()
  | (Expr.expr.Sub e1 e2), k, kerr => eval_2 e1 (eval_2a e2 k kerr) kerr
axiom eval_2a'def {α : Type} [Inhabited α] (e2 : Expr.expr) (k : ℤ -> α) (kerr : Unit -> α) (v1 : ℤ) : eval_2a e2 k kerr v1 = eval_2 e2 (eval_2b v1 k kerr) kerr
axiom Vnum_closure : ℤ -> value
axiom fc2 : Unit -> value
axiom Vnum_closure_def (y : ℤ) : Vnum_closure y = value.Vnum y
axiom fc'def2 (x : Unit) : fc2 x = value.Underflow
noncomputable def interpret_2 (p : Expr.expr) := eval_2 p Vnum_closure fc2
axiom eval_3a : Expr.expr -> (ℤ -> value) -> ℤ -> value
axiom eval_3b : ℤ -> (ℤ -> value) -> ℤ -> value
axiom eval_3b'def (v1 : ℤ) (k : ℤ -> value) (v2 : ℤ) : eval_3b v1 k v2 = (if v2 ≤ v1 then k (v1 - v2) else value.Underflow)
noncomputable def eval_3 : Expr.expr -> (ℤ -> value) -> value
  | (Expr.expr.Cte n), k => if (0 : ℤ) ≤ n then k n else value.Underflow
  | (Expr.expr.Sub e1 e2), k => eval_3 e1 (eval_3a e2 k)
axiom eval_3a'def (e2 : Expr.expr) (k : ℤ -> value) (v1 : ℤ) : eval_3a e2 k v1 = eval_3 e2 (eval_3b v1 k)
noncomputable def interpret_3 (p : Expr.expr) := eval_3 p Vnum_closure
inductive cont where
  | I : cont
  | A : Expr.expr -> cont -> cont
  | B : ℤ -> cont -> cont
axiom inhabited_axiom_cont : Inhabited cont
attribute [instance] inhabited_axiom_cont
inductive eval_cont : cont -> value -> value -> Prop where
 | underflow (k : cont) : eval_cont k value.Underflow value.Underflow
 | a1 (v : ℤ) (k : cont) (e2 : Expr.expr) (r : value) : eval_cont (cont.B v k) (eval_0 e2) r → eval_cont (cont.A e2 k) (value.Vnum v) r
 | a2 (k : cont) (v : ℤ) (v1 : ℤ) (r : value) : eval_cont k (if v ≤ v1 then value.Vnum (v1 - v) else value.Underflow) r → eval_cont (cont.B v1 k) (value.Vnum v) r
 | a3 (v : ℤ) : eval_cont cont.I (value.Vnum v) (value.Vnum v)
noncomputable def size_e : Expr.expr -> ℤ
  | (Expr.expr.Cte x) => (1 : ℤ)
  | (Expr.expr.Sub e1 e2) => (3 : ℤ) + size_e e1 + size_e e2
noncomputable def size_c : cont -> ℤ
  | cont.I => (0 : ℤ)
  | (cont.A e2 k) => (2 : ℤ) + Defunctionalization.size_e e2 + size_c k
  | (cont.B x k) => (1 : ℤ) + size_c k
theorem continue_4'vc (v : ℤ) (c : cont) (fact0 : (0 : ℤ) ≤ v) : (match c with | cont.A e2 k => (0 : ℤ) ≤ size_c c ∧ size_c (cont.B v k) + Defunctionalization.size_e e2 < size_c c | cont.B v1 k => v ≤ v1 → ((0 : ℤ) ≤ size_c c ∧ size_c k < size_c c) ∧ (0 : ℤ) ≤ v1 - v | cont.I => True) ∧ (∀(result : value), (match c with | cont.A e2 k => eval_cont (cont.B v k) (eval_0 e2) result | cont.B v1 k => (if v ≤ v1 then eval_cont k (value.Vnum (v1 - v)) result else result = value.Underflow) | cont.I => result = value.Vnum v) → eval_cont c (value.Vnum v) result)
  := sorry
end defunctionalization_SemWithError_continue_4qtvc
