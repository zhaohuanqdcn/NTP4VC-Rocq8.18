import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2018_mind_the_gap_1_Top_gap_bufferqtvc
axiom char : Type
axiom inhabited_axiom_char : Inhabited char
attribute [instance] inhabited_axiom_char
axiom any_char : char
theorem gap_buffer'vc : (0 : ℤ) ≤ (0 : ℤ) ∧ (∀(o1 : List char), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) → o1[Int.toNat i]! = any_char) ∧ Int.ofNat (List.length o1) = (0 : ℤ) → (let content : List char := ([] : List char); ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ Int.ofNat (List.length o1)) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ Int.ofNat (List.length o1) → Int.ofNat (List.length o1) = Int.ofNat (List.length content) + (0 : ℤ) - (0 : ℤ) ∧ (Int.ofNat (List.length o1) = Int.ofNat (List.length content) + (0 : ℤ) - (0 : ℤ) → (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) → content[Int.toNat i]! = (getElem! o1 ∘ Int.toNat) i) ∧ ((∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) → content[Int.toNat i]! = (getElem! o1 ∘ Int.toNat) i) → (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length content) → content[Int.toNat i]! = (getElem! o1 ∘ Int.toNat) (i + (0 : ℤ) - (0 : ℤ))))))))
  := sorry
end verifythis_2018_mind_the_gap_1_Top_gap_bufferqtvc
