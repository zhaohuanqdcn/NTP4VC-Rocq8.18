import Why3.Base
open Classical
open Lean4Why3
namespace vstte12_ring_buffer_RingBuffer_bufferqtvc
theorem buffer'vc {α : Type} [Inhabited α] (o2 : α) : (0 : ℤ) ≤ (1 : ℤ) ∧ (∀(o1 : List α), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (1 : ℤ) → o1[Int.toNat i]! = o2) ∧ Int.ofNat (List.length o1) = (1 : ℤ) → (let sequence : List α := ([] : List α); let size : ℤ := Int.ofNat (List.length o1); ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < size) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ size) ∧ (0 : ℤ) = Int.ofNat (List.length sequence) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) → ((0 : ℤ) + i < size → getElem_i? sequence i = Option.some (o1[Int.toNat ((0 : ℤ) + i)]!)) ∧ ((0 : ℤ) ≤ (0 : ℤ) + i - size → getElem_i? sequence i = Option.some (o1[Int.toNat ((0 : ℤ) + i - size)]!)))))
  := sorry
end vstte12_ring_buffer_RingBuffer_bufferqtvc
