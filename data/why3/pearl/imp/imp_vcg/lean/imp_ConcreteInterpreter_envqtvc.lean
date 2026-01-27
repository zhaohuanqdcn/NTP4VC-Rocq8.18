import Why3.Base
import pearl.imp.lib.lean.imp.Syntax
import pearl.imp.lib.lean.imp.ConcreteSemantics
import pearl.imp.lib.lean.dict.Imperative
open Classical
open Lean4Why3
namespace imp_ConcreteInterpreter_envqtvc
axiom env : Type
axiom inhabited_axiom_env : Inhabited env
attribute [instance] inhabited_axiom_env
theorem env'vc : True
  := sorry
end imp_ConcreteInterpreter_envqtvc
