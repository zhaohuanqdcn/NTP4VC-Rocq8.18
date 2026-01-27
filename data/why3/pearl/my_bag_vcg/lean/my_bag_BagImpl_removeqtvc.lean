import Why3.Base
import Why3.int.NumOf
import Why3.map.Const
import pearl.my_bag_vcg.lean.my_bag.Bag
import pearl.my_bag_vcg.lean.my_bag.ResizableArraySpec
open Classical
open Lean4Why3
namespace my_bag_BagImpl_removeqtvc
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
theorem remove'vc {α : Type} [Inhabited α] (i : ℤ) (t1 : t α) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < size t1) : let n : ℤ := size t1 - (1 : ℤ); let o1 : ResizableArraySpec.rarray α := data t1; ((0 : ℤ) ≤ i ∧ i < ResizableArraySpec.len o1) ∧ (if i < n then ((0 : ℤ) ≤ n ∧ n < ResizableArraySpec.len (data t1)) ∧ ((0 : ℤ) ≤ i ∧ i < ResizableArraySpec.len (data t1)) ∧ (ResizableArraySpec.len (ResizableArraySpec.mixfix_lblsmnrb (data t1) i (ResizableArraySpec.mixfix_lbrb (data t1) n)) = ResizableArraySpec.len (data t1) → ResizableArraySpec.len (ResizableArraySpec.mixfix_lblsmnrb (data t1) i (ResizableArraySpec.mixfix_lbrb (data t1) n)) = ResizableArraySpec.len (data t1) → (0 : ℤ) ≤ n ∧ (∀(t_data : ResizableArraySpec.rarray α), ResizableArraySpec.len t_data = n ∧ (∀(i1 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < ResizableArraySpec.len (ResizableArraySpec.mixfix_lblsmnrb (data t1) i (ResizableArraySpec.mixfix_lbrb (data t1) n)) → i1 < n → ResizableArraySpec.mixfix_lbrb t_data i1 = ResizableArraySpec.mixfix_lbrb (ResizableArraySpec.mixfix_lblsmnrb (data t1) i (ResizableArraySpec.mixfix_lbrb (data t1) n)) i1) → (∀(t2 : t α), (((0 : ℤ) ≤ n ∧ n = ResizableArraySpec.len t_data) ∧ (∀(x : α), Bag.remove (ResizableArraySpec.mixfix_lbrb o1 i) (contents t1) x = numof t_data x (0 : ℤ) n)) ∧ (Bag.remove (ResizableArraySpec.mixfix_lbrb o1 i) (contents t1) = contents t2 ∧ t_data = data t2 ∧ n = size t2 → size t2 = size t1 - (1 : ℤ) ∧ Bag.infix_eqeq (contents t2) (Bag.remove (ResizableArraySpec.mixfix_lbrb (data t1) i) (contents t1)))))) else (0 : ℤ) ≤ n ∧ (∀(t_data : ResizableArraySpec.rarray α), ResizableArraySpec.len t_data = n ∧ (∀(i1 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < ResizableArraySpec.len (data t1) → i1 < n → ResizableArraySpec.mixfix_lbrb t_data i1 = ResizableArraySpec.mixfix_lbrb (data t1) i1) → (∀(t2 : t α), (((0 : ℤ) ≤ n ∧ n = ResizableArraySpec.len t_data) ∧ (∀(x : α), Bag.remove (ResizableArraySpec.mixfix_lbrb o1 i) (contents t1) x = numof t_data x (0 : ℤ) n)) ∧ (Bag.remove (ResizableArraySpec.mixfix_lbrb o1 i) (contents t1) = contents t2 ∧ t_data = data t2 ∧ n = size t2 → size t2 = size t1 - (1 : ℤ) ∧ Bag.infix_eqeq (contents t2) (Bag.remove (ResizableArraySpec.mixfix_lbrb (data t1) i) (contents t1))))))
  := sorry
end my_bag_BagImpl_removeqtvc
