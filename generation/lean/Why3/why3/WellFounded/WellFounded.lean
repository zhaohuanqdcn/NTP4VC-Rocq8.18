import Why3.Base
open Classical
open Lean4Why3
namespace WellFounded
inductive acc { α : Type} : (α -> α -> Bool) -> α -> Prop where
 | acc_x (r : α -> α -> Bool) (x : α) : (∀(y : α), r y x = true → acc r y) → acc r x
noncomputable def well_founded {α : Type} [Inhabited α] (r : α -> α -> Bool) := ∀(x : α), acc r x
end WellFounded
