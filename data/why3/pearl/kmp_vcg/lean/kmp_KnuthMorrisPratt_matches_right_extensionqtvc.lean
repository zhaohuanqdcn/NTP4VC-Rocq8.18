import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace kmp_KnuthMorrisPratt_matches_right_extensionqtvc
axiom char : Type
axiom inhabited_axiom_char : Inhabited char
attribute [instance] inhabited_axiom_char
noncomputable def matches1 (a1 : List char) (i1 : ℤ) (a2 : List char) (i2 : ℤ) (n : ℤ) := ((0 : ℤ) ≤ i1 ∧ i1 ≤ Int.ofNat (List.length a1) - n) ∧ ((0 : ℤ) ≤ i2 ∧ i2 ≤ Int.ofNat (List.length a2) - n) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → a1[Int.toNat (i1 + i)]! = a2[Int.toNat (i2 + i)]!)
theorem matches_right_extension'vc (a1 : List char) (i1 : ℤ) (a2 : List char) (i2 : ℤ) (n : ℤ) (fact0 : matches1 a1 i1 a2 i2 n) (fact1 : i1 ≤ Int.ofNat (List.length a1) - n - (1 : ℤ)) (fact2 : i2 ≤ Int.ofNat (List.length a2) - n - (1 : ℤ)) (fact3 : a1[Int.toNat (i1 + n)]! = a2[Int.toNat (i2 + n)]!) : matches1 a1 i1 a2 i2 (n + (1 : ℤ))
  := sorry
end kmp_KnuthMorrisPratt_matches_right_extensionqtvc
