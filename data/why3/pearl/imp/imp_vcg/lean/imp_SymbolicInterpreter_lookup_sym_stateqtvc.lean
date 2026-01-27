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
namespace imp_SymbolicInterpreter_lookup_sym_stateqtvc
theorem lookup_sym_state'vc (s : SymState.sym_state) (x : Syntax.program_var) : let o1 : Constraint.t := SymState.sigma s; (∀(result : Svar.svar), (match Constraint.get o1 x with | Option.none => False | Option.some v => result = v) → Constraint.get (SymState.sigma s) x = Option.some result) ∧ (Constraint.get o1 x = Option.none → Constraint.get (SymState.sigma s) x = Option.none)
  := sorry
end imp_SymbolicInterpreter_lookup_sym_stateqtvc
