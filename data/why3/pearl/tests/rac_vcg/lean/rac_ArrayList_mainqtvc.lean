import Why3.Base
open Classical
open Lean4Why3
namespace rac_ArrayList_mainqtvc
theorem main'vc : (0 : ℤ) ≤ (4 : ℤ) ∧ (∀(f : List ℤ), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (4 : ℤ) → f[Int.toNat i]! = (0 : ℤ)) ∧ Int.ofNat (List.length f) = (4 : ℤ) → (0 : ℤ) ≤ (0 : ℤ) ∧ (4 : ℤ) ≤ Int.ofNat (List.length f))
  := sorry
end rac_ArrayList_mainqtvc
