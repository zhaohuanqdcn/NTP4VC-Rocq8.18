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
namespace imp_SymbolicInterpreter_results_extend_seqqtvc
axiom compose : (Svar.svar -> ℤ) -> Constraint.t -> Syntax.program_var -> Option ℤ
axiom compose'def (rho : Svar.svar -> ℤ) (sigma : Constraint.t) (x : Syntax.program_var) : compose rho sigma x = (match Constraint.get sigma x with | Option.some v => Option.some (rho v) | Option.none => Option.none)
noncomputable def state_extends (s : SymState.sym_state) (s' : SymState.sym_state) := Svar.to_fset (SymState.vars s) ⊆ Svar.to_fset (SymState.vars s') ∧ (∀(v : Svar.svar), v ∈ Svar.to_fset (SymState.vars s) → SymState.rho s v = SymState.rho s' v)
axiom svar_set_add : Svar.svar -> Svar.set -> Svar.set
axiom svar_set_add'def (v : Svar.svar) (vs : Svar.set) : Svar.to_fset (svar_set_add v vs) = insert v (Svar.to_fset vs) ∧ (if v ∈ Svar.to_fset vs then Finset.card (Svar.to_fset (svar_set_add v vs)) = Finset.card (Svar.to_fset vs) else Int.ofNat (Finset.card (Svar.to_fset (svar_set_add v vs))) = Int.ofNat (Finset.card (Svar.to_fset vs)) + (1 : ℤ))
noncomputable def results_extend (s : SymState.sym_state) (normals : Finset SymState.sym_state) (unbounds : Finset SymState.sym_state) (limits : Finset SymState.sym_state) := ∀(s' : SymState.sym_state), s' ∈ normals ∨ s' ∈ unbounds ∨ s' ∈ limits → state_extends s s'
theorem results_extend_seq'vc (s : SymState.sym_state) (normals1 : Finset SymState.sym_state) (unbounds1 : Finset SymState.sym_state) (limits1 : Finset SymState.sym_state) (s1 : SymState.sym_state) (normals2 : Finset SymState.sym_state) (unbounds2 : Finset SymState.sym_state) (limits2 : Finset SymState.sym_state) (fact0 : results_extend s normals1 unbounds1 limits1) (fact1 : s1 ∈ normals1) (fact2 : results_extend s1 normals2 unbounds2 limits2) : results_extend s normals2 (unbounds1 ∪ unbounds2) (limits1 ∪ limits2)
  := sorry
end imp_SymbolicInterpreter_results_extend_seqqtvc
