import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2018_mind_the_gap_1_Top_leftqtvc
axiom char : Type
axiom inhabited_axiom_char : Inhabited char
attribute [instance] inhabited_axiom_char
axiom any_char : char
axiom gap_buffer : Type
axiom inhabited_axiom_gap_buffer : Inhabited gap_buffer
attribute [instance] inhabited_axiom_gap_buffer
axiom a : gap_buffer -> List char
axiom l : gap_buffer -> ℤ
axiom r : gap_buffer -> ℤ
axiom content : gap_buffer -> List char
axiom gap_buffer'invariant (self : gap_buffer) : (0 : ℤ) ≤ l self ∧ l self ≤ r self ∧ r self ≤ Int.ofNat (List.length (a self)) ∧ Int.ofNat (List.length (a self)) = Int.ofNat (List.length (content self)) + r self - l self ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < l self → (content self)[Int.toNat i]! = (getElem! (a self) ∘ Int.toNat) i) ∧ (∀(i : ℤ), l self ≤ i ∧ i < Int.ofNat (List.length (content self)) → (content self)[Int.toNat i]! = (getElem! (a self) ∘ Int.toNat) (i + r self - l self))
noncomputable def gap_buffer'eq (a1 : gap_buffer) (b : gap_buffer) := a a1 = a b ∧ l a1 = l b ∧ r a1 = r b ∧ content a1 = content b
axiom gap_buffer'inj (a1 : gap_buffer) (b : gap_buffer) (fact0 : gap_buffer'eq a1 b) : a1 = b
theorem left'vc (g : gap_buffer) : if ¬l g = (0 : ℤ) then ((0 : ℤ) ≤ l g - (1 : ℤ) ∧ l g - (1 : ℤ) < Int.ofNat (List.length (a g))) ∧ (let o1 : char := (a g)[Int.toNat (l g - (1 : ℤ))]!; ((0 : ℤ) ≤ r g - (1 : ℤ) ∧ r g - (1 : ℤ) < Int.ofNat (List.length (a g))) ∧ (∀(g1 : gap_buffer), List.length (List.set (a g) (Int.toNat (r g - (1 : ℤ))) o1) = List.length (a g) → List.length (List.set (a g) (Int.toNat (r g - (1 : ℤ))) o1) = List.length (a g) → getElem! (List.set (a g) (Int.toNat (r g - (1 : ℤ))) o1) ∘ Int.toNat = Function.update (getElem! (a g) ∘ Int.toNat) (r g - (1 : ℤ)) o1 → (((0 : ℤ) ≤ l g - (1 : ℤ) ∧ l g - (1 : ℤ) ≤ r g - (1 : ℤ) ∧ r g - (1 : ℤ) ≤ Int.ofNat (List.length (List.set (a g) (Int.toNat (r g - (1 : ℤ))) o1))) ∧ Int.ofNat (List.length (List.set (a g) (Int.toNat (r g - (1 : ℤ))) o1)) = Int.ofNat (List.length (content g)) + (r g - (1 : ℤ)) - (l g - (1 : ℤ)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < l g - (1 : ℤ) → (content g)[Int.toNat i]! = (getElem! (List.set (a g) (Int.toNat (r g - (1 : ℤ))) o1) ∘ Int.toNat) i) ∧ (∀(i : ℤ), l g - (1 : ℤ) ≤ i ∧ i < Int.ofNat (List.length (content g)) → (content g)[Int.toNat i]! = (getElem! (List.set (a g) (Int.toNat (r g - (1 : ℤ))) o1) ∘ Int.toNat) (i + (r g - (1 : ℤ)) - (l g - (1 : ℤ))))) ∧ (content g = content g1 ∧ r g - (1 : ℤ) = r g1 ∧ l g - (1 : ℤ) = l g1 ∧ List.set (a g) (Int.toNat (r g - (1 : ℤ))) o1 = a g1 → l g1 = (if l g = (0 : ℤ) then l g else l g - (1 : ℤ)) ∧ content g1 = content g))) else l g = (if l g = (0 : ℤ) then l g else l g - (1 : ℤ))
  := sorry
end verifythis_2018_mind_the_gap_1_Top_leftqtvc
