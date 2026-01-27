import Why3.Base
open Classical
open Lean4Why3
namespace vstte12_ring_buffer_RingBufferSeq_pushqtvc
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
theorem push'vc {α : Type} [Inhabited α] (b : buffer α) (x : α) (fact0 : len b < size b) : let o1 : List α := sequence b; let o2 : List α := o1 ++ [x]; Int.ofNat (List.length o2) = (1 : ℤ) + Int.ofNat (List.length o1) ∧ o2[List.length o1]! = x ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length o1) → o2[Int.toNat i]! = o1[Int.toNat i]!) → (let i : ℤ := first b + len b; let n : ℤ := Int.ofNat (List.length (data b)); ∀(o3 : ℤ), (if n ≤ i then o3 = i - n else o3 = i) → ((0 : ℤ) ≤ o3 ∧ o3 < Int.ofNat (List.length (data b))) ∧ (List.length (List.set (data b) (Int.toNat o3) x) = List.length (data b) → List.length (List.set (data b) (Int.toNat o3) x) = List.length (data b) → getElem! (List.set (data b) (Int.toNat o3) x) ∘ Int.toNat = Function.update (getElem! (data b) ∘ Int.toNat) o3 x → (∀(b1 : buffer α), (let size1 : ℤ := Int.ofNat (List.length (List.set (data b) (Int.toNat o3) x)); ((0 : ℤ) ≤ first b ∧ first b < size1) ∧ ((0 : ℤ) ≤ len b + (1 : ℤ) ∧ len b + (1 : ℤ) ≤ size1) ∧ len b + (1 : ℤ) = Int.ofNat (List.length o2) ∧ (∀(i1 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < len b + (1 : ℤ) → (first b + i1 < size1 → o2[Int.toNat i1]! = (List.set (data b) (Int.toNat o3) x)[Int.toNat (first b + i1)]!) ∧ ((0 : ℤ) ≤ first b + i1 - size1 → o2[Int.toNat i1]! = (List.set (data b) (Int.toNat o3) x)[Int.toNat (first b + i1 - size1)]!))) ∧ (o2 = sequence b1 ∧ List.set (data b) (Int.toNat o3) x = data b1 ∧ len b + (1 : ℤ) = len b1 ∧ first b = first b1 → len b1 = len b + (1 : ℤ) ∧ sequence b1 = sequence b ++ [x]))))
  := sorry
end vstte12_ring_buffer_RingBufferSeq_pushqtvc
