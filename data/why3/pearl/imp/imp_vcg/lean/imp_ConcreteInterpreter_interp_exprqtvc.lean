import Why3.Base
import pearl.imp.lib.lean.imp.Syntax
import pearl.imp.lib.lean.imp.ConcreteSemantics
import pearl.imp.lib.lean.dict.Imperative
open Classical
open Lean4Why3
namespace imp_ConcreteInterpreter_interp_exprqtvc
axiom env : Type
axiom inhabited_axiom_env : Inhabited env
attribute [instance] inhabited_axiom_env
theorem interp_expr'vc (e : Syntax.expr) (env1 : Imperative.t Syntax.program_var ℤ) : match e with | Syntax.expr.Elit n => ConcreteSemantics.eval_expr (Imperative.model1 env1) e (ConcreteSemantics.expr_behaviour.Enormal n) | Syntax.expr.Evar x => (∀(result : ℤ), (match Imperative.get env1 x with | Option.none => False | Option.some v => result = v) → ConcreteSemantics.eval_expr (Imperative.model1 env1) e (ConcreteSemantics.expr_behaviour.Enormal result)) ∧ (Imperative.get env1 x = Option.none → ConcreteSemantics.eval_expr (Imperative.model1 env1) e ConcreteSemantics.expr_behaviour.Eunbound_var) | Syntax.expr.Esub e1 e2 => (match e with | Syntax.expr.Elit _ => False | Syntax.expr.Evar _ => False | Syntax.expr.Esub f f1 => f = e2 ∨ f1 = e2) ∧ (∀(o1 : ℤ), ConcreteSemantics.eval_expr (Imperative.model1 env1) e2 (ConcreteSemantics.expr_behaviour.Enormal o1) → (match e with | Syntax.expr.Elit _ => False | Syntax.expr.Evar _ => False | Syntax.expr.Esub f f1 => f = e1 ∨ f1 = e1) ∧ (∀(o2 : ℤ), ConcreteSemantics.eval_expr (Imperative.model1 env1) e1 (ConcreteSemantics.expr_behaviour.Enormal o2) → ConcreteSemantics.eval_expr (Imperative.model1 env1) e (ConcreteSemantics.expr_behaviour.Enormal (o2 - o1))) ∧ (ConcreteSemantics.eval_expr (Imperative.model1 env1) e1 ConcreteSemantics.expr_behaviour.Eunbound_var → ConcreteSemantics.eval_expr (Imperative.model1 env1) e ConcreteSemantics.expr_behaviour.Eunbound_var)) ∧ (ConcreteSemantics.eval_expr (Imperative.model1 env1) e2 ConcreteSemantics.expr_behaviour.Eunbound_var → ConcreteSemantics.eval_expr (Imperative.model1 env1) e ConcreteSemantics.expr_behaviour.Eunbound_var)
  := sorry
end imp_ConcreteInterpreter_interp_exprqtvc
