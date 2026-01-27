import Why3.Base
import Why3.int.NumOf
import Why3.map.Const
import pearl.my_bag_vcg.lean.my_bag.Bag
import pearl.my_bag_vcg.lean.my_bag.ResizableArraySpec
open Classical
open Lean4Why3
namespace my_bag_BagImpl_createqtvc
axiom fc :  {α : Type} -> [Inhabited α] -> ResizableArraySpec.rarray α -> α -> ℤ -> Bool
axiom fc'def {α : Type} [Inhabited α] (r : ResizableArraySpec.rarray α) (x : α) (i : ℤ) : (fc r x i = true) = (ResizableArraySpec.data r i = x)
noncomputable def numof {α : Type} [Inhabited α] (r : ResizableArraySpec.rarray α) (x : α) (l : ℤ) (u : ℤ) := NumOf.numof (fc r x) l u
axiom t : Type -> Type
axiom inhabited_axiom_t {α : Type} [Inhabited α] : Inhabited (t α)
attribute [instance] inhabited_axiom_t
axiom size :  {α : Type} -> [Inhabited α] -> t α -> ℤ
axiom data :  {α : Type} -> [Inhabited α] -> t α -> ResizableArraySpec.rarray α
axiom contents :  {α : Type} -> [Inhabited α] -> t α -> α -> ℤ
axiom t'invariant {α : Type} [Inhabited α] (self : t α) : (0 : ℤ) ≤ size self ∧ size self = ResizableArraySpec.len (data self) ∧ (∀(x : α), contents self x = numof (data self) x (0 : ℤ) (size self))
noncomputable def t'eq {α : Type} [Inhabited α] (a : t α) (b : t α) := size a = size b ∧ data a = data b ∧ contents a = contents b
axiom t'inj {α : Type} [Inhabited α] (a : t α) (b : t α) (fact0 : t'eq a b) : a = b
axiom fc1 :  {α : Type} -> [Inhabited α] -> α -> ℤ
axiom fc2 :  {α : Type} -> [Inhabited α] -> α -> ℤ
axiom fc'def1 {α : Type} [Inhabited α] (y0 : α) : fc1 y0 = (0 : ℤ)
axiom fc'def2 {α : Type} [Inhabited α] (y0 : α) : fc2 y0 = (0 : ℤ)
theorem create'vc {α : Type} [Inhabited α] (dummy : α) : let o1 : α -> ℤ := fc1; (0 : ℤ) ≤ (0 : ℤ) ∧ (∀(o2 : ResizableArraySpec.rarray α), ResizableArraySpec.len o2 = (0 : ℤ) ∧ ResizableArraySpec.data o2 = Const.const dummy → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) = ResizableArraySpec.len o2) ∧ (∀(x : α), o1 x = numof o2 x (0 : ℤ) (0 : ℤ))) ∧ (∀(result : t α), size result = (0 : ℤ) ∧ data result = o2 ∧ contents result = o1 → size result = (0 : ℤ) ∧ Bag.infix_eqeq (contents result) fc2))
  := sorry
end my_bag_BagImpl_createqtvc
