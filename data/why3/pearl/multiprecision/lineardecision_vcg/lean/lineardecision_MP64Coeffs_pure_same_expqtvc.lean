import Why3.Base
import Why3.why3.Ref.Ref
import Why3.debug.Debug
import pearl.multiprecision.lib.lean.lineardecision.RationalCoeffs
open Classical
open Lean4Why3
namespace lineardecision_MP64Coeffs_pure_same_expqtvc
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
theorem pure_same_exp'vc (e2 : exp) (e1 : exp) : (match e2 with | exp.Lit x => (match e1 with | exp.Lit x1 => True | _ => True) | exp.Var x => (match e1 with | exp.Var x1 => True | _ => True) | exp.Minus x => (match e1 with | exp.Minus x1 => (match e1 with | exp.Lit _ => False | exp.Var _ => False | exp.Plus f f1 => f = x1 ∨ f1 = x1 | exp.Minus f => f = x1 | exp.Sub f f1 => f = x1 ∨ f1 = x1) ∨ e1 = x1 ∧ (match e2 with | exp.Lit _ => False | exp.Var _ => False | exp.Plus f f1 => f = x ∨ f1 = x | exp.Minus f => f = x | exp.Sub f f1 => f = x ∨ f1 = x) | _ => True) | exp.Plus x x1 => (match e1 with | exp.Plus x2 x3 => (((match e1 with | exp.Lit _ => False | exp.Var _ => False | exp.Plus f f1 => f = x2 ∨ f1 = x2 | exp.Minus f => f = x2 | exp.Sub f f1 => f = x2 ∨ f1 = x2) ∨ e1 = x2 ∧ (match e2 with | exp.Lit _ => False | exp.Var _ => False | exp.Plus f f1 => f = x ∨ f1 = x | exp.Minus f => f = x | exp.Sub f f1 => f = x ∨ f1 = x)) ∧ ((∀(y : ℤ -> ℤ), interp_exp x2 y = interp_exp x y) → (match e1 with | exp.Lit _ => False | exp.Var _ => False | exp.Plus f f1 => f = x3 ∨ f1 = x3 | exp.Minus f => f = x3 | exp.Sub f f1 => f = x3 ∨ f1 = x3) ∨ e1 = x3 ∧ (match e2 with | exp.Lit _ => False | exp.Var _ => False | exp.Plus f f1 => f = x1 ∨ f1 = x1 | exp.Minus f => f = x1 | exp.Sub f f1 => f = x1 ∨ f1 = x1))) ∧ (∀(o1 : Bool), (∃(o2 : Bool), (o2 = true → (∀(y : ℤ -> ℤ), interp_exp x2 y = interp_exp x y)) ∧ (if o2 = true then o1 = true → (∀(y : ℤ -> ℤ), interp_exp x3 y = interp_exp x1 y) else o1 = false)) → ¬o1 = true → ((match e1 with | exp.Lit _ => False | exp.Var _ => False | exp.Plus f f1 => f = x2 ∨ f1 = x2 | exp.Minus f => f = x2 | exp.Sub f f1 => f = x2 ∨ f1 = x2) ∨ e1 = x2 ∧ (match e2 with | exp.Lit _ => False | exp.Var _ => False | exp.Plus f f1 => f = x1 ∨ f1 = x1 | exp.Minus f => f = x1 | exp.Sub f f1 => f = x1 ∨ f1 = x1)) ∧ ((∀(y : ℤ -> ℤ), interp_exp x2 y = interp_exp x1 y) → (match e1 with | exp.Lit _ => False | exp.Var _ => False | exp.Plus f f1 => f = x3 ∨ f1 = x3 | exp.Minus f => f = x3 | exp.Sub f f1 => f = x3 ∨ f1 = x3) ∨ e1 = x3 ∧ (match e2 with | exp.Lit _ => False | exp.Var _ => False | exp.Plus f f1 => f = x ∨ f1 = x | exp.Minus f => f = x | exp.Sub f f1 => f = x ∨ f1 = x))) | _ => True) | _ => True) ∧ ((match e2 with | exp.Lit x => (match e1 with | exp.Lit x1 => true = (if x1 = x then true else false) | _ => true = false) | exp.Var x => (match e1 with | exp.Var x1 => true = (if x1 = x then true else false) | _ => true = false) | exp.Minus x => (match e1 with | exp.Minus x1 => (∀(y : ℤ -> ℤ), interp_exp x1 y = interp_exp x y) | _ => true = false) | exp.Plus x x1 => (match e1 with | exp.Plus x2 x3 => (∃(o1 : Bool), (∃(o2 : Bool), (o2 = true → (∀(y : ℤ -> ℤ), interp_exp x2 y = interp_exp x y)) ∧ (if o2 = true then o1 = true → (∀(y : ℤ -> ℤ), interp_exp x3 y = interp_exp x1 y) else o1 = false)) ∧ (if o1 = true then True else ∃(o2 : Bool), (o2 = true → (∀(y : ℤ -> ℤ), interp_exp x2 y = interp_exp x1 y)) ∧ (if o2 = true then ∀(y : ℤ -> ℤ), interp_exp x3 y = interp_exp x y else true = false))) | _ => true = false) | _ => true = false) → (∀(y : ℤ -> ℤ), interp_exp e1 y = interp_exp e2 y))
  := sorry
end lineardecision_MP64Coeffs_pure_same_expqtvc
