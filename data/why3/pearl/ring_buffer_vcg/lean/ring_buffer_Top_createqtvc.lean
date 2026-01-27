import Why3.Base
open Classical
open Lean4Why3
namespace ring_buffer_Top_createqtvc
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
theorem create'vc {α : Type} [Inhabited α] (x : α) : let o1 : List α := ([] : List α); (0 : ℤ) ≤ (10 : ℤ) ∧ (∀(o2 : List α), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (10 : ℤ) → o2[Int.toNat i]! = x) ∧ Int.ofNat (List.length o2) = (10 : ℤ) → ((0 : ℤ) < Int.ofNat (List.length o2) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ Int.ofNat (List.length o2)) ∧ Int.ofNat (List.length o1) = (0 : ℤ) - (0 : ℤ) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) - (0 : ℤ) → o1[Int.toNat i]! = o2[Int.toNat ((0 : ℤ) + i)]!)) ∧ (∀(result : t α), data result = o2 ∧ m result = (0 : ℤ) ∧ n result = (0 : ℤ) ∧ contents result = o1 → contents result = ([] : List α)))
  := sorry
end ring_buffer_Top_createqtvc
