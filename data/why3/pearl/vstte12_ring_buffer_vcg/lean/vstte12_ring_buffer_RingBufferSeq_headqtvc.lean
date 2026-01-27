import Why3.Base
open Classical
open Lean4Why3
namespace vstte12_ring_buffer_RingBufferSeq_headqtvc
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
theorem head'vc {α : Type} [Inhabited α] (b : buffer α) (fact0 : (0 : ℤ) < len b) : let o1 : ℤ := first b; let o2 : List α := data b; ((0 : ℤ) ≤ o1 ∧ o1 < Int.ofNat (List.length o2)) ∧ o2[Int.toNat o1]! = (sequence b)[(0 : ℕ)]!
  := sorry
end vstte12_ring_buffer_RingBufferSeq_headqtvc
