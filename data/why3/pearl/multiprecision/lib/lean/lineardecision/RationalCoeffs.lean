import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace RationalCoeffs
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom rvars : Type
axiom inhabited_axiom_rvars : Inhabited rvars
attribute [instance] inhabited_axiom_rvars
noncomputable def rinterp (t1 : ℤ × ℤ) (x_v : ℤ -> ℝ) := match t1 with | (n, d) => Int.to_Real n / Int.to_Real d
noncomputable def req (a : ℤ × ℤ) (b : ℤ × ℤ) := match (a, b) with | ((n1, d1), (n2, d2)) => n1 = n2 ∧ d1 = d2 ∨ ¬d1 = (0 : ℤ) ∧ ¬d2 = (0 : ℤ) ∧ n1 * d2 = n2 * d1
axiom req'spec (a : ℤ × ℤ) (b : ℤ × ℤ) (y : ℤ -> ℝ) (fact0 : req a b) : rinterp a y = rinterp b y
end RationalCoeffs
