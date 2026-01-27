import Why3.Base
import Why3.why3.Ref.Ref
import pearl.conjugate_vcg.lean.conjugate.Conjugate
open Classical
open Lean4Why3
namespace conjugate_Test_benchqtvc
theorem bench'vc (a : List ℤ) (fact0 : (4 : ℤ) ≤ Int.ofNat (List.length a)) : (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < Int.ofNat (List.length a) ∧ (a[(0 : ℕ)]! = (4 : ℤ) → ((0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) < Int.ofNat (List.length a)) ∧ (a[(1 : ℕ)]! = (3 : ℤ) → ((0 : ℤ) ≤ (2 : ℤ) ∧ (2 : ℤ) < Int.ofNat (List.length a)) ∧ (a[(2 : ℕ)]! = (1 : ℤ) → (0 : ℤ) ≤ (3 : ℤ) ∧ (3 : ℤ) < Int.ofNat (List.length a))))
  := sorry
end conjugate_Test_benchqtvc
