import Why3.Base
open Classical
open Lean4Why3
namespace my_bag_Bag_addqtvc
axiom bag : Type -> Type
axiom inhabited_axiom_bag {α : Type} [Inhabited α] : Inhabited (bag α)
attribute [instance] inhabited_axiom_bag
noncomputable def infix_eqeq {α : Type} [Inhabited α] (b1 : α -> ℤ) (b2 : α -> ℤ) := ∀(x : α), b1 x = b2 x
theorem add'vc : True
  := sorry
end my_bag_Bag_addqtvc
