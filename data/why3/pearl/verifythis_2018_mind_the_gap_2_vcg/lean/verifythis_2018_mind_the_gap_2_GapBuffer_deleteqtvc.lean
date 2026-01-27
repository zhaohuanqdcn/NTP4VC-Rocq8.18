import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2018_mind_the_gap_2_GapBuffer_deleteqtvc
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
noncomputable def contents_deleted (newb : buffer) (oldb : buffer) (pos : ℤ) := len_contents newb = len_contents oldb - (1 : ℤ) ∧ ((0 : ℤ) ≤ pos ∧ pos < len_contents oldb) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < pos → contents newb i = contents oldb i) ∧ (∀(i : ℤ), pos ≤ i ∧ i < len_contents newb → contents newb i = contents oldb (i + (1 : ℤ)))
theorem delete'vc (b : buffer) : if ¬l b = (0 : ℤ) then ∀(b1 : buffer), ((0 : ℤ) ≤ l b - (1 : ℤ) ∧ l b - (1 : ℤ) ≤ r b ∧ r b ≤ Int.ofNat (List.length (data b))) ∧ (r b = r b1 ∧ l b - (1 : ℤ) = l b1 ∧ data b = data b1 → (if l b = (0 : ℤ) then b1 = b else l b1 = l b - (1 : ℤ) ∧ contents_deleted b1 b (l b - (1 : ℤ)))) else ¬l b = (0 : ℤ) → l b = l b - (1 : ℤ) ∧ contents_deleted b b (l b - (1 : ℤ))
  := sorry
end verifythis_2018_mind_the_gap_2_GapBuffer_deleteqtvc
