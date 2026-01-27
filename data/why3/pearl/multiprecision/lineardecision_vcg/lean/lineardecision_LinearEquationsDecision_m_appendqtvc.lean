import Why3.Base
import Why3.why3.Ref.Ref
import Why3.mach.matrix.Matrix63
open Classical
open Lean4Why3
namespace lineardecision_LinearEquationsDecision_m_appendqtvc
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
theorem m_append'vc (m : Matrix63.matrix coeff) (v : array63 coeff) (fact0 : Matrix63.rows m = array63_length v) (fact1 : BitVec.toInt (Matrix63.columns m) < (4611686018427387903 : ℤ)) : let o1 : BitVec 63 := Matrix63.columns m; int'63_in_bounds (BitVec.toInt o1 + (1 : ℤ)) ∧ (∀(o2 : BitVec 63), BitVec.toInt o2 = BitVec.toInt o1 + (1 : ℤ) → (let o3 : BitVec 63 := Matrix63.rows m; ((0 : ℤ) ≤ BitVec.toInt o3 ∧ (0 : ℤ) ≤ BitVec.toInt o2) ∧ (∀(r : Matrix63.matrix coeff), Matrix63.rows r = o3 ∧ Matrix63.columns r = o2 ∧ (∀(i : ℤ) (j : ℤ), ((0 : ℤ) ≤ i ∧ i < BitVec.toInt o3) ∧ (0 : ℤ) ≤ j ∧ j < BitVec.toInt o2 → Matrix63.get_unsafe r i j = czero) → (let o4 : BitVec 63 := Matrix63.rows m; int'63_in_bounds (BitVec.toInt o4 - (1 : ℤ)) ∧ (∀(o5 : BitVec 63), BitVec.toInt o5 = BitVec.toInt o4 - (1 : ℤ) → ((0 : ℤ) ≤ BitVec.toInt o5 + (1 : ℤ) → ((∀(k : ℤ) (j : ℤ), (0 : ℤ) ≤ k ∧ k < (0 : ℤ) → (0 : ℤ) ≤ j ∧ j < BitVec.toInt (Matrix63.columns m) → Matrix63.elts r k j = Matrix63.elts m k j) ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < (0 : ℤ) → Matrix63.elts r k (BitVec.toInt (Matrix63.columns m)) = (array63_elts v)[Int.toNat k]!)) ∧ (∀(r1 : Matrix63.matrix coeff), Matrix63.rows r1 = Matrix63.rows r ∧ Matrix63.columns r1 = Matrix63.columns r → (∀(i : BitVec 63), let i1 : ℤ := BitVec.toInt i; ((0 : ℤ) ≤ i1 ∧ i1 ≤ BitVec.toInt o5) ∧ (∀(k : ℤ) (j : ℤ), (0 : ℤ) ≤ k ∧ k < i1 → (0 : ℤ) ≤ j ∧ j < BitVec.toInt (Matrix63.columns m) → Matrix63.elts r1 k j = Matrix63.elts m k j) ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < i1 → Matrix63.elts r1 k (BitVec.toInt (Matrix63.columns m)) = (array63_elts v)[Int.toNat k]!) → (let o6 : BitVec 63 := Matrix63.columns m; int'63_in_bounds (BitVec.toInt o6 - (1 : ℤ)) ∧ (∀(o7 : BitVec 63), BitVec.toInt o7 = BitVec.toInt o6 - (1 : ℤ) → ((0 : ℤ) ≤ BitVec.toInt o7 + (1 : ℤ) → ((∀(k : ℤ) (j : ℤ), (0 : ℤ) ≤ k ∧ k < i1 → (0 : ℤ) ≤ j ∧ j < BitVec.toInt (Matrix63.columns m) → Matrix63.elts r1 k j = Matrix63.elts m k j) ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < i1 → Matrix63.elts r1 k (BitVec.toInt (Matrix63.columns m)) = (array63_elts v)[Int.toNat k]!) ∧ (∀(l : ℤ), (0 : ℤ) ≤ l ∧ l < (0 : ℤ) → Matrix63.elts r1 i1 l = Matrix63.elts m i1 l)) ∧ (∀(r2 : Matrix63.matrix coeff), Matrix63.rows r2 = Matrix63.rows r1 ∧ Matrix63.columns r2 = Matrix63.columns r1 → (∀(j : BitVec 63), let j1 : ℤ := BitVec.toInt j; ((0 : ℤ) ≤ j1 ∧ j1 ≤ BitVec.toInt o7) ∧ (∀(k : ℤ) (j2 : ℤ), (0 : ℤ) ≤ k ∧ k < i1 → (0 : ℤ) ≤ j2 ∧ j2 < BitVec.toInt (Matrix63.columns m) → Matrix63.elts r2 k j2 = Matrix63.elts m k j2) ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < i1 → Matrix63.elts r2 k (BitVec.toInt (Matrix63.columns m)) = (array63_elts v)[Int.toNat k]!) ∧ (∀(l : ℤ), (0 : ℤ) ≤ l ∧ l < j1 → Matrix63.elts r2 i1 l = Matrix63.elts m i1 l) → Matrix63.valid_index m i j ∧ Matrix63.valid_index r2 i j ∧ (∀(r3 : Matrix63.matrix coeff), Matrix63.rows r3 = Matrix63.rows r2 ∧ Matrix63.columns r3 = Matrix63.columns r2 → Matrix63.elts r3 = Function.update (Matrix63.elts r2) (BitVec.toInt i) (Function.update (Matrix63.elts r2 (BitVec.toInt i)) (BitVec.toInt j) (Matrix63.get_unsafe m (BitVec.toInt i) (BitVec.toInt j))) → (∀(k : ℤ) (j2 : ℤ), (0 : ℤ) ≤ k ∧ k < i1 → (0 : ℤ) ≤ j2 ∧ j2 < BitVec.toInt (Matrix63.columns m) → Matrix63.elts r3 k j2 = Matrix63.elts m k j2) ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < i1 → Matrix63.elts r3 k (BitVec.toInt (Matrix63.columns m)) = (array63_elts v)[Int.toNat k]!) ∧ (∀(l : ℤ), (0 : ℤ) ≤ l ∧ l < j1 + (1 : ℤ) → Matrix63.elts r3 i1 l = Matrix63.elts m i1 l))) ∧ ((∀(k : ℤ) (j : ℤ), (0 : ℤ) ≤ k ∧ k < i1 → (0 : ℤ) ≤ j ∧ j < BitVec.toInt (Matrix63.columns m) → Matrix63.elts r2 k j = Matrix63.elts m k j) ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < i1 → Matrix63.elts r2 k (BitVec.toInt (Matrix63.columns m)) = (array63_elts v)[Int.toNat k]!) ∧ (∀(l : ℤ), (0 : ℤ) ≤ l ∧ l < BitVec.toInt o7 + (1 : ℤ) → Matrix63.elts r2 i1 l = Matrix63.elts m i1 l) → ((0 : ℤ) ≤ BitVec.toInt i ∧ BitVec.toInt i < BitVec.toInt (array63_length v)) ∧ (let o8 : BitVec 63 := Matrix63.columns m; Matrix63.valid_index r2 i o8 ∧ (∀(r3 : Matrix63.matrix coeff), Matrix63.rows r3 = Matrix63.rows r2 ∧ Matrix63.columns r3 = Matrix63.columns r2 → Matrix63.elts r3 = Function.update (Matrix63.elts r2) (BitVec.toInt i) (Function.update (Matrix63.elts r2 (BitVec.toInt i)) (BitVec.toInt o8) ((array63_elts v)[Int.toNat (BitVec.toInt i)]!)) → (∀(k : ℤ) (j : ℤ), (0 : ℤ) ≤ k ∧ k < i1 + (1 : ℤ) → (0 : ℤ) ≤ j ∧ j < BitVec.toInt (Matrix63.columns m) → Matrix63.elts r3 k j = Matrix63.elts m k j) ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < i1 + (1 : ℤ) → Matrix63.elts r3 k (BitVec.toInt (Matrix63.columns m)) = (array63_elts v)[Int.toNat k]!)))))) ∧ (BitVec.toInt o7 + (1 : ℤ) < (0 : ℤ) → ((0 : ℤ) ≤ BitVec.toInt i ∧ BitVec.toInt i < BitVec.toInt (array63_length v)) ∧ (let o8 : BitVec 63 := Matrix63.columns m; Matrix63.valid_index r1 i o8 ∧ (∀(r2 : Matrix63.matrix coeff), Matrix63.rows r2 = Matrix63.rows r1 ∧ Matrix63.columns r2 = Matrix63.columns r1 → Matrix63.elts r2 = Function.update (Matrix63.elts r1) (BitVec.toInt i) (Function.update (Matrix63.elts r1 (BitVec.toInt i)) (BitVec.toInt o8) ((array63_elts v)[Int.toNat (BitVec.toInt i)]!)) → (∀(k : ℤ) (j : ℤ), (0 : ℤ) ≤ k ∧ k < i1 + (1 : ℤ) → (0 : ℤ) ≤ j ∧ j < BitVec.toInt (Matrix63.columns m) → Matrix63.elts r2 k j = Matrix63.elts m k j) ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < i1 + (1 : ℤ) → Matrix63.elts r2 k (BitVec.toInt (Matrix63.columns m)) = (array63_elts v)[Int.toNat k]!))))))) ∧ ((∀(k : ℤ) (j : ℤ), (0 : ℤ) ≤ k ∧ k < BitVec.toInt o5 + (1 : ℤ) → (0 : ℤ) ≤ j ∧ j < BitVec.toInt (Matrix63.columns m) → Matrix63.elts r1 k j = Matrix63.elts m k j) ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < BitVec.toInt o5 + (1 : ℤ) → Matrix63.elts r1 k (BitVec.toInt (Matrix63.columns m)) = (array63_elts v)[Int.toNat k]!) → Matrix63.rows r1 = Matrix63.rows m ∧ BitVec.toInt (Matrix63.columns r1) = BitVec.toInt (Matrix63.columns m) + (1 : ℤ) ∧ (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < BitVec.toInt (Matrix63.rows m) → (0 : ℤ) ≤ j ∧ j < BitVec.toInt (Matrix63.columns m) → Matrix63.elts r1 i j = Matrix63.elts m i j) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < BitVec.toInt (Matrix63.rows m) → Matrix63.elts r1 i (BitVec.toInt (Matrix63.columns m)) = (array63_elts v)[Int.toNat i]!)))) ∧ (BitVec.toInt o5 + (1 : ℤ) < (0 : ℤ) → Matrix63.rows r = Matrix63.rows m ∧ BitVec.toInt (Matrix63.columns r) = BitVec.toInt (Matrix63.columns m) + (1 : ℤ) ∧ (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < BitVec.toInt (Matrix63.rows m) → (0 : ℤ) ≤ j ∧ j < BitVec.toInt (Matrix63.columns m) → Matrix63.elts r i j = Matrix63.elts m i j) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < BitVec.toInt (Matrix63.rows m) → Matrix63.elts r i (BitVec.toInt (Matrix63.columns m)) = (array63_elts v)[Int.toNat i]!)))))))
  := sorry
end lineardecision_LinearEquationsDecision_m_appendqtvc
