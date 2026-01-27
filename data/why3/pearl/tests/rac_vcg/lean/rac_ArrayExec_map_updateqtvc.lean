import Why3.Base
open Classical
open Lean4Why3
namespace rac_ArrayExec_map_updateqtvc
structure array (α : Type) where
  length : ℤ
  elts : ℤ -> α
axiom inhabited_axiom_array {α : Type} [Inhabited α] : Inhabited (array α)
attribute [instance] inhabited_axiom_array
theorem map_update'vc : True
  := sorry
end rac_ArrayExec_map_updateqtvc
