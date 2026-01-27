import Why3.Base
open Classical
open Lean4Why3
namespace rac_ArrayExec_makeqtvc
structure array (α : Type) where
  length : ℤ
  elts : ℤ -> α
axiom inhabited_axiom_array {α : Type} [Inhabited α] : Inhabited (array α)
attribute [instance] inhabited_axiom_array
axiom o1 :  {α : Type} -> [Inhabited α] -> α -> ℤ -> α
axiom o2 :  {α : Type} -> [Inhabited α] -> α -> ℤ -> α
axiom o'def {α : Type} [Inhabited α] (v : α) (x : ℤ) : o1 v x = v
axiom o'def1 {α : Type} [Inhabited α] (v : α) (x : ℤ) : o2 v x = v
theorem make'vc {α : Type} [Inhabited α] (i : ℤ) (n : ℤ) (v : α) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < n) : o2 v i = v
  := sorry
end rac_ArrayExec_makeqtvc
