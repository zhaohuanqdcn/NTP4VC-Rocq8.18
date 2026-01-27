import Why3.Base
import Why3.why3.Ref.Ref
import Why3.mach.matrix.Matrix63
import Why3.debug.Debug
open Classical
open Lean4Why3
namespace lineardecision_LinearEquationsDecision_add_exprqtvc
axiom coeff : Type
axiom inhabited_axiom_coeff : Inhabited coeff
attribute [instance] inhabited_axiom_coeff
axiom a : Type
axiom inhabited_axiom_a : Inhabited a
attribute [instance] inhabited_axiom_a
axiom infix_pl : a -> a -> a
axiom infix_as : a -> a -> a
axiom prefix_mn : a -> a
axiom azero : a
axiom aone : a
axiom ale : a -> a -> Prop
axiom Assoc (x : a) (y : a) (z : a) : infix_pl (infix_pl x y) z = infix_pl x (infix_pl y z)
axiom Unit_def_l (x : a) : infix_pl azero x = x
axiom Unit_def_r (x : a) : infix_pl x azero = x
axiom Inv_def_l (x : a) : infix_pl (prefix_mn x) x = azero
axiom Inv_def_r (x : a) : infix_pl x (prefix_mn x) = azero
axiom Comm (x : a) (y : a) : infix_pl x y = infix_pl y x
axiom Assoc1 (x : a) (y : a) (z : a) : infix_as (infix_as x y) z = infix_as x (infix_as y z)
axiom Mul_distr_l (x : a) (y : a) (z : a) : infix_as x (infix_pl y z) = infix_pl (infix_as x y) (infix_as x z)
axiom Mul_distr_r (y : a) (z : a) (x : a) : infix_as (infix_pl y z) x = infix_pl (infix_as y x) (infix_as z x)
axiom Comm1 (x : a) (y : a) : infix_as x y = infix_as y x
axiom Unitary (x : a) : infix_as aone x = x
axiom NonTrivialRing : ¬azero = aone
axiom Refl (x : a) : ale x x
axiom Trans (x : a) (y : a) (z : a) (fact0 : ale x y) (fact1 : ale y z) : ale x z
axiom Antisymm (x : a) (y : a) (fact0 : ale x y) (fact1 : ale y x) : x = y
axiom Total (x : a) (y : a) : ale x y ∨ ale y x
axiom ZeroLessOne : ale azero aone
axiom CompatOrderAdd (x : a) (y : a) (z : a) (fact0 : ale x y) : ale (infix_pl x z) (infix_pl y z)
axiom CompatOrderMult (x : a) (y : a) (z : a) (fact0 : ale x y) (fact1 : ale azero z) : ale (infix_as x z) (infix_as y z)
axiom infix_mn : a -> a -> a
axiom sub_def (a1 : a) (a2 : a) : infix_mn a1 a2 = infix_pl a1 (prefix_mn a2)
axiom vars : Type
axiom inhabited_axiom_vars : Inhabited vars
attribute [instance] inhabited_axiom_vars
axiom cvars : Type
axiom inhabited_axiom_cvars : Inhabited cvars
attribute [instance] inhabited_axiom_cvars
axiom interp : coeff -> cvars -> a
axiom czero : coeff
axiom cone : coeff
axiom zero_def (y : cvars) : interp czero y = azero
axiom one_def (y : cvars) : interp cone y = aone
axiom eq : coeff -> coeff -> Prop
axiom eq'spec (a1 : coeff) (b : coeff) (y : cvars) (fact0 : eq a1 b) : interp a1 y = interp b y
axiom vars1 : Type
axiom inhabited_axiom_vars1 : Inhabited vars1
attribute [instance] inhabited_axiom_vars1
inductive expr where
  | Term : coeff -> ℤ -> expr
  | Add : expr -> expr -> expr
  | Cst : coeff -> expr
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
noncomputable def interp1 : expr -> (ℤ -> a) -> cvars -> a
  | (expr.Term c v), y, z => infix_as (interp c z) (y v)
  | (expr.Add e1 e2), y, z => infix_pl (interp1 e1 y z) (interp1 e2 y z)
  | (expr.Cst c), y, z => interp c z
axiom equality : Type
axiom inhabited_axiom_equality : Inhabited equality
attribute [instance] inhabited_axiom_equality
axiom context : Type
axiom inhabited_axiom_context : Inhabited context
attribute [instance] inhabited_axiom_context
noncomputable def valid_eq (eq1 : expr × expr) := match eq1 with | (e1, e2) => valid_expr e1 ∧ valid_expr e2
noncomputable def eq_bound (eq1 : expr × expr) (b : ℤ) := match eq1 with | (e1, e2) => expr_bound e1 b ∧ expr_bound e2 b
noncomputable def valid_ctx : List (expr × expr) -> Prop
  | ([] : List (expr × expr)) => True
  | (List.cons eq1 t) => valid_eq eq1 ∧ valid_ctx t
noncomputable def ctx_bound : List (expr × expr) -> ℤ -> Prop
  | ([] : List (expr × expr)), b => True
  | (List.cons eq1 t), b => eq_bound eq1 b ∧ ctx_bound t b
noncomputable def interp_eq (g : expr × expr) (y : ℤ -> a) (z : cvars) := if match g with | (g1, g2) => interp1 g1 y z = interp1 g2 y z then true else false
noncomputable def interp_ctx : List (expr × expr) -> expr × expr -> (ℤ -> a) -> cvars -> Bool
  | l, g, y, z => if match l with | ([] : List (expr × expr)) => interp_eq g y z = true | List.cons h t => interp_eq h y z = true → interp_ctx t g y z = true then true else false
axiom infix_eqeq : array63 coeff -> array63 coeff -> Prop
axiom infix_eqeq'spec (a1 : array63 coeff) (b : array63 coeff) (fact0 : infix_eqeq a1 b) : array63_length a1 = array63_length b ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < BitVec.toInt (array63_length a1) → eq ((array63_elts a1)[Int.toNat i]!) ((array63_elts b)[Int.toNat i]!))
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
theorem add_expr'vc (e2 : expr) (e1 : expr) : (∀(c : coeff) (i : ℤ), let o1 : coeff := czero; (eq o1 c → (∀(y : cvars), interp o1 y = interp c y)) → (∀(result : expr), (if eq o1 c then result = expr.Cst czero else result = expr.Term c i) → (∀(y : ℤ -> a) (z : cvars), interp1 result y z = interp1 (expr.Term c i) y z))) ∧ (∀(e : expr) (a1 : expr), atom a1 → (match a1 with | expr.Term x x1 => (match e with | expr.Term x2 x3 => (if x3 = x1 then ∀(o1 : coeff), (∀(v : cvars), interp o1 v = infix_pl (interp x2 v) (interp x v)) → (∀(o2 : expr), (∀(y : ℤ -> a) (z : cvars), interp1 o2 y z = interp1 (expr.Term o1 x3) y z) → (∀(y : ℤ -> a) (z : cvars), interp1 o2 y z = infix_pl (interp1 e y z) (interp1 a1 y z))) else let o1 : coeff := czero; (eq x2 o1 → (∀(y : cvars), interp x2 y = interp o1 y)) → (∀(r : expr) (result : Bool), (if eq x2 o1 then (∀(y : ℤ -> a) (z : cvars), interp1 r y z = interp1 (expr.Term x x1) y z) ∧ result = true else let o2 : coeff := czero; (eq x o2 → (∀(y : cvars), interp x y = interp o2 y)) ∧ (if eq x o2 then r = e ∧ result = true else r = expr.Add e a1 ∧ result = false)) → (∀(y : ℤ -> a) (z : cvars), interp1 r y z = infix_pl (interp1 e y z) (interp1 a1 y z)))) | expr.Cst x2 => (let o1 : coeff := czero; (eq x o1 → (∀(y : cvars), interp x y = interp o1 y)) → (∀(r : expr) (result : Bool), (if eq x o1 then r = e ∧ result = true else let o2 : coeff := czero; (eq x2 o2 → (∀(y : cvars), interp x2 y = interp o2 y)) ∧ (if eq x2 o2 then r = a1 ∧ result = true else r = expr.Add e a1 ∧ result = false)) → (∀(y : ℤ -> a) (z : cvars), interp1 r y z = infix_pl (interp1 e y z) (interp1 a1 y z)))) | expr.Add x2 x3 => ((match e with | expr.Term _ _ => False | expr.Add f f1 => f = x2 ∨ f1 = x2 | expr.Cst _ => False) ∧ atom a1) ∧ (∀(r : expr) (b : Bool), (∀(y : ℤ -> a) (z : cvars), interp1 r y z = infix_pl (interp1 x2 y z) (interp1 a1 y z)) → (if b = true then (match r with | expr.Cst c => True | _ => True) ∧ (∀(r1 : expr) (result : Bool), (match r with | expr.Cst c => (let o1 : coeff := czero; (eq c o1 → (∀(y : cvars), interp c y = interp o1 y)) ∧ (if eq c o1 then r1 = x3 ∧ result = true else r1 = expr.Add r x3 ∧ result = true)) | _ => r1 = expr.Add r x3 ∧ result = true) → (∀(y : ℤ -> a) (z : cvars), interp1 r1 y z = infix_pl (interp1 e y z) (interp1 a1 y z))) else ((match e with | expr.Term _ _ => False | expr.Add f f1 => f = x3 ∨ f1 = x3 | expr.Cst _ => False) ∧ atom a1) ∧ (∀(r1 : expr) (b1 : Bool), (∀(y : ℤ -> a) (z : cvars), interp1 r1 y z = infix_pl (interp1 x3 y z) (interp1 a1 y z)) → (match r1 with | expr.Cst c => True | _ => True) ∧ (∀(r2 : expr) (result : Bool), (match r1 with | expr.Cst c => (let o1 : coeff := czero; (eq c o1 → (∀(y : cvars), interp c y = interp o1 y)) ∧ (if eq c o1 then r2 = x2 ∧ result = true else r2 = expr.Add x2 r1 ∧ result = b1)) | _ => r2 = expr.Add x2 r1 ∧ result = b1) → (∀(y : ℤ -> a) (z : cvars), interp1 r2 y z = infix_pl (interp1 e y z) (interp1 a1 y z))))))) | expr.Cst x => (match e with | expr.Cst x1 => (∀(o1 : coeff), (∀(v : cvars), interp o1 v = infix_pl (interp x1 v) (interp x v)) → (∀(y : ℤ -> a) (z : cvars), interp1 (expr.Cst o1) y z = infix_pl (interp1 e y z) (interp1 a1 y z))) | expr.Term x1 x2 => (let o1 : coeff := czero; (eq x1 o1 → (∀(y : cvars), interp x1 y = interp o1 y)) → (∀(r : expr) (result : Bool), (if eq x1 o1 then r = a1 ∧ result = true else let o2 : coeff := czero; (eq x o2 → (∀(y : cvars), interp x y = interp o2 y)) ∧ (if eq x o2 then r = e ∧ result = true else r = expr.Add e a1 ∧ result = false)) → (∀(y : ℤ -> a) (z : cvars), interp1 r y z = infix_pl (interp1 e y z) (interp1 a1 y z)))) | expr.Add x1 x2 => ((match e with | expr.Term _ _ => False | expr.Add f f1 => f = x1 ∨ f1 = x1 | expr.Cst _ => False) ∧ atom a1) ∧ (∀(r : expr) (b : Bool), (∀(y : ℤ -> a) (z : cvars), interp1 r y z = infix_pl (interp1 x1 y z) (interp1 a1 y z)) → (if b = true then (match r with | expr.Cst c => True | _ => True) ∧ (∀(r1 : expr) (result : Bool), (match r with | expr.Cst c => (let o1 : coeff := czero; (eq c o1 → (∀(y : cvars), interp c y = interp o1 y)) ∧ (if eq c o1 then r1 = x2 ∧ result = true else r1 = expr.Add r x2 ∧ result = true)) | _ => r1 = expr.Add r x2 ∧ result = true) → (∀(y : ℤ -> a) (z : cvars), interp1 r1 y z = infix_pl (interp1 e y z) (interp1 a1 y z))) else ((match e with | expr.Term _ _ => False | expr.Add f f1 => f = x2 ∨ f1 = x2 | expr.Cst _ => False) ∧ atom a1) ∧ (∀(r1 : expr) (b1 : Bool), (∀(y : ℤ -> a) (z : cvars), interp1 r1 y z = infix_pl (interp1 x2 y z) (interp1 a1 y z)) → (match r1 with | expr.Cst c => True | _ => True) ∧ (∀(r2 : expr) (result : Bool), (match r1 with | expr.Cst c => (let o1 : coeff := czero; (eq c o1 → (∀(y : cvars), interp c y = interp o1 y)) ∧ (if eq c o1 then r2 = x1 ∧ result = true else r2 = expr.Add x1 r1 ∧ result = b1)) | _ => r2 = expr.Add x1 r1 ∧ result = b1) → (∀(y : ℤ -> a) (z : cvars), interp1 r2 y z = infix_pl (interp1 e y z) (interp1 a1 y z))))))) | expr.Add x x1 => (match e with | expr.Add x2 x3 => ((match e with | expr.Term _ _ => False | expr.Add f f1 => f = x2 ∨ f1 = x2 | expr.Cst _ => False) ∧ atom a1) ∧ (∀(r : expr) (b : Bool), (∀(y : ℤ -> a) (z : cvars), interp1 r y z = infix_pl (interp1 x2 y z) (interp1 a1 y z)) → (if b = true then (match r with | expr.Cst c => True | _ => True) ∧ (∀(r1 : expr) (result : Bool), (match r with | expr.Cst c => (let o1 : coeff := czero; (eq c o1 → (∀(y : cvars), interp c y = interp o1 y)) ∧ (if eq c o1 then r1 = x3 ∧ result = true else r1 = expr.Add r x3 ∧ result = true)) | _ => r1 = expr.Add r x3 ∧ result = true) → (∀(y : ℤ -> a) (z : cvars), interp1 r1 y z = infix_pl (interp1 e y z) (interp1 a1 y z))) else ((match e with | expr.Term _ _ => False | expr.Add f f1 => f = x3 ∨ f1 = x3 | expr.Cst _ => False) ∧ atom a1) ∧ (∀(r1 : expr) (b1 : Bool), (∀(y : ℤ -> a) (z : cvars), interp1 r1 y z = infix_pl (interp1 x3 y z) (interp1 a1 y z)) → (match r1 with | expr.Cst c => True | _ => True) ∧ (∀(r2 : expr) (result : Bool), (match r1 with | expr.Cst c => (let o1 : coeff := czero; (eq c o1 → (∀(y : cvars), interp c y = interp o1 y)) ∧ (if eq c o1 then r2 = x2 ∧ result = true else r2 = expr.Add x2 r1 ∧ result = b1)) | _ => r2 = expr.Add x2 r1 ∧ result = b1) → (∀(y : ℤ -> a) (z : cvars), interp1 r2 y z = infix_pl (interp1 e y z) (interp1 a1 y z)))))) | _ => False))) ∧ (match e2 with | expr.Add e1' e2' => (match e2 with | expr.Term _ _ => False | expr.Add f f1 => f = e1' ∨ f1 = e1' | expr.Cst _ => False) ∧ (∀(o1 : expr), (∀(y : ℤ -> a) (z : cvars), interp1 o1 y z = infix_pl (interp1 e1 y z) (interp1 e1' y z)) → (match e2 with | expr.Term _ _ => False | expr.Add f f1 => f = e2' ∨ f1 = e2' | expr.Cst _ => False) ∧ (∀(result : expr), (∀(y : ℤ -> a) (z : cvars), interp1 result y z = infix_pl (interp1 o1 y z) (interp1 e2' y z)) → (∀(y : ℤ -> a) (z : cvars), interp1 result y z = infix_pl (interp1 e1 y z) (interp1 e2 y z)))) | _ => atom e2 ∧ (∀(o1 : expr), (∀(y : ℤ -> a) (z : cvars), interp1 o1 y z = infix_pl (interp1 e1 y z) (interp1 e2 y z)) → (∀(y : ℤ -> a) (z : cvars), interp1 o1 y z = infix_pl (interp1 e1 y z) (interp1 e2 y z))))
  := sorry
end lineardecision_LinearEquationsDecision_add_exprqtvc
