import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2018_mind_the_gap_2_GapBuffer_growqtvc
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
theorem grow'vc (b : buffer) : let o1 : ℤ := Int.ofNat (List.length (data b)) + (42 : ℤ); (0 : ℤ) ≤ o1 ∧ (∀(ndata : List char), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < o1 → ndata[Int.toNat i]! = dummy_char) ∧ Int.ofNat (List.length ndata) = o1 → (let o2 : ℤ := l b; let o3 : List char := data b; (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ o2 ∧ (0 : ℤ) + o2 ≤ Int.ofNat (List.length o3)) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) + o2 ≤ Int.ofNat (List.length ndata)) ∧ (∀(ndata1 : List char), List.length ndata1 = List.length ndata → (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) ∨ (0 : ℤ) + o2 ≤ i ∧ i < Int.ofNat (List.length ndata1) → ndata1[Int.toNat i]! = ndata[Int.toNat i]!) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) + o2 → ndata1[Int.toNat i]! = o3[Int.toNat ((0 : ℤ) + i - (0 : ℤ))]!) → (let o4 : ℤ := Int.ofNat (List.length (data b)) - r b; let o5 : ℤ := r b + (42 : ℤ); let o6 : ℤ := r b; let o7 : List char := data b; (((0 : ℤ) ≤ o6 ∧ (0 : ℤ) ≤ o4 ∧ o6 + o4 ≤ Int.ofNat (List.length o7)) ∧ (0 : ℤ) ≤ o5 ∧ o5 + o4 ≤ Int.ofNat (List.length ndata1)) ∧ (∀(ndata2 : List char), List.length ndata2 = List.length ndata1 → (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < o5 ∨ o5 + o4 ≤ i ∧ i < Int.ofNat (List.length ndata2) → ndata2[Int.toNat i]! = ndata1[Int.toNat i]!) ∧ (∀(i : ℤ), o5 ≤ i ∧ i < o5 + o4 → ndata2[Int.toNat i]! = o7[Int.toNat (o6 + i - o5)]!) → (∀(b1 : buffer), ((0 : ℤ) ≤ l b ∧ l b ≤ r b + (42 : ℤ) ∧ r b + (42 : ℤ) ≤ Int.ofNat (List.length ndata2)) ∧ (r b + (42 : ℤ) = r b1 ∧ l b = l b1 ∧ ndata2 = data b1 → l b1 = l b ∧ r b1 = r b + (42 : ℤ) ∧ same_contents b1 b)))))))
  := sorry
end verifythis_2018_mind_the_gap_2_GapBuffer_growqtvc
