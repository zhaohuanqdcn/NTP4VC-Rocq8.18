import Why3.Base
open Classical
open Lean4Why3
namespace Bag
axiom bag : Type -> Type
axiom inhabited_axiom_bag {α : Type} [Inhabited α] : Inhabited (bag α)
attribute [instance] inhabited_axiom_bag
noncomputable def infix_eqeq {α : Type} [Inhabited α] (b1 : α -> ℤ) (b2 : α -> ℤ) := ∀(x : α), b1 x = b2 x
axiom add :  {α : Type} -> [Inhabited α] -> α -> (α -> ℤ) -> α -> ℤ
axiom add'def {α : Type} [Inhabited α] (e : α) (b : α -> ℤ) (x : α) : add e b x = (if x = e then b x + (1 : ℤ) else b x)
axiom remove :  {α : Type} -> [Inhabited α] -> α -> (α -> ℤ) -> α -> ℤ
axiom remove'def {α : Type} [Inhabited α] (e : α) (b : α -> ℤ) (x : α) : remove e b x = (if x = e then b x - (1 : ℤ) else b x)
end Bag
