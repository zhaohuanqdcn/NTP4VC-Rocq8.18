import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace lineardecision_RationalCoeffs_simpqtvc
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom rvars : Type
axiom inhabited_axiom_rvars : Inhabited rvars
attribute [instance] inhabited_axiom_rvars
noncomputable def rinterp (t1 : ℤ × ℤ) (x_v : ℤ -> ℝ) := match t1 with | (n, d) => Int.to_Real n / Int.to_Real d
theorem simp'vc (d : ℤ) (n : ℤ) : (¬d = (0 : ℤ) → ¬n = (0 : ℤ) → (let o1 : ℤ := abs d; let o2 : ℤ := abs n; ((0 : ℤ) < o2 ∧ (0 : ℤ) < o1) ∧ (let g : ℤ := Int.ofNat (Int.gcd o2 o1); (0 : ℤ) < g → ¬g = (0 : ℤ)))) ∧ (∀(result : ℤ) (result1 : ℤ), let result2 : ℤ × ℤ := (result, result1); (if d = (0 : ℤ) then result = n ∧ result1 = d else if n = (0 : ℤ) then result2 = ((0 : ℤ), (1 : ℤ)) else let g : ℤ := Int.ofNat (Int.gcd (abs n) (abs d)); (0 : ℤ) < g ∧ result = Int.tdiv n g ∧ result1 = Int.tdiv d g) → (∀(v : ℤ -> ℝ), rinterp result2 v = rinterp (n, d) v))
  := sorry
end lineardecision_RationalCoeffs_simpqtvc
