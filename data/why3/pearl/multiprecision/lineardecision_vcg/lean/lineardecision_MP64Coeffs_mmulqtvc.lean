import Why3.Base
import Why3.why3.Ref.Ref
import Why3.debug.Debug
import pearl.multiprecision.lib.lean.lineardecision.RationalCoeffs
open Classical
open Lean4Why3
namespace lineardecision_MP64Coeffs_mmulqtvc
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
theorem mmul'vc (b : ℤ) (b1 : ℤ) (b2 : exp) (a : ℤ) (a1 : ℤ) (a2 : exp) : let b3 : (ℤ × ℤ) × exp := ((b, b1), b2); let a3 : (ℤ × ℤ) × exp := ((a, a1), a2); ∀(q : ℤ) (q1 : ℤ), let q2 : ℤ × ℤ := (q, q1); (∀(y : ℤ -> ℝ), RationalCoeffs.rinterp q2 y = RationalCoeffs.rinterp (a, a1) y * RationalCoeffs.rinterp (b, b1) y) → (if RationalCoeffs.req q2 ((0 : ℤ), (1 : ℤ)) then ∀(y : ℤ -> ℤ), minterp (((0 : ℤ), (1 : ℤ)), exp.Lit (0 : ℤ)) y = minterp a3 y * minterp b3 y else ∀(e : exp), (∀(y : ℤ -> ℤ), interp_exp e y = interp_exp a2 y + interp_exp b2 y) → (∀(y : ℤ -> ℤ), minterp (q2, e) y = minterp a3 y * minterp b3 y))
  := sorry
end lineardecision_MP64Coeffs_mmulqtvc
