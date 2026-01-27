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
namespace imp_SymbolicInterpreter_state_extends_freshqtvc
axiom compose : (Svar.svar -> ℤ) -> Constraint.t -> Syntax.program_var -> Option ℤ
axiom compose'def (rho : Svar.svar -> ℤ) (sigma : Constraint.t) (x : Syntax.program_var) : compose rho sigma x = (match Constraint.get sigma x with | Option.some v => Option.some (rho v) | Option.none => Option.none)
noncomputable def state_extends (s : SymState.sym_state) (s' : SymState.sym_state) := Svar.to_fset (SymState.vars s) ⊆ Svar.to_fset (SymState.vars s') ∧ (∀(v : Svar.svar), v ∈ Svar.to_fset (SymState.vars s) → SymState.rho s v = SymState.rho s' v)
axiom svar_set_add : Svar.svar -> Svar.set -> Svar.set
axiom svar_set_add'def (v : Svar.svar) (vs : Svar.set) : Svar.to_fset (svar_set_add v vs) = insert v (Svar.to_fset vs) ∧ (if v ∈ Svar.to_fset vs then Finset.card (Svar.to_fset (svar_set_add v vs)) = Finset.card (Svar.to_fset vs) else Int.ofNat (Finset.card (Svar.to_fset (svar_set_add v vs))) = Int.ofNat (Finset.card (Svar.to_fset vs)) + (1 : ℤ))
theorem state_extends_fresh'vc (v : Svar.svar) (s : SymState.sym_state) (c : Constraint.constr) (x : Syntax.program_var) (n : ℤ) (fact0 : FreshSvar.is_fresh v (Svar.to_fset (SymState.vars s))) (fact1 : Constraint.vars_in_constraint c = insert v (∅ : Finset Svar.svar)) : state_extends s (SymState.mk_sym_state (Constraint.set (SymState.sigma s) x v) (Constraint.constr.Cconj (SymState.constr s) c) (svar_set_add v (SymState.vars s)) (Function.update (SymState.rho s) v n))
  := sorry
end imp_SymbolicInterpreter_state_extends_freshqtvc
