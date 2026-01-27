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
namespace imp_SymbolicInterpreter_update_rho_interp_symbolic_exprqtvc
axiom compose : (Svar.svar -> ℤ) -> Constraint.t -> Syntax.program_var -> Option ℤ
axiom compose'def (rho : Svar.svar -> ℤ) (sigma : Constraint.t) (x : Syntax.program_var) : compose rho sigma x = (match Constraint.get sigma x with | Option.some v => Option.some (rho v) | Option.none => Option.none)
noncomputable def state_extends (s : SymState.sym_state) (s' : SymState.sym_state) := Svar.to_fset (SymState.vars s) ⊆ Svar.to_fset (SymState.vars s') ∧ (∀(v : Svar.svar), v ∈ Svar.to_fset (SymState.vars s) → SymState.rho s v = SymState.rho s' v)
axiom svar_set_add : Svar.svar -> Svar.set -> Svar.set
axiom svar_set_add'def (v : Svar.svar) (vs : Svar.set) : Svar.to_fset (svar_set_add v vs) = insert v (Svar.to_fset vs) ∧ (if v ∈ Svar.to_fset vs then Finset.card (Svar.to_fset (svar_set_add v vs)) = Finset.card (Svar.to_fset vs) else Int.ofNat (Finset.card (Svar.to_fset (svar_set_add v vs))) = Int.ofNat (Finset.card (Svar.to_fset vs)) + (1 : ℤ))
noncomputable def results_extend (s : SymState.sym_state) (normals : Finset SymState.sym_state) (unbounds : Finset SymState.sym_state) (limits : Finset SymState.sym_state) := ∀(s' : SymState.sym_state), s' ∈ normals ∨ s' ∈ unbounds ∨ s' ∈ limits → state_extends s s'
theorem update_rho_interp_symbolic_expr'vc (v : Svar.svar) (se : Constraint.symbolic_expr) (rho : Svar.svar -> ℤ) (fact0 : FreshSvar.is_fresh v (Constraint.vars_in_symbolic_expr se)) : Constraint.interp_symbolic_expr (Function.update rho v (Constraint.interp_symbolic_expr rho se)) (Constraint.symbolic_expr.Svar v) = Constraint.interp_symbolic_expr (Function.update rho v (Constraint.interp_symbolic_expr rho se)) se
  := sorry
end imp_SymbolicInterpreter_update_rho_interp_symbolic_exprqtvc
