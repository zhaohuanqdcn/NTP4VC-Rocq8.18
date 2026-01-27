import Why3.Base
open Classical
open Lean4Why3
namespace ring_buffer_Top_enqueueqtvc
axiom t : Type -> Type
axiom inhabited_axiom_t {α : Type} [Inhabited α] : Inhabited (t α)
attribute [instance] inhabited_axiom_t
axiom data :  {α : Type} -> [Inhabited α] -> t α -> List α
axiom m :  {α : Type} -> [Inhabited α] -> t α -> ℤ
axiom n :  {α : Type} -> [Inhabited α] -> t α -> ℤ
axiom contents :  {α : Type} -> [Inhabited α] -> t α -> List α
axiom t'invariant {α : Type} [Inhabited α] (self : t α) : (0 : ℤ) < Int.ofNat (List.length (data self)) ∧ (0 : ℤ) ≤ m self ∧ m self ≤ n self ∧ n self ≤ Int.ofNat (List.length (data self)) ∧ Int.ofNat (List.length (contents self)) = n self - m self ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < m self - n self → (contents self)[Int.toNat i]! = (data self)[Int.toNat (m self + i)]!)
noncomputable def t'eq {α : Type} [Inhabited α] (a : t α) (b : t α) := data a = data b ∧ m a = m b ∧ n a = n b ∧ contents a = contents b
axiom t'inj {α : Type} [Inhabited α] (a : t α) (b : t α) (fact0 : t'eq a b) : a = b
theorem enqueue'vc {α : Type} [Inhabited α] (q : t α) (x : α) (fact0 : n q < Int.ofNat (List.length (data q))) : let o1 : ℤ := n q; let o2 : List α := data q; ((0 : ℤ) ≤ o1 ∧ o1 < Int.ofNat (List.length o2)) ∧ (List.length (List.set o2 (Int.toNat o1) x) = List.length o2 → List.length (List.set o2 (Int.toNat o1) x) = List.length (data q) → getElem! (List.set o2 (Int.toNat o1) x) ∘ Int.toNat = Function.update (getElem! o2 ∘ Int.toNat) o1 x → (let o3 : List α := contents q ++ [x]; Int.ofNat (List.length o3) = (1 : ℤ) + Int.ofNat (List.length (contents q)) ∧ o3[List.length (contents q)]! = x ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length (contents q)) → o3[Int.toNat i]! = (contents q)[Int.toNat i]!) → (∀(q1 : t α), ((0 : ℤ) < Int.ofNat (List.length (List.set o2 (Int.toNat o1) x)) ∧ ((0 : ℤ) ≤ m q ∧ m q ≤ n q + (1 : ℤ) ∧ n q + (1 : ℤ) ≤ Int.ofNat (List.length (List.set o2 (Int.toNat o1) x))) ∧ Int.ofNat (List.length o3) = n q + (1 : ℤ) - m q ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < m q - (n q + (1 : ℤ)) → o3[Int.toNat i]! = (List.set o2 (Int.toNat o1) x)[Int.toNat (m q + i)]!)) ∧ (o3 = contents q1 ∧ n q + (1 : ℤ) = n q1 ∧ m q = m q1 ∧ List.set o2 (Int.toNat o1) x = data q1 → contents q1 = contents q ++ [x]))))
  := sorry
end ring_buffer_Top_enqueueqtvc
