import Why3.Base
import Why3.why3.Ref.Ref
import Why3.debug.Debug
import pearl.multiprecision.lib.lean.lineardecision.RationalCoeffs
open Classical
open Lean4Why3
namespace lineardecision_MP64Coeffs_moppqtvc
axiom evars : Type
axiom inhabited_axiom_evars : Inhabited evars
attribute [instance] inhabited_axiom_evars
inductive exp where
  | Lit : ℤ -> exp
  | Var : ℤ -> exp
  | Plus : exp -> exp -> exp
  | Minus : exp -> exp
  | Sub : exp -> exp -> exp
axiom inhabited_axiom_exp : Inhabited exp
attribute [instance] inhabited_axiom_exp
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
noncomputable def qinterp (q : ℤ × ℤ) := match q with | (n, d) => Int.to_Real n / Int.to_Real d
noncomputable def interp_exp : exp -> (ℤ -> ℤ) -> ℤ
  | (exp.Lit n), y => n
  | (exp.Var v), y => y v
  | (exp.Plus e1 e2), y => interp_exp e1 y + interp_exp e2 y
  | (exp.Sub e1 e2), y => interp_exp e1 y - interp_exp e2 y
  | (exp.Minus e'), y => -interp_exp e' y
noncomputable def minterp (t1 : (ℤ × ℤ) × exp) (y : ℤ -> ℤ) := match t1 with | (q, e) => qinterp q * HPow.hPow (Int.to_Real ((18446744073709551615 : ℤ) + (1 : ℤ))) (Int.to_Real (interp_exp e y))
theorem mopp'vc (result : ℤ) (result1 : ℤ) (q : ℤ) (q1 : ℤ) (e : exp) (y : ℤ -> ℤ) (fact0 : ∀(y : ℤ -> ℝ), RationalCoeffs.rinterp (result, result1) y = -RationalCoeffs.rinterp (q, q1) y) : minterp ((result, result1), e) y = -minterp ((q, q1), e) y
  := sorry
end lineardecision_MP64Coeffs_moppqtvc
