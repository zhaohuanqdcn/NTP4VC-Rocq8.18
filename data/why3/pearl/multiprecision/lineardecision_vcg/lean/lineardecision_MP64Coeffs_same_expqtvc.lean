import Why3.Base
import Why3.why3.Ref.Ref
import Why3.debug.Debug
import pearl.multiprecision.lib.lean.lineardecision.RationalCoeffs
open Classical
open Lean4Why3
namespace lineardecision_MP64Coeffs_same_expqtvc
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
theorem same_exp'vc (e2 : exp) (e1 : exp) : match e2 with | exp.Lit x => (match e1 with | exp.Lit x1 => x1 = x → (∀(y : ℤ -> ℤ), interp_exp e1 y = interp_exp e2 y) | _ => (∀(o1 : exp), (∀(y : ℤ -> ℤ), interp_exp o1 y = -interp_exp e2 y) → (∀(o2 : exp), (∀(y : ℤ -> ℤ), interp_exp o2 y = interp_exp e1 y + interp_exp o1 y) → (∀(y : ℤ -> ℤ), interp_exp o2 y = (0 : ℤ)) → (∀(y : ℤ -> ℤ), interp_exp e1 y = interp_exp e2 y)))) | exp.Var x => (match e1 with | exp.Var x1 => x1 = x → (∀(y : ℤ -> ℤ), interp_exp e1 y = interp_exp e2 y) | _ => (∀(o1 : exp), (∀(y : ℤ -> ℤ), interp_exp o1 y = -interp_exp e2 y) → (∀(o2 : exp), (∀(y : ℤ -> ℤ), interp_exp o2 y = interp_exp e1 y + interp_exp o1 y) → (∀(y : ℤ -> ℤ), interp_exp o2 y = (0 : ℤ)) → (∀(y : ℤ -> ℤ), interp_exp e1 y = interp_exp e2 y)))) | exp.Minus x => (match e1 with | exp.Minus x1 => ((match e1 with | exp.Lit _ => False | exp.Var _ => False | exp.Plus f f1 => f = x1 ∨ f1 = x1 | exp.Minus f => f = x1 | exp.Sub f f1 => f = x1 ∨ f1 = x1) ∨ e1 = x1 ∧ (match e2 with | exp.Lit _ => False | exp.Var _ => False | exp.Plus f f1 => f = x ∨ f1 = x | exp.Minus f => f = x | exp.Sub f f1 => f = x ∨ f1 = x)) ∧ ((∀(y : ℤ -> ℤ), interp_exp x1 y = interp_exp x y) → (∀(y : ℤ -> ℤ), interp_exp e1 y = interp_exp e2 y)) | _ => (∀(o1 : exp), (∀(y : ℤ -> ℤ), interp_exp o1 y = -interp_exp e2 y) → (∀(o2 : exp), (∀(y : ℤ -> ℤ), interp_exp o2 y = interp_exp e1 y + interp_exp o1 y) → (∀(y : ℤ -> ℤ), interp_exp o2 y = (0 : ℤ)) → (∀(y : ℤ -> ℤ), interp_exp e1 y = interp_exp e2 y)))) | _ => (∀(o1 : exp), (∀(y : ℤ -> ℤ), interp_exp o1 y = -interp_exp e2 y) → (∀(o2 : exp), (∀(y : ℤ -> ℤ), interp_exp o2 y = interp_exp e1 y + interp_exp o1 y) → (∀(y : ℤ -> ℤ), interp_exp o2 y = (0 : ℤ)) → (∀(y : ℤ -> ℤ), interp_exp e1 y = interp_exp e2 y)))
  := sorry
end lineardecision_MP64Coeffs_same_expqtvc
