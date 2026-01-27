import Why3.Base
import pearl.prover.lib.lean.Functions.Config
open Classical
open Lean4Why3
namespace Functions_Func_update_neqqtvc
noncomputable def extensionalEqual {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) (g : α -> β) := ∀(x : α), f x = g x
axiom functionExtensionality {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) (g : α -> β) (fact0 : extensionalEqual f g) : f = g
axiom update :  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> (α -> β) -> α -> β -> α -> β
axiom update_def {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) (x : α) (y : β) (z : α) : update f x y z = (if x = z then y else f z)
theorem update_neq'vc {β : Type} {α : Type} [Inhabited β] [Inhabited α] (x : α) (z : α) (f : α -> β) (y : β) (fact0 : ¬x = z) : update f x y z = f z
  := sorry
end Functions_Func_update_neqqtvc
