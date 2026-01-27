import Why3.Base
open Classical
open Lean4Why3
namespace vstte12_ring_buffer_RingBufferSeq_popqtvc
axiom buffer : Type -> Type
axiom inhabited_axiom_buffer {α : Type} [Inhabited α] : Inhabited (buffer α)
attribute [instance] inhabited_axiom_buffer
axiom first :  {α : Type} -> [Inhabited α] -> buffer α -> ℤ
axiom len :  {α : Type} -> [Inhabited α] -> buffer α -> ℤ
axiom data :  {α : Type} -> [Inhabited α] -> buffer α -> List α
axiom sequence :  {α : Type} -> [Inhabited α] -> buffer α -> List α
axiom buffer'invariant {α : Type} [Inhabited α] (self : buffer α) : ((0 : ℤ) ≤ first self ∧ first self < Int.ofNat (List.length (data self))) ∧ ((0 : ℤ) ≤ len self ∧ len self ≤ Int.ofNat (List.length (data self))) ∧ len self = Int.ofNat (List.length (sequence self)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < len self → (first self + i < Int.ofNat (List.length (data self)) → (sequence self)[Int.toNat i]! = (data self)[Int.toNat (first self + i)]!) ∧ ((0 : ℤ) ≤ first self + i - Int.ofNat (List.length (data self)) → (sequence self)[Int.toNat i]! = (data self)[Int.toNat (first self + i - Int.ofNat (List.length (data self)))]!))
noncomputable def buffer'eq {α : Type} [Inhabited α] (a : buffer α) (b : buffer α) := first a = first b ∧ len a = len b ∧ data a = data b ∧ sequence a = sequence b
axiom buffer'inj {α : Type} [Inhabited α] (a : buffer α) (b : buffer α) (fact0 : buffer'eq a b) : a = b
noncomputable def size {α : Type} [Inhabited α] (b : buffer α) := Int.ofNat (List.length (data b))
theorem pop'vc {α : Type} [Inhabited α] (b : buffer α) (fact0 : (0 : ℤ) < len b) : let o1 : List α := sequence b; ((0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) ≤ Int.ofNat (List.length o1)) ∧ ((0 : ℤ) ≤ first b ∧ first b < Int.ofNat (List.length (data b))) ∧ (let r : α := (data b)[Int.toNat (first b)]!; ∀(b1 : buffer α), if first b + (1 : ℤ) = Int.ofNat (List.length (data b)) then ∀(b2 : buffer α), (let size1 : ℤ := Int.ofNat (List.length (data b)); ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < size1) ∧ ((0 : ℤ) ≤ len b - (1 : ℤ) ∧ len b - (1 : ℤ) ≤ size1) ∧ len b - (1 : ℤ) = Int.ofNat (List.length (List.drop (1 : ℕ) o1)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < len b - (1 : ℤ) → ((0 : ℤ) + i < size1 → (List.drop (1 : ℕ) o1)[Int.toNat i]! = (data b)[Int.toNat ((0 : ℤ) + i)]!) ∧ ((0 : ℤ) ≤ (0 : ℤ) + i - size1 → (List.drop (1 : ℕ) o1)[Int.toNat i]! = (data b)[Int.toNat ((0 : ℤ) + i - size1)]!))) ∧ (List.drop (1 : ℕ) o1 = sequence b2 ∧ data b = data b2 ∧ len b - (1 : ℤ) = len b2 ∧ (0 : ℤ) = first b2 → len b2 = len b - (1 : ℤ) ∧ r = (sequence b)[(0 : ℕ)]! ∧ sequence b2 = List.drop (1 : ℕ) (sequence b)) else (let size1 : ℤ := Int.ofNat (List.length (data b)); ((0 : ℤ) ≤ first b + (1 : ℤ) ∧ first b + (1 : ℤ) < size1) ∧ ((0 : ℤ) ≤ len b - (1 : ℤ) ∧ len b - (1 : ℤ) ≤ size1) ∧ len b - (1 : ℤ) = Int.ofNat (List.length (List.drop (1 : ℕ) o1)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < len b - (1 : ℤ) → (first b + (1 : ℤ) + i < size1 → (List.drop (1 : ℕ) o1)[Int.toNat i]! = (data b)[Int.toNat (first b + (1 : ℤ) + i)]!) ∧ ((0 : ℤ) ≤ first b + (1 : ℤ) + i - size1 → (List.drop (1 : ℕ) o1)[Int.toNat i]! = (data b)[Int.toNat (first b + (1 : ℤ) + i - size1)]!))) ∧ (List.drop (1 : ℕ) o1 = sequence b1 ∧ data b = data b1 ∧ len b - (1 : ℤ) = len b1 ∧ first b + (1 : ℤ) = first b1 → len b1 = len b - (1 : ℤ) ∧ r = (sequence b)[(0 : ℕ)]! ∧ sequence b1 = List.drop (1 : ℕ) (sequence b)))
  := sorry
end vstte12_ring_buffer_RingBufferSeq_popqtvc
