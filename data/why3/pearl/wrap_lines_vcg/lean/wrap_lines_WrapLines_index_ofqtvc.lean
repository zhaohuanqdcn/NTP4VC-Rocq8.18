import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace wrap_lines_WrapLines_index_ofqtvc
axiom char : Type
axiom inhabited_axiom_char : Inhabited char
attribute [instance] inhabited_axiom_char
axiom space : char
axiom newline : char
theorem index_of'vc (from1 : ℤ) (s : List char) (c : char) (fact0 : (0 : ℤ) ≤ from1) (fact1 : from1 ≤ Int.ofNat (List.length s)) : from1 ≤ from1 ∧ from1 ≤ Int.ofNat (List.length s) ∧ (∀(i : ℤ), from1 ≤ i ∧ i < from1 → ¬s[Int.toNat i]! = c) ∧ (∀(k : ℤ), (from1 ≤ k ∧ k ≤ Int.ofNat (List.length s)) ∧ (∀(i : ℤ), from1 ≤ i ∧ i < k → ¬s[Int.toNat i]! = c) → (if k < Int.ofNat (List.length s) then ((0 : ℤ) ≤ k ∧ k < Int.ofNat (List.length s)) ∧ (if s[Int.toNat k]! = c then k = -(1 : ℤ) ∧ (∀(i : ℤ), from1 ≤ i ∧ i < Int.ofNat (List.length s) → ¬s[Int.toNat i]! = c) ∨ (from1 ≤ k ∧ k < Int.ofNat (List.length s)) ∧ s[Int.toNat k]! = c ∧ (∀(i : ℤ), from1 ≤ i ∧ i < k → ¬s[Int.toNat i]! = c) else ((0 : ℤ) ≤ Int.ofNat (List.length s) - k ∧ Int.ofNat (List.length s) - (k + (1 : ℤ)) < Int.ofNat (List.length s) - k) ∧ (from1 ≤ k + (1 : ℤ) ∧ k + (1 : ℤ) ≤ Int.ofNat (List.length s)) ∧ (∀(i : ℤ), from1 ≤ i ∧ i < k + (1 : ℤ) → ¬s[Int.toNat i]! = c)) else (∀(i : ℤ), from1 ≤ i ∧ i < Int.ofNat (List.length s) → ¬s[Int.toNat i]! = c) ∨ (from1 ≤ -(1 : ℤ) ∧ -(1 : ℤ) < Int.ofNat (List.length s)) ∧ s[Int.toNat (-(1 : ℤ))]! = c ∧ (∀(i : ℤ), from1 ≤ i ∧ i < -(1 : ℤ) → ¬s[Int.toNat i]! = c)))
  := sorry
end wrap_lines_WrapLines_index_ofqtvc
