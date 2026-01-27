import Why3.Base
import pearl.prover.lib.lean.Functions.Config
import pearl.prover.lib.lean.Functions.Func
open Classical
open Lean4Why3
namespace Predicates_Pred_pcompose_associativeqtvc
noncomputable def predExtensionalEqual {α : Type} [Inhabited α] (p : α -> Bool) (q : α -> Bool) := ∀(x : α), (p x = true) = (q x = true)
axiom predicateExtensionality {α : Type} [Inhabited α] (p : α -> Bool) (q : α -> Bool) (fact0 : predExtensionalEqual p q) : p = q
noncomputable def evalp {α : Type} [Inhabited α] (p : α -> Bool) (x : α) := p x = true
axiom pupdate :  {α : Type} -> [Inhabited α] -> (α -> Bool) -> α -> Bool -> α -> Bool
axiom pupdate_def {α : Type} [Inhabited α] (p : α -> Bool) (x : α) (y : Bool) (z : α) : (pupdate p x y z = true) = (if x = z then y = true else p z = true)
axiom pcompose :  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> (β -> Bool) -> (α -> β) -> α -> Bool
axiom pcompose_def {β : Type} {α : Type} [Inhabited β] [Inhabited α] (p : β -> Bool) (f : α -> β) (x : α) : (pcompose p f x = true) = (p (f x) = true)
theorem pcompose_associative'vc {γ : Type} {β : Type} {α : Type} [Inhabited γ] [Inhabited β] [Inhabited α] (p : γ -> Bool) (g : β -> γ) (f : α -> β) : pcompose (pcompose p g) f = pcompose p (Func.compose g f)
  := sorry
end Predicates_Pred_pcompose_associativeqtvc
