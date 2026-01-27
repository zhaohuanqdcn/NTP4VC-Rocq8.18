import Why3.Base
open Classical
open Lean4Why3
namespace ring_buffer_Top_dequeueqtvc
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
theorem dequeue'vc {α : Type} [Inhabited α] (q : t α) (fact0 : (0 : ℤ) < Int.ofNat (List.length (contents q))) : let o1 : ℤ := m q; ((0 : ℤ) ≤ o1 ∧ o1 < Int.ofNat (List.length (data q))) ∧ ((0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) ≤ Int.ofNat (List.length (contents q))) ∧ (∀(q1 : t α), ((0 : ℤ) < Int.ofNat (List.length (data q)) ∧ ((0 : ℤ) ≤ m q + (1 : ℤ) ∧ m q + (1 : ℤ) ≤ n q ∧ n q ≤ Int.ofNat (List.length (data q))) ∧ Int.ofNat (List.length (List.drop (1 : ℕ) (contents q))) = n q - (m q + (1 : ℤ)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < m q + (1 : ℤ) - n q → (List.drop (1 : ℕ) (contents q))[Int.toNat i]! = (data q)[Int.toNat (m q + (1 : ℤ) + i)]!)) ∧ (List.drop (1 : ℕ) (contents q) = contents q1 ∧ n q = n q1 ∧ m q + (1 : ℤ) = m q1 ∧ data q = data q1 → contents q1 = List.drop (1 : ℕ) (contents q)))
  := sorry
end ring_buffer_Top_dequeueqtvc
