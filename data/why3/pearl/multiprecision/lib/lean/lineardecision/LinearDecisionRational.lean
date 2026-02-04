import Why3.Base
import Why3.why3.Ref.Ref
import Why3.mach.matrix.Matrix63
import Why3.debug.Debug
import pearl.multiprecision.lib.lean.lineardecision.RationalCoeffs
open Classical
open Lean4Why3
namespace LinearDecisionRational
axiom sub_def (a1 : ℝ) (a2 : ℝ) : a1 - a2 = a1 + -a2
axiom vars : Type
axiom inhabited_axiom_vars : Inhabited vars
attribute [instance] inhabited_axiom_vars
axiom zero_def (y : ℤ -> ℝ) : RationalCoeffs.rinterp ((0 : ℤ), (1 : ℤ)) y = (0 : ℝ)
axiom one_def (y : ℤ -> ℝ) : RationalCoeffs.rinterp ((1 : ℤ), (1 : ℤ)) y = (1 : ℝ)
axiom vars1 : Type
axiom inhabited_axiom_vars1 : Inhabited vars1
attribute [instance] inhabited_axiom_vars1
inductive expr where
  | Term : ℤ × ℤ -> ℤ -> expr
  | Add : expr -> expr -> expr
  | Cst : ℤ × ℤ -> expr
axiom inhabited_axiom_expr : Inhabited expr
attribute [instance] inhabited_axiom_expr
noncomputable def valid_expr : expr -> Prop
  | (expr.Term x i) => (0 : ℤ) ≤ i
  | (expr.Cst x) => True
  | (expr.Add e1 e2) => valid_expr e1 ∧ valid_expr e2
noncomputable def expr_bound : expr -> ℤ -> Prop
  | (expr.Term x i), b => (0 : ℤ) ≤ i ∧ i ≤ b
  | (expr.Cst x), b => True
  | (expr.Add e1 e2), b => expr_bound e1 b ∧ expr_bound e2 b
noncomputable def interp : expr -> (ℤ -> ℝ) -> (ℤ -> ℝ) -> ℝ
  | (expr.Term c v), y, z => RationalCoeffs.rinterp c z * y v
  | (expr.Add e1 e2), y, z => interp e1 y z + interp e2 y z
  | (expr.Cst c), y, z => RationalCoeffs.rinterp c z
axiom equality : Type
axiom inhabited_axiom_equality : Inhabited equality
attribute [instance] inhabited_axiom_equality
axiom context : Type
axiom inhabited_axiom_context : Inhabited context
attribute [instance] inhabited_axiom_context
noncomputable def valid_eq (eq : expr × expr) := match eq with | (e1, e2) => valid_expr e1 ∧ valid_expr e2
noncomputable def eq_bound (eq : expr × expr) (b : ℤ) := match eq with | (e1, e2) => expr_bound e1 b ∧ expr_bound e2 b
noncomputable def valid_ctx : List (expr × expr) -> Prop
  | ([] : List (expr × expr)) => True
  | (List.cons eq t) => valid_eq eq ∧ valid_ctx t
noncomputable def ctx_bound : List (expr × expr) -> ℤ -> Prop
  | ([] : List (expr × expr)), b => True
  | (List.cons eq t), b => eq_bound eq b ∧ ctx_bound t b
noncomputable def interp_eq (g : expr × expr) (y : ℤ -> ℝ) (z : ℤ -> ℝ) := if match g with | (g1, g2) => interp g1 y z = interp g2 y z then true else false
noncomputable def interp_ctx : List (expr × expr) -> expr × expr -> (ℤ -> ℝ) -> (ℤ -> ℝ) -> Bool
  | l, g, y, z => if match l with | ([] : List (expr × expr)) => interp_eq g y z = true | List.cons h t => interp_eq h y z = true → interp_ctx t g y z = true then true else false
axiom infix_eqeq : array63 (ℤ × ℤ) -> array63 (ℤ × ℤ) -> Prop
axiom infix_eqeq'spec (a : array63 (ℤ × ℤ)) (b : array63 (ℤ × ℤ)) (fact0 : infix_eqeq a b) : array63_length a = array63_length b ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < BitVec.toInt (array63_length a) → RationalCoeffs.req ((array63_elts a)[Int.toNat i]!) ((array63_elts b)[Int.toNat i]!))
axiom max_var : expr -> ℤ
axiom max_var'def (e : expr) (fact0 : valid_expr e) : match e with | expr.Term _ i => max_var e = i | expr.Cst _ => max_var e = (0 : ℤ) | expr.Add e1 e2 => max_var e = max (max_var e1) (max_var e2)
axiom max_var'spec'0 (e : expr) (fact0 : valid_expr e) : (0 : ℤ) ≤ max_var e
axiom max_var'spec (e : expr) (fact0 : valid_expr e) : expr_bound e (max_var e)
axiom max_var_e : expr × expr -> ℤ
axiom max_var_e'def (e : expr × expr) (fact0 : valid_eq e) : match e with | (e1, e2) => max_var_e e = max (max_var e1) (max_var e2)
axiom max_var_e'spec'0 (e : expr × expr) (fact0 : valid_eq e) : (0 : ℤ) ≤ max_var_e e
axiom max_var_e'spec (e : expr × expr) (fact0 : valid_eq e) : eq_bound e (max_var_e e)
axiom max_var_ctx : List (expr × expr) -> ℤ
axiom max_var_ctx'def (l : List (expr × expr)) (fact0 : valid_ctx l) : match l with | ([] : List (expr × expr)) => max_var_ctx l = (0 : ℤ) | List.cons e t => max_var_ctx l = max (max_var_e e) (max_var_ctx t)
axiom max_var_ctx'spec'0 (l : List (expr × expr)) (fact0 : valid_ctx l) : (0 : ℤ) ≤ max_var_ctx l
axiom max_var_ctx'spec (l : List (expr × expr)) (fact0 : valid_ctx l) : ctx_bound l (max_var_ctx l)
noncomputable def atom (e : expr) := match e with | expr.Add _ _ => False | _ => True
axiom to_list :  {α : Type} -> [Inhabited α] -> array63 α -> BitVec 63 -> BitVec 63 -> List α
mutual
inductive expr' where
  | Sum : expr' -> expr' -> expr'
  | ProdL : expr' -> cprod -> expr'
  | ProdR : cprod -> expr' -> expr'
  | Diff : expr' -> expr' -> expr'
  | Var : ℤ -> expr'
  | Coeff : ℤ × ℤ -> expr'
inductive cprod where
  | C : ℤ × ℤ -> cprod
  | Times : cprod -> cprod -> cprod
end
axiom inhabited_axiom_expr' : Inhabited expr'
attribute [instance] inhabited_axiom_expr'
axiom inhabited_axiom_cprod : Inhabited cprod
attribute [instance] inhabited_axiom_cprod
noncomputable def interp_c : cprod -> (ℤ -> ℝ) -> (ℤ -> ℝ) -> ℝ
  | (cprod.C c), y, z => RationalCoeffs.rinterp c z
  | (cprod.Times e1 e2), y, z => interp_c e1 y z * interp_c e2 y z
noncomputable def interp' : expr' -> (ℤ -> ℝ) -> (ℤ -> ℝ) -> ℝ
  | (expr'.Sum e1 e2), y, z => interp' e1 y z + interp' e2 y z
  | (expr'.ProdL e1 c), y, z => interp' e1 y z * interp_c c y z
  | (expr'.ProdR c e1), y, z => interp_c c y z * interp' e1 y z
  | (expr'.Diff e1 e2), y, z => interp' e1 y z - interp' e2 y z
  | (expr'.Var n), y, z => y n
  | (expr'.Coeff c), y, z => RationalCoeffs.rinterp c z
axiom equality' : Type
axiom inhabited_axiom_equality' : Inhabited equality'
attribute [instance] inhabited_axiom_equality'
axiom context' : Type
axiom inhabited_axiom_context' : Inhabited context'
attribute [instance] inhabited_axiom_context'
noncomputable def interp_eq' (g : expr' × expr') (y : ℤ -> ℝ) (z : ℤ -> ℝ) := if match g with | (g1, g2) => interp' g1 y z = interp' g2 y z then true else false
noncomputable def interp_ctx' : List (expr' × expr') -> expr' × expr' -> (ℤ -> ℝ) -> (ℤ -> ℝ) -> Bool
  | l, g, y, z => if match l with | ([] : List (expr' × expr')) => interp_eq' g y z = true | List.cons h t => interp_eq' h y z = true → interp_ctx' t g y z = true then true else false
noncomputable def valid_expr' : expr' -> Prop
  | (expr'.Var i) => (0 : ℤ) ≤ i
  | (expr'.Sum e1 e2) => valid_expr' e1 ∧ valid_expr' e2
  | (expr'.Diff e1 e2) => valid_expr' e1 ∧ valid_expr' e2
  | (expr'.Coeff x) => True
  | (expr'.ProdL e1 x) => valid_expr' e1
  | (expr'.ProdR x e1) => valid_expr' e1
noncomputable def valid_eq' (eq : expr' × expr') := match eq with | (e1, e2) => valid_expr' e1 ∧ valid_expr' e2
noncomputable def valid_ctx' : List (expr' × expr') -> Prop
  | ([] : List (expr' × expr')) => True
  | (List.cons eq t) => valid_eq' eq ∧ valid_ctx' t
end LinearDecisionRational
