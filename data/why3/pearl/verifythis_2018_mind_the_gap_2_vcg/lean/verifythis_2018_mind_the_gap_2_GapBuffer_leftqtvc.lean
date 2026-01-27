import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2018_mind_the_gap_2_GapBuffer_leftqtvc
axiom char : Type
axiom inhabited_axiom_char : Inhabited char
attribute [instance] inhabited_axiom_char
axiom dummy_char : char
axiom buffer : Type
axiom inhabited_axiom_buffer : Inhabited buffer
attribute [instance] inhabited_axiom_buffer
axiom data : buffer -> List char
axiom l : buffer -> ℤ
axiom r : buffer -> ℤ
axiom buffer'invariant (self : buffer) : (0 : ℤ) ≤ l self ∧ l self ≤ r self ∧ r self ≤ Int.ofNat (List.length (data self))
noncomputable def buffer'eq (a : buffer) (b : buffer) := data a = data b ∧ l a = l b ∧ r a = r b
axiom buffer'inj (a : buffer) (b : buffer) (fact0 : buffer'eq a b) : a = b
noncomputable def len_contents (b : buffer) := Int.ofNat (List.length (data b)) - r b + l b
axiom contents : buffer -> ℤ -> char
axiom contents'def (b : buffer) (i : ℤ) : contents b i = (if (0 : ℤ) ≤ i ∧ i < l b then (getElem! (data b) ∘ Int.toNat) i else if l b ≤ i ∧ i ≤ len_contents b then (getElem! (data b) ∘ Int.toNat) (i + r b - l b) else dummy_char)
noncomputable def same_contents (b1 : buffer) (b2 : buffer) := len_contents b1 = len_contents b2 ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < len_contents b1 → contents b1 i = contents b2 i)
theorem left'vc (b : buffer) : if ¬l b = (0 : ℤ) then ((0 : ℤ) ≤ l b - (1 : ℤ) ∧ l b - (1 : ℤ) < Int.ofNat (List.length (data b))) ∧ (let o1 : char := (data b)[Int.toNat (l b - (1 : ℤ))]!; ((0 : ℤ) ≤ r b - (1 : ℤ) ∧ r b - (1 : ℤ) < Int.ofNat (List.length (data b))) ∧ (∀(b1 : buffer), List.length (List.set (data b) (Int.toNat (r b - (1 : ℤ))) o1) = List.length (data b) → List.length (List.set (data b) (Int.toNat (r b - (1 : ℤ))) o1) = List.length (data b) → getElem! (List.set (data b) (Int.toNat (r b - (1 : ℤ))) o1) ∘ Int.toNat = Function.update (getElem! (data b) ∘ Int.toNat) (r b - (1 : ℤ)) o1 → ((0 : ℤ) ≤ l b - (1 : ℤ) ∧ l b - (1 : ℤ) ≤ r b - (1 : ℤ) ∧ r b - (1 : ℤ) ≤ Int.ofNat (List.length (List.set (data b) (Int.toNat (r b - (1 : ℤ))) o1))) ∧ (r b - (1 : ℤ) = r b1 ∧ l b - (1 : ℤ) = l b1 ∧ List.set (data b) (Int.toNat (r b - (1 : ℤ))) o1 = data b1 → (if l b = (0 : ℤ) then b1 = b else l b1 = l b - (1 : ℤ)) ∧ same_contents b1 b))) else (¬l b = (0 : ℤ) → l b = l b - (1 : ℤ)) ∧ same_contents b b
  := sorry
end verifythis_2018_mind_the_gap_2_GapBuffer_leftqtvc
