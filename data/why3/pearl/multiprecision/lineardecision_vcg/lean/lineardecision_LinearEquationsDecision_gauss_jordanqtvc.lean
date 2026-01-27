import Why3.Base
import Why3.why3.Ref.Ref
import Why3.mach.matrix.Matrix63
import Why3.debug.Debug
open Classical
open Lean4Why3
namespace lineardecision_LinearEquationsDecision_gauss_jordanqtvc
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
theorem gauss_jordan'vc (a1 : Matrix63.matrix coeff) (fact0 : (1 : ℤ) ≤ BitVec.toInt (Matrix63.rows a1)) (fact1 : (1 : ℤ) ≤ BitVec.toInt (Matrix63.columns a1)) : let n : BitVec 63 := Matrix63.rows a1; let m : BitVec 63 := Matrix63.columns a1; (∀(a2 : Matrix63.matrix coeff), Matrix63.rows a2 = Matrix63.rows a1 ∧ Matrix63.columns a2 = Matrix63.columns a1 → (∀(i : BitVec 63) (j : BitVec 63), ((0 : ℤ) ≤ BitVec.toInt i ∧ BitVec.toInt i ≤ BitVec.toInt n) ∧ (0 : ℤ) ≤ BitVec.toInt j ∧ BitVec.toInt j < BitVec.toInt m → (¬BitVec.toInt n ≤ BitVec.toInt i → (let o1 : coeff := czero; Matrix63.valid_index a2 i j ∧ (let o2 : coeff := Matrix63.get_unsafe a2 (BitVec.toInt i) (BitVec.toInt j); (eq o2 o1 → (∀(y : cvars), interp o2 y = interp o1 y)) → eq o2 o1 → int'63_in_bounds (BitVec.toInt i + (1 : ℤ)) ∧ (∀(o3 : BitVec 63), BitVec.toInt o3 = BitVec.toInt i + (1 : ℤ) → ((0 : ℤ) ≤ BitVec.toInt n - BitVec.toInt i ∧ BitVec.toInt n - BitVec.toInt o3 < BitVec.toInt n - BitVec.toInt i) ∧ ((0 : ℤ) ≤ BitVec.toInt o3 ∧ BitVec.toInt o3 ≤ BitVec.toInt n) ∧ (0 : ℤ) ≤ BitVec.toInt j ∧ BitVec.toInt j < BitVec.toInt m)))) ∧ (∀(result : BitVec 63), (if BitVec.toInt n ≤ BitVec.toInt i then result = n else let o1 : coeff := czero; let o2 : coeff := Matrix63.get_unsafe a2 (BitVec.toInt i) (BitVec.toInt j); (eq o2 o1 → (∀(y : cvars), interp o2 y = interp o1 y)) ∧ (if eq o2 o1 then ∃(o3 : BitVec 63), BitVec.toInt o3 = BitVec.toInt i + (1 : ℤ) ∧ (BitVec.toInt o3 ≤ BitVec.toInt result ∧ BitVec.toInt result ≤ BitVec.toInt n) ∧ (BitVec.toInt result < BitVec.toInt n → ¬eq (Matrix63.elts a2 (BitVec.toInt result) (BitVec.toInt j)) czero) else result = i)) → (BitVec.toInt i ≤ BitVec.toInt result ∧ BitVec.toInt result ≤ BitVec.toInt n) ∧ (BitVec.toInt result < BitVec.toInt n → ¬eq (Matrix63.elts a2 (BitVec.toInt result) (BitVec.toInt j)) czero)))) ∧ (0 : ℤ) ≤ BitVec.toInt n ∧ (∀(pivots : array63 (BitVec 63)), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < BitVec.toInt n → (array63_elts pivots)[Int.toNat i]! = (0 : BitVec 63)) ∧ array63_length pivots = n → int'63_in_bounds (BitVec.toInt m - (2 : ℤ)) ∧ (∀(o1 : BitVec 63), BitVec.toInt o1 = BitVec.toInt m - (2 : ℤ) → ((0 : ℤ) ≤ BitVec.toInt o1 + (1 : ℤ) → ((-(1 : ℤ) ≤ -(1 : ℤ) ∧ -(1 : ℤ) < BitVec.toInt n) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i ≤ -(1 : ℤ) → (0 : ℤ) ≤ BitVec.toInt ((array63_elts pivots)[Int.toNat i]!)) ∧ (∀(i1 : ℤ) (i2 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < i2 ∧ i2 ≤ -(1 : ℤ) → BitVec.toInt ((array63_elts pivots)[Int.toNat i1]!) < BitVec.toInt ((array63_elts pivots)[Int.toNat i2]!)) ∧ ((0 : ℤ) ≤ -(1 : ℤ) → BitVec.toInt ((array63_elts pivots)[Int.toNat (-(1 : ℤ))]!) < (0 : ℤ))) ∧ (∀(r : BitVec 63) (pivots1 : array63 (BitVec 63)) (a2 : Matrix63.matrix coeff), array63_length pivots1 = array63_length pivots → Matrix63.rows a2 = Matrix63.rows a1 ∧ Matrix63.columns a2 = Matrix63.columns a1 → (∀(j : BitVec 63), let j1 : ℤ := BitVec.toInt j; ((0 : ℤ) ≤ j1 ∧ j1 ≤ BitVec.toInt o1) ∧ (-(1 : ℤ) ≤ BitVec.toInt r ∧ BitVec.toInt r < BitVec.toInt n) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i ≤ BitVec.toInt r → (0 : ℤ) ≤ BitVec.toInt ((array63_elts pivots1)[Int.toNat i]!)) ∧ (∀(i1 : ℤ) (i2 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < i2 ∧ i2 ≤ BitVec.toInt r → BitVec.toInt ((array63_elts pivots1)[Int.toNat i1]!) < BitVec.toInt ((array63_elts pivots1)[Int.toNat i2]!)) ∧ ((0 : ℤ) ≤ BitVec.toInt r → BitVec.toInt ((array63_elts pivots1)[Int.toNat (BitVec.toInt r)]!) < j1) → int'63_in_bounds (BitVec.toInt r + (1 : ℤ)) ∧ (∀(o2 : BitVec 63), BitVec.toInt o2 = BitVec.toInt r + (1 : ℤ) → (((0 : ℤ) ≤ BitVec.toInt o2 ∧ BitVec.toInt o2 ≤ BitVec.toInt n) ∧ (0 : ℤ) ≤ BitVec.toInt j ∧ BitVec.toInt j < BitVec.toInt m) ∧ (∀(k : BitVec 63), (BitVec.toInt o2 ≤ BitVec.toInt k ∧ BitVec.toInt k ≤ BitVec.toInt n) ∧ (BitVec.toInt k < BitVec.toInt n → ¬eq (Matrix63.elts a2 (BitVec.toInt k) (BitVec.toInt j)) czero) → (if BitVec.toInt k < BitVec.toInt n then int'63_in_bounds (BitVec.toInt r + (1 : ℤ)) ∧ (∀(o3 : BitVec 63), BitVec.toInt o3 = BitVec.toInt r + (1 : ℤ) → ((0 : ℤ) ≤ BitVec.toInt o3 ∧ BitVec.toInt o3 < BitVec.toInt (array63_length pivots1)) ∧ (∀(pivots2 : array63 (BitVec 63)), array63_length pivots2 = array63_length pivots1 → array63_elts pivots2 = List.set (array63_elts pivots1) (Int.toNat (BitVec.toInt o3)) j → Matrix63.valid_index a2 k j ∧ ¬eq (Matrix63.get_unsafe a2 (BitVec.toInt k) (BitVec.toInt j)) czero ∧ (∀(o4 : coeff), ¬eq o4 czero → (((0 : ℤ) ≤ BitVec.toInt k ∧ BitVec.toInt k < BitVec.toInt (Matrix63.rows a2)) ∧ ¬eq o4 czero) ∧ (∀(a3 : Matrix63.matrix coeff), Matrix63.rows a3 = Matrix63.rows a2 ∧ Matrix63.columns a3 = Matrix63.columns a2 → (BitVec.toInt k = BitVec.toInt o3 → k = o3) → (if ¬k = o3 then (((0 : ℤ) ≤ BitVec.toInt k ∧ BitVec.toInt k < BitVec.toInt (Matrix63.rows a3)) ∧ (0 : ℤ) ≤ BitVec.toInt o3 ∧ BitVec.toInt o3 < BitVec.toInt (Matrix63.rows a3)) ∧ (∀(a4 : Matrix63.matrix coeff), Matrix63.rows a4 = Matrix63.rows a3 ∧ Matrix63.columns a4 = Matrix63.columns a3 → int'63_in_bounds (BitVec.toInt n - (1 : ℤ)) ∧ (∀(o5 : BitVec 63), BitVec.toInt o5 = BitVec.toInt n - (1 : ℤ) → ((0 : ℤ) ≤ BitVec.toInt o5 + (1 : ℤ) → (∀(a5 : Matrix63.matrix coeff), Matrix63.rows a5 = Matrix63.rows a4 ∧ Matrix63.columns a5 = Matrix63.columns a4 → (∀(i : BitVec 63), let i1 : ℤ := BitVec.toInt i; (0 : ℤ) ≤ i1 ∧ i1 ≤ BitVec.toInt o5 → (BitVec.toInt i = BitVec.toInt o3 → i = o3) → ¬i = o3 → Matrix63.valid_index a5 i j ∧ (∀(o6 : coeff), (∀(v : cvars), interp o6 v = prefix_mn (interp (Matrix63.get_unsafe a5 (BitVec.toInt i) (BitVec.toInt j)) v)) → ((0 : ℤ) ≤ BitVec.toInt o3 ∧ BitVec.toInt o3 < BitVec.toInt (Matrix63.rows a5)) ∧ (0 : ℤ) ≤ BitVec.toInt i ∧ BitVec.toInt i < BitVec.toInt (Matrix63.rows a5))) ∧ (-(1 : ℤ) ≤ BitVec.toInt o3 ∧ BitVec.toInt o3 < BitVec.toInt n) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i ≤ BitVec.toInt o3 → (0 : ℤ) ≤ BitVec.toInt ((array63_elts pivots2)[Int.toNat i]!)) ∧ (∀(i1 : ℤ) (i2 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < i2 ∧ i2 ≤ BitVec.toInt o3 → BitVec.toInt ((array63_elts pivots2)[Int.toNat i1]!) < BitVec.toInt ((array63_elts pivots2)[Int.toNat i2]!)) ∧ ((0 : ℤ) ≤ BitVec.toInt o3 → BitVec.toInt ((array63_elts pivots2)[Int.toNat (BitVec.toInt o3)]!) < j1 + (1 : ℤ)))) ∧ (BitVec.toInt o5 + (1 : ℤ) < (0 : ℤ) → (-(1 : ℤ) ≤ BitVec.toInt o3 ∧ BitVec.toInt o3 < BitVec.toInt n) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i ≤ BitVec.toInt o3 → (0 : ℤ) ≤ BitVec.toInt ((array63_elts pivots2)[Int.toNat i]!)) ∧ (∀(i1 : ℤ) (i2 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < i2 ∧ i2 ≤ BitVec.toInt o3 → BitVec.toInt ((array63_elts pivots2)[Int.toNat i1]!) < BitVec.toInt ((array63_elts pivots2)[Int.toNat i2]!)) ∧ ((0 : ℤ) ≤ BitVec.toInt o3 → BitVec.toInt ((array63_elts pivots2)[Int.toNat (BitVec.toInt o3)]!) < j1 + (1 : ℤ))))) else int'63_in_bounds (BitVec.toInt n - (1 : ℤ)) ∧ (∀(o5 : BitVec 63), BitVec.toInt o5 = BitVec.toInt n - (1 : ℤ) → ((0 : ℤ) ≤ BitVec.toInt o5 + (1 : ℤ) → (∀(a4 : Matrix63.matrix coeff), Matrix63.rows a4 = Matrix63.rows a3 ∧ Matrix63.columns a4 = Matrix63.columns a3 → (∀(i : BitVec 63), let i1 : ℤ := BitVec.toInt i; (0 : ℤ) ≤ i1 ∧ i1 ≤ BitVec.toInt o5 → (BitVec.toInt i = BitVec.toInt o3 → i = o3) → ¬i = o3 → Matrix63.valid_index a4 i j ∧ (∀(o6 : coeff), (∀(v : cvars), interp o6 v = prefix_mn (interp (Matrix63.get_unsafe a4 (BitVec.toInt i) (BitVec.toInt j)) v)) → ((0 : ℤ) ≤ BitVec.toInt o3 ∧ BitVec.toInt o3 < BitVec.toInt (Matrix63.rows a4)) ∧ (0 : ℤ) ≤ BitVec.toInt i ∧ BitVec.toInt i < BitVec.toInt (Matrix63.rows a4))) ∧ (-(1 : ℤ) ≤ BitVec.toInt o3 ∧ BitVec.toInt o3 < BitVec.toInt n) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i ≤ BitVec.toInt o3 → (0 : ℤ) ≤ BitVec.toInt ((array63_elts pivots2)[Int.toNat i]!)) ∧ (∀(i1 : ℤ) (i2 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < i2 ∧ i2 ≤ BitVec.toInt o3 → BitVec.toInt ((array63_elts pivots2)[Int.toNat i1]!) < BitVec.toInt ((array63_elts pivots2)[Int.toNat i2]!)) ∧ ((0 : ℤ) ≤ BitVec.toInt o3 → BitVec.toInt ((array63_elts pivots2)[Int.toNat (BitVec.toInt o3)]!) < j1 + (1 : ℤ)))) ∧ (BitVec.toInt o5 + (1 : ℤ) < (0 : ℤ) → (-(1 : ℤ) ≤ BitVec.toInt o3 ∧ BitVec.toInt o3 < BitVec.toInt n) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i ≤ BitVec.toInt o3 → (0 : ℤ) ≤ BitVec.toInt ((array63_elts pivots2)[Int.toNat i]!)) ∧ (∀(i1 : ℤ) (i2 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < i2 ∧ i2 ≤ BitVec.toInt o3 → BitVec.toInt ((array63_elts pivots2)[Int.toNat i1]!) < BitVec.toInt ((array63_elts pivots2)[Int.toNat i2]!)) ∧ ((0 : ℤ) ≤ BitVec.toInt o3 → BitVec.toInt ((array63_elts pivots2)[Int.toNat (BitVec.toInt o3)]!) < j1 + (1 : ℤ))))))))) else (-(1 : ℤ) ≤ BitVec.toInt r ∧ BitVec.toInt r < BitVec.toInt n) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i ≤ BitVec.toInt r → (0 : ℤ) ≤ BitVec.toInt ((array63_elts pivots1)[Int.toNat i]!)) ∧ (∀(i1 : ℤ) (i2 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < i2 ∧ i2 ≤ BitVec.toInt r → BitVec.toInt ((array63_elts pivots1)[Int.toNat i1]!) < BitVec.toInt ((array63_elts pivots1)[Int.toNat i2]!)) ∧ ((0 : ℤ) ≤ BitVec.toInt r → BitVec.toInt ((array63_elts pivots1)[Int.toNat (BitVec.toInt r)]!) < j1 + (1 : ℤ)))))) ∧ ((-(1 : ℤ) ≤ BitVec.toInt r ∧ BitVec.toInt r < BitVec.toInt n) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i ≤ BitVec.toInt r → (0 : ℤ) ≤ BitVec.toInt ((array63_elts pivots1)[Int.toNat i]!)) ∧ (∀(i1 : ℤ) (i2 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < i2 ∧ i2 ≤ BitVec.toInt r → BitVec.toInt ((array63_elts pivots1)[Int.toNat i1]!) < BitVec.toInt ((array63_elts pivots1)[Int.toNat i2]!)) ∧ ((0 : ℤ) ≤ BitVec.toInt r → BitVec.toInt ((array63_elts pivots1)[Int.toNat (BitVec.toInt r)]!) < BitVec.toInt o1 + (1 : ℤ)) → ¬BitVec.toInt r < (0 : ℤ) → (0 : ℤ) ≤ BitVec.toInt m ∧ (∀(v : array63 coeff), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < BitVec.toInt m → (array63_elts v)[Int.toNat i]! = czero) ∧ array63_length v = m → ((0 : ℤ) ≤ BitVec.toInt r + (1 : ℤ) → (∀(v1 : array63 coeff), array63_length v1 = array63_length v → (∀(i : BitVec 63), let i1 : ℤ := BitVec.toInt i; (0 : ℤ) ≤ i1 ∧ i1 ≤ BitVec.toInt r → int'63_in_bounds (BitVec.toInt m - (1 : ℤ)) ∧ (∀(o2 : BitVec 63), BitVec.toInt o2 = BitVec.toInt m - (1 : ℤ) → Matrix63.valid_index a2 i o2 ∧ ((0 : ℤ) ≤ BitVec.toInt i ∧ BitVec.toInt i < BitVec.toInt (array63_length pivots1)) ∧ (let o3 : BitVec 63 := (array63_elts pivots1)[Int.toNat (BitVec.toInt i)]!; (0 : ℤ) ≤ BitVec.toInt o3 ∧ BitVec.toInt o3 < BitVec.toInt (array63_length v1)))) ∧ array63_length v1 = Matrix63.columns a2)) ∧ (BitVec.toInt r + (1 : ℤ) < (0 : ℤ) → array63_length v = Matrix63.columns a2))))) ∧ (BitVec.toInt o1 + (1 : ℤ) < (0 : ℤ) → ¬-(1 : ℤ) < (0 : ℤ) → (0 : ℤ) ≤ BitVec.toInt m ∧ (∀(v : array63 coeff), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < BitVec.toInt m → (array63_elts v)[Int.toNat i]! = czero) ∧ array63_length v = m → ((0 : ℤ) ≤ -(1 : ℤ) + (1 : ℤ) → (∀(v1 : array63 coeff), array63_length v1 = array63_length v → (∀(i : BitVec 63), let i1 : ℤ := BitVec.toInt i; (0 : ℤ) ≤ i1 ∧ i1 ≤ -(1 : ℤ) → int'63_in_bounds (BitVec.toInt m - (1 : ℤ)) ∧ (∀(o2 : BitVec 63), BitVec.toInt o2 = BitVec.toInt m - (1 : ℤ) → Matrix63.valid_index a1 i o2 ∧ ((0 : ℤ) ≤ BitVec.toInt i ∧ BitVec.toInt i < BitVec.toInt (array63_length pivots)) ∧ (let o3 : BitVec 63 := (array63_elts pivots)[Int.toNat (BitVec.toInt i)]!; (0 : ℤ) ≤ BitVec.toInt o3 ∧ BitVec.toInt o3 < BitVec.toInt (array63_length v1)))) ∧ array63_length v1 = Matrix63.columns a1)) ∧ (-(1 : ℤ) + (1 : ℤ) < (0 : ℤ) → array63_length v = Matrix63.columns a1)))))
  := sorry
end lineardecision_LinearEquationsDecision_gauss_jordanqtvc
