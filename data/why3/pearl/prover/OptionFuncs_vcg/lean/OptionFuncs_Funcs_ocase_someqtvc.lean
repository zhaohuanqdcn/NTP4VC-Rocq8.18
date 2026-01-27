import Why3.Base
import pearl.prover.lib.lean.Functions.Config
import pearl.prover.lib.lean.Functions.Func
open Classical
open Lean4Why3
namespace OptionFuncs_Funcs_ocase_someqtvc
axiom some :  {α : Type} -> [Inhabited α] -> α -> Option α
axiom some_def {α : Type} [Inhabited α] (x : α) : some x = Option.some x
axiom ocase :  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> (α -> β) -> β -> Option α -> β
axiom ocase_def {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) (d : β) (x : Option α) : ocase f d x = (match x with | (Option.none : Option α) => d | Option.some x1 => f x1)
theorem ocase_some'vc {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) (d : β) (x : α) : ocase f d (Option.some x) = f x
  := sorry
end OptionFuncs_Funcs_ocase_someqtvc
