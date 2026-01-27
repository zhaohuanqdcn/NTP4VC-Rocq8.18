import Why3.Base
import Why3.why3.Ref.Ref
import Why3.debug.Debug
import pearl.multiprecision.lib.lean.lineardecision.RationalCoeffs
open Classical
open Lean4Why3
namespace lineardecision_MP64Coeffs_zero_expqtvc
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
theorem zero_exp'vc (e : exp) : (∀(e : exp), (match e with | exp.Lit n => True | exp.Var _ => True | exp.Minus e1 => (match e with | exp.Lit _ => False | exp.Var _ => False | exp.Plus f f1 => f = e1 ∨ f1 = e1 | exp.Minus f => f = e1 | exp.Sub f f1 => f = e1 ∨ f1 = e1) | exp.Plus e1 e2 => (match e with | exp.Lit _ => False | exp.Var _ => False | exp.Plus f f1 => f = e1 ∨ f1 = e1 | exp.Minus f => f = e1 | exp.Sub f f1 => f = e1 ∨ f1 = e1) ∧ ((∀(y : ℤ -> ℤ), interp_exp e1 y = (0 : ℤ)) → (match e with | exp.Lit _ => False | exp.Var _ => False | exp.Plus f f1 => f = e2 ∨ f1 = e2 | exp.Minus f => f = e2 | exp.Sub f f1 => f = e2 ∨ f1 = e2)) | exp.Sub e1 e2 => (match e with | exp.Lit _ => False | exp.Var _ => False | exp.Plus f f1 => f = e1 ∨ f1 = e1 | exp.Minus f => f = e1 | exp.Sub f f1 => f = e1 ∨ f1 = e1) ∧ ((∀(y : ℤ -> ℤ), interp_exp e1 y = (0 : ℤ)) → (match e with | exp.Lit _ => False | exp.Var _ => False | exp.Plus f f1 => f = e2 ∨ f1 = e2 | exp.Minus f => f = e2 | exp.Sub f f1 => f = e2 ∨ f1 = e2))) ∧ ((match e with | exp.Lit n => true = (if n = (0 : ℤ) then true else false) | exp.Var _ => true = false | exp.Minus e1 => (∀(y : ℤ -> ℤ), interp_exp e1 y = (0 : ℤ)) | exp.Plus e1 e2 => (∃(o1 : Bool), (o1 = true → (∀(y : ℤ -> ℤ), interp_exp e1 y = (0 : ℤ))) ∧ (if o1 = true then ∀(y : ℤ -> ℤ), interp_exp e2 y = (0 : ℤ) else true = false)) | exp.Sub e1 e2 => (∃(o1 : Bool), (o1 = true → (∀(y : ℤ -> ℤ), interp_exp e1 y = (0 : ℤ))) ∧ (if o1 = true then ∀(y : ℤ -> ℤ), interp_exp e2 y = (0 : ℤ) else true = false))) → (∀(y : ℤ -> ℤ), interp_exp e y = (0 : ℤ)))) ∧ (∀(e' : exp), (∀(y : ℤ -> ℤ), interp_exp e' y = interp_exp (exp.Lit (0 : ℤ)) y + interp_exp e y) → (∀(y : ℤ -> ℤ), interp_exp e' y = (0 : ℤ)) → (∀(y : ℤ -> ℤ), interp_exp e y = (0 : ℤ)))
  := sorry
end lineardecision_MP64Coeffs_zero_expqtvc
