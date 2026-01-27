import Why3.Base
open Classical
open Lean4Why3
namespace Cursor
axiom cursor : Type -> Type
axiom inhabited_axiom_cursor {α : Type} [Inhabited α] : Inhabited (cursor α)
attribute [instance] inhabited_axiom_cursor
axiom visited :  {α : Type} -> [Inhabited α] -> cursor α -> List α
axiom permitted :  {α : Type} -> [Inhabited α] -> cursor α -> Prop
axiom permitted_empty {α : Type} [Inhabited α] (c : cursor α) (fact0 : visited c = ([] : List α)) : permitted c
axiom complete :  {α : Type} -> [Inhabited α] -> cursor α -> Prop
end Cursor
