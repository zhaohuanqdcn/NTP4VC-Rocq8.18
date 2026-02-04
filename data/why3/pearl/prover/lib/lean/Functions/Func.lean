import Why3.Base
import pearl.prover.lib.lean.Functions.Config
open Classical
open Lean4Why3
namespace Func
noncomputable def extensionalEqual {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) (g : α -> β) := ∀(x : α), f x = g x
axiom functionExtensionality {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) (g : α -> β) (fact0 : extensionalEqual f g) : f = g
axiom update :  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> (α -> β) -> α -> β -> α -> β
axiom update_def {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) (x : α) (y : β) (z : α) : update f x y z = (if x = z then y else f z)
axiom identity :  {α : Type} -> [Inhabited α] -> α -> α
axiom identity_def {α : Type} [Inhabited α] (x : α) : identity x = x
axiom compose :  {γ : Type} -> [Inhabited γ] ->  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> (β -> γ) -> (α -> β) -> α -> γ
axiom compose_def {γ : Type} {β : Type} {α : Type} [Inhabited γ] [Inhabited β] [Inhabited α] (g : β -> γ) (f : α -> β) (x : α) : compose g f x = g (f x)
axiom const :  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> β -> α -> β
axiom const_def {β : Type} {α : Type} [Inhabited β] [Inhabited α] (x : β) (z : α) : (const : β -> α -> β) x z = x
end Func
