import Why3.Base
import pearl.prover.lib.lean.Functions.Config
import pearl.prover.lib.lean.Functions.Func
open Classical
open Lean4Why3
namespace Predicates_Pred_pupdate_eqqtvc
noncomputable def predExtensionalEqual {α : Type} [Inhabited α] (p : α -> Bool) (q : α -> Bool) := ∀(x : α), (p x = true) = (q x = true)
axiom predicateExtensionality {α : Type} [Inhabited α] (p : α -> Bool) (q : α -> Bool) (fact0 : predExtensionalEqual p q) : p = q
noncomputable def evalp {α : Type} [Inhabited α] (p : α -> Bool) (x : α) := p x = true
axiom pupdate :  {α : Type} -> [Inhabited α] -> (α -> Bool) -> α -> Bool -> α -> Bool
axiom pupdate_def {α : Type} [Inhabited α] (p : α -> Bool) (x : α) (y : Bool) (z : α) : (pupdate p x y z = true) = (if x = z then y = true else p z = true)
theorem pupdate_eq'vc {α : Type} [Inhabited α] (p : α -> Bool) (x : α) (y : Bool) : (pupdate p x y x = true) = (y = true)
  := sorry
end Predicates_Pred_pupdate_eqqtvc
