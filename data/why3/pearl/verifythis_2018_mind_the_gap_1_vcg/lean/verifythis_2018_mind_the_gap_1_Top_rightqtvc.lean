import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2018_mind_the_gap_1_Top_rightqtvc
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
theorem right'vc (g : gap_buffer) : if ¬r g = Int.ofNat (List.length (a g)) then let o1 : ℤ := r g; let o2 : List char := a g; ((0 : ℤ) ≤ o1 ∧ o1 < Int.ofNat (List.length o2)) ∧ (let o3 : char := o2[Int.toNat o1]!; let o4 : ℤ := l g; let o5 : List char := a g; ((0 : ℤ) ≤ o4 ∧ o4 < Int.ofNat (List.length o5)) ∧ (List.length (List.set o5 (Int.toNat o4) o3) = List.length o5 → List.length (List.set o5 (Int.toNat o4) o3) = List.length (a g) → getElem! (List.set o5 (Int.toNat o4) o3) ∘ Int.toNat = Function.update (getElem! o5 ∘ Int.toNat) o4 o3 → (∀(g1 : gap_buffer), (((0 : ℤ) ≤ l g + (1 : ℤ) ∧ l g + (1 : ℤ) ≤ r g + (1 : ℤ) ∧ r g + (1 : ℤ) ≤ Int.ofNat (List.length (List.set o5 (Int.toNat o4) o3))) ∧ Int.ofNat (List.length (List.set o5 (Int.toNat o4) o3)) = Int.ofNat (List.length (content g)) + (r g + (1 : ℤ)) - (l g + (1 : ℤ)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < l g + (1 : ℤ) → (content g)[Int.toNat i]! = (getElem! (List.set o5 (Int.toNat o4) o3) ∘ Int.toNat) i) ∧ (∀(i : ℤ), l g + (1 : ℤ) ≤ i ∧ i < Int.ofNat (List.length (content g)) → (content g)[Int.toNat i]! = (getElem! (List.set o5 (Int.toNat o4) o3) ∘ Int.toNat) (i + (r g + (1 : ℤ)) - (l g + (1 : ℤ))))) ∧ (content g = content g1 ∧ r g + (1 : ℤ) = r g1 ∧ l g + (1 : ℤ) = l g1 ∧ List.set o5 (Int.toNat o4) o3 = a g1 → l g1 = (if l g = Int.ofNat (List.length (content g)) then l g else l g + (1 : ℤ)) ∧ content g1 = content g)))) else l g = (if l g = Int.ofNat (List.length (content g)) then l g else l g + (1 : ℤ))
  := sorry
end verifythis_2018_mind_the_gap_1_Top_rightqtvc
