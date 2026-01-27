import Why3.Base
import Why3.why3.Ref.Ref
import Why3.mach.matrix.Matrix63
import Why3.debug.Debug
import pearl.multiprecision.lib.lean.lineardecision.RationalCoeffs
import pearl.multiprecision.lib.lean.lineardecision.MP64Coeffs
import pearl.multiprecision.lib.lean.lineardecision.LinearDecisionRationalMP
open Classical
open Lean4Why3
namespace lineardecision_LinearDecisionIntMP_mqtvc
inductive t where
  | I : ℤ -> t
  | E : MP64Coeffs.exp -> t
  | R : t
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
noncomputable def mpinterp (t1 : t) (y : ℤ -> ℤ) := match t1 with | t.I n => n | t.E e => HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (MP64Coeffs.interp_exp e y)) | t.R => (18446744073709551615 : ℤ) + (1 : ℤ)
axiom mpeq'spec : True
axiom sub_def (a1 : ℤ) (a2 : ℤ) : a1 - a2 = a1 + -a2
axiom vars : Type
axiom inhabited_axiom_vars : Inhabited vars
attribute [instance] inhabited_axiom_vars
axiom zero_def (y : ℤ -> ℤ) : mpinterp (t.I (0 : ℤ)) y = (0 : ℤ)
axiom one_def (y : ℤ -> ℤ) : mpinterp (t.I (1 : ℤ)) y = (1 : ℤ)
axiom vars1 : Type
axiom inhabited_axiom_vars1 : Inhabited vars1
attribute [instance] inhabited_axiom_vars1
inductive expr where
  | Term : t -> ℤ -> expr
  | Add : expr -> expr -> expr
  | Cst : t -> expr
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
noncomputable def interp : expr -> (ℤ -> ℤ) -> (ℤ -> ℤ) -> ℤ
  | (expr.Term c v), y, z => mpinterp c z * y v
  | (expr.Add e1 e2), y, z => interp e1 y z + interp e2 y z
  | (expr.Cst c), y, z => mpinterp c z
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
  | (List.cons eq t1) => valid_eq eq ∧ valid_ctx t1
noncomputable def ctx_bound : List (expr × expr) -> ℤ -> Prop
  | ([] : List (expr × expr)), b => True
  | (List.cons eq t1), b => eq_bound eq b ∧ ctx_bound t1 b
noncomputable def interp_eq (g : expr × expr) (y : ℤ -> ℤ) (z : ℤ -> ℤ) := if match g with | (g1, g2) => interp g1 y z = interp g2 y z then true else false
noncomputable def interp_ctx : List (expr × expr) -> expr × expr -> (ℤ -> ℤ) -> (ℤ -> ℤ) -> Bool
  | l, g, y, z => if match l with | ([] : List (expr × expr)) => interp_eq g y z = true | List.cons h t1 => interp_eq h y z = true → interp_ctx t1 g y z = true then true else false
axiom infix_eqeq : array63 t -> array63 t -> Prop
axiom infix_eqeq'spec (a : array63 t) (b : array63 t) (fact0 : infix_eqeq a b) : array63_length a = array63_length b ∧ (∀(i : ℤ), ¬((0 : ℤ) ≤ i ∧ i < BitVec.toInt (array63_length a)))
axiom max_var : expr -> ℤ
axiom max_var'def (e : expr) (fact0 : valid_expr e) : match e with | expr.Term _ i => max_var e = i | expr.Cst _ => max_var e = (0 : ℤ) | expr.Add e1 e2 => max_var e = max (max_var e1) (max_var e2)
axiom max_var'spec'0 (e : expr) (fact0 : valid_expr e) : (0 : ℤ) ≤ max_var e
axiom max_var'spec (e : expr) (fact0 : valid_expr e) : expr_bound e (max_var e)
axiom max_var_e : expr × expr -> ℤ
axiom max_var_e'def (e : expr × expr) (fact0 : valid_eq e) : match e with | (e1, e2) => max_var_e e = max (max_var e1) (max_var e2)
axiom max_var_e'spec'0 (e : expr × expr) (fact0 : valid_eq e) : (0 : ℤ) ≤ max_var_e e
axiom max_var_e'spec (e : expr × expr) (fact0 : valid_eq e) : eq_bound e (max_var_e e)
axiom max_var_ctx : List (expr × expr) -> ℤ
axiom max_var_ctx'def (l : List (expr × expr)) (fact0 : valid_ctx l) : match l with | ([] : List (expr × expr)) => max_var_ctx l = (0 : ℤ) | List.cons e t1 => max_var_ctx l = max (max_var_e e) (max_var_ctx t1)
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
  | Coeff : t -> expr'
inductive cprod where
  | C : t -> cprod
  | Times : cprod -> cprod -> cprod
end
axiom inhabited_axiom_expr' : Inhabited expr'
attribute [instance] inhabited_axiom_expr'
axiom inhabited_axiom_cprod : Inhabited cprod
attribute [instance] inhabited_axiom_cprod
noncomputable def interp_c : cprod -> (ℤ -> ℤ) -> (ℤ -> ℤ) -> ℤ
  | (cprod.C c), y, z => mpinterp c z
  | (cprod.Times e1 e2), y, z => interp_c e1 y z * interp_c e2 y z
noncomputable def interp' : expr' -> (ℤ -> ℤ) -> (ℤ -> ℤ) -> ℤ
  | (expr'.Sum e1 e2), y, z => interp' e1 y z + interp' e2 y z
  | (expr'.ProdL e1 c), y, z => interp' e1 y z * interp_c c y z
  | (expr'.ProdR c e1), y, z => interp_c c y z * interp' e1 y z
  | (expr'.Diff e1 e2), y, z => interp' e1 y z - interp' e2 y z
  | (expr'.Var n), y, z => y n
  | (expr'.Coeff c), y, z => mpinterp c z
axiom equality' : Type
axiom inhabited_axiom_equality' : Inhabited equality'
attribute [instance] inhabited_axiom_equality'
axiom context' : Type
axiom inhabited_axiom_context' : Inhabited context'
attribute [instance] inhabited_axiom_context'
noncomputable def interp_eq' (g : expr' × expr') (y : ℤ -> ℤ) (z : ℤ -> ℤ) := if match g with | (g1, g2) => interp' g1 y z = interp' g2 y z then true else false
noncomputable def interp_ctx' : List (expr' × expr') -> expr' × expr' -> (ℤ -> ℤ) -> (ℤ -> ℤ) -> Bool
  | l, g, y, z => if match l with | ([] : List (expr' × expr')) => interp_eq' g y z = true | List.cons h t1 => interp_eq' h y z = true → interp_ctx' t1 g y z = true then true else false
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
  | (List.cons eq t1) => valid_eq' eq ∧ valid_ctx' t1
noncomputable def pos_exp (t1 : t) (y : ℤ -> ℤ) := match t1 with | t.E e => (0 : ℤ) ≤ MP64Coeffs.interp_exp e y | t.I _ => True | t.R => True
noncomputable def pos_cprod : cprod -> (ℤ -> ℤ) -> Prop
  | (cprod.C c), y => pos_exp c y
  | (cprod.Times c1 c2), y => pos_cprod c1 y ∧ pos_cprod c2 y
noncomputable def pos_expr' : expr' -> (ℤ -> ℤ) -> Prop
  | (expr'.Coeff c), y => pos_exp c y
  | (expr'.Var x), y => True
  | (expr'.Sum e1 e2), y => pos_expr' e1 y ∧ pos_expr' e2 y
  | (expr'.Diff e1 e2), y => pos_expr' e1 y ∧ pos_expr' e2 y
  | (expr'.ProdL e1 c), y => pos_expr' e1 y ∧ pos_cprod c y
  | (expr'.ProdR c e1), y => pos_expr' e1 y ∧ pos_cprod c y
noncomputable def pos_eq' (eq : expr' × expr') (y : ℤ -> ℤ) := match eq with | (e1, e2) => pos_expr' e1 y ∧ pos_expr' e2 y
noncomputable def pos_ctx' : List (expr' × expr') -> (ℤ -> ℤ) -> Prop
  | ([] : List (expr' × expr')), y => True
  | (List.cons h t1), y => pos_eq' h y ∧ pos_ctx' t1 y
theorem m'vc (t1 : t) : (match t1 with | t.I n => True | t.E e => True | t.R => True) ∧ (∀(result : ℤ) (result1 : ℤ) (result2 : MP64Coeffs.exp), (match t1 with | t.I n => (result = n ∧ result1 = (1 : ℤ)) ∧ result2 = MP64Coeffs.exp.Lit (0 : ℤ) | t.E e => (result = (1 : ℤ) ∧ result1 = (1 : ℤ)) ∧ result2 = e | t.R => (result = (1 : ℤ) ∧ result1 = (1 : ℤ)) ∧ result2 = MP64Coeffs.exp.Lit (1 : ℤ)) → (∀(y : ℤ -> ℤ), pos_exp t1 y → MP64Coeffs.minterp ((result, result1), result2) y = Int.to_Real (mpinterp t1 y)))
  := sorry
end lineardecision_LinearDecisionIntMP_mqtvc
