import Why3.Base
open Classical
open Lean4Why3
namespace avl_SelectionTypes_rebuildqtvc
structure split (α : Type) where
  left1 : List α
  middle : Option α
  right1 : List α
axiom inhabited_axiom_split {α : Type} [Inhabited α] : Inhabited (split α)
attribute [instance] inhabited_axiom_split
inductive part_base (α : Type) where
  | Left : α -> part_base α
  | Right : α -> part_base α
  | Here : part_base α
axiom inhabited_axiom_part_base {α : Type} [Inhabited α] : Inhabited (part_base α)
attribute [instance] inhabited_axiom_part_base
noncomputable def option_to_seq {α : Type} [Inhabited α] (o1 : Option α) := match o1 with | Option.some x => [x] | (Option.none : Option α) => ([] : List α)
theorem rebuild'vc : True
  := sorry
end avl_SelectionTypes_rebuildqtvc
