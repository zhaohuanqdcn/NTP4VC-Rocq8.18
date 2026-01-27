import Why3.Base
open Classical
open Lean4Why3
namespace split_string_SplitString_concatqtvc
axiom char : Type
axiom inhabited_axiom_char : Inhabited char
attribute [instance] inhabited_axiom_char
axiom string' : Type
axiom inhabited_axiom_string' : Inhabited string'
attribute [instance] inhabited_axiom_string'
theorem concat'vc (ss : List (List char)) (sep : char) (fact0 : (1 : ℤ) ≤ Int.ofNat (List.length ss)) (fact1 : ¬Int.ofNat (List.length ss) = (1 : ℤ)) : let o1 : List char := ss[Int.toNat (Int.ofNat (List.length ss) - (1 : ℤ))]!; let o2 : List char := List.cons sep o1; Int.ofNat (List.length o2) = (1 : ℤ) + Int.ofNat (List.length o1) ∧ o2[(0 : ℕ)]! = sep ∧ (∀(i : ℤ), (0 : ℤ) < i ∧ i ≤ Int.ofNat (List.length o1) → o2[Int.toNat i]! = o1[Int.toNat (i - (1 : ℤ))]!) → (let o3 : ℤ := Int.ofNat (List.length ss) - (1 : ℤ); ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ o3 ∧ o3 ≤ Int.ofNat (List.length ss)) ∧ (let o4 : List (List char) := List.drop (0 : ℕ) (List.take (Int.toNat o3 - (0 : ℕ)) ss); Int.ofNat (List.length o4) = o3 - (0 : ℤ) ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < o3 - (0 : ℤ) → o4[Int.toNat k]! = ss[Int.toNat ((0 : ℤ) + k)]!) → ((0 : ℤ) ≤ Int.ofNat (List.length ss) ∧ List.length o4 < List.length ss) ∧ (1 : ℤ) ≤ Int.ofNat (List.length o4)))
  := sorry
end split_string_SplitString_concatqtvc
