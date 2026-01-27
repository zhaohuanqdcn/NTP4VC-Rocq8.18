import Why3.Base
import pearl.imp.lib.lean.imp.Syntax
import pearl.imp.lib.lean.imp.ConcreteSemantics
import pearl.imp.lib.lean.imp.Svar
import pearl.imp.lib.lean.imp.Constraint
import pearl.imp.lib.lean.imp.SymState
import pearl.imp.lib.lean.imp.FreshSvar
import pearl.imp.lib.lean.imp.SymStateSet
open Classical
open Lean4Why3
namespace imp_SymbolicInterpreter_compose_set_fresh_in_envqtvc
axiom compose : (Svar.svar -> ℤ) -> Constraint.t -> Syntax.program_var -> Option ℤ
axiom compose'def (rho : Svar.svar -> ℤ) (sigma : Constraint.t) (x : Syntax.program_var) : compose rho sigma x = (match Constraint.get sigma x with | Option.some v => Option.some (rho v) | Option.none => Option.none)
noncomputable def state_extends (s : SymState.sym_state) (s' : SymState.sym_state) := Svar.to_fset (SymState.vars s) ⊆ Svar.to_fset (SymState.vars s') ∧ (∀(v : Svar.svar), v ∈ Svar.to_fset (SymState.vars s) → SymState.rho s v = SymState.rho s' v)
theorem compose_set_fresh_in_env'vc (sigma : Constraint.t) (v : Svar.svar) (rho : Svar.svar -> ℤ) (x : Syntax.program_var) (n : ℤ) (fact0 : ∀(x : Syntax.program_var), ¬Constraint.get sigma x = Option.some v) : Function.update (compose rho sigma) x (Option.some n) = compose (Function.update rho v n) (Constraint.set sigma x v)
  := sorry
end imp_SymbolicInterpreter_compose_set_fresh_in_envqtvc
