import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2018_mind_the_gap_1_Top_growqtvc
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
theorem grow'vc (k : ℤ) (g : gap_buffer) (fact0 : (0 : ℤ) < k) : let o1 : ℤ := Int.ofNat (List.length (a g)) + k; (0 : ℤ) ≤ o1 ∧ (∀(b : List char), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < o1 → b[Int.toNat i]! = any_char) ∧ Int.ofNat (List.length b) = o1 → (let o2 : ℤ := l g; let o3 : List char := a g; (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ o2 ∧ (0 : ℤ) + o2 ≤ Int.ofNat (List.length o3)) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) + o2 ≤ Int.ofNat (List.length b)) ∧ (∀(b1 : List char), List.length b1 = List.length b → (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) ∨ (0 : ℤ) + o2 ≤ i ∧ i < Int.ofNat (List.length b1) → b1[Int.toNat i]! = b[Int.toNat i]!) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) + o2 → b1[Int.toNat i]! = o3[Int.toNat ((0 : ℤ) + i - (0 : ℤ))]!) → (let o4 : ℤ := Int.ofNat (List.length (a g)) - r g; let o5 : ℤ := r g + k; let o6 : ℤ := r g; let o7 : List char := a g; (((0 : ℤ) ≤ o6 ∧ (0 : ℤ) ≤ o4 ∧ o6 + o4 ≤ Int.ofNat (List.length o7)) ∧ (0 : ℤ) ≤ o5 ∧ o5 + o4 ≤ Int.ofNat (List.length b1)) ∧ (∀(b2 : List char), List.length b2 = List.length b1 → (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < o5 ∨ o5 + o4 ≤ i ∧ i < Int.ofNat (List.length b2) → b2[Int.toNat i]! = b1[Int.toNat i]!) ∧ (∀(i : ℤ), o5 ≤ i ∧ i < o5 + o4 → b2[Int.toNat i]! = o7[Int.toNat (o6 + i - o5)]!) → (∀(g1 : gap_buffer), (((0 : ℤ) ≤ l g ∧ l g ≤ r g + k ∧ r g + k ≤ Int.ofNat (List.length b2)) ∧ Int.ofNat (List.length b2) = Int.ofNat (List.length (content g)) + (r g + k) - l g ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < l g → (content g)[Int.toNat i]! = (getElem! b2 ∘ Int.toNat) i) ∧ (∀(i : ℤ), l g ≤ i ∧ i < Int.ofNat (List.length (content g)) → (content g)[Int.toNat i]! = (getElem! b2 ∘ Int.toNat) (i + (r g + k) - l g))) ∧ (content g = content g1 ∧ r g + k = r g1 ∧ l g = l g1 ∧ b2 = a g1 → (l g1 = l g ∧ content g1 = content g) ∧ l g1 < r g1)))))))
  := sorry
end verifythis_2018_mind_the_gap_1_Top_growqtvc
