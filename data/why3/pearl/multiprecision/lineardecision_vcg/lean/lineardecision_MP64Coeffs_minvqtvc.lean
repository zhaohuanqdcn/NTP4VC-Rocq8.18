import Why3.Base
import Why3.why3.Ref.Ref
import Why3.debug.Debug
import pearl.multiprecision.lib.lean.lineardecision.RationalCoeffs
open Classical
open Lean4Why3
namespace lineardecision_MP64Coeffs_minvqtvc
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
noncomputable def pure_same_exp : exp -> exp -> Prop
  | (exp.Lit n1), (exp.Lit n2) => n1 = n2
  | (exp.Var v1), (exp.Var v2) => v1 = v2
  | (exp.Minus e1'), (exp.Minus e2') => pure_same_exp e1' e2'
  | (exp.Plus a1 a2), (exp.Plus b1 b2) => pure_same_exp a1 b1 ∧ pure_same_exp a2 b2 ∨ pure_same_exp a1 b2 ∧ pure_same_exp a2 b1
  | x, x0 => False
axiom pure_same_exp'spec (e1 : exp) (e2 : exp) (y : ℤ -> ℤ) (fact0 : pure_same_exp e1 e2) : interp_exp e1 y = interp_exp e2 y
noncomputable def meq (a : (ℤ × ℤ) × exp) (b : (ℤ × ℤ) × exp) := match (a, b) with | ((q1, e1), (q2, e2)) => RationalCoeffs.req q1 q2 ∧ pure_same_exp e1 e2 ∨ RationalCoeffs.req q1 ((0 : ℤ), (1 : ℤ)) ∧ RationalCoeffs.req q2 ((0 : ℤ), (1 : ℤ))
axiom meq'spec (a : (ℤ × ℤ) × exp) (b : (ℤ × ℤ) × exp) (y : ℤ -> ℤ) (fact0 : meq a b) : minterp a y = minterp b y
theorem minv'vc (q : ℤ) (q1 : ℤ) (e : exp) (fact0 : ¬meq ((q, q1), e) (((0 : ℤ), (1 : ℤ)), exp.Lit (0 : ℤ))) : let q2 : ℤ × ℤ := (q, q1); ∀(o1 : exp), (∀(y : ℤ -> ℤ), interp_exp o1 y = -interp_exp e y) → ¬RationalCoeffs.req q2 ((0 : ℤ), (1 : ℤ)) ∧ (∀(o2 : ℤ) (o3 : ℤ), let o4 : ℤ × ℤ := (o2, o3); ¬RationalCoeffs.req o4 ((0 : ℤ), (1 : ℤ)) ∧ (∀(y : ℤ -> ℝ), RationalCoeffs.rinterp o4 y * RationalCoeffs.rinterp q2 y = (1 : ℝ)) → ¬meq (o4, o1) (((0 : ℤ), (1 : ℤ)), exp.Lit (0 : ℤ)))
  := sorry
end lineardecision_MP64Coeffs_minvqtvc
