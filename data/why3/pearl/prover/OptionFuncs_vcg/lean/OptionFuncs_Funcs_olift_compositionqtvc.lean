import Why3.Base
import pearl.prover.lib.lean.Functions.Config
import pearl.prover.lib.lean.Functions.Func
open Classical
open Lean4Why3
namespace OptionFuncs_Funcs_olift_compositionqtvc
axiom some :  {α : Type} -> [Inhabited α] -> α -> Option α
axiom some_def {α : Type} [Inhabited α] (x : α) : some x = Option.some x
axiom ocase :  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> (α -> β) -> β -> Option α -> β
axiom ocase_def {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) (d : β) (x : Option α) : ocase f d x = (match x with | (Option.none : Option α) => d | Option.some x1 => f x1)
noncomputable def omap {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) (x : Option α) := match x with | (Option.none : Option α) => (Option.none : Option β) | Option.some x1 => Option.some (f x1)
noncomputable def olift {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) := ocase (Func.compose some f) (Option.none : Option β)
theorem olift_composition'vc {γ : Type} {α : Type} {β : Type} [Inhabited γ] [Inhabited α] [Inhabited β] (g : β -> γ) (f : α -> β) : Func.compose ((olift : (β -> γ) -> Option β -> Option γ) g) ((olift : (α -> β) -> Option α -> Option β) f) = (olift : (α -> γ) -> Option α -> Option γ) (Func.compose g f)
  := sorry
end OptionFuncs_Funcs_olift_compositionqtvc
