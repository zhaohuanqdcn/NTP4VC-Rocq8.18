import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace lineardecision_RationalCoeffs_gcdqtvc
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom rvars : Type
axiom inhabited_axiom_rvars : Inhabited rvars
attribute [instance] inhabited_axiom_rvars
noncomputable def rinterp (t1 : ℤ × ℤ) (x_v : ℤ -> ℝ) := match t1 with | (n, d) => Int.to_Real n / Int.to_Real d
theorem gcd'vc (x : ℤ) (y : ℤ) (fact0 : (0 : ℤ) < x) (fact1 : (0 : ℤ) < y) : (0 : ℤ) ≤ x ∧ (0 : ℤ) ≤ y ∧ (∀(y1 : ℤ) (x1 : ℤ), ((0 : ℤ) ≤ x1 ∧ (0 : ℤ) ≤ y1) ∧ Int.gcd x1 y1 = Int.gcd x y ∧ ((0 : ℤ) < x → (0 : ℤ) < x1) → (if (0 : ℤ) < y1 then ¬y1 = (0 : ℤ) ∧ ¬y1 = (0 : ℤ) ∧ ((0 : ℤ) ≤ y1 ∧ Int.tmod x1 y1 < y1) ∧ ((0 : ℤ) ≤ y1 ∧ (0 : ℤ) ≤ Int.tmod x1 y1) ∧ Int.gcd y1 (Int.tmod x1 y1) = Int.gcd x y ∧ ((0 : ℤ) < x → (0 : ℤ) < y1) else x1 = Int.ofNat (Int.gcd x y) ∧ (0 : ℤ) < x1))
  := sorry
end lineardecision_RationalCoeffs_gcdqtvc
