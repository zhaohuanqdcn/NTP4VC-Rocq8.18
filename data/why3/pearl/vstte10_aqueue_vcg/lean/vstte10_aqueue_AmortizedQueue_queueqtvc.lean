import Why3.Base
open Classical
open Lean4Why3
namespace vstte10_aqueue_AmortizedQueue_queueqtvc
theorem queue'vc {α : Type} [Inhabited α] : let rear : List α := ([] : List α); Int.ofNat (List.length ([] : List α)) = (0 : ℤ) ∧ Int.ofNat (List.length rear) ≤ (0 : ℤ) ∧ Int.ofNat (List.length rear) = (0 : ℤ)
  := sorry
end vstte10_aqueue_AmortizedQueue_queueqtvc
