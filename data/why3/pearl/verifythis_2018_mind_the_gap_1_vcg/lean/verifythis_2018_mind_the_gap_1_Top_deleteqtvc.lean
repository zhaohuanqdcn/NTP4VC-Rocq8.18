import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2018_mind_the_gap_1_Top_deleteqtvc
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
theorem delete'vc (g : gap_buffer) : if ¬l g = (0 : ℤ) then let o1 : ℤ := l g; let o2 : List char := content g; ((0 : ℤ) ≤ o1 ∧ o1 ≤ Int.ofNat (List.length o2)) ∧ (let o3 : List char := List.drop (Int.toNat o1) o2; let o4 : ℤ := l g - (1 : ℤ); let o5 : List char := content g; ((0 : ℤ) ≤ o4 ∧ o4 ≤ Int.ofNat (List.length o5)) ∧ (let o6 : List char := List.take (Int.toNat o4) o5; let o7 : List char := o6 ++ o3; Int.ofNat (List.length o7) = Int.ofNat (List.length o6) + Int.ofNat (List.length o3) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length o6) → o7[Int.toNat i]! = o6[Int.toNat i]!) ∧ (∀(i : ℤ), Int.ofNat (List.length o6) ≤ i ∧ i < Int.ofNat (List.length o7) → o7[Int.toNat i]! = o3[Int.toNat (i - Int.ofNat (List.length o6))]!) → (∀(g1 : gap_buffer), (((0 : ℤ) ≤ l g - (1 : ℤ) ∧ l g - (1 : ℤ) ≤ r g ∧ r g ≤ Int.ofNat (List.length (a g))) ∧ Int.ofNat (List.length (a g)) = Int.ofNat (List.length o7) + r g - (l g - (1 : ℤ)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < l g - (1 : ℤ) → o7[Int.toNat i]! = (getElem! (a g) ∘ Int.toNat) i) ∧ (∀(i : ℤ), l g - (1 : ℤ) ≤ i ∧ i < Int.ofNat (List.length o7) → o7[Int.toNat i]! = (getElem! (a g) ∘ Int.toNat) (i + r g - (l g - (1 : ℤ))))) ∧ (o7 = content g1 ∧ r g = r g1 ∧ l g - (1 : ℤ) = l g1 ∧ a g = a g1 → (if l g = (0 : ℤ) then g1 = g else l g1 = l g - (1 : ℤ) ∧ content g1 = List.take (Int.toNat (l g - (1 : ℤ))) (content g) ++ List.drop (Int.toNat (l g)) (content g)))))) else ¬l g = (0 : ℤ) → l g = l g - (1 : ℤ) ∧ content g = List.take (Int.toNat (l g - (1 : ℤ))) (content g) ++ List.drop (Int.toNat (l g)) (content g)
  := sorry
end verifythis_2018_mind_the_gap_1_Top_deleteqtvc
