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
namespace imp_SymbolicInterpreter_bhv_unionqtqtvc
axiom compose : (Svar.svar -> ℤ) -> Constraint.t -> Syntax.program_var -> Option ℤ
axiom compose'def (rho : Svar.svar -> ℤ) (sigma : Constraint.t) (x : Syntax.program_var) : compose rho sigma x = (match Constraint.get sigma x with | Option.some v => Option.some (rho v) | Option.none => Option.none)
noncomputable def state_extends (s : SymState.sym_state) (s' : SymState.sym_state) := Svar.to_fset (SymState.vars s) ⊆ Svar.to_fset (SymState.vars s') ∧ (∀(v : Svar.svar), v ∈ Svar.to_fset (SymState.vars s) → SymState.rho s v = SymState.rho s' v)
axiom svar_set_add : Svar.svar -> Svar.set -> Svar.set
axiom svar_set_add'def (v : Svar.svar) (vs : Svar.set) : Svar.to_fset (svar_set_add v vs) = insert v (Svar.to_fset vs) ∧ (if v ∈ Svar.to_fset vs then Finset.card (Svar.to_fset (svar_set_add v vs)) = Finset.card (Svar.to_fset vs) else Int.ofNat (Finset.card (Svar.to_fset (svar_set_add v vs))) = Int.ofNat (Finset.card (Svar.to_fset vs)) + (1 : ℤ))
theorem bhv_union''vc (bhv : ConcreteSemantics.behavior) (s : SymState.sym_state) (normals2 : Finset SymState.sym_state) (unbounds1 : Finset SymState.sym_state) (unbounds2 : Finset SymState.sym_state) (limits1 : Finset SymState.sym_state) (limits2 : Finset SymState.sym_state) (fact0 : match bhv with | ConcreteSemantics.behavior.Cnormal => s ∈ normals2 | ConcreteSemantics.behavior.Cunbound_var => s ∈ unbounds1 ∪ unbounds2 | ConcreteSemantics.behavior.Cloop_limit => s ∈ limits1 ∪ limits2) : (match bhv with | ConcreteSemantics.behavior.Cnormal => s ∈ normals2 | ConcreteSemantics.behavior.Cunbound_var => s ∈ unbounds2 | ConcreteSemantics.behavior.Cloop_limit => s ∈ limits2) ∨ bhv = ConcreteSemantics.behavior.Cunbound_var ∧ s ∈ unbounds1 ∨ bhv = ConcreteSemantics.behavior.Cloop_limit ∧ s ∈ limits1
  := sorry
end imp_SymbolicInterpreter_bhv_unionqtqtvc
