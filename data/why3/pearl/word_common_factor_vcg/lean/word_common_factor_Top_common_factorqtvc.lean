import Why3.Base
open Classical
open Lean4Why3
namespace word_common_factor_Top_common_factorqtvc
axiom char : Type
axiom inhabited_axiom_char : Inhabited char
attribute [instance] inhabited_axiom_char
axiom power : List char -> ℤ -> List char
axiom power'def (n : ℤ) (w : List char) (fact0 : (0 : ℤ) ≤ n) : if n = (0 : ℤ) then power w n = ([] : List char) else power w n = w ++ power w (n - (1 : ℤ))
theorem common_factor'vc (a : List char) (b : List char) (fact0 : a ++ b = b ++ a) : let o1 : ℤ := Int.ofNat (List.length a); (¬o1 = (0 : ℤ) → ¬Int.ofNat (List.length b) = (0 : ℤ) → (if List.length a ≤ List.length b then let o2 : ℤ := Int.ofNat (List.length a); ((0 : ℤ) ≤ o2 ∧ o2 ≤ Int.ofNat (List.length b)) ∧ (let c : List char := List.drop (Int.toNat o2) b; b = a ++ c ∧ (b = a ++ c → ((0 : ℤ) ≤ Int.ofNat (List.length b) ∧ List.length c < List.length b) ∧ a ++ c = c ++ a)) else ((0 : ℤ) ≤ Int.ofNat (List.length a) ∧ List.length b < List.length a ∨ List.length a = List.length b ∧ (0 : ℤ) ≤ Int.ofNat (List.length b) ∧ List.length a < List.length b) ∧ b ++ a = a ++ b)) ∧ (∀(w : List char) (ka : ℤ) (kb : ℤ), (if o1 = (0 : ℤ) then w = b ∧ ka = (0 : ℤ) ∧ kb = (1 : ℤ) else if Int.ofNat (List.length b) = (0 : ℤ) then w = a ∧ ka = (1 : ℤ) ∧ kb = (0 : ℤ) else if List.length a ≤ List.length b then let c : List char := List.drop (List.length a) b; b = a ++ c ∧ (∃(kb1 : ℤ), (((0 : ℤ) ≤ ka ∧ a = power w ka) ∧ (0 : ℤ) ≤ kb1 ∧ c = power w kb1) ∧ kb = ka + kb1) else ((0 : ℤ) ≤ kb ∧ b = power w kb) ∧ (0 : ℤ) ≤ ka ∧ a = power w ka) → ((0 : ℤ) ≤ ka ∧ a = power w ka) ∧ (0 : ℤ) ≤ kb ∧ b = power w kb)
  := sorry
end word_common_factor_Top_common_factorqtvc
