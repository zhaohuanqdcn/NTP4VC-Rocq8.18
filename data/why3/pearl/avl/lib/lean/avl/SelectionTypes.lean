import Why3.Base
open Classical
open Lean4Why3
namespace SelectionTypes
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
noncomputable def rebuild {α : Type} [Inhabited α] (p : split α) := (split.left1 p ++ option_to_seq (split.middle p)) ++ split.right1 p
noncomputable def left_extend {α : Type} [Inhabited α] (l : List α) (d : α) (e : split α) := split.mk (l ++ List.cons d (split.left1 e)) (split.middle e) (split.right1 e)
noncomputable def right_extend {α : Type} [Inhabited α] (e : split α) (d : α) (r : List α) := split.mk (split.left1 e) (split.middle e) (split.right1 e ++ List.cons d r)
end SelectionTypes
