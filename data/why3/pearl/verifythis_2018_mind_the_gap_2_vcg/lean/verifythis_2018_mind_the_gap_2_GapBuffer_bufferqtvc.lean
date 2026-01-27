import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2018_mind_the_gap_2_GapBuffer_bufferqtvc
axiom char : Type
axiom inhabited_axiom_char : Inhabited char
attribute [instance] inhabited_axiom_char
axiom dummy_char : char
theorem buffer'vc : (0 : ℤ) ≤ (1 : ℤ) ∧ (∀(o1 : List char), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (1 : ℤ) → o1[Int.toNat i]! = dummy_char) ∧ Int.ofNat (List.length o1) = (1 : ℤ) → (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ Int.ofNat (List.length o1))
  := sorry
end verifythis_2018_mind_the_gap_2_GapBuffer_bufferqtvc
