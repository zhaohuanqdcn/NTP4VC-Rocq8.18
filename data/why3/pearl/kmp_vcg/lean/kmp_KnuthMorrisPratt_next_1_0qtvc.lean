import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace kmp_KnuthMorrisPratt_next_1_0qtvc
axiom char : Type
axiom inhabited_axiom_char : Inhabited char
attribute [instance] inhabited_axiom_char
noncomputable def matches1 (a1 : List char) (i1 : ℤ) (a2 : List char) (i2 : ℤ) (n : ℤ) := ((0 : ℤ) ≤ i1 ∧ i1 ≤ Int.ofNat (List.length a1) - n) ∧ ((0 : ℤ) ≤ i2 ∧ i2 ≤ Int.ofNat (List.length a2) - n) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → a1[Int.toNat (i1 + i)]! = a2[Int.toNat (i2 + i)]!)
noncomputable def is_next (p : List char) (j : ℤ) (n : ℤ) := ((0 : ℤ) ≤ n ∧ n < j) ∧ matches1 p (j - n) p (0 : ℤ) n ∧ (∀(z : ℤ), n < z ∧ z < j → ¬matches1 p (j - z) p (0 : ℤ) z)
theorem next_1_0'vc (p : List char) (fact0 : (1 : ℤ) ≤ Int.ofNat (List.length p)) : is_next p (1 : ℤ) (0 : ℤ)
  := sorry
end kmp_KnuthMorrisPratt_next_1_0qtvc
