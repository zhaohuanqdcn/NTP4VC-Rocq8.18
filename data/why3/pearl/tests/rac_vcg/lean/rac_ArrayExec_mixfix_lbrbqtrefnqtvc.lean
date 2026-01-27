import Why3.Base
open Classical
open Lean4Why3
namespace rac_ArrayExec_mixfix_lbrbqtrefnqtvc
structure array (α : Type) where
  length : ℤ
  elts : ℤ -> α
axiom inhabited_axiom_array {α : Type} [Inhabited α] : Inhabited (array α)
attribute [instance] inhabited_axiom_array
axiom map_update :  {α : Type} -> [Inhabited α] -> (ℤ -> α) -> ℤ -> α -> ℤ -> α
axiom map_update'def {α : Type} [Inhabited α] (f : ℤ -> α) (i : ℤ) (x : α) (j : ℤ) : map_update f i x j = (if j = i then x else f j)
noncomputable def mixfix_lbrb' {α : Type} [Inhabited α] (a : array α) (i : ℤ) := array.elts a i
noncomputable def mixfix_lbrb {α : Type} [Inhabited α] (a : array α) (i : ℤ) := array.elts a i
theorem mixfix_lbrb'refn'vc {α : Type} [Inhabited α] (i : ℤ) (a : array α) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < array.length a) : array.elts a i = mixfix_lbrb a i
  := sorry
end rac_ArrayExec_mixfix_lbrbqtrefnqtvc
