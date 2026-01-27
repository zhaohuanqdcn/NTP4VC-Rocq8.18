import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2018_mind_the_gap_2_GapBuffer_insertqtvc
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
noncomputable def contents_inserted (newb : buffer) (oldb : buffer) (x : char) (pos : ℤ) := len_contents newb = len_contents oldb + (1 : ℤ) ∧ ((0 : ℤ) ≤ pos ∧ pos ≤ len_contents oldb) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < pos → contents newb i = contents oldb i) ∧ contents newb pos = x ∧ (∀(i : ℤ), pos < i ∧ i < len_contents newb → contents newb i = contents oldb (i - (1 : ℤ)))
theorem insert'vc (b : buffer) (x : char) : if l b = r b then ∀(b1 : buffer), l b = l b1 → l b1 = l b ∧ r b1 = r b + (42 : ℤ) ∧ same_contents b1 b → (let o1 : ℤ := l b1; let o2 : List char := data b1; ((0 : ℤ) ≤ o1 ∧ o1 < Int.ofNat (List.length o2)) ∧ (List.length (List.set o2 (Int.toNat o1) x) = List.length o2 → List.length (List.set o2 (Int.toNat o1) x) = List.length (data b1) → getElem! (List.set o2 (Int.toNat o1) x) ∘ Int.toNat = Function.update (getElem! o2 ∘ Int.toNat) o1 x → (∀(b2 : buffer), ((0 : ℤ) ≤ l b1 + (1 : ℤ) ∧ l b1 + (1 : ℤ) ≤ r b1 ∧ r b1 ≤ Int.ofNat (List.length (List.set o2 (Int.toNat o1) x))) ∧ (r b1 = r b2 ∧ l b1 + (1 : ℤ) = l b2 ∧ List.set o2 (Int.toNat o1) x = data b2 → l b2 = l b + (1 : ℤ) ∧ contents_inserted b2 b x (l b))))) else let o1 : ℤ := l b; let o2 : List char := data b; ((0 : ℤ) ≤ o1 ∧ o1 < Int.ofNat (List.length o2)) ∧ (List.length (List.set o2 (Int.toNat o1) x) = List.length o2 → List.length (List.set o2 (Int.toNat o1) x) = List.length (data b) → getElem! (List.set o2 (Int.toNat o1) x) ∘ Int.toNat = Function.update (getElem! o2 ∘ Int.toNat) o1 x → (∀(b1 : buffer), ((0 : ℤ) ≤ l b + (1 : ℤ) ∧ l b + (1 : ℤ) ≤ r b ∧ r b ≤ Int.ofNat (List.length (List.set o2 (Int.toNat o1) x))) ∧ (r b = r b1 ∧ l b + (1 : ℤ) = l b1 ∧ List.set o2 (Int.toNat o1) x = data b1 → l b1 = l b + (1 : ℤ) ∧ contents_inserted b1 b x (l b))))
  := sorry
end verifythis_2018_mind_the_gap_2_GapBuffer_insertqtvc
