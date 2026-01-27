import Why3.Base
open Classical
open Lean4Why3
namespace rac_ArrayExec_arrayqtrefnqtvc
structure array (α : Type) where
  length : ℤ
  elts : ℤ -> α
axiom inhabited_axiom_array {α : Type} [Inhabited α] : Inhabited (array α)
attribute [instance] inhabited_axiom_array
axiom map_update :  {α : Type} -> [Inhabited α] -> (ℤ -> α) -> ℤ -> α -> ℤ -> α
axiom map_update'def {α : Type} [Inhabited α] (f : ℤ -> α) (i : ℤ) (x : α) (j : ℤ) : map_update f i x j = (if j = i then x else f j)
noncomputable def mixfix_lbrb' {α : Type} [Inhabited α] (a : array α) (i : ℤ) := array.elts a i
theorem array'refn'vc {α : Type} [Inhabited α] (self : array α) : (0 : ℤ) ≤ array.length self
  := sorry
end rac_ArrayExec_arrayqtrefnqtvc
