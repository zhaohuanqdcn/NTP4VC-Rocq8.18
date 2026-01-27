import Why3.Base
open Classical
open Lean4Why3
namespace vstte12_ring_buffer_RingBuffer_createqtvc
axiom buffer : Type -> Type
axiom inhabited_axiom_buffer {α : Type} [Inhabited α] : Inhabited (buffer α)
attribute [instance] inhabited_axiom_buffer
axiom first :  {α : Type} -> [Inhabited α] -> buffer α -> ℤ
axiom len :  {α : Type} -> [Inhabited α] -> buffer α -> ℤ
axiom data :  {α : Type} -> [Inhabited α] -> buffer α -> List α
axiom sequence :  {α : Type} -> [Inhabited α] -> buffer α -> List α
axiom buffer'invariant {α : Type} [Inhabited α] (self : buffer α) : ((0 : ℤ) ≤ first self ∧ first self < Int.ofNat (List.length (data self))) ∧ ((0 : ℤ) ≤ len self ∧ len self ≤ Int.ofNat (List.length (data self))) ∧ len self = Int.ofNat (List.length (sequence self)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < len self → (first self + i < Int.ofNat (List.length (data self)) → getElem_i? (sequence self) i = Option.some ((data self)[Int.toNat (first self + i)]!)) ∧ ((0 : ℤ) ≤ first self + i - Int.ofNat (List.length (data self)) → getElem_i? (sequence self) i = Option.some ((data self)[Int.toNat (first self + i - Int.ofNat (List.length (data self)))]!)))
noncomputable def buffer'eq {α : Type} [Inhabited α] (a : buffer α) (b : buffer α) := first a = first b ∧ len a = len b ∧ data a = data b ∧ sequence a = sequence b
axiom buffer'inj {α : Type} [Inhabited α] (a : buffer α) (b : buffer α) (fact0 : buffer'eq a b) : a = b
noncomputable def size {α : Type} [Inhabited α] (b : buffer α) := Int.ofNat (List.length (data b))
theorem create'vc {α : Type} [Inhabited α] (n : ℤ) (dummy : α) (fact0 : (0 : ℤ) < n) : let o1 : List α := ([] : List α); (0 : ℤ) ≤ n ∧ (∀(o2 : List α), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → o2[Int.toNat i]! = dummy) ∧ Int.ofNat (List.length o2) = n → (let size1 : ℤ := Int.ofNat (List.length o2); ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < size1) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ size1) ∧ (0 : ℤ) = Int.ofNat (List.length o1) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) → ((0 : ℤ) + i < size1 → getElem_i? o1 i = Option.some (o2[Int.toNat ((0 : ℤ) + i)]!)) ∧ ((0 : ℤ) ≤ (0 : ℤ) + i - size1 → getElem_i? o1 i = Option.some (o2[Int.toNat ((0 : ℤ) + i - size1)]!)))) ∧ (∀(result : buffer α), first result = (0 : ℤ) ∧ len result = (0 : ℤ) ∧ data result = o2 ∧ sequence result = o1 → size result = n ∧ sequence result = ([] : List α)))
  := sorry
end vstte12_ring_buffer_RingBuffer_createqtvc
