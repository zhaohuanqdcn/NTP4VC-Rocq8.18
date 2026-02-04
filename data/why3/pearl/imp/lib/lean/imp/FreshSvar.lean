import Why3.Base
import pearl.imp.lib.lean.imp.Syntax
import pearl.imp.lib.lean.imp.Svar
import pearl.imp.lib.lean.imp.Constraint
import pearl.imp.lib.lean.imp.SymState
open Classical
open Lean4Why3
namespace FreshSvar
noncomputable def is_fresh (v : Svar.svar) (vars : Finset Svar.svar) := ¬v ∈ vars
end FreshSvar
