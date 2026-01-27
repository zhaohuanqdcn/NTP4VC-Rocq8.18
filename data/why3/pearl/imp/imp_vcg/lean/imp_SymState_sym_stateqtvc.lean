import Why3.Base
import pearl.imp.lib.lean.imp.Syntax
import pearl.imp.lib.lean.imp.Svar
import pearl.imp.lib.lean.imp.Constraint
open Classical
open Lean4Why3
namespace imp_SymState_sym_stateqtvc
theorem sym_state'vc (o1 : Svar.set) (fact0 : Svar.to_fset o1 = (∅ : Finset Svar.svar)) (fact1 : Int.ofNat (Finset.card (Svar.to_fset o1)) = (0 : ℤ)) : let constr : Constraint.constr := Constraint.constr.Ctrue; Constraint.vars_in_constraint constr ⊆ Svar.to_fset o1 ∧ (Constraint.vars_in_constraint constr ⊆ Svar.to_fset o1 → (∀(x : Syntax.program_var) (v : Svar.svar), Constraint.get Constraint.empty x = Option.some v → v ∈ Svar.to_fset o1))
  := sorry
end imp_SymState_sym_stateqtvc
