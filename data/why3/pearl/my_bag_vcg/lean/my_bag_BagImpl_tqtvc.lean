import Why3.Base
import Why3.int.NumOf
import Why3.map.Const
import pearl.my_bag_vcg.lean.my_bag.Bag
import pearl.my_bag_vcg.lean.my_bag.ResizableArraySpec
open Classical
open Lean4Why3
namespace my_bag_BagImpl_tqtvc
axiom fc :  {α : Type} -> [Inhabited α] -> ResizableArraySpec.rarray α -> α -> ℤ -> Bool
axiom fc'def {α : Type} [Inhabited α] (r : ResizableArraySpec.rarray α) (x : α) (i : ℤ) : (fc r x i = true) = (ResizableArraySpec.data r i = x)
noncomputable def numof {α : Type} [Inhabited α] (r : ResizableArraySpec.rarray α) (x : α) (l : ℤ) (u : ℤ) := NumOf.numof (fc r x) l u
axiom fc1 :  {α : Type} -> [Inhabited α] -> α -> ℤ
axiom fc2 :  {α : Type} -> [Inhabited α] -> α -> ℤ
axiom fc'def1 {α : Type} [Inhabited α] (y0 : α) : fc1 y0 = (0 : ℤ)
axiom fc'def2 {α : Type} [Inhabited α] (y0 : α) : fc2 y0 = (0 : ℤ)
theorem t'vc {α : Type} [Inhabited α] (o2 : α) : (0 : ℤ) ≤ (0 : ℤ) ∧ (∀(o1 : ResizableArraySpec.rarray α), ResizableArraySpec.len o1 = (0 : ℤ) ∧ ResizableArraySpec.data o1 = Const.const o2 → ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) = ResizableArraySpec.len o1) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) = ResizableArraySpec.len o1 → (∀(x : α), fc2 x = numof o1 x (0 : ℤ) (0 : ℤ))))
  := sorry
end my_bag_BagImpl_tqtvc
